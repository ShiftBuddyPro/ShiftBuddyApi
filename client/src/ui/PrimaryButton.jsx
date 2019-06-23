import React from "react";
import appColors from "constants/appColors";
import styled from "styled-components";

const PrimaryButton = props => {
  return <Btn style={props.style}>{props.children}</Btn>;
};

const Btn = styled.button`
  width: 140px;
  height: 45px;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 1000;
  color: ${appColors.white};
  background-color: ${appColors.primary.regular};
  border: none;
  border-radius: 0.5rem;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  text-align: center;
  align-items: center;
  justify-content: center;
  &:hover {
    background-color: ${appColors.primary.light};
    box-shadow: 0px 15px 20px ${appColors.grey.light};
    color: #fff;
    transform: translateY(-7px);
  }
`;

export default PrimaryButton;
