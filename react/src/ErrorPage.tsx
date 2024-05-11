import { useRouteError } from "react-router-dom";


export default function ErrorPage() {
  const error : any = useRouteError();
  console.error(error);

  return (
    <div id="error-page">
      <h1>404!</h1>
      <p>Sorry, an unexpected error has occurred. Please try another path.</p>
      <p>
        <i>{error.statusText || error.message}</i>
      </p>
    </div>
  );
}