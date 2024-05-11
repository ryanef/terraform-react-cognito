// import { useLoaderData } from "react-router-dom";
import { currentAuthenticatedUser, currentSession } from "../auth/auth";
import {redirect, useLoaderData} from 'react-router-dom';

export async function loader ({params} : any ) {

    const session = await currentSession();

    const user = await currentAuthenticatedUser();
    
    if(user==="UserUnAuthenticatedException"){
      return redirect("/signin")
    }

    if(session !== null){
      const token = session.toString()
   
      const profileData = await fetch(`${import.meta.env.VITE_API_GW_URL}/api/user`, {
        headers: {
          "Authorization": token,
          }
      })

      const data = await profileData.json();
      
      return data
    }

    return null
}

export async function action() {
  return null
}

export default function Profile(){
  const data : any = useLoaderData();
  console.log(data)
  
  return (
      <div className="profile">
        <h2>Protected profile page</h2>
        <div>
          <h3 className="attention"> welcome, {data  && data?.first_name}!</h3>

          <h3 className="attention">Email: {data && data?.email}</h3>

          <p>Information retrieved from DynamoDB via API Gateway and Lambda</p>
                    
        </div>
      </div>
  )
}