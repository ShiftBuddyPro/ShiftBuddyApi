import React from "react";
import { IPhoneMockup } from "assets/images";
import styled from "styled-components";
import * as UI from "ui";
import appColors from "constants/appColors";
import MaterialIcon from "material-icons-react";

const About = props => {
  return (
    <Container>
      <Header>
        <UI.BackArrow />
        <HeaderText>About</HeaderText>
      </Header>
      <div>
        <IPhoneMockup width={300} type={2} />
        <IPhoneMockup width={300} type={1} />
        <IPhoneMockup width={300} type={3} />
      </div>
    </Container>
  );
};

const Container = styled(UI.Column)`
  flex: 1;
`;

const Header = styled(UI.Column)`
  border-bottom: 1px solid ${appColors.grey.regular};
  width: 100%;
  padding-top: 1rem;
  padding-bottom: 1rem;
  padding-left: 2rem;
`;

const HeaderText = styled.h1`
  font-weight: bold;
  font-size: 2rem;
  margin-top: 0.5rem;
`;

const ImagesRow = styled(UI.Row)`
  flex: 1;
  width: 100%;
`;

export default About;
