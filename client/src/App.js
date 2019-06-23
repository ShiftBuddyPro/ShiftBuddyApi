import React, { Component } from "react";
import "./App.css";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import SiteNavbar from "./components/utilities/SiteNavbar";
import Landing from "./screens/Home";
import Login from "./components/public/Login";
import Dashboard from "./components/manager/Dashboard";
import Employee from "./components/manager/Employee";
import Employees from "./components/manager/Employees";
import Shifts from "./components/manager/Shifts";
import Shift from "./components/manager/Shift";
import EmployeesNew from "./components/manager/EmployeesNew";
import Settings from "./components/manager/Settings";
import InventoryItems from "./components/manager/InventoryItems";
import PrivacyPolicy from "./components/public/PrivacyPolicy";
import Contact from "./components/public/Contact";

class App extends Component {
  render() {
    return (
      <Router>
        <>
          <Switch>
            <Route exact path="/" component={Landing} />
          </Switch>
          <Switch>
            <Route exact path="/dashboard" component={Dashboard} />
          </Switch>
          <Switch>
            <Route exact path="/login" component={Login} />
          </Switch>
          <Switch>
            <Route exact path="/shifts" component={Shifts} />
          </Switch>
          <Switch>
            <Route exact path="/shift" component={Shift} />
          </Switch>
          <Switch>
            <Route exact path="/employee" component={Employee} />
          </Switch>
          <Switch>
            <Route exact path="/employees" component={Employees} />
          </Switch>
          <Switch>
            <Route exact path="/employeesnew" component={EmployeesNew} />
          </Switch>
          <Switch>
            <Route exact path="/settings" component={Settings} />
          </Switch>
          <Switch>
            <Route exact path="/inventory-items" component={InventoryItems} />
          </Switch>
          <Switch>
            <Route exact path="/privacy-policy" component={PrivacyPolicy} />
          </Switch>
          <Switch>
            <Route exact path="/contact" component={Contact} />
          </Switch>
        </>
      </Router>
    );
  }
}

export default App;
