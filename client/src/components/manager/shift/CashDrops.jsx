import React from "react";
import * as UI from "../../ui";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher";

export default props => {
  const shiftId = localStorage.getItem("shift_id");
  const renderCashDrops = cashDrops => (
    <UI.Table
      headers={["Number", "Amount"]}
      data={cashDrops}
      rowCells={cashDrop => [cashDrop.number, `$${cashDrop.amount.toFixed(2)}`]}
    />
  );

  return (
    <Fetcher
      render={renderCashDrops}
      api={ManagerApi.getCashDrops(shiftId)}
      noData="No Cash Drops"
    />
  );
};
