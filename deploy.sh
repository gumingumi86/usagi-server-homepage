#!/bin/bash

# 設定ファイルの読み込み
if [ -f .env ]; then
  source .env
else
  echo ".env file not found. Please create it with S3_BUCKET and DISTRIBUTION_ID."
  exit 1
fi

# Vueプロジェクトのビルド
echo "Building Vue project..."
npm run build
if [ $? -ne 0 ]; then
  echo "Build failed. Exiting..."
  exit 1
fi

# S3へアップロード
echo "Uploading to S3..."
aws s3 sync dist/ s3://$S3_BUCKET --delete --exclude "dynmap/*"
if [ $? -ne 0 ]; then
  echo "S3 upload failed. Exiting..."
  exit 1
fi

# CloudFrontキャッシュ無効化
echo "Invalidating CloudFront cache..."
aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*"
if [ $? -ne 0 ]; then
  echo "CloudFront invalidation failed. Exiting..."
  exit 1
fi

echo "Deployment completed!"