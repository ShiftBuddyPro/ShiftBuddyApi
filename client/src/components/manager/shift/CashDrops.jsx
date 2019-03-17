import React from "react";
import { Table } from "reactstrap";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher";

export default props => {
  const renderCashDrops = cashDrops => (
    <Table hover>
      <thead>
        <tr>
          <th>Number</th>
          <th>Amount</th>
        </tr>
      </thead>
      <tbody>
        {cashDrops.map(cashDrop => (
          <tr>
            <th scope="row">{cashDrop.number}</th>
            <td>{cashDrop.amount.toFixed(2)}</td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
  const shiftId = localStorage.getItem("shift_id");

  return (
    <Fetcher
      render={cashDrops => renderCashDrops(cashDrops)}
      api={ManagerApi.getCashDrops(shiftId)}
      noData="No Cash Drops"
    />
  );
};
