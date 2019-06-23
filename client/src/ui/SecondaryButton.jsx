import React from "react";
import appColors from "constants/appColors";
import styled from "styled-components";

const SecondaryButton = props => {
  const { style, children, ...remainingProps } = props;
  return (
    <Btn {...remainingProps} style={style}>
      {children}
    </Btn>
  );
};

const Btn = styled.button`
  display: flex;
  flex-direction: row;
  padding-left: 2rem;
  padding-right: 2rem;
  padding-top: 1rem;
  padding-bottom: 1rem;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: bold;
  border: 1px solid ${appColors.black};
  color: ${appColors.black};
  background-color: ${appColors.grey.lighter};
  border-radius: 0.5rem;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  text-align: center;
  align-items: center;
  justify-content: center;
  &:hover {
    background-color: ${appColors.white};
    box-shadow: 0px 15px 20px ${appColors.grey.light};
    transform: translateY(-7px);
  }
`;

export default SecondaryButton;
