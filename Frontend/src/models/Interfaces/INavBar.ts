import { UsersEnum } from "../Enum/User";

export interface INavItem {
  title: string;
  id?: string;
  path: string | "";
  cName?: string;
  keyId?: number;
  setClick?: (active: boolean) => void;
}

export interface IAdminNavItem extends INavItem {
  submenu?: INavItem[] | null;
}

export interface IMenuItems {
  menuItems: IAdminNavItem;
}

export interface INavBar {
  user: keyof typeof UsersEnum;
}

export interface IRoute {
  path: string;
  private: boolean;
  element: React.LazyExoticComponent<(props: any) => JSX.Element>;
}
