import styled from "styled-components";

export const DashBoardWrapper = styled.div`
  // Width: calc(100% - 250px);
  // margin-left: auto;
`;

export const MainContainer = styled.div`
  box-shadow: 0px 2px 2px 3px #00000012;
  background: #fff;
  width: 800px;
  margin: 10px auto;
  padding: 20px 20px;
  border-radius: 5px;
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
`;

export const ColorBox = styled.div`
  height: 60px;
  width: 60px;
  border-radius: 5px;
  cursor: pointer;
    &.selected{
      box-shadow: -1px 0px 0px 5px #0000001f;
    }
`;

export const FormElement = styled.div`
  display: flex;
  flex-direction: column;
  width: 90%;
  margin: 25px auto;
  position: relative;
  label {
    margin-bottom: 10px;
  }
  .cancel{
    position: absolute;
    top: 20px;
    right: -9px;
    height: 22px;
    width: 21px;
    font-size: 12px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #fff;
    color: #358dd1;
    border-radius: 50%;
    cursor: pointer;
    border: 1px solid #ccc;
  }
`;

export const ColorBoxContainer = styled.div`
  display: flex;
  width: 80%;
  margin: 0 auto;
  gap: 20px;
`;
export const ColorContentBox = styled.div`
  padding: 25px 15px;
  height: 100%;
  width: max-content;
  border-radius: 5px;
  color: #fff;
  font-weight: bold;
  text-align: center;
  min-width: 70px;
  position: relative;
  i{
    position: absolute;
    top: -9px;
    right: -9px;
    height: 25px;
    width: 25px;
    font-size: 12px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #fff;
    color: #358dd1;
    border-radius: 50%;
    cursor: pointer;
    box-shadow: 0px 2px 2px 3px #00000012;
  }
`;

export const TodoNotes = styled.div`
  box-shadow: 0px 2px 2px 3px #00000012;
  background: #fff;
  width: 800px;
  margin: 10px auto;
  padding: 20px 20px;
  border-radius: 5px;
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
`;
export const Heading = styled.h3`
  text-align: center;
  width: 100%;
`;
export const DeleteBtn = styled.div`
  display: flex;
  align-items: center;
  i{
    height: 35px;
    width: 45px;
    margin-top: 12px;
    font-size: 19px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #fff;
    color: #e5513d;
    box-shadow: 0px 2px 2px 3px #00000012;
    border-radius: 5px;
    cursor:pointer;
  }
`;
