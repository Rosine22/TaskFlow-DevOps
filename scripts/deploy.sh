#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# === CONFIGURATION ===
APP_NAME="taskflow-backend-0c848a54"
RESOURCE_GROUP="frontend-resource-group"
IMAGE_NAME="ghcr.io/rosine22/taskflow-backend-0c848a54:latest"
REGISTRY_URL="https://ghcr.io"
REGISTRY_USER="rosine22"

echo "🔐 Logging in to Azure..."
az login --service-principal \
  --username "$AZURE_CLIENT_ID" \
  --password "$AZURE_CLIENT_SECRET" \
  --tenant "$AZURE_TENANT_ID"

echo "📦 Setting Azure subscription..."
az account set --subscription "$AZURE_SUBSCRIPTION_ID"

echo "🚀 Configuring container settings for $APP_NAME..."
az webapp config container set \
  --name "$APP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --docker-custom-image-name "$IMAGE_NAME" \
  --docker-registry-server-url "$REGISTRY_URL" \
  --docker-registry-server-user "$REGISTRY_USER" \
  --docker-registry-server-password "$GITHUB_TOKEN"

echo "🔁 Restarting web app to apply changes..."
az webapp restart \
  --name "$APP_NAME" \
  --resource-group "$RESOURCE_GROUP"

echo "✅ Deployment to $APP_NAME complete!"
