import { ipcRenderer, contextBridge } from "electron";
import path from "path";

contextBridge.exposeInMainWorld("path", {
	join: (...args) => path.join(),
})