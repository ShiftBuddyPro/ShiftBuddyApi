import React, { Component } from "react";
import { Table } from "reactstrap";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher.tsx";

interface Item {
  name: number;
  start_amount: number;
  end_amount: number | null;
}

interface Props {}

export default (props: Props) => {
  const renderInventoryItems = (items: Item[]) => (
    <Table hover>
      <thead>
        <tr>
          <th>Name</th>
          <th>Start</th>
          <th>End</th>
          <th>Used</th>
        </tr>
      </thead>
      <tbody>
        {items.map(item => (
          <tr>
            <th scope="row">{item.name}</th>
            <td>{item.start_amount}</td>
            <td>{item.end_amount || "-"}</td>
            <td>
              {item.end_amount ? item.end_amount - item.start_amount : "-"}
            </td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
  const shiftId = localStorage.getItem("shift_id");
  return (
    <Fetcher
      api={ManagerApi.getInventory(shiftId)}
      render={renderInventoryItems}
      noData="No Paid Outs"
    />
  );
};
