
export default function About(){

  return (
    <>
      <div>
        <p>  
          A React application and Terraform modules that provision a serverless architecture for developing and testing AWS Cognito settings.
        </p>

      </div>
      <div className="about">

        <div className="stack">
        <h3>Frontend Stack</h3>
          <ul>
            <li>React 18.2</li>
            <li>React Router 6.22</li>
            <li>AWS Amplify 6.0</li>
          </ul>
        </div>
        <div className="stack">
        <h3>Infrastructure Stack</h3>
          <ul>
            <li>Terraform 1.8</li>
            <li>GitHub</li>
            <li>AWS</li>
          </ul>
        </div>
        <div className="stack">
        <h3>AWS Resources</h3>
          <ul>
            <li>API Gateway</li>
            <li>CloudFront + OAC</li>
            <li>CloudWatch Logs</li>
            <li>Cognito</li>
            <li>DynamoDB</li>
            <li>S3 Bucket</li>
          </ul>
        </div>
      </div>
    </>
  )
}