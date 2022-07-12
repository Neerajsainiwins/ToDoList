import styled from "styled-components";

export const SideBarWrapper = styled.div`
  //   display: none;
  height: 100vh;
  width: 250px;
  background-color: #ffffff;
  box-shadow: 0 10px 10px 2px #00000012;
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  font-size: 20px;
`;

export const Header = styled.h3`
  text-align: center;
  padding: 18px 0;
  color: #fff;
  background-image: linear-gradient(to right, #088cd1, #7dc8f1);
  margin: 0;
`;
export const ColorList = styled.ul`
  padding: 0;
  margin: 0;
  list-style: none;
`;
export const Colors = styled.li`
  height: 60px;
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
    &.active{
      border: 2px solid #0568b2;
      color: #fff;
      font-weight: bolder;
    }
  `;
