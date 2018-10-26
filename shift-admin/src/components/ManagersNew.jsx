import React, { Component } from 'react';
import { Button, Form, FormGroup, Input, Label } from 'reactstrap';
import axios from 'axios';

export class ManagersNew extends Component {
  state = {
    name: '',
    email: '',
  }

  onChange = e => {
    this.setState({ [e.target.name]: e.target.value })
  }

  onSubmit = e => {
    e.preventDefault();
    const { name, email } = this.state;

    axios.post("http://localhost:8000/api/v1/managers", { name, email })
    .then(result => {
      console.log(result);
    })
    .catch(err => {
      console.log(err);
    })
  };

  render() {
    const { name, email } = this.state;
    return (
      <Form onSubmit={this.onSubmit}>
        <FormGroup>
          <Label for="name">Name</Label>
          <Input value={name} onChange={this.onChange} type="name" name="name"/>
        </FormGroup>
        <FormGroup>
          <Label for="exampleEmail">Email</Label>
          <Input value={email} onChange={this.onChange} type="email" name="email"/>
        </FormGroup>
        <Button type="submit">Submit</Button>
      </Form>
    )
  }
}

export default ManagersNew
