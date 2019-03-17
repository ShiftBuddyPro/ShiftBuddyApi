import React, { Component } from "react";
import { Button, Container, Col, Row } from "reactstrap";
import { InputGroup, InputGroupAddon, Input } from "reactstrap";
import ManagerApi from "../../services/ManagerApi";

export default class InventoryItems extends Component {
  constructor(props) {
    super(props);
    this.state = {
      trackedItems: [],
      name: ""
    };

    this.onSubmit = this.onSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount() {
    ManagerApi.getTrackedItems()
      .then(trackedItems => this.setState({ trackedItems }))
      .catch(err => console.log(err));
  }

  onSubmit() {
    ManagerApi.addTrackedItem(this.state.name)
      .then(trackedItem => {
        this.setState({
          trackedItems: [...this.state.trackedItems, trackedItem]
        });
      })
      .catch(err => console.log(err));
  }

  inventoryItemsView() {
    if (this.state.trackedItems.length < 1) {
      return this.emptyView();
    }

    return this.state.trackedItems.map(item => {
      const { id, name } = item;
      const deleteItem = () =>
        ManagerApi.deleteTrackedItem(id)
          .then(_ => {
            const trackedItems = [...this.state.trackedItems].filter(
              item => item.id !== id
            );
            this.setState({ trackedItems });
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
  }

  handleChange(event) {
    return this.setState({ name: event.target.value });
  }

  emptyView() {
    return (
      <div className="center italic text-small">
        There are currently no tracked items. You may add them above.
      </div>
    );
  }

  render() {
    return (
      <Container>
        <Row>
          <h1 className="center">Tracked Items</h1>
        </Row>
        <Row className="mb-1rem">
          <Col md={{ size: 4, offset: 4 }}>
            <InputGroup>
              <InputGroupAddon addonType="prepend">></InputGroupAddon>
              <Input
                className="mr-1rem"
                onChange={this.handleChange}
                placeholder="Item Name"
              />
              <Button
                className="basic-button shadow blue"
                onClick={this.onSubmit}
              >
                Add Item
              </Button>
            </InputGroup>
          </Col>
        </Row>
        <Row>
          <Col className="card p-1" md={{ size: 8, offset: 2 }}>
            {this.inventoryItemsView()}
          </Col>
        </Row>
      </Container>
    );
  }
}
