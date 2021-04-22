import React from "react";
import {newContextComponents} from "@drizzle/react-components";
import logo from "./logo.png";

const {AccountData, ContractData, ContractForm} = newContextComponents;

export default ({drizzle, drizzleState}) => {
  // destructure drizzle and drizzleState from props

  return (
    <div className="App">
      <div>
        <img src={logo} alt="drizzle-logo"/>
        <h1>Drizzle Exercices</h1>
        <p>
          Exercice du 22/04/2021 avec l'IIM
        </p>
      </div>

      <div className="section">
        <h2>Active Account</h2>
        <AccountData
          drizzle={drizzle}
          drizzleState={drizzleState}
          accountIndex={0}
          units="ether"
          precision={3}
        />
        <div>
          Statut d'envoi:
          <ContractData
            drizzle={drizzle}
            drizzleState={drizzleState}
            contract="ProductStatusContract"
            method="currentState"
          /></div>
      </div>


      <div className="section">
        <h2>Test de statut d'envoi</h2>
        <ContractForm drizzle={drizzle} contract="ProductStatusContract" method="isShipped"/>
      </div>

      <div className="section">
        <h2>Test de statut de réception</h2>
        <ContractForm drizzle={drizzle} contract="ProductStatusContract" method="isDelivered"/>
      </div>


    </div>
  );
};
