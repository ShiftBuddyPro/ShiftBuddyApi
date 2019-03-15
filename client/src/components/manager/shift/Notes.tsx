import React, { Component } from "react";
import { Container, Row, Col, Table } from "reactstrap";
import ManagerApi from "../../../services/ManagerApi";
import useFetch from "./useFetch.ts";
import Fetcher from "./Fetcher.tsx";

interface Note {
  title: string;
  message: string;
}

interface Props {
  shiftId: number;
}

export default (props: Props) => {
  const renderNotes = (notes: Note[]) => (
    <Table hover>
      <thead>
        <tr>
          <th>Title</th>
          <th>Message</th>
        </tr>
      </thead>
      <tbody>
        {notes.map(check => (
          <tr>
            <th scope="row">{check.title}</th>
            <td>{check.message}</td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
  const shiftId = localStorage.getItem("shift_id");
  return (
    <Fetcher
      api={ManagerApi.getNotes(shiftId)}
      render={renderNotes}
      noData="No Paid Outs"
    />
  );
};
