import React from "react";
import { Link } from "react-router-dom";
import { Jumbotron } from "reactstrap";
import appColors from "constants/appColors";
import styled from "styled-components";
import { AppStoreBadge, PlayStoreBadge } from "assets/images";
import * as UI from "ui";

export default props => {
  if (localStorage.getItem("auth_token")) props.history.push("/dashboard");

  const handleLoginClick = () => props.history.push("/login");
  const handleContactClick = () => null;

  return (
    <Container>
      <TopHalfContainer>
        <Heading>ShiftBuddyPro</Heading>
        <Subheading>
          Revolutionizing the way your businsess handles shifts
        </Subheading>
      </TopHalfContainer>
      <BottomHalfContainer>
        <UI.Row>
          <LoginButton onClick={handleLoginClick}>Login</LoginButton>
          <ContactButton onClick={handleContactClick}>Contact</ContactButton>
        </UI.Row>
        <BadgesRow>
          <a href="https://apps.apple.com/us/app/shiftbuddypro/id1467445828?ign-mpt=uo%3D2">
            <AppStoreBadge height={60} />
          </a>
          <a href="https://play.google.com/store/apps/details?id=com.shiftbuddypro.shiftbuddymobile&hl=en_US">
            <PlayStoreBadge height={60} />
          </a>
        </BadgesRow>
        <Footer>
          <PrivacyPolicyText to="privacy-policy">
            Privacy Policy
          </PrivacyPolicyText>
          <CopyrightText>Usman Ghani 2019 © </CopyrightText>
        </Footer>
      </BottomHalfContainer>
    </Container>
  );
};

const styles = {
  primaryButton: {}
};

const Container = styled(UI.Column)`
  height: 100vh;
  flex: 1;
`;

const TopHalfContainer = styled(UI.Column)`
  justify-content: center;
  align-items: center;
  background-color: ${appColors.secondary.regular};
  vertical-align: middle;
  flex: 1;
`;

const Heading = styled.div`
  color: ${appColors.white};
  text-align: center;
  vertical-align: middle;
  font-size: 3rem;
`;

const Subheading = styled.div`
  color: ${appColors.white};
  font-size: 1.5rem;
`;

const LoginButton = styled(UI.PrimaryButton)`
  margin-left: auto;
  margin-right: 0.5rem
  margin-top: -1.5rem;
  width: 8rem;
`;

const ContactButton = styled(UI.SecondaryButton)`
  margin-left: 0.5rem;
  margin-right: auto;
  margin-top: -1.5rem;
  width: 8rem;
`;

const BottomHalfContainer = styled(UI.Column)`
  background-color: white;
  flex: 1;
`;

const BadgesRow = styled(UI.Row)`
  margin-top: auto;
  margin-top: 5rem;
  align-items: center;
  justify-content: center;
`;

const Footer = styled(UI.Row)`
  padding-top: 0.5rem;
  padding-bottom: 0.5rem;
  margin-top: auto;
  background-color: ${appColors.grey.dark};
  flex-direction: row;
  justify-content: center;
  color: ${appColors.white};
  font-size: 0.75rem;
  flex-grow: 0;
`;

const PrivacyPolicyText = styled(Link)`
  color: ${appColors.primary.light};
  margin-right: auto;
  padding-left: 1rem;
  width: auto;
`;

const CopyrightText = styled.div`
  position: absolute;
  margin-left: auto;
  margin-right: auto;
`;
