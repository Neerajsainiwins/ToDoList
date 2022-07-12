import { Suspense, useState } from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import "./App.css";
import Loading from "./components/Loading";
import { routes } from "./config/Routes";
import { DashBoardLayout } from "./layout";
import { IRoute } from "./models/Interfaces/INavBar";

function App() {
  const [isloading, setLoading] = useState(true);
  const [color, setColor] = useState({});
  return (
    <>
      <ToastContainer />
      <Loading isLoading={isloading} />
      <Router>
        <Routes>
          {routes.map((route: IRoute) => {
            return (
              <Route
                path={route.path}
                element={
                  <DashBoardLayout setColor={setColor}>
                    <Suspense fallback="...Loading">
                      <route.element setLoading={setLoading} color={color} />
                    </Suspense>
                  </DashBoardLayout>
                }
              />
            );
          })}
        </Routes>
      </Router>
    </>
  );
}

export default App;
