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
