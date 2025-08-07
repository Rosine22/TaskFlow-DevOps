#!/bin/bash

echo "🔐 Logging in to Azure..."
az login --service-principal \
  -u $AZURE_CLIENT_ID \
  -p $AZURE_CLIENT_SECRET \
  --tenant $AZURE_TENANT_ID

echo "📦 Setting Azure subscription..."
az account set --subscription $AZURE_SUBSCRIPTION_ID

echo "🚀 Deploying Docker image to Azure Web App..."
az webapp config container set \
  --name taskflow-backend-0c848a54 \
  --resource-group frontend-resource-group \
  --docker-custom-image-name ghcr.io/Rosine22/taskflow-backend-0c848a54:latest \
  --docker-registry-server-url https://ghcr.io \
  --docker-registry-server-user Rosine22 \
  --docker-registry-server-password $GITHUB_TOKEN

echo "✅ Deployment complete!"
