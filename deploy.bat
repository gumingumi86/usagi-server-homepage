:: filepath: c:\work_dir\usagi-server-homepage\deploy.bat
@echo off

:: 設定
set S3_BUCKET=usagi-server-homepage-new
set DISTRIBUTION_ID=E1IWI3R1K2V109

:: Vueプロジェクトのビルド
echo Building Vue project...
call npm run build

:: S3へアップロード
echo Uploading to S3...
aws s3 sync dist/ s3://%S3_BUCKET% --delete --exclude "*" --include "assets/*" --include "index.html"

:: CloudFrontキャッシュ無効化
echo Invalidating CloudFront cache...
aws cloudfront create-invalidation --distribution-id %DISTRIBUTION_ID% --paths "/*"

echo Deployment completed!
pause