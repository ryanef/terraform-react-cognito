import { Amplify } from 'aws-amplify';
import { CookieStorage } from 'aws-amplify/utils';
import { cognitoUserPoolsTokenProvider } from 'aws-amplify/auth/cognito';
console.log(import.meta.env.VITE_S3_DOMAIN)
Amplify.configure({
  Auth: {
    Cognito: {
   
      userPoolId: import.meta.env.VITE_USER_POOL_ID,

      userPoolClientId: import.meta.env.VITE_USER_POOL_CLIENT_ID,

      // identityPoolId: 'XX-XXXX-X:XXXXXXXX-XXXX-1234-abcd-1234567890ab',

      // allowGuestAccess: true

      signUpVerificationMethod: 'code', // 'code' | 'link'

      // loginWith: {
      //   // OPTIONAL - Hosted UI configuration
      //   oauth: {
      //     domain: 'your_cognito_domain',
      //     scopes: [
      //       'phone',
      //       'email',
      //       'profile',
      //       'openid',
      //       'aws.cognito.signin.user.admin'
      //     ],
      //     redirectSignIn: ['http://localhost:3000/'],
      //     redirectSignOut: ['http://localhost:3000/'],
      //     responseType: 'code' // or 'token', note that REFRESH token will only be generated when the responseType is code
      //   }
      // }
    }
  }
})


// cognitoUserPoolsTokenProvider.setKeyValueStorage(new CookieStorage());
cognitoUserPoolsTokenProvider.setKeyValueStorage(new CookieStorage(
  {
    domain: `${import.meta.env.VITE_CLOUDFRONT_DOMAIN}`, 
    secure: false, 
    path: "/", 
    sameSite: "strict", 
    expires: 365
  }
)
);

export const currentConfig = Amplify.getConfig();