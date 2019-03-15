import React, { Component } from "react";
import { Table } from "reactstrap";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher.tsx";

interface PaidOut {
  company: string;
  amount: number;
}

interface Props {}

export default (props: Props) => {
  const renderPaidOuts = (paidOuts: PaidOut[]) => (
    <Table hover>
      <thead>
        <tr>
          <th>Title</th>
          <th>Message</th>
        </tr>
      </thead>
      <tbody>
        {paidOuts.map(paidOut => (
          <tr>
            <th scope="row">{paidOut.company}</th>
            <td>{paidOut.amount}</td>
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
