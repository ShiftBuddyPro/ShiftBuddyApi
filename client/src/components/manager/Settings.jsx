import React, { Component } from "react";
import { Link } from "react-router-dom";
import { Container, Col, Row } from "reactstrap";

export default class Settings extends Component {
  render() {
    return (
      <Container>
        <Row>
          <h1 className="center py-1rem">Settings</h1>
        </Row>
        <Row>
          <Col md={{ size: 6, offset: 3 }} className="card py-1rem">
            <Link className="center" to="/inventory-items">
              <button className="basic-button shadow orange">
                Inventory Items
              </button>
            </Link>
          </Col>
        </Row>
      </Container>
    );
  }
}
