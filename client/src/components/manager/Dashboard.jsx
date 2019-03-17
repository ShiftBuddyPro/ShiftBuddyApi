import React, { useState, useEffect } from "react";
import { Col, Row, Container, Spinner } from "reactstrap";
import ManagerApi from "../../services/ManagerApi";

export default props => {
  const [activities, setActivities] = useState([]);
  const [loading, setLoading] = useState([true]);
  useEffect(() => {
    ManagerApi.getActivityLogs()
      .then(activities => {
        setActivities(activities);
        setLoading(false);
      })
      .catch(err => {
        console.log(err);
        setLoading(false);
      });
  }, []);

  const renderActivities = () => {
    if (loading)
      return (
        <div className="flex flex-center">
          <Spinner color="warning" />
        </div>
      );

    if (!activities.length)
      return (
        <div className="text-center card p-1rem">
          There are no recent activities
        </div>
      );

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
        <Col md={{ size: 8, offset: 2 }}>{renderActivities()}</Col>
      </Row>
    </Container>
  );
};
