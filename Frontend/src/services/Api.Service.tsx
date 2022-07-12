import Axios from "axios";
import { ErrorToast } from "../components/Toaster";
import * as Env from "../config/Env";

const API = Axios.create({
  baseURL: Env.API_URL,
});
API.interceptors.request.use(
  (conf: any) => {
    // you can add some information before send it.
    return conf;
  },
  (error) => {
    return Promise.reject(error);
  },
);
API.interceptors.response.use(
  (next) => {
    return Promise.resolve(next.data);
  },
  (error) => {
    // You can handle error here and trigger warning message without get in the code inside
    ErrorToast(JSON.parse(error.request.response).responseMessage);
    return Promise.reject(JSON.parse(error.request.response));
  },
);
export default API;
