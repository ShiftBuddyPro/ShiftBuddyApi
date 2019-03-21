import React from "react";
import * as UI from "../../ui";
import ManagerApi from "../../../services/ManagerApi";
import Fetcher from "./Fetcher";

export default props => {
  const shiftId = localStorage.getItem("shift_id");
  return (
    <Fetcher
      api={ManagerApi.getChecks(shiftId)}
      noData="No Checks"
      render={checks => (
        <UI.Table
          headers={["Number", "Company", "Amount"]}
          data={checks}
          rowCells={check => [
            check.number,
            check.company,
            `$${check.amount.toFixed(2)}`
          ]}
        />
      )}
    />
  );
};
