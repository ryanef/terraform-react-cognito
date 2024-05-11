#!/bin/bash

API_GW_URL=$(terraform output -raw api_gw_url)
CLOUDFRONT_DOMAIN=$(terraform output -raw cloudfront_url)
S3_NAME=$(terraform output -raw s3_name)
USER_POOL_ID=$(terraform output -raw user_pool_id)
USER_POOL_CLIENT_ID=$(terraform output -raw user_pool_client_id)


echo "VITE_API_GW_URL=$API_GW_URL" > ../react/.env
echo "VITE_CLOUDFRONT_DOMAIN=localhost" >> ../react/.env
echo "VITE_S3_NAME=$S3_NAME" >> ../react/.env
echo "VITE_USER_POOL_ID=$USER_POOL_ID" >> ../react/.env
echo "VITE_USER_POOL_CLIENT_ID=$USER_POOL_CLIENT_ID" >> ../react/.env


echo "VITE_API_GW_URL=$API_GW_URL" > ../react/.env.production
echo "VITE_CLOUDFRONT_DOMAIN=$CLOUDFRONT_DOMAIN" >> ../react/.env.production
echo "VITE_S3_NAME=$S3_NAME" >> ../react/.env.production
echo "VITE_USER_POOL_ID=$USER_POOL_ID" >> ../react/.env.production
echo "VITE_USER_POOL_CLIENT_ID=$USER_POOL_CLIENT_ID" >> ../react/.env.production
