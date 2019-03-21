import React from "react";
import { Table } from "reactstrap";

export default props => {
  const { headers, rowCells, data } = props;

  const renderHeaders = () => headers.map(renderHeader);

  const renderHeader = header => <th>{header}</th>;

  const renderRows = data => data.map(renderRow);

  const renderRow = item => <tr>{renderRowCells(rowCells(item))}</tr>;

  const renderRowCells = cellItems =>
    cellItems.map(cellItems => <td>{cellItems}</td>);

  return (
    <Table hover>
      <thead>
        <tr>{renderHeaders()}</tr>
      </thead>
      <tbody>{renderRows(data)}</tbody>
    </Table>
  );
};
