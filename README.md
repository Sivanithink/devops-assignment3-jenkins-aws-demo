# Jenkins Hands-On Project 

### Module 1: Prerequisites & Setup

- Launched two EC2 instances (Amazon Linux for Master, Ubuntu for Agent).
- Created a Key Pair (sivanithin-key.pem) for SSH access.
- Security Groups were configured to allow inbound SSH (port 22), HTTP (port 80), and Jenkins traffic (port 8080).
- Confirmed both instances were up, accessible via SSH, and prepared for software installation.

---
### Module 2: Jenkins Master Setup
![Screenshot (209)](https://github.com/user-attachments/assets/904d531f-9114-4515-b683-a59095625e62)
![Screenshot (211)](https://github.com/user-attachments/assets/44d109c1-27e7-4a87-be77-2f9788857921)

- Installed Java 11 (since Jenkins needs it) and then installed Jenkins using the official repo.
- Started the Jenkins service and unlocked the dashboard using the initial admin password.
- Installed recommended plugins and set up the Jenkins web UI.
- created an admin user account 
---
### Module 3: Jenkins Agent Node Configuration
- Step 1: Prepare the Agent EC2 Instance
![Screenshot (208)](https://github.com/user-attachments/assets/0f05f6f5-2d31-41ac-9a80-25045542a574)
![Screenshot (210)](https://github.com/user-attachments/assets/4322978f-a88e-4e2f-a156-350572929071)
- Step 2: Install Required Software on the Agent
- ssh -i sivanithin-kp.pem ubuntu@13.201.86.141
- Step 3: Connect the Master to the Agent
- 1)Get the Master's Public Key
- ![Screenshot (203)](https://github.com/user-attachments/assets/d04fd0de-2c22-40d0-92c1-11ab51ff823b)
- 2)Authorize the Master on the Agent
- ![Screenshot (202)](https://github.com/user-attachments/assets/3933beff-2b20-4dcd-a8b8-37ee13851808)
- 3)Create Credentials in Jenkins and register the Node in Jenkins
- ![Screenshot (206)](https://github.com/user-attachments/assets/18008e92-5ded-470a-9b5d-ca3dab6e561d)
---
###  Module 4: Sample App Creation (Test App)

- create a new folder jenkins-aws-demo and added  a file named app.js,package.json
- creted a public repository in github and pushed to it 
---
### Module 5: Pipeline #1 - Continuous Integration
- Step 1: Created the Jenkinsfile and pushed to git repo
- Step 2: Create the Pipeline Job in Jenkins
- ![Screenshot (204)](https://github.com/user-attachments/assets/270061fa-aedc-414a-b048-ccb6cf3a71e5)
- Step 3: Run the Pipeline!
- ![Screenshot (199)](https://github.com/user-attachments/assets/f02761a6-e6bd-43a2-9341-18343cd1409c)
- ![Screenshot (190)](https://github.com/user-attachments/assets/155116bb-2cd8-468c-a0be-22ddaaed7c7a)

- we can see output confirming the job ran on linux-nithin
-![Screenshot (200)](https://github.com/user-attachments/assets/8977ed42-15c6-4cf2-9b5a-fb9bd0c67dd1)
- ![Screenshot (201)](https://github.com/user-attachments/assets/f3cc9ea8-295b-41d4-976f-8a5fe120ebaa)

- clean up process
- ![23 end](https://github.com/user-attachments/assets/c179c505-5d54-48df-b06c-e30b6ed71c90)



