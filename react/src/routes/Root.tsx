import { Outlet, NavLink } from "react-router-dom";
import '../styles/form.css';

export async function loader () {
  return null
}

export async function action() {
  return null
}

export default function Root(){
  return (
    <>
        <header>
          <h1>
          <img src="/emojis/spy.png"/>
            <NavLink to="/">
              Cogneato
            </NavLink>
          </h1>

          <nav>
            <ul>
              <li><NavLink to="/">Home</NavLink></li>
              <li><NavLink to="/about">About</NavLink></li>
              <li><NavLink to="/profile">Profile</NavLink></li>
              <li><NavLink to="/signup">Register</NavLink></li>
              <li><NavLink to="/signin">Login</NavLink></li>
            </ul>
          </nav>
        </header>

        <main>
          <Outlet />
        </main>

    </>
  )
}