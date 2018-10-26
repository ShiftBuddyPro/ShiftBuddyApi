import { Switch, Route } from 'react-router-dom'
import React from 'react';
import Dashboard from './components/Dashboard';
import Managers from './components/Managers';
import ManagersNew from './components/ManagersNew';

const Main = () => (
  <main>
    <Switch>
      <Route exact path='/' component={Dashboard}/>
      <Route path='/Managers' component={Managers}/>
      <Route path='/ManagersNew' component={ManagersNew}/>
    </Switch>
  </main>
)

/* <Switch>
<Route path='/Employees' component={Employees}/>
<Route path='/Shifts' component={Shifts}/>
<Route path='/Checks' component={Checks}/>
<Route path='/PaidOuts' component={PaidOuts}/>
<Route path='/CashDrops' component={CashDrops}/>
<Route path='/InventoryItems' component={InventoryItems}/>
<Route path='/Change' component={Change}/>
<Route path='/Notes' component={Notes}/>
</Switch> */
export default Main;
