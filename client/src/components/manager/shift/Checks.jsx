import React from "react";
import * as UI from "../../ui";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher";

export default props => {
  const renderChecks = checks => (
    <UI.Table
      headers={["Number", "Company", "Amount"]}
      data={checks}
      renderRow={check => (
        <tr>
          <th scope="row">{check.number}</th>
          <td>{check.company}</td>
          <td>{check.amount.toFixed(2)}</td>
        </tr>
      )}
    />
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
