import React from "react";
import { Table } from "reactstrap";

export default props => {
  const { headers, renderRow, data } = props;

  const renderHeaders = () => headers.map(header => <th>{header}</th>);

  const renderBody = data => data.map(renderRow);

  return (
    <Table hover>
      <thead>
        <tr>{renderHeaders()}</tr>
      </thead>
      <tbody>{renderBody(data)}</tbody>
    </Table>
  );
};
