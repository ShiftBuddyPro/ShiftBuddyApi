import React from "react";
import * as UI from "../../ui";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher";

export default props => {
  const renderCashDrops = cashDrops => (
    <UI.Table
      headers={["Number", "Amount"]}
      data={cashDrops}
      renderRow={cashDrop => (
        <tr>
          <th scope="row">{cashDrop.number}</th>
          <td>{cashDrop.amount.toFixed(2)}</td>
        </tr>
      )}
    />
  );
  const shiftId = localStorage.getItem("shift_id");

  return (
    <Fetcher
      render={renderCashDrops}
      api={ManagerApi.getCashDrops(shiftId)}
      noData="No Cash Drops"
    />
  );
};
