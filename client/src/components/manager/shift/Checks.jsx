import React from "react";
import { Table } from "reactstrap";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher";

export default props => {
  const renderChecks = checks => (
    <Table hover>
      <thead>
        <tr>
          <th>Number</th>
          <th>Company</th>
          <th>Amount</th>
        </tr>
      </thead>
      <tbody>
        {checks.map(check => (
          <tr>
            <th scope="row">{check.number}</th>
            <td>{check.company}</td>
            <td>{check.amount.toFixed(2)}</td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
  const shiftId = localStorage.getItem("shift_id");
  return (
    <Fetcher
      api={ManagerApi.getChecks(shiftId)}
      render={renderChecks}
      noData="No Checks"
    />
  );
};
