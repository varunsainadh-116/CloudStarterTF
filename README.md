  # Terraform Commands - Complete Guide

  ## **1. Setup & Initialization**

  ### **Install Terraform**

  #### 🪟 **For Windows**
  1. Download Terraform from the official site:  
    👉 https://developer.hashicorp.com/terraform/downloads  
  2. Unzip the downloaded file.  
  3. Move the `terraform.exe` binary to a folder (e.g., `C:\Terraform`) and add that folder to your **System Environment Variables** → **Path**.  
  4. Verify installation in **Command Prompt** or **PowerShell**:
  ```powershell
  terraform -v
  ```
  ### 🐧 For Linux & macOS
  ```
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
  sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  sudo apt-get update && sudo apt-get install terraform

  # Verify Installation
  terraform -v
  ```
  ### Initialize Terraform
  ```
  terraform init
  ```
  - Downloads provider plugins
  - Sets up the working directory

  ## Set-up
  1. To get started we first need to clone the project. 

  2. Clone the Project via Git

  ```bash
  git clone https://github.com/varunsainadh-116/CloudStarterTF.git
  ```
        
  3. To get started, first change directory:
   ```
   cd CloudStarterTF
   ```
  5. Format & Validate Code :

  ```commandline
  terraform fmt       # Formats Terraform code
  terraform validate  # Validates Terraform syntax
  ```
  5. Plan & Apply Infrastructure
  ```commandline
  terraform plan                  # Shows execution plan without applying
  terraform apply                 # Creates/updates infrastructure
  terraform apply -auto-approve  # Applies without manual confirmation
  ```
  6. Destroy Infrastructure
  ```commandline
  terraform destroy               # Destroys all managed resources
  terraform destroy -auto-approve  # Without confirmation
  ```

