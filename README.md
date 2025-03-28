week 1:Familiarization and Environment setup 
steps:
1.install Required Tools  Flask Application Deployment on AWS
Project Overview
This project helps you set up a Flask web application and deploy it on AWS using Docker, Kubernetes, and Terraform**.
Week 1: Familiarization and Environment Setup
 Steps:
1. Install Required Tools:
   - Docker
   - Kubernetes (kubectl & minikube for local testing)
   - Terraform
   - AWS CLI
   - Flask (Python framework)

2.  Obtain AWS Credentials:
   - Create an AWS account
   - Set up IAM user with required permissions
   - Configure AWS CLI using:
     aws configure


3. Written Terraform Scripts:
   - Create VPC, subnets, EC2 instances, and an S3 bucket for storing static assets.
   - Push Terraform scripts to GitHub.

Week 2: Application Containerization
Steps:
1. Create a Dockerfile:
   - Defines how the Flask app runs inside a container.
   - Example:
     dockerfile
     FROM python:3.9
     WORKDIR /app
     COPY . .
     RUN pip install -r requirements.txt
     CMD ["python", "app.py"]

2. Test Locally:
   docker build -t my-flask-app .
   docker run -p 5000:5000 my-flask-app
   - Open browser: `http://localhost:5000`

3. Push Docker Image to AWS ECR:
   - Create an ECR repository in AWS.
   - Authenticate and push the Docker image:
aws ecr get-login-password | docker login --username AWS --password-stdin 779846788677.dkr.ecr.ap-south-1.amazonaws.com
docker tag my-flask-app:latest 779846788677.dkr.ecr.ap-south-1.amazonaws.com/my-flask-app:latest

Week 3: Kubernetes Deployment
 Steps:
1. Writtten Kubernetes Manifests:
   - Deployment: Defines how the Flask app runs in Kubernetes.
   - Service: Exposes the application to the internet.
   - ConfigMaps & Secrets: Store environment variables securely.

2. Deploy on AWS EKS:
   - Set up Amazon EKS (Kubernetes cluster)
   - Deploy the application:
     kubectl apply -f k8s/

3.  Test the Website
   - Get the public URL using:
     kubectl get services
   - Open the URL in a browser to check if everything works.


 Week 4: CI/CD Pipeline Integration
 Deliverables:
- Configure Jenkins or GitHub Actions to automate build, test, and deployment.
- Set up triggers for code changes to automatically deploy updated builds.
- Validate the pipeline for successful integration and deployment.

 Steps:
1. CI/CD Pipeline Setup:**
   - Configure Jenkins inside a Docker container.
   - Create a Jenkinsfile to automate build and deployment steps.
   - Alternatively, set up GitHub Actions workflow "https://github.com/shivadornala/food-web-app/blob/main/.github/workflows/cicd-pipeline.yml"
     
2. Build Automation:
   - Automate Docker image building and pushing to AWS ECR.
   - Ensure Terraform scripts deploy updated infrastructure if needed.
     
3. Trigger Configuration:
   - Enable webhooks for GitHub to trigger Jenkins/GitHub Actions on code changes.
   - Validate auto-deployment after each commit.


 Week 5: Monitoring and Logging
 Deliverables:
- Integrate AWS CloudWatch for logs and application performance monitoring.
- Set up Grafana for monitoring Kubernetes clusters.
- Create alerts for key performance metrics (response time, server uptime).

Steps:
1. CloudWatch Setup:
   - Enable CloudWatch logs and metrics for EC2 instances and EKS pods.
   - Configure CloudWatch Alarms for failures and performance degradation.
2.  Grafana Integration:
    - Configure Grafana dashboards for real-time monitoring.
    - Set up alerts based on predefined thresholds.


