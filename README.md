# Enterprise GitOps & Infrastructure as Code Pipeline

A complete, end-to-end DevOps portfolio project demonstrating the automated provisioning of cloud infrastructure and the deployment of a microservices-ready architecture using GitOps principles.

## Architecture Overview
This project separates infrastructure state and application delivery into distinct phases. AWS resources are provisioned via Terraform with remote state management. Application code is built via GitHub Actions, pushed to a private Elastic Container Registry (ECR), and automatically synchronized to an Amazon EKS cluster using ArgoCD.

## Technology Stack
* **Cloud Provider:** AWS (us-east-1)
* **Infrastructure as Code:** Terraform
* **Containerization:** Docker
* **Container Registry:** Amazon ECR
* **Orchestration:** Amazon EKS (Kubernetes)
* **Continuous Integration:** GitHub Actions
* **Continuous Deployment:** ArgoCD (GitOps)

## Directory Structure
* `01-backend/`: Initial Terraform state configuration (S3 & DynamoDB).
* `02-cluster/`: Highly available VPC network and EKS cluster provisioning.
* `03-ecr/`: Private container registry infrastructure.
* `04-app/`: Custom Nginx web application and Dockerfile.
* `05-k8s/`: Kubernetes manifests (Deployment, LoadBalancer Service) and ArgoCD Application definitions.
* `.github/workflows/`: CI pipeline for automated Docker image building and pushing.

## Deployment Pipeline (The GitOps Flow)
1. Developer pushes application code to the `main` branch.
2. GitHub Actions intercepts the push, builds a new Docker image, and authenticates with AWS.
3. The image is securely pushed to the private Amazon ECR repository.
4. ArgoCD, running inside the EKS cluster, detects changes in the GitHub repository's Kubernetes manifests.
5. ArgoCD automatically pulls the new state and dynamically updates the worker nodes.
6. Traffic is routed to the application pods via an AWS Classic Load Balancer.

## Infrastructure Management
All Terraform modules utilize remote S3 backends for state preservation, allowing for clean tear-downs of compute resources to optimize cloud costs without losing architectural memory.