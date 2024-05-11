import { redirect, Form } from "react-router-dom";
import { handleSignUp } from "../auth/auth";

export async function loader () {
    return null
 
}
export async function action({request} : any) {
  const data = Object.fromEntries(await request.formData())
  console.log(data)
  const { email, password, name } = data;
  const user = await handleSignUp({email, password, name});

  if(user?.signUpStep === 'CONFIRM_SIGN_UP'){
    return redirect('/verify');
  }

  return null;
}

export default function Signup(){

  return (
    <div className="signup">
      
      <h2>Register</h2>

      <Form method="post">
        <label htmlFor="email">Email</label>
        <input type="email" name="email" placeholder="Email address..." />

        <label htmlFor="name">Name</label>
        <input type="text" name="name" placeholder="First Name..." />

        <label htmlFor="password">Password</label>
        <input type="password" name="password" placeholder="Enter password..." />

        <label htmlFor="password2">Password</label>
        <input type="password" name="password2" placeholder="Confirm password..." />
        
        <button type="submit">Register</button>
      </Form>

      </div>
  )
}