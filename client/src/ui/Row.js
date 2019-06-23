import React from "react";
import styled from "styled-components";

const Row = props => {
  const { children, ...remainingProps } = props;
  return <R {...remainingProps}>{children}</R>;
};

const R = styled.div`
  display: flex;
  flex-direction: row;
`;

export default Row;
