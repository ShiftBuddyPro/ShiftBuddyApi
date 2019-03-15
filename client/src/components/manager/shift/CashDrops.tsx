import React from "react";
import { Table } from "reactstrap";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher.tsx";

interface CashDrop {
  number: number;
  amount: number;
}

interface Props {
  shiftId: number;
  data?: any;
}

export default (props: Props) => {
  const renderCashDrops = (cashDrops: CashDrop[]) => (
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
            <td>{cashDrop.amount}</td>
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
