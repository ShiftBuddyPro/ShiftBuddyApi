import axios from "axios";

export default class Api {
  constructor() {
    this.client = axios.create({
      baseURL: "https://www.shiftbuddypro.com"
    });
  }

  getBasePrefix() {
    if (localStorage.getItem("manager_id")) {
      return `/api/v1/managers/${localStorage.getItem("manager_id")}`;
    } else return "";
  }

  setDefaultHeader() {
    if (localStorage.getItem("auth_token")) {
      this.client.defaults.headers.common.Authorization = `Bearer ${localStorage.getItem(
        "auth_token"
      )}`;
    }
  }

  get(route) {
    this.setDefaultHeader();
    return this.client.get(this.getBasePrefix() + route);
  }

  post(route, params) {
    this.setDefaultHeader();
    return this.client.post(this.getBasePrefix() + route, params);
  }

  put(route, params) {
    this.setDefaultHeader();
    return this.client.put(this.getBasePrefix() + route, params);
  }

  delete(route) {
    this.setDefaultHeader();
    return this.client.delete(this.getBasePrefix() + route);
  }
}
