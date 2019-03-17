import React, { useState, useEffect } from "react";
import { Container, Col, Row, Spinner } from "reactstrap";
import ManagerApi from "../../services/ManagerApi";

export default props => {
  const [loading, setLoading] = useState(true);
  const [shifts, setShifts] = useState([]);
  useEffect(() => {
    ManagerApi.getShifts()
      .then(shifts => {
        setShifts(shifts);
        setLoading(false);
      })
      .catch(err => setLoading(false));
  }, []);

  const renderShifts = () => {
    const handleShiftClick = shift_id => {
      localStorage.setItem("shift_id", shift_id);
      props.history.push("/shift");
    };
    return shifts.map(shift => {
      return (
        <div key={shift.id} className="flex-1 list-view-item w-35 ">
          <div className="" key={shift.id}>
            <div>{shift.attributes.employee_name}</div>
            <div>{shift.attributes.date}</div>
          </div>

          <button
            className="float-right ml-auto basic-button shadow orange"
            onClick={() => {
              handleShiftClick(shift.id);
            }}
          >
            View
          </button>
        </div>
      );
    });
  };

  const renderLoading = () => (
    <div className="py-3 center">
      <Spinner color="warning" />
    </div>
  );

  return (
    <Container>
      <h1 className="text-center"> Shifts</h1>
      <Row>
        <Col className="card" md={{ size: 8, offset: 2 }}>
          {loading ? renderLoading() : renderShifts()}
        </Col>
      </Row>
    </Container>
  );
};
