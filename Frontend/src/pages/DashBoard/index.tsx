import {
  DashBoardWrapper,
  MainContainer,
  ColorBox,
  FormElement,
  ColorBoxContainer,
  ColorContentBox,
  TodoNotes,
  Heading,
  DeleteBtn,
} from "./style";
import InputValidator from "../../components/Form/input";
import { useState, useEffect } from "react";
import { API_URLS } from "../../config/ApiUrls";
import API from "../../services/Api.Service";
import useValidator from "../../hooks/useValidator";
import { SuccessToast, ErrorToast } from "../../components/Toaster";
import { Icon, Form } from "semantic-ui-react";
import { IAddTodoItem, IGlobalCode, ITodoItem } from "../../models/Interfaces/IGlobalCode";
import { IDashBordProps } from "../../models/Interfaces/IDashBord";
import DeleteModal from "../../modals/deleteModal";
const DashBoard = ({ color }: IDashBordProps) => {

  const [openModal, setOpenModal] = useState(false);
  const [validator, showValidationMessage] = useValidator();
  const [todoItem, setTodoItem] = useState<IAddTodoItem>({ name: "", toDoListId: null, globalCodeId: -1 });
  const [allColour, setAllColour] = useState<IGlobalCode[] | null>(null);
  const [filteredColour, setFilteredColour] = useState<IGlobalCode[] | null>(null);
  const [open, setOpen] = useState(false)
  const [todoList, setTodoList] = useState([]);

  const onChange = (name: string, value: any) => {
    setTodoItem({ ...todoItem, [name]: value });
    if (name === "globalCodeId" && todoItem.name !== "" && value > -1) {
      checksubmit(value);
    }

  };
  useEffect(() => {
    getGetToDoList();
    if (color?.globalCodeId) {
      const filtered: IGlobalCode[] = allColour?.filter((filtred: IGlobalCode) => {
        return filtred.globalCodeId === color.globalCodeId
      }) as IGlobalCode[];
      setFilteredColour(filtered);
    }
    else {
      setFilteredColour(allColour);
    }
  }, [color]);

  useEffect(() => {
    API.get(API_URLS.GlobalCode, {
      params: { CategoryName: "ColourType", GlobalCodeId: "-1" },
    }).then((response: any) => {
      setAllColour(response);
      setFilteredColour(response);
    });
  }, []);

  function onKeyPress(e: any) {
    if (e.charCode !== 13) {
      return;
    }
    checksubmit();
  }

  function checksubmit(selectedColor?: number) {
    let colorId = selectedColor ?? todoItem.globalCodeId;
    if (validator.allValid()) {
      if (colorId > -1) {
        API.post(API_URLS.AddToDoList, { toDoListId: todoItem.toDoListId, colourId: colorId, text: todoItem.name, actionPerformedBy: null }).then((response: any) => {
          SuccessToast(response.responseMessage)
          setTodoItem({ ...todoItem, name: "", toDoListId: null, globalCodeId: -1 });
          getGetToDoList();
          showValidationMessage(false);
        });
      }
      else {
        ErrorToast("Please select color.");
      }
    } else {
      ErrorToast("Please enter todo task.");
    }
  }
  const getGetToDoList = () => {
    API.get(API_URLS.GetToDoList, { params: { ToDoListId: -1, ColourId: color?.globalCodeId ?? -1, PageNo: 1, PageSize: 1000, SearchValue: "", SortColumn: "", SortOrder: "" } }).then((response: any) => {
      setTodoList(response);
    });
  }
  const editToDoItem = (todo: ITodoItem) => {
    setTodoItem({ name: todo.text, toDoListId: todo.toDoListId, globalCodeId: todo.colourId });
  }
  const cancelTodoItem = () => {
    setTodoItem({ name: "", toDoListId: null, globalCodeId: -1 });
  }
  const DeletedToDoList = (isConfimed: boolean) => {
    if (isConfimed) {
      API.delete(API_URLS.DeletedToDoList, { params: { ToDoListId: todoItem.toDoListId, ActionPerformedBy: null } }).then((response: any) => {
        SuccessToast(response.responseMessage)
        cancelTodoItem();
        getGetToDoList();
      });
    }
    else {
      cancelTodoItem();
    }
    setOpenModal(false);
  }



  return (
    <>
      <DashBoardWrapper>
        <MainContainer>
          <FormElement>
            <label> Enter your Todo Task</label>
            <InputValidator
              type={"text"}
              name={"name"}
              value={todoItem.name}
              simpleValidator={validator}
              handleChange={onChange}
              customValidator="required"
              customMessage={{ required: "This field is required" }}
              onKeyPress={onKeyPress}
            />
            {todoItem?.toDoListId && <Icon className="cancel" onClick={() => cancelTodoItem()} title="Cancel" name="cancel" />}
          </FormElement>
          <DeleteBtn onClick={() => setOpenModal(true)}>
            {todoItem?.toDoListId && <Icon className="trash" title="trash" name="trash" />}
          </DeleteBtn>
          <ColorBoxContainer>
            {filteredColour?.map((color: IGlobalCode) => {
              let selected = color.globalCodeId === todoItem.globalCodeId
              return <ColorBox style={{ backgroundColor: color.codeName }} className={`${selected ? "selected" : ""}`} onClick={() => onChange("globalCodeId", color.globalCodeId)} />
            })}
          </ColorBoxContainer>
        </MainContainer>
        <TodoNotes>
          {todoList?.length > 0 ?
            todoList?.map((todo: ITodoItem) => {
              return <ColorContentBox style={{ backgroundColor: todo.codeName }}> {todo.text} <Icon name="pencil alternate" onClick={() => editToDoItem(todo)} /></ColorContentBox>
            }) : <Heading> No Todo Notes </Heading>}
        </TodoNotes>
        <DeleteModal isOpen={openModal} setCloseModal={DeletedToDoList} />
      </DashBoardWrapper>
    </>
  );
};

export default DashBoard;
