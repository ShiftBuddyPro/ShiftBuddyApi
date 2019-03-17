import React, { useState, useEffect } from "react";
import { Col, Row, Container } from "reactstrap";
import ManagerApi from "../../services/ManagerApi";

export default props => {
  const [activities, setActivities] = useState([]);
  useEffect(() => {
    ManagerApi.getActivityLogs()
      .then(activities => setActivities(activities))
      .catch(err => console.log(err));
  }, []);

  const renderActivities = () => {
    return activities.map(activity => {
      return (
        <div key={activity} className="card p-1rem">
          {activity}
        </div>
      );
    });
  };

  return (
    <Container>
      <h1 className="text-center py-1rem">Activity Log </h1>
      <Row>
        <Col md={{ size: 8, offset: 2 }}>
          {activities.length > 0 ? (
            renderActivities()
          ) : (
            <div className="text-center">There are no recent activities</div>
          )}
        </Col>
      </Row>
    </Container>
  );
};
