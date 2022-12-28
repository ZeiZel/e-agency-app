import { app, ipcMain } from "electron";
import serve from "electron-serve";
import { createWindow } from "./helpers";
import {bootstrap} from "./main";

const isProd: boolean = process.env.NODE_ENV === "production";

if (isProd) {
	serve({ directory: "app" });
} else {
	app.setPath("userData", `${app.getPath("userData")} (development)`);
}

(async () => {
	await app.whenReady().then(()=> {
		const boot = bootstrap();
	});

	const mainWindow = createWindow("main", {
		width: 1200,
		height: 680,
		minWidth: 700,
		minHeight: 600,
		maxWidth: 1920,
		maxHeight: 1080,
		frame: false,
	});

	if (isProd) {
		await mainWindow.loadURL("app://./home.html");
	} else {
		const port = process.argv[2];
		await mainWindow.loadURL(`http://localhost:${port}/home`);
		mainWindow.webContents.openDevTools();
	}
})();

app.on("window-all-closed", () => {
	app.quit();
});
