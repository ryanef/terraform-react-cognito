import { useLoaderData } from "react-router-dom";

export async function loader () {
  return null;
}

export async function action() {
  return null;
}

export default function Index(){
  const loaderData = useLoaderData();
  console.log(loaderData);
  return (
    <>
    <div className="cta">
      <p>Cogneato is a set of Terraform modules and React application for testing AWS Cognito. The default settings show how to use Cognito to register and authenticate a user. After user is authenticated, React will send an access token to API Gateway where if validated, Lambda will retrieve the user's profile information from DynamoDB.</p>
      <p>Cogneato's Terraform modules create a serverless infrastructure:</p> 
      <ul>
        <li><img src="/emojis/incognito.png" alt="cognito icon" /><span>Cognito User Pool + App Client</span></li>
        <li><img src="/emojis/cloudfront.png" alt="cognito icon" /><span>CloudFront + OAC</span></li>
        <li><img src="/emojis/aws_s3.png" alt="cognito icon" /><span>S3 Bucket</span></li>
        <li><img src="/emojis/aws_apigateway.png" alt="cognito icon" /><span>API Gateway + Cognito Authorizer</span></li> 
        <li><img src="/emojis/lambda.png" alt="cognito icon" /><span>Lambda (Python 3.10)</span></li>
        <li><img src="/emojis/dynamodb.png" alt="cognito icon" /><span>DynamoDB Table</span></li>
      </ul>
    </div>
    <div className="quickstart">
    <h2>Quick Start</h2>
      <p>Clone the <a href="https://github.com/ryanef/terraform-react-cognito" target="_blank">repository</a>. In the repository is an <strong>infra</strong> folder and <strong>react</strong> folder. </p>
      <pre>
        <p>git clone https://github.com/ryanef/terraform-react-cognito</p>
  

        <p>cd terraform-react-cognito</p>
 
        <p>cd infra</p>
 
        <p>terraform init</p>

        <p>terraform plan</p>

        <p>terraform apply</p>
      </pre>

    </div>
    </>
  )
}