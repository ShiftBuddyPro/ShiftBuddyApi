import React from "react";
import appStoreBadge from "./appStoreBadge.png";
import playStoreBadge from "./playStoreBadge.png";
import iPhoneX1 from "./iPhoneX1.png";
import iPhoneX2 from "./iPhoneX2.png";
import iPhoneX3 from "./iPhoneX3.png";

const PlayStoreBadge = props => (
  <img {...props} src={playStoreBadge} alt="play store badge" />
);

const AppStoreBadge = props => (
  <img {...props} src={appStoreBadge} alt="app store badge" />
);

const IPhoneMockup = props => {
  const { type, ...remainingProps } = props;
  let src;
  switch (type) {
    case 1:
      src = iPhoneX1;
      break;
    case 2:
      src = iPhoneX2;
      break;
    case 3:
      src = iPhoneX3;
      break;
    default:
      src = iPhoneX1;
  }
  return <img {...remainingProps} src={src} alt={`iphone mockup #${type}`} />;
};

export { AppStoreBadge, PlayStoreBadge, IPhoneMockup };
