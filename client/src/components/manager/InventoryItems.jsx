import React, { useState, useEffect } from "react";
import { Button, Container, Col, Row } from "reactstrap";
import { InputGroup, InputGroupAddon, Input } from "reactstrap";
import ManagerApi from "../../services/ManagerApi";

export default props => {
  const [name, setName] = useState("");
  const [trackedItems, setTrackedItems] = useState([]);
  useEffect(() => {
    ManagerApi.getTrackedItems()
      .then(trackedItems => setTrackedItems(trackedItems))
      .catch(err => console.log(err));
  }, []);

  const addTrackedItem = () => {
    ManagerApi.addTrackedItem(name)
      .then(trackedItem => {
        setTrackedItems([...trackedItems, trackedItem]);
      })
      .catch(err => console.log(err));
  };

  const renderInventoryItems = () => {
    if (trackedItems.length < 1) {
      return (
        <div className="center italic text-small py-1rem">
          There are currently no tracked items. You may add them above.
        </div>
      );
    }

    return trackedItems.map(item => {
      const { id, name } = item;
      const deleteItem = () =>
        ManagerApi.deleteTrackedItem(id)
          .then(_ => {
            const newTrackedItems = [...trackedItems].filter(
              item => item.id !== id
            );
            setTrackedItems(newTrackedItems);
          })
          .catch(err => console.log(err));

      return (
        <div className="flex list-view-item" key={id}>
          <div className="flex-1">{name}</div>
          <div className="flex-1">
            <button
              onClick={deleteItem}
              className="basic-button shadow red ml-auto"
            >
              Delete
            </button>
          </div>
        </div>
      );
    });
  };

  return (
    <Container>
      <Row>
        <h1 className="center py-1rem">Tracked Items</h1>
      </Row>
      <Row className="mb-1rem">
        <Col md={{ size: 4, offset: 4 }}>
          <InputGroup>
            <InputGroupAddon addonType="prepend">Item Name</InputGroupAddon>
            <Input
              className="mr-1rem"
              onChange={e => setName(e.target.value)}
            />
            <Button
              className="basic-button shadow blue"
              onClick={addTrackedItem}
            >
              Add Item
            </Button>
          </InputGroup>
        </Col>
      </Row>
      <Row>
        <Col className="card" md={{ size: 8, offset: 2 }}>
          {renderInventoryItems()}
        </Col>
      </Row>
    </Container>
  );
};
