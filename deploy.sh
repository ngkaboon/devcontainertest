#!/bin/bash

# Deploy to Google Cloud Run
# Usage: ./deploy.sh [PROJECT_ID] [REGION]

PROJECT_ID=${1:-your-project-id}
REGION=${2:-us-central1}
SERVICE_NAME="hello-devcontainer"

echo "🚀 Deploying to Google Cloud Run..."
echo "Project: $PROJECT_ID"
echo "Region: $REGION"
echo "Service: $SERVICE_NAME"

# Build and deploy
gcloud run deploy $SERVICE_NAME \
  --source . \
  --platform managed \
  --region $REGION \
  --project $PROJECT_ID \
  --allow-unauthenticated \
  --port 8080 \
  --memory 512Mi \
  --cpu 1 \
  --min-instances 0 \
  --max-instances 10

echo "✅ Deployment complete!"
echo "🌐 Your app should be available at the URL shown above"