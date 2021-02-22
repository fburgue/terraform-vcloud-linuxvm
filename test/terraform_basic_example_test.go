package test

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/retry"
	"github.com/gruntwork-io/terratest/modules/ssh"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()

	tmpDir, err := ioutil.TempDir("", "tf-vms")
	if err != nil {
		log.Fatal(err)
	}

	os.Setenv("TF_DATA_DIR", tmpDir)
	//nolint:exhaustivestruct
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/basic",
		// Variables to pass to our Terraform code using -var options
		EnvVars: map[string]string{},
		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	// Comment this line to keep the vm
	defer terraform.Destroy(t, terraformOptions)

	// Show the plan
	terraform.InitAndPlan(t, terraformOptions)
	// Apply twice
	terraform.InitAndApplyAndIdempotent(t, terraformOptions)
	// Check that we can ssh using our ssh agent
	// cicd key must be present in ssh agent
	ip := terraform.Output(t, terraformOptions, "ip")
	//nolint:exhaustivestruct
	host := ssh.Host{SshAgent: true, Hostname: ip, SshUserName: "root"}
	description := fmt.Sprintf("SSH to VM %s", ip)
	retry.DoWithRetry(t, description, 60, 4, func() (string, error) {
		err := ssh.CheckSshConnectionE(t, host)
		if err != nil {
			return "", fmt.Errorf("Unable to connect using ssh for the moment: %w", err)
		}
		return "", nil
	})
}
