import React from "react";
import * as UI from "../../ui";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher";

export default props => {
  const renderInventoryItems = items => (
    <UI.Table
      headers={["Name", "Start", "End", "Used"]}
      data={items}
      rowCells={item => [
        item.name,
        item.start_amount,
        item.end_amount || "-",
        item.end_amount ? item.end_amount - item.start_amount : "-"
      ]}
    />
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
