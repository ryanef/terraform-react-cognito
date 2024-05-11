import '../auth/config'
import { redirect, Form  } from "react-router-dom";
import { handleSignIn, currentSession } from "../auth/auth";

export async function loader () {
    return null
}
export async function action({request} : any) {
  const data = Object.fromEntries(await request.formData());
  console.log(data);
  const { email, password } = data;
  const user = await handleSignIn({username: email, password});
  console.log("user")
  console.log(user)
  if(user === "UserAlreadyAuthenticatedException" || user.signInStep === "DONE"){
    const session = await currentSession();
    console.log("signin session")
    console.log(session)
    return redirect('/profile')
  }else {
    return null
    return user.signInStep
  }
}

export default function Signin(){

  return (
    <div className="signin">
      <h2>Login</h2>
      <Form method="post">
        <label htmlFor="email">Email</label>
        <input type="email" name="email" placeholder="Email address..." />

        <label htmlFor="password">Password</label>
        <input type="password" name="password" placeholder="Enter password..." />

        <button type="submit">Login</button>
      </Form>
      </div>
  )
}