export interface IGlobalCode {
  categoryId: number;
  categoryName: string;
  codeName: string;
  description: string;
  globalCodeId: number;
  isActive: boolean;
}

export interface ILoader {
  setLoading: (isLoading: boolean) => void | undefined;
}

export interface ILoading {
  isLoading: boolean;
}

export interface ITodoItem {
  codeName: string;
  colourId: number;
  isActive: boolean;
  text: string;
  toDoListId?: any;
}

export interface IAddTodoItem {
  name: string;
  toDoListId?: any;
  globalCodeId: number;
}

export interface IDeleteModalProp {
  isOpen: boolean;
  setCloseModal: (isConfirmed: boolean) => void | undefined;
}
