import React, { Component, useState, useEffect } from "react";
import { Container, Row, Col, Table } from "reactstrap";
import ManagerApi from "../../services/ManagerApi";

export default props => {
  const [shift, setShift] = useState({
    cashDrops: [],
    paidOuts: [],
    checks: [],
    change: {},
    notes: []
  });
  useEffect(() => {
    const shiftId = localStorage.getItem("shift_id");
    ManagerApi.getCashDrops(shiftId).then(cashDrops => {
      ManagerApi.getPaidOuts(shiftId).then(paidOuts => {
        ManagerApi.getChecks(shiftId).then(checks => {
          ManagerApi.getNotes(shiftId).then(notes => {
            ManagerApi.getInventory(shiftId)
              .then(inventory => {
                ManagerApi.getChange(shiftId)
                  .then(change => {
                    setShift({
                      cashDrops,
                      paidOuts,
                      checks,
                      inventory,
                      notes,
                      change
                    });
                  })
                  .catch(_ =>
                    setShift({ cashDrops, paidOuts, checks, notes, inventory })
                  );
              })
              .catch(_ => setShift({ cashDrops, paidOuts, checks, notes }));
          });
        });
      });
    });
  }, []);

  const renderCashDrops = () => {
    return shift.cashDrops.map(cashDrop => {
      return (
        <div key={cashDrop.id}>
          #{cashDrop.number} - ${cashDrop.amount.toFixed(2)}
        </div>
      );
    });
  };

  const renderPaidOuts = () => {
    return shift.paidOuts.map(paidOut => {
      return (
        <div key={paidOut.id}>
          {paidOut.company} - ${paidOut.amount.toFixed(2)}
        </div>
      );
    });
  };

  const renderChecks = () => {
    return shift.checks.map(check => {
      return (
        <div key={check.id}>
          {check.number} - {check.company} - ${check.amount.toFixed(2)}
        </div>
      );
    });
  };

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
          {renderCashDrops()}
        </Col>
        <Col className="card" md={{ size: 6, offset: 1 }}>
          <h5>Paid Outs</h5>
          {renderPaidOuts()}
        </Col>
      </Row>
      <Row>
        <Col className="card">
          <h5>Checks</h5>
          {renderChecks()}
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
};
