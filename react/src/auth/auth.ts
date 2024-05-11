import './config'
import { signUp, confirmSignUp, type ConfirmSignUpInput,  signIn, type SignInInput, getCurrentUser, fetchAuthSession  } from 'aws-amplify/auth';

type SignUpParameters = {
  name: string;
  password: string;
  email: string;
};

export async function handleSignUp({
  email,
  password,
  name,
}: SignUpParameters) {
  try {
    const { isSignUpComplete, userId, nextStep } = await signUp({
      username: email,
      password,
      options: {
        userAttributes: {
          name,
        },

        // autoSignIn: true 
      }
    });

    console.log(userId);
    console.log(isSignUpComplete);
    console.log(nextStep);
    return nextStep
  } catch (error) {
    console.log('error signing up:', error);
  }
}

export async function handleSignUpConfirmation({
  username,
  confirmationCode
}: ConfirmSignUpInput) {
  try {
    const { isSignUpComplete, nextStep } = await confirmSignUp({
      username,
      confirmationCode
    });
    console.log(isSignUpComplete);
    console.log(nextStep);
    return nextStep;

  } catch (error) {
    console.log('error confirming sign up', error);
  }
}

export async function handleSignIn({ username, password }: SignInInput) {
  try {
    const { isSignedIn, nextStep } = await signIn({ username, password });

    return nextStep;
  } catch (error : any) {

    return error.name
  }
}

export async function currentAuthenticatedUser() {
  try {
    const { username, userId, signInDetails } = await getCurrentUser();

    return {username, userId, signInDetails};
  } catch (err: any) {
    console.log(Object.getOwnPropertyNames(err));
    return err.name;
  }
}

export async function currentSession() {
  try {
    const { accessToken, idToken } = (await fetchAuthSession()).tokens ?? {};
   
    return accessToken;
  } catch (err: any) {
    console.log(err.message);
    return err.message
  }
}

