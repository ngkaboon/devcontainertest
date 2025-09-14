#!/bin/bash

# Deploy to AWS App Runner
# Usage: ./deploy-aws.sh [REGION]

REGION=${1:-us-east-1}
SERVICE_NAME="hello-devcontainer-aws"
IMAGE_NAME="public.ecr.aws/z6l6u0w0/hello-devcontainer-aws:latest"

echo "🚀 Deploying to AWS App Runner..."
echo "Region: $REGION"
echo "Service: $SERVICE_NAME"
echo "Image: $IMAGE_NAME"

# Build and push to GitHub Container Registry
echo "📦 Building Docker image..."
docker build -t $IMAGE_NAME .

echo "📤 Pushing to ECR Public..."
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
docker push $IMAGE_NAME

# Check if service exists
echo "🔍 Checking if service exists..."
SERVICE_ARN=$(aws apprunner list-services --region $REGION --query "ServiceSummaryList[?ServiceName=='$SERVICE_NAME'].ServiceArn" --output text 2>/dev/null)

if [ -n "$SERVICE_ARN" ] && [ "$SERVICE_ARN" != "None" ]; then
    echo "🔄 Service exists, triggering deployment..."
    aws apprunner start-deployment --service-arn "$SERVICE_ARN" --region $REGION
else
    echo "🆕 Creating new App Runner service..."
    aws apprunner create-service \
        --service-name $SERVICE_NAME \
        --region $REGION \
        --source-configuration '{
            "ImageRepository": {
                "ImageIdentifier": "'$IMAGE_NAME'",
                "ImageConfiguration": {
                    "Port": "8080"
                },
                "ImageRepositoryType": "ECR_PUBLIC"
            },
            "AutoDeploymentsEnabled": false
        }' \
        --instance-configuration '{
            "Cpu": "0.25 vCPU",
            "Memory": "0.5 GB"
        }'
fi

# Get service URL
echo "⏳ Waiting for service to be ready..."
sleep 30

SERVICE_ARN=$(aws apprunner list-services --region $REGION --query "ServiceSummaryList[?ServiceName=='$SERVICE_NAME'].ServiceArn" --output text)
SERVICE_URL=$(aws apprunner describe-service --service-arn "$SERVICE_ARN" --region $REGION --query "Service.ServiceUrl" --output text)

echo "✅ Deployment complete!"
echo "🌐 Your app is available at: https://$SERVICE_URL"