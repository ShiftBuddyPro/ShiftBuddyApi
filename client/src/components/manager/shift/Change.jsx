import React from "react";
import { Table } from "reactstrap";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher";

export default props => {
  const renderChange = change => {
    const row = (type, start, end) => {
      return (
        <tr>
          <th scope="row">{type}</th>
          <td>{start}</td>
          <td>{end}</td>
          <td>{end - start}</td>
        </tr>
      );
    };
    return (
      <Table hover>
        <thead>
          <tr>
            <th>Type</th>
            <th>Start</th>
            <th>End</th>
            <th>Used</th>
          </tr>
        </thead>
        <tbody>
          {row("Pennies", change.start_pennies, change.end_pennies)}
          {row("Nickels", change.start_nickels, change.end_nickels)}
          {row("Dimes", change.start_dimes, change.end_dimes)}
          {row("Quarters", change.start_quarters, change.end_quarters)}
          {row("Ones", change.start_ones, change.end_ones)}
          {row("Fives", change.start_fives, change.end_fives)}
          {row("Tens", change.start_tens, change.end_tens)}
          {row("Twenties", change.start_twenties, change.end_twenties)}
        </tbody>
      </Table>
    );
  };
  const shiftId = localStorage.getItem("shift_id");

  return (
    <Fetcher
      render={renderChange}
      api={ManagerApi.getChange(shiftId)}
      noData="No Change"
    />
  );
};

const red = {
  id: 56,
  shift_id: 216,
  created_at: "2019-01-11T05:38:02.487Z",
  updated_at: "2019-01-11T05:38:02.487Z"
};
