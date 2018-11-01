import React, { Component } from 'react'
import { Table, Button } from 'reactstrap';
import axios from 'axios'

export class Employees extends Component {
  state = {
    employees: []
  }

  componentDidMount() {
    axios.get("http://localhost:8000/api/v1/employees")
    .then(res => {
      const employees = res.data;
      this.setState({ employees })
      console.log(employees)
    })
  }

  onDelete(employeeId) {
    axios.delete("http://localhost:8000/api/v1/employees/" + employeeId)
  }

  render() {
    return (
      <div>
        <h1>Employees <Button href="/employeesnew" color="success">+</Button></h1>
        <Table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          {this.state.employees.map(employee => {
            return(
              <tr key={employee.id + "row"}>
                <td key={employee.id}>{employee.id}</td>
                <td key={employee.name}>{employee.name}</td>
                <td key={employee.email}>{employee.email}</td>
                <td key={employee.name + 'delete'}><Button onClick={this.onDelete(employee.id)} color='danger'>Delete</Button></td>
              </tr>
             )
          }) }

        </tbody>
      </Table>
      </div>
    )
  }
}

export default Employees
