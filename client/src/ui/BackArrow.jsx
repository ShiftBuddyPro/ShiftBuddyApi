import React from "react";
import MaterialIcon from "material-icons-react";
import appColors from "constants/appColors";
import styled from "styled-components";
import { withRouter } from "react-router-dom";
import * as UI from "ui";

const BackArrow = props => {
  const onBackClick = props.route
    ? () => props.history.push(props.route)
    : () => props.history.goBack();

  return (
    <IconContainer>
      <MaterialIcon
        size={30}
        color={appColors.primary.regular}
        onClick={onBackClick}
        icon="arrow_back"
      />
    </IconContainer>
  );
};

const IconContainer = styled(UI.Row)`
  cursor: pointer;
  width: 30px;
  &:hover {
    opacity: 0.5;
  }
`;

export default withRouter(BackArrow);
