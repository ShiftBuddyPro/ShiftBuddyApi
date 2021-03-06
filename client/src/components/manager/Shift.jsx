import * as React from "react";
import { Container, Row, Col } from "reactstrap";
import CashDrops from "./shift/CashDrops";
import Notes from "./shift/Notes";
import PaidOuts from "./shift/PaidOuts";
import Inventory from "./shift/Inventory";
import Checks from "./shift/Checks";
import Change from "./shift/Change";

export default props => {
  const renderSection = (name, body) => {
    return (
      <Row>
        <Col className="card p-b-2rem pl-half">
          <h5 className="p-y-half">{name}</h5>
          {body}
        </Col>
      </Row>
    );
  };

  return (
    <Container>
      <Row>
        <Col className="text-center">
          <h1 className="py-1rem">Shift</h1>
        </Col>
      </Row>
      <Row>
        <Col className="card p-b-2rem pl-half" md={{ size: 5 }}>
          <h5 className="p-y-half">Cash Drops</h5>
          <CashDrops />
        </Col>
        <Col className="card p-b-2rem pl-half" md={{ size: 6, offset: 1 }}>
          <h5 className="p-y-half">Paid Outs</h5>
          <PaidOuts />
        </Col>
      </Row>
      {renderSection("Checks", <Checks />)}
      {renderSection("Change", <Change />)}
      {renderSection("Inventory", <Inventory />)}
      {renderSection("Notes", <Notes />)}
    </Container>
  );
};
