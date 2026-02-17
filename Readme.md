# 🚀 GitOps Infrastructure Deployment

**Terraform + Ansible + GitHub Actions + Linode (Akamai Cloud)**

---

## 📌 Overview

This project implements a **GitOps-based infrastructure and configuration deployment pipeline**.

Whenever a developer updates infrastructure code or configuration in GitHub, an automated workflow:

1. Provisions or updates cloud infrastructure using Terraform
2. Generates server inventory dynamically
3. Configures servers using Ansible
4. Verifies deployment health
5. Sends deployment status notifications

The repository is the **single source of truth** for infrastructure and system configuration.

---

## 🔁 End-to-End Deployment Flow

```
Developer updates code or infrastructure config in GitHub
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
```

---

## ⚙️ What Happens When Code Changes?

### Infrastructure Changes (Terraform)

If Terraform configuration is modified:

* New servers may be created
* Existing servers may be updated or resized
* Load balancers or networking may change
* Infrastructure state is reconciled automatically

---

### Configuration Changes (Ansible)

If server configuration changes:

* Software gets installed or updated
* Application configuration is applied
* Services restart automatically
* Security or system settings are enforced

---

### Scaling Changes

If instance count increases:

* New cloud servers are provisioned
* Inventory is updated automatically
* New servers are configured by Ansible

---

## 🧠 Key Principles

### Git as Source of Truth

All infrastructure and configuration is defined in Git.
The live environment always matches repository state.

---

### Infrastructure as Code (IaC)

Terraform defines and manages cloud resources declaratively.

---

### Configuration as Code

Ansible enforces server configuration consistently.

---

### GitOps Automation

Deployment is triggered automatically from version control events.

---

## 🔐 Automation Pipeline Responsibilities

GitHub Actions performs the following tasks:

1. Checkout repository
2. Initialize Terraform
3. Apply infrastructure changes
4. Retrieve Terraform outputs (server IPs)
5. Generate Ansible inventory dynamically
6. Execute Ansible playbooks
7. Validate deployment health
8. Report success or failure

---

## ✅ Benefits

* Fully automated infrastructure provisioning
* Consistent server configuration
* No manual deployment steps
* Self-updating environments
* Reproducible infrastructure
* Version-controlled changes
* Faster and safer releases

---

## 💬 One-Line Architecture Summary

When code is pushed to GitHub, GitHub Actions automatically runs Terraform to provision or update infrastructure and then runs Ansible to configure the servers so the environment always matches the repository state.

---

## 🏁 Result

A fully automated GitOps deployment pipeline that keeps infrastructure and configuration synchronized with Git at all times.
