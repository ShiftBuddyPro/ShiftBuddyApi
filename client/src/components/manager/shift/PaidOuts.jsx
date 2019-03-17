import React from "react";
import { Table } from "reactstrap";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher";

export default props => {
  const renderPaidOuts = paidOuts => (
    <Table hover>
      <thead>
        <tr>
          <th>Company</th>
          <th>Amount</th>
        </tr>
      </thead>
      <tbody>
        {paidOuts.map(paidOut => (
          <tr>
            <th scope="row">{paidOut.company}</th>
            <td>{paidOut.amount.toFixed(2)}</td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
  const shiftId = localStorage.getItem("shift_id");

  return (
    <Fetcher
      api={ManagerApi.getPaidOuts(shiftId)}
      render={renderPaidOuts}
      noData="No Paid Outs"
    />
  );
};
