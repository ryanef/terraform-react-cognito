import React from 'react'
import ReactDOM from 'react-dom/client'
import "./global-window";
import "./auth/config";
import { createBrowserRouter, RouterProvider, } from "react-router-dom";
import ErrorPage from "./ErrorPage";
import About from "./routes/About";
import Index, { loader as indexLoader } from "./routes/Index";
import Profile, { loader as profileLoader } from "./routes/Profile";
import Root, { loader as rootLoader } from "./routes/Root";
import Signin, { loader as signinLoader, action as signinAction } from "./routes/Signin";
import Signup, { loader as signupLoader, action as signupAction } from "./routes/Signup";
import Verify, { action as verifyAction } from "./routes/Verify";
import './styles/index.css'


const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    errorElement: <ErrorPage />,
    loader: rootLoader,
    children: [
      { index: true, element: <Index />, loader: indexLoader },
      {
        path: "profile/:screenname?",
        element: <Profile/>,
        loader: profileLoader
      },
      {
        path: "about",
        element: <About/>
      },
      {
        path: "signin",
        element: <Signin/>,
        loader: signinLoader,
        action: signinAction
      },
      {
        path: "signup",
        element: <Signup/>,
        loader: signupLoader,
        action: signupAction
      },
      {
        path: "verify",
        element: <Verify/>,
        action: verifyAction
      },
    ],
  },
]);


ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)
