import React, { Component } from "react";
import axios from "axios";
import { Col, Row, Container } from "reactstrap";

export default class Employee extends Component {
  state = {
    employee: ""
  };

  componentDidMount() {
    axios
      .get(`/api/v1/employees/${localStorage.getItem("employee_id")}`)
      .then(res => this.setState({ employee: res.data.data }))
      .catch(err => console.log(err));
  }

  employeeView() {
    if (this.state.employee) {
      return (
        <Container className="mt-6">
          <Row>
            <Col className="card" md={{ size: 6, offset: 3 }}>
              {this.state.employee.attributes.name} (
              {this.state.employee.attributes.username})
            </Col>
          </Row>
        </Container>
      );
    }
  }

  render() {
    console.log(this.state.employee);
    return <div>{this.employeeView()}</div>;
  }
}
