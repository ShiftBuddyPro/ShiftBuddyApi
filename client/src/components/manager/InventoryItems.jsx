import React, { Component } from "react";
import { Button, Container, Col, Row } from "reactstrap";
import axios from "axios";
import { InputGroup, InputGroupAddon, Input } from "reactstrap";

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
    axios
      .get(
        `/api/v1/managers/${localStorage.getItem("manager_id")}/tracked_items`
      )
      .then(res => this.setState({ trackedItems: res.data }))
      .catch(err => console.log(err));
  }

  onSubmit() {
    axios
      .post(
        `api/v1/managers/${localStorage.getItem("manager_id")}/tracked_items`,
        {
          tracked_item: { name: this.state.name }
        }
      )
      .then(res =>
        this.setState({
          ...this.state,
          trackedItems: [...this.state.trackedItems, res.data]
        })
      )
      .catch(err => console.log(err));
  }

  inventoryItemsView() {
    if (this.state.trackedItems.length < 1) {
      return this.emptyView();
    }

    return this.state.trackedItems.map(item => {
      const deleteItem = id =>
        axios
          .delete(
            `/api/v1/managers/${localStorage.getItem(
              "manager_id"
            )}/tracked_items/${id}`
          )
          .then(res => {
            const items = [...this.state.trackedItems];
            const newItems = items.filter(item => item.id !== id);
            this.setState({ trackedItems: newItems });
          })
          .catch(err => console.log(err));

      return (
        <div className="flex list-view-item" key={item.id}>
          <div className="flex-1">{item.name}</div>
          <div className="flex-1">
            <button
              onClick={() => deleteItem(item.id)}
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
