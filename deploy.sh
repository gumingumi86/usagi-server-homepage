#!/bin/bash

# 設定
S3_BUCKET="usagi-server-homepage-new"
DISTRIBUTION_ID="E1IWI3R1K2V109"

# Vueプロジェクトのビルド
echo "Building Vue project..."
npm run build

# S3へアップロード
echo "Uploading to S3..."
aws s3 sync dist/ s3://$S3_BUCKET --delete --exclude "*" --include "assets/*" --include "index.html" --include "items.json"

# CloudFrontキャッシュ無効化
echo "Invalidating CloudFront cache..."
aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*"

echo "Deployment completed!"
