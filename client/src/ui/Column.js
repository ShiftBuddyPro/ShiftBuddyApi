import React from "react";
import styled from "styled-components";

const Column = props => {
  const { children, ...remainingProps } = props;
  return <Col {...remainingProps}>{children}</Col>;
};

const Col = styled.div`
  display: flex;
  flex-direction: column;
 `;

export default Column;
