import React, { Component } from "react";
import axios from "axios";

export default class Shift extends Component {
  state = {
    cashdrops: []
  };

  componentDidMount() {
    axios
      .get(
        `http://localhost:8000/api/v1/shifts/${this.props.shiftId}/cash_drops`
      )
      .then(res => {
        this.setState({ cashDrops: res.data });
      })
      .catch(err => console.log(err));
  }
  render() {
    console.log(this.state.cashdrops)
    return <div />;
  }
}
