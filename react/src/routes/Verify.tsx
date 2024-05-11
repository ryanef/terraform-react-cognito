import { useLoaderData, redirect, Form  } from "react-router-dom";
import { handleSignUpConfirmation } from "../auth/auth";

export async function loader () {
    return null
 
}
export async function action({request} : any) {
  const data = Object.fromEntries(await request.formData());
  console.log(data);
  const { email, confirmationCode } = data;
  const user = await handleSignUpConfirmation({username: email, confirmationCode});
  console.log(user);
  if(user?.signUpStep==="DONE"){
    return redirect('/signin');
  }
  return null
}

export default function Verify(){
  const data = useLoaderData();

  console.log(data);
  return (
    <div className="verify">
      <h2>Enter Confirmation Code</h2>

      <Form method="post">
        <label htmlFor="email">Email</label>
        <input type="email" name="email" placeholder="Email address..." />

        <label htmlFor="confirmationCode">Confirmation Code</label>
        <input type="text" name="confirmationCode" placeholder="Enter Confirmation Code..." />

        <button type="submit">Verify</button>
      </Form>
      
      </div>
  )
}