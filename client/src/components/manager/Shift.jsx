import React, { Component } from "react";
import axios from "axios";
import { Container, Row, Col, Table } from "reactstrap";

export default class Shift extends Component {
  state = {
    cashDrops: [],
    paidOuts: [],
    checks: [],
    change: {}
  };

  componentDidMount() {
    axios
      .get(`/api/v1/shifts/${localStorage.getItem("shift_id")}/cash_drops`)
      .then(res => {
        this.setState({ cashDrops: res.data });
      })
      .catch(err => console.log(err));

    axios
      .get(`/api/v1/shifts/${localStorage.getItem("shift_id")}/checks`)
      .then(res => {
        this.setState({ checks: res.data });
      })
      .catch(err => console.log(err));

    axios
      .get(`/api/v1/shifts/${localStorage.getItem("shift_id")}/paid_outs`)
      .then(res => {
        this.setState({ paidOuts: res.data });
      })
      .catch(err => console.log(err));

    axios
      .get(`/api/v1/shifts/${localStorage.getItem("shift_id")}/change_sheet`)
      .then(res => {
        console.log(res);
        this.setState({ change: res.data });
      })
      .catch(err => console.log(err));
  }

  cashDropsView() {
    return this.state.cashDrops.map(cashDrop => {
      return (
        <div key={cashDrop.id}>
          #{cashDrop.number} - ${cashDrop.amount.toFixed(2)}
        </div>
      );
    });
  }

  paidOutsView() {
    return this.state.paidOuts.map(paidOut => {
      return (
        <div key={paidOut.id}>
          {paidOut.company} - ${paidOut.amount.toFixed(2)}
        </div>
      );
    });
  }

  checksView() {
    return this.state.checks.map(check => {
      return (
        <div key={check.id}>
          {check.number} - {check.company} - ${check.amount.toFixed(2)}
        </div>
      );
    });
  }

  render() {
    return (
      <Container>
        <Row>
          <Col className="text-center">
            <h1>Shift</h1>
          </Col>
        </Row>
        <Row>
          <Col className="card" md={{ size: 5 }}>
            <h5>Cash Drops</h5>
            {this.cashDropsView()}
          </Col>
          <Col className="card" md={{ size: 6, offset: 1 }}>
            <h5>Paid Outs</h5>
            {this.paidOutsView()}
          </Col>
        </Row>
        <Row>
          <Col className="card">
            <h5>Checks</h5>
            {this.checksView()}
          </Col>
        </Row>
        <Row>
          <Col className="card">
            <h5>Change</h5>
          </Col>
        </Row>
        <Row>
          <Col className="card">
            <h5>Inventory</h5>
          </Col>
        </Row>
        <Row>
          <Col className="card">
            <h5>Notes</h5>
          </Col>
        </Row>
      </Container>
    );
  }
}
