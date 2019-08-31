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
      <Body>
        <div
          style={{
            width: "auto",
            marginLeft: "auto",
            marginRight: "auto"
          }}
        >
          <IPhoneMockup width={300} type={2} />
          <IPhoneMockup width={300} type={1} />
          <IPhoneMockup width={300} type={3} />
        </div>
        <Card>
          ShiftBuddyPro is a revolutionary new tool intended to overhaul the way
          that businesses handle shift reports. Traditional paper shift reports
          are wasteful, don't do calculations for you and can be impossible to
          keep track of. With ShiftBuddyPro all of those problems are a thing of
          the past. ShiftBuddyPro will seamlessly take the place of your current
          employee shift reporting process and put all the data you need to run
          your business in the palm of your hands. You'll recieve real time
          updates to your phone, tablet, or computer whenever any activity
          occurs in your business from a check being written to change being
          taken out of the safe. Not only this but you'll be able access any
          shift report at any time as well as have access to trends based on
          your reports thanks to our state of the art Data Visualization Engine.
          Contact{" "}
          <a
            style={{ color: "blue" }}
            href="mailto:usman@shiftbuddypro.com"
            target="_blank"
          >
            usman@shiftbuddypro.com
          </a>{" "}
          for pricing and to take your business into the future.
        </Card>
      </Body>
    </Container>
  );
};

const Container = styled(UI.Column)`
  flex: 1;
  min-height: 100vh;
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

const Body = styled(UI.Column)`
  background-color: ${appColors.background.regular};
  flex: 1;
`;

const Card = styled.p`
  font-weight: bold;
  background-color: #fafafa;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  border-radius: 1em;
  margin-left: 2em;
  margin-right: 2em;
  padding: 1em;
`;
export default About;
