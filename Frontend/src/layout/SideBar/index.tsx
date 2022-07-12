import { SideBarWrapper, Header, ColorList, Colors } from "./style";
import { useState, useEffect } from "react";
import { API_URLS } from "../../config/ApiUrls";
import API from "../../services/Api.Service";
import { IGlobalCode } from "../../models/Interfaces/IGlobalCode";
import { ISidebar } from "../../models/Interfaces/ISiderbar";

function SideBar({setColor}:ISidebar) {
  const [allColour, setAllColour] = useState([]);
  const [selectedColor, setSelectedColor] = useState<IGlobalCode>();

  useEffect(() => {
    API.get(API_URLS.GlobalCode, {
      params: { CategoryName: "ColourType", GlobalCodeId: "-1" },
    }).then((response: any) => {
      setAllColour(response);
    });
  }, []);

  const onFilterColor = (color: any) => {
    setColor(color);
    setSelectedColor(color);
  }

  return (
    <SideBarWrapper>
      <Header>Filters</Header>
      <Colors style={{background: "#fff"}}  onClick={()=>onFilterColor({})}>Show All</Colors>
      <ColorList>
        {allColour?.map((color: IGlobalCode) => {
          let isSelected = color.globalCodeId === selectedColor?.globalCodeId;
          return <Colors style={{ backgroundColor: color.codeName }}  className={`${isSelected?"active":""}`}  onClick={() => onFilterColor(color)}>{isSelected?"Selected":""}</Colors>
        })}
      </ColorList>
    </SideBarWrapper>
  );
}

export default SideBar;
