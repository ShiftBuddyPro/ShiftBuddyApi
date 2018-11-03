import React, { Component } from 'react';
import IndexTable from './IndexTable';

export class Managers extends Component {
  render() {
    return (
      <IndexTable resource={"managers"} attributes={["id", "name", "email"]}/>
    )
  }
}

export class Employees extends Component {
  render() {
    return (
      <IndexTable resource={"employees"} attributes={["id", "name", "manager_id"]}/>
    )
  }
}

export class Shifts extends Component {
  render() {
    return (
      <IndexTable resource={"shifts"} attributes ={["id", "employee_id"]}/>
    )
  }
}

export class Checks extends Component {
  render() {
    return (
      <IndexTable resource={"checks"} attributes ={["id", "shift_id", "number", "company", "amount", "created_at"]}/>
    )
  }
}

export class Change extends Component {
  render() {
    return (
      <IndexTable resource={"change"} attributes ={["id", "shift_id"]}/>
    )
  }
}

export class CashDrops extends Component {
  render() {
    return (
      <IndexTable resource={"cash_drops"} attributes ={["id", "shift_id", "amount", "number"]}/>
    )
  }
}

export class PaidOuts extends Component {
  render() {
    return (
      <IndexTable resource={"paid_outs"} attributes ={["id", "shift_id", "company", "amount"]}/>
    )
  }
}

export class InventoryItems extends Component {
  render() {
    return (
      <IndexTable resource={"inventory_items"} attributes ={["id", "shift_id", "name", "start_amount", "end_amount"]}/>
    )
  }
}

export class Notes extends Component {
  render() {
    return (
      <IndexTable resource={"notes"} attributes ={["id", "shift_id", "title", "message"]}/>
    )
  }
}
