import React, { useEffect, useState } from "react";
import { Container, Row, Col, FormGroup, Label, Input, Form } from "reactstrap";
import appColors from "constants/appColors";
import ManagerApi from "../../services/ManagerApi";

export default props => {
  const [fields, setFields] = useState({ email: "", password: "" });
  const [errors, setErrors] = useState(false);

  useEffect(() => {
    if (localStorage.getItem("auth_token")) props.history.push("/dashboard");
  }, []);

  const handleSubmit = event => {
    event.preventDefault();
    ManagerApi.login(fields)
      .then(res => {
        props.history.push({ pathname: "/dashboard" });
      })
      .catch(err => setErrors(true));
  };

  const handleChange = event => {
    setFields({ ...fields, [event.target.name]: event.target.value });
  };

  const renderErrors = () => {
    if (errors)
      return (
        <p style={{ color: appColors.darkRed, textAlign: "center" }}>
          Invalid Email/Password combination
        </p>
      );
  };

  return (
    <Container className="mt-6">
      <Row>
        <Col md={{ size: 6, offset: 3 }}>
          <Form className="card p-1rem">
            <h3 className="ml-auto mr-auto">Manager Login</h3>
            <FormGroup>
              <Label for="email">Email</Label>
              <Input onChange={handleChange} type="email" name="email" />
            </FormGroup>
            <FormGroup>
              <Label for="password">Password</Label>
              <Input onChange={handleChange} type="password" name="password" />
            </FormGroup>
            {renderErrors()}
            <button
              style={{ backgroundColor: appColors.primary.regular }}
              className="basic-button shadow"
              onClick={handleSubmit}
            >
              Enter
            </button>
          </Form>
        </Col>
      </Row>
    </Container>
  );
};
