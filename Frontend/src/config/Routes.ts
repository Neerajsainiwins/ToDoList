import { lazy } from "react";
import { IRoute } from "../models/Interfaces/INavBar";
import routePaths from "./RoutePaths";

export const routes: IRoute[] = [
  {
    path: `${routePaths.NOTFOUND}`,
    private: false,
    element: lazy(() => import("../pages/NotFound")),
  },
  {
    path: `${routePaths.DASHBOARD}`,
    private: true,
    element: lazy(() => import("../pages/DashBoard")),
  },
];
