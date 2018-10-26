import React, { Component } from 'react'
import { Table, Button } from 'reactstrap';
import axios from 'axios'

export class Managers extends Component {
  state = {
    managers: []
  }

  componentDidMount() {
    axios.get("http://localhost:8000/api/v1/managers")
    .then(res => {
      const managers = res.data;
      this.setState({ managers })
      console.log(managers)
    })
  }

  render() {
    return (
      <div>
        <h1>Managers <Button href="/managersnew" color="success">+</Button></h1>
        <Table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          {this.state.managers.map(manager => {
            return(
              <tr key={manager.id + "row"}>
                <td key={manager.id}>{manager.id}</td>
                <td key={manager.name}>{manager.name}</td>
                <td key={manager.email}>{manager.email}</td>
              </tr>
             )
          }) }

        </tbody>
      </Table>
      </div>
    )
  }
}

export default Managers
