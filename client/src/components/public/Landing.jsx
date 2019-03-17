import React from "react";
import { Link } from "react-router-dom";
import { Jumbotron } from "reactstrap";

export default props => {
  if (localStorage.getItem("auth_token")) props.history.push("/dashboard");

  return (
    <div>
      <Jumbotron>
        <h1 className="display-3">Shift Buddy Pro</h1>
        <p className="lead">
          Revolutionizing the way that your business handles shift reports
        </p>
        <hr className="my-2" />
        <p className="lead">
          <button className="basic-button shadow orange" href="/login">
            <Link to="/login">Login</Link>
          </button>
        </p>
      </Jumbotron>
    </div>
  );
};
