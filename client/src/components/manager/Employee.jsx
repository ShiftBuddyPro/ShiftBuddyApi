import React, { useEffect, useState } from "react";
import { Col, Row, Container, Spinner } from "reactstrap";
import ManagerApi from "../../services/ManagerApi";

export default props => {
  const [loading, setLoading] = useState(true);
  const [employee, setEmployee] = useState(null);
  useEffect(() => {
    ManagerApi.getEmployee(localStorage.getItem("employee_id"))
      .then(employee => {
        setEmployee(employee);
        setLoading(false);
      })
      .catch(err => setLoading(false));
  });

  const renderEmployee = () => {
    return `${employee.name} (${employee.username})`;
  };

  const renderLoading = () => <Spinner color="warning" />;

  return (
    <Container className="mt-6">
      <Row>
        <Col className="card " md={{ size: 6, offset: 3 }}>
          <div className="ml-auto mr-auto">
            {loading ? renderLoading() : renderEmployee()}
          </div>
        </Col>
      </Row>
    </Container>
  );
};
