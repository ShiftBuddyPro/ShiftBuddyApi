import React, { Component } from 'react'
import { Table, Button } from 'reactstrap';
import axios from 'axios'

export class IndexTable extends Component {
  state = {
    resource: []
  }

  componentDidMount() {
    axios.get("http://localhost:8000/api/v1/" + this.props.resource)
    .then(res => {
      const resource = res.data;
      this.setState({ resource })
      console.log(resource)
    })
  }

  onDelete(resourceId) {
    axios.delete("http://localhost:8000/api/v1/" + this.props.resource + '/' + resourceId)
    .then(window.location.reload())
    .catch(err => console.log(err));
  }

  render() {
    return (
      <div>
        <h1 className="index-header" >{this.props.resource} <Button href={"/" + this.props.resource + "new"} color="success">+</Button></h1>
        <Table>
        <thead>
          <tr>
            {this.props.attributes.map(attribute => {
              return(
                <td key={attribute + 'attribute1'}>{attribute}</td>
              )
            })
            }
          </tr>
        </thead>
        <tbody>
          {this.state.resource.map(resource => {
            return(
              <tr key={resource.id + "row"}>
                {this.props.attributes.map(attribute => {
                  return(
                    <td key={attribute + 'attribute'}>{resource[attribute]}</td>
                  )
                })}
                <td key={resource.name + 'delete'}><Button onClick={() => this.onDelete(resource.id)} color='danger'>Delete</Button></td>
              </tr>
             )
          }) }

        </tbody>
      </Table>
      </div>
    )
  }
}

export default IndexTable
