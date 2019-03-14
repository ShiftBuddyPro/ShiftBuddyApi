import React, { useState, useEffect } from "react";
import { Container, Col, Row, Spinner } from "reactstrap";
import ManagerApi from "../../services/ManagerApi";

export default props => {
  const [loading, setLoading] = useState(true);
  const [employees, setEmployees] = useState([]);
  useEffect(() => {
    ManagerApi.getEmployees()
      .then(employees => {
        setEmployees(employees);
        setLoading(false);
      })
      .catch(err => setLoading(false));
  }, []);

  const renderEmployees = () => {
    const handleEmployeeClick = employee_id => {
      localStorage.setItem("employee_id", employee_id);
      props.history.push("/employee");
    };

    return employees.map(employee => {
      return (
        <div className="list-view-item" key={employee.id}>
          {employee.name}
          <button
            className="float-right basic-button shadow orange"
            onClick={() => {
              handleEmployeeClick(employee.id);
            }}
          >
            View
          </button>
        </div>
      );
    });
  };

  const renderLoading = () => (
    <div className="ml-auto mr-auto py-3 ">
      <Spinner color="warning" />
    </div>
  );

  return (
    <Container>
      <h1 className="text-center">
        {" "}
        Employees{" "}
        <span
          onClick={() => props.history.push("/employeesnew")}
          className="plus-button"
        >
          +
        </span>
      </h1>
      <Row>
        <Col className="card" md={{ size: 8, offset: 2 }}>
          {loading ? renderLoading() : renderEmployees()}
        </Col>
      </Row>
    </Container>
  );
};
