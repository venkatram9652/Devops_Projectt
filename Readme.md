Developer updates code or infra config in GitHub
                ↓
GitHub detects change (push / merge / PR)
                ↓
GitHub Actions workflow starts automatically
                ↓
Step 1 → Terraform runs
         - terraform init
         - terraform plan
         - terraform apply
         - Creates / updates Linode infrastructure
                ↓
Step 2 → Get server IPs from Terraform output
                ↓
Step 3 → Generate Ansible inventory
                ↓
Step 4 → Run Ansible playbook
         - Install software
         - Update configs
         - Restart services
         - Deploy application
                ↓
Step 5 → Verify deployment
         - Health check
         - Service status
                ↓
Step 6 → Notify result (success / failure)
