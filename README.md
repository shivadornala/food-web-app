Food Menu Website Deployment Using DevOps Practices
 🚀 Project Objective

Deploy and maintain a scalable, static food menu website built with Flask, following best practices in DevOps to achieve automation, reliability, and observability.
🏗️ Architecture Overview

Cloud Provider: AWS  
Key Components:
- Infrastructure as Code: Terraform
- Containerization: Docker
- Orchestration: Kubernetes (AWS EKS)
- CI/CD: Jenkins or GitHub Actions
- Monitoring: AWS CloudWatch, Prometheus, Grafana
            +-------------------------+
            |    GitHub Repository    |
            +-----------+-------------+
                        |
                        | Webhook/CI
                        ▼
         +--------------+-------------+
         |     CI/CD Pipeline (Jenkins/GitHub Actions)   |
         +--------------+-------------+
                        |
                        ▼
              Docker Build & Push to ECR
                        |
                        ▼
          +-------------+--------------+
          |     Kubernetes Cluster (EKS)     |
          +-------------+--------------+
                        |
         +--------------+--------------+
         |        Flask Web Application        |
         |   (Static Assets from S3 Bucket)    |
         +--------------+--------------+
                        |
                        ▼
        +-------------------------------+
        | Monitoring (CloudWatch, Prometheus, Grafana) |
        +-------------------------------+

📦 Project Structure

 ✅ Deployment Steps

 🗓️ Week 1: Infrastructure & Environment Setup

1. Install Prerequisites
   - Docker
   - Kubernetes + kubectl
   - AWS CLI
   - Terraform
   - Flask (Python 3+)

2. AWS Setup
   - Create AWS account and configure CLI:  
       aws configure

3. Project Initialization
   - Set up project structure with app.py, templates, and static.

4. Terraform Deployment
   - Initialize and apply Terraform to provision:
     - VPC
     - Public/private subnets
     - EC2 instances
     - S3 bucket (for static assets)
   - Example:
     cd terraform
     terraform init
     terraform apply
     
🗓️ Week 2: Application Containerization

1. Create Dockerfile
   - Build Flask app image with necessary dependencies.

2. Build & Test Locally
   docker build -t food-menu-app .
   docker run -p 5000:5000 food-menu-app
   
4. Push to ECR
   aws ecr create-repository --repository-name food-web-app --region ap-south-1
   aws ecr get-login-password | docker login --username AWS --password-stdin 779846788677.dkr.ecr.ap-south-1.amazonaws.com
   docker tag food-web-app 779846788677.dkr.ecr.ap-south-1.amazonaws.com/food-web-app:latest
   docker push 779846788677.dkr.ecr.ap-south-1.amazonaws.com/food-web-app:latest


🗓️ Week 3: Kubernetes Deployment

1. Create Kubernetes Manifests
   - deployment.yaml, service.yaml, configmap.yaml, 

2. Deploy to EKS
    aws eks --region ap-south-1 update-kubeconfig --name education-eks-xOedHzgm
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml



3. Verify Application
   - Ensure application is accessible and static assets load from S3.


🗓️ Week 4: CI/CD Integration

1. CI/CD Setup
   - Use Jenkins or GitHub Actions for:
     - Automated build
     - Push to ECR
     - Deploy to EKS

2. Add Triggers
   - Auto-deploy on main branch merge
     
🗓️ Week 5: Monitoring & Logging

1. Enable AWS CloudWatch
   - Collect logs and metrics from EC2/EKS.

2.  Grafana
   - Install in-cluster with Helm:
     helm install grafana grafana/grafana
    

3. Alerts
   - Create alert rules for response time, pod status, server uptime.

