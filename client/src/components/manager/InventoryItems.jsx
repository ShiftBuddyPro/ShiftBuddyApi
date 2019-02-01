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
      return <div key={item.id}>{item.name}</div>;
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
    console.log(this.state);
    return (
      <Container>
        <Row>
          <h1 className="center">Tracked Items</h1>
        </Row>
        <Row className="mb-1rem">
          <Col md={{ size: 4, offset: 4 }}>
            <InputGroup>
              <InputGroupAddon addonType="prepend">@</InputGroupAddon>
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
