import React from "react";
import appStoreBadge from "./appStoreBadge.png";
import playStoreBadge from "./playStoreBadge.png";

const PlayStoreBadge = props => (
  <img {...props} src={playStoreBadge} alt="play store badge" />
);

const AppStoreBadge = props => (
  <img {...props} src={appStoreBadge} alt="app store badge" />
);

export { AppStoreBadge, PlayStoreBadge };
