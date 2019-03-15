import React, { Component } from "react";
import { Container, Row, Col, Table } from "reactstrap";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher";

export default props => {
  const renderNotes = notes => (
    <Table hover>
      <thead>
        <tr>
          <th>Title</th>
          <th>Message</th>
        </tr>
      </thead>
      <tbody>
        {notes.map(check => (
          <tr>
            <th scope="row">{check.title}</th>
            <td>{check.message}</td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
  const shiftId = localStorage.getItem("shift_id");
  return (
    <Fetcher
      api={ManagerApi.getNotes(shiftId)}
      render={renderNotes}
      noData="No Paid Outs"
    />
  );
};
