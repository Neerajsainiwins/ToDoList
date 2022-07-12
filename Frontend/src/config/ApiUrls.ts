const API_URL = process.env.REACT_APP_API_URL;
export const API_URLS = {
  GetLanguages: `${API_URL}/GetLanguages`,
  GlobalCode: `${API_URL}/api/GlobalCode`,
  AddToDoList: `${API_URL}/api/ToDoList/AddToDoList`,
  GetToDoList: `${API_URL}/api/ToDoList/GetToDoList`,
  DeletedToDoList: `${API_URL}/api/ToDoList/DeletedToDoList`,
};
