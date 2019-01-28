import React, { Component } from "react";
import axios from "axios";
import * as jwt_decode from "jwt-decode";
import {
  Container,
  Row,
  Col,
  FormGroup,
  Label,
  Input,
  FormText,
  Form
} from "reactstrap";

export default class Login extends Component {
  constructor(props) {
    super(props);
    this.state = { email: "", password: "", errors: false };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ [event.target.name]: event.target.value });
  }

  componentWillMount() {
    if (localStorage.getItem("auth_token")) {
      this.props.history.push("/dashboard");
    }
  }

  handleSubmit(event) {
    event.preventDefault();

    axios
      .post("/api/v1/managers/authenticate", this.state)
      .then(res => {
        this.setState({ errors: false });
        const { auth_token } = res.data;
        localStorage.setItem("auth_token", auth_token);
        const { manager_id } = jwt_decode(auth_token);
        localStorage.setItem("manager_id", manager_id);
        this.props.history.push({ pathname: "/dashboard" });
      })
      .catch(err => this.setState({ errors: true }));
  }

  renderErrorMessage() {
    return (
      <p className="small-error-text">Invalid Email/Password combination</p>
    );
  }

  render() {
    return (
      <Container className="mt-6">
        <Row>
          <Col md={{ size: 6, offset: 3 }}>
            <Form className="card p-1rem">
              <h3 className="ml-auto mr-auto">Manager Login</h3>
              <FormGroup>
                <Label for="email">Email</Label>
                <Input
                  onChange={this.handleChange}
                  type="email"
                  name="email"
                  id="email"
                />
              </FormGroup>
              <FormGroup>
                <Label for="password">Password</Label>
                <Input
                  onChange={this.handleChange}
                  type="password"
                  name="password"
                  id="password"
                />
              </FormGroup>
              {this.state.errors ? this.renderErrorMessage() : ""}
              <button
                className="basic-button shadow blue"
                onClick={this.handleSubmit}
              >
                Enter
              </button>
            </Form>
          </Col>
        </Row>
      </Container>
    );
  }
}
