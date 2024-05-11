# Cogneato 

## Introduction

A React application and Terraform modules that provision a serverless architecture for developing and testing AWS Cognito settings.

The default settings work out of the box for registering and authenticating users. React is using `@aws-amplify` but only for the scoped `auth` package to have a smaller bundle size and to avoid using the whole Amplify ecosystem. 

### Terraform will create:
- Cognito User Pool and App Client
- S3 Bucket for hosting static website app
- DynamoDB table for storing some basic user profile data
- API Gateway for making API calls to get user profile information
- Two Lambda Functions
    - **confirm_signup** - Post Confirmation Hook for Cognito that automatically inserts user profile info to DynamoDB after user confirms their email
    - **user_profile** - fetches user profile information from DynamoDB after user successfully logs in and goes to their profile
- CloudFront distribution for SSL + Origin Access Control to keep the S3 Bucket private

## Quick Start

### Create AWS Infrastructure

```bash
cd infra

terraform init
terraform plan
terraform apply -auto-approve

## Optional Bash Script: Copy Terraform Output to React folder .env
## Copies Terraform Outputs 

sudo chmod +x ./envvars.sh
./envvars.sh
```

### Setup React Application

You can test locally or do a production build and upload to an S3 Bucket to have a live HTTPS CloudFront URL 

#### Local Development


```bash
cd react

npm install

npm run dev

```

#### Deploy React to AWS

Terraform does all the configuration between CloudFront and S3 so all that's needed on your part is to do `npm run build` and then upload the dist/build folder to the S3 bucket. Replace "bucketname" with the name of the S3 Bucket created by Terraform.

```bash
npm run build

aws s3 --recursive s3://bucketname
```