import React from 'react'
import { Navbar, Nav, NavItem, NavLink, NavbarBrand} from 'reactstrap'

export default function Header() {
  return (
    <div>
      <Navbar color='dark' dark expand='md'>
        <NavbarBrand href='/'>Shift-Admin</NavbarBrand>
        <Nav navbar>
          <NavItem>
            <NavLink href='/Managers'>Managers</NavLink>
          </NavItem>
          <NavItem>
            <NavLink href='/Employees'>Employees</NavLink>
          </NavItem>
          <NavItem>
            <NavLink href='/Shifts'>Shifts</NavLink>
          </NavItem>
          <NavItem>
            <NavLink href='/Checks'>Checks</NavLink>
          </NavItem>
          <NavItem>
            <NavLink href='/PaidOuts'>PaidOuts</NavLink>
          </NavItem>
          <NavItem>
            <NavLink href='/CashDrops'>CashDrops</NavLink>
          </NavItem>
          <NavItem>
            <NavLink href='/InventoryItems'>InventoryItems</NavLink>
          </NavItem>
          <NavItem>
            <NavLink href='/Change'>Change</NavLink>
          </NavItem>
         <NavItem>
            <NavLink href='/Notes'>Notes</NavLink>
         </NavItem>
        </Nav>
      </Navbar>
    </div>
  )
}
