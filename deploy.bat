@echo off

:: .envファイルの読み込み
if exist .env (
    for /f "tokens=1,2 delims==" %%i in ('type .env') do (
        set %%i=%%j
    )
) else (
    echo .env file not found. Please create it with S3_BUCKET and DISTRIBUTION_ID.
    exit /b 1
)

:: 必要な環境変数が設定されているか確認
if "%S3_BUCKET%"=="" (
    echo S3_BUCKET is not set in .env file. Exiting...
    exit /b 1
)
if "%DISTRIBUTION_ID%"=="" (
    echo DISTRIBUTION_ID is not set in .env file. Exiting...
    exit /b 1
)

:: Vueプロジェクトのビルド
echo Building Vue project...
npm run build
if %ERRORLEVEL% NEQ 0 (
    echo Build failed. Exiting...
    exit /b %ERRORLEVEL%
)

:: S3へアップロード
echo Uploading to S3...
aws s3 sync dist/ s3://%S3_BUCKET% --delete --exclude "dynmap/*"
if %ERRORLEVEL% NEQ 0 (
    echo S3 upload failed. Exiting...
    exit /b %ERRORLEVEL%
)

:: CloudFrontキャッシュ無効化
echo Invalidating CloudFront cache...
aws cloudfront create-invalidation --distribution-id %DISTRIBUTION_ID% --paths "/*"
if %ERRORLEVEL% NEQ 0 (
    echo CloudFront invalidation failed. Exiting...
    exit /b %ERRORLEVEL%
)

echo Deployment completed!
pause