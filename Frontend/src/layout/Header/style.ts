import styled from "styled-components";

export const HeaderWrapper = styled.header`
  width: calc(100% - 250px);
  height: 60px;
  margin-left: auto;
  background-color: #088cd1;
  box-shadow: 0 10px 10px 2px #00000012;
  background-image: linear-gradient(to right, #088cd1, #7dc8f1);
  color: #fff;
  display: flex;
  align-items: center;
  padding: 0 20px;
  font-size: 20px;
  position: sticky;
  top: 0;
  left: 250px;
  z-index: 99;
`;
