import React from "react";
import { Link } from "react-router-dom";
import { Jumbotron } from "reactstrap";
import appColors from "constants/appColors";
import styled from "styled-components";
import { AppStoreBadge, PlayStoreBadge } from "assets/images";
import * as UI from "ui";

export default props => {
  if (localStorage.getItem("auth_token")) props.history.push("/dashboard");

  return (
    <Container>
      <TopHalfContainer>
        <Heading>ShiftBuddyPro</Heading>
        <Subheading>
          Revolutionizing the way your businsess handles shifts
        </Subheading>
      </TopHalfContainer>
      <BottomHalfContainer>
        <Link to="/login">
          <UI.PrimaryButton style={styles.primaryButton}>
            Login
          </UI.PrimaryButton>
        </Link>
        <BadgesRow>
          <AppStoreBadge height={60} />
          <PlayStoreBadge height={60} />
        </BadgesRow>
        <Footer>
          <PrivacyPolicyText>Privacy Policy</PrivacyPolicyText>
        </Footer>
      </BottomHalfContainer>
    </Container>
  );
};

const styles = {
  primaryButton: {
    marginLeft: "auto",
    marginRight: "auto",
    marginTop: -20
  }
};

const Container = styled.div`
  flex: 1;
  display: flex;
  flex-direction: column;
  height: 100vh;
`;

const TopHalfContainer = styled.div`
  justify-content: center;
  align-items: center;
  background-color: ${appColors.secondary.regular};
  flex: 1;
  display: flex;
  flex-direction: column;
  vertical-align: middle;
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

const BottomHalfContainer = styled.div`
  background-color: white;
  flex: 1;
  display: flex;
`;

const BadgesRow = styled.div`
  flex-direction: row;
  margin-top: auto;
  margin-top: 100px;
  height: 100px;
  align-items: center;
  justify-content: center;
`;

const Footer = styled.div`
  padding-top: 10px;
  padding-bottom: 10px;
  margin-top: auto;
  background-color: ${appColors.grey.light};
`;

const PrivacyPolicyText = styled.a``;
