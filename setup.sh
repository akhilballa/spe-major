#!/bin/bash

# Configuration setup script for SPE_Majorproject

echo "======================================================="
echo "   SPE_Majorproject Personalization Setup Script"
echo "======================================================="
echo "This script will help you replace hardcoded values with your own."
echo ""

# 1. Docker Hub Username
read -p "Enter your Docker Hub Username (current: asrith1158): " DOCKER_USER
if [ -z "$DOCKER_USER" ]; then
    echo "Skipping Docker Hub Username update..."
else
    echo "Updating Docker Hub Username to '$DOCKER_USER'..."
    # Update docker-compose.yml
    sed -i '' "s|asrith1158/|$DOCKER_USER/|g" docker-compose.yml
    # Update Jenkinsfile
    sed -i '' "s|asrith1158|$DOCKER_USER|g" Jenkinsfile
    # Update K8s deployments
    sed -i '' "s|asrith1158/|$DOCKER_USER/|g" k8/frontend-deployment.yaml
    sed -i '' "s|asrith1158/|$DOCKER_USER/|g" k8/backend-deployment.yaml
    echo "Done."
fi
echo ""

# 2. MongoDB URI
read -p "Enter your MongoDB URI: " MONGO_URI
if [ -z "$MONGO_URI" ]; then
    echo "Skipping MongoDB URI update..."
else
    echo "Updating MongoDB URI..."
    # Escape special characters for sed
    ESCAPED_MONGO_URI=$(printf '%s\n' "$MONGO_URI" | sed -e 's/[\/&]/\\&/g')
    
    # Update docker-compose.yml (Note: looking for the specific hardcoded string or just replacing MONGODB_URI value)
    # Since the current value is specific, we rely on the key being predictable. 
    # Current: MONGODB_URI: mongodb+srv://...
    sed -i '' "s|MONGODB_URI: .*|MONGODB_URI: $ESCAPED_MONGO_URI|g" docker-compose.yml
    
    # Update Jenkinsfile
    sed -i '' "s|MONGODB_URI='.*'|MONGODB_URI='$ESCAPED_MONGO_URI'|g" Jenkinsfile
    
    # Update K8s Secret (Base64)
    # Handle MacOS vs Linux base64 behavior
    if [[ "$OSTYPE" == "darwin"* ]]; then
        B64_MONGO=$(echo -n "$MONGO_URI" | base64)
    else
        B64_MONGO=$(echo -n "$MONGO_URI" | base64 -w 0)
    fi
    sed -i '' "s|MONGODB_URI: .*|MONGODB_URI: $B64_MONGO|g" k8/mern-backend-secret.yaml
    
    echo "Done."
fi
echo ""

# 3. JWT Secret
read -p "Enter a new JWT Secret Key (leave empty to generate one): " JWT_SECRET
if [ -z "$JWT_SECRET" ]; then
    JWT_SECRET=$(openssl rand -hex 32)
    echo "Generated new secret: $JWT_SECRET"
fi

if [ -n "$JWT_SECRET" ]; then
    echo "Updating JWT Secret..."
    ESCAPED_JWT=$(printf '%s\n' "$JWT_SECRET" | sed -e 's/[\/&]/\\&/g')
    
    # Update docker-compose.yml
    sed -i '' "s|JWT_SECRET_KEY: .*|JWT_SECRET_KEY: $ESCAPED_JWT|g" docker-compose.yml
    
    # Update Jenkinsfile
    sed -i '' "s|JWT_SECRET_KEY='.*'|JWT_SECRET_KEY='$ESCAPED_JWT'|g" Jenkinsfile
    
    # Update K8s Secret
    if [[ "$OSTYPE" == "darwin"* ]]; then
        B64_JWT=$(echo -n "$JWT_SECRET" | base64)
    else
        B64_JWT=$(echo -n "$JWT_SECRET" | base64 -w 0)
    fi
    sed -i '' "s|JWT_SECRET_KEY: .*|JWT_SECRET_KEY: $B64_JWT|g" k8/mern-backend-secret.yaml
    echo "Done."
fi
echo ""

# 4. Git Repository URL
read -p "Enter your Git Repository URL (e.g., https://github.com/user/repo.git): " GIT_URL
if [ -z "$GIT_URL" ]; then
    echo "Skipping Git URL update..."
else
    echo "Updating Git URL in Jenkinsfile..."
    ESCAPED_GIT_URL=$(printf '%s\n' "$GIT_URL" | sed -e 's/[\/&]/\\&/g')
    sed -i '' "s|url: 'https://github.com/Asrith16/SPE_Majorproject.git'|url: '$ESCAPED_GIT_URL'|g" Jenkinsfile
    echo "Done."
fi
echo ""

# 5. Cloudinary Cloud Name
read -p "Enter your Cloudinary Cloud Name: " CLOUD_NAME
if [ -z "$CLOUD_NAME" ]; then
    echo "Skipping Cloudinary Cloud Name update..."
else
    echo "Updating Cloudinary Cloud Name..."
    sed -i '' "s|REACT_APP_CLOUDINARY_CLOUD_NAME: .*|REACT_APP_CLOUDINARY_CLOUD_NAME: $CLOUD_NAME|g" docker-compose.yml
    sed -i '' "s|REACT_APP_CLOUDINARY_CLOUD_NAME = '.*'|REACT_APP_CLOUDINARY_CLOUD_NAME = '$CLOUD_NAME'|g" Jenkinsfile
    echo "Done."
fi
echo ""

# 6. Cloudinary Upload Preset
read -p "Enter your Cloudinary Upload Preset (current: chat-app-file): " CLOUD_PRESET
if [ -z "$CLOUD_PRESET" ]; then
    echo "Skipping Upload Preset update..."
else
    echo "Updating Cloudinary Upload Preset..."
    sed -i '' "s|\"upload_preset\",\"chat-app-file\"|\"upload_preset\",\"$CLOUD_PRESET\"|g" client/src/helpers/uploadFile.js
    echo "Done."
fi

echo ""
echo "======================================================="
echo "   Configuration Complete!"
echo "   Please review the changes before committing."
echo "======================================================="
