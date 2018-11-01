import React, { Component } from 'react'
import { Table, Button } from 'reactstrap';
import axios from 'axios';
import IndexTable from './IndexTable';

export class Managers extends Component {
  render() {
    return (
      <IndexTable resource={"managers"}/>
    )
  }
}

export default Managers
