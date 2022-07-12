import { useState } from "react";
import Header from "../Header";
import SideBar from "../SideBar";
import { Main } from "./style";

function DashBoardLayout({ children, setColor }: { children: JSX.Element, setColor: any }) {

  return (
    <>
      <Header />
      <SideBar setColor={setColor} />
      <Main >{children}</Main>
    </>
  );
}
export default DashBoardLayout;
