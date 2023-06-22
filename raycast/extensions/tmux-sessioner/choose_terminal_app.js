"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/choose_terminal_app.tsx
var choose_terminal_app_exports = {};
__export(choose_terminal_app_exports, {
  default: () => ChooseTerminalApp
});
module.exports = __toCommonJS(choose_terminal_app_exports);

// src/SelectTermnialApp.tsx
var import_api = require("@raycast/api");
var import_api2 = require("@raycast/api");
var import_react = require("react");

// src/pathUtils.ts
var import_child_process = require("child_process");
function applicationIconFromPath(path) {
  const infoPlist = `${path}/Contents/Info.plist`;
  const possibleIconKeyNames = ["CFBundleIconFile", "CFBundleIconName"];
  let iconFileName = null;
  for (const keyName of possibleIconKeyNames) {
    try {
      iconFileName = (0, import_child_process.execSync)(["plutil", "-extract", keyName, "raw", '"' + infoPlist + '"'].join(" ")).toString().trim();
      break;
    } catch (error) {
      continue;
    }
  }
  if (!iconFileName) {
    return "";
  }
  if (!iconFileName.endsWith(".icns")) {
    iconFileName = `${iconFileName}.icns`;
  }
  const iconPath = `${path}/Contents/Resources/${iconFileName}`;
  console.log(iconPath);
  return iconPath;
}

// src/SelectTermnialApp.tsx
var import_jsx_runtime = require("react/jsx-runtime");
var ALLOWED_APPS = ["kitty", "Alacritty", "iTerm2", "Terminal", "Warp"];
var SelectTerminalApp = ({ setIsTerminalSetup }) => {
  const [apps, setApps] = (0, import_react.useState)();
  const [loading, setLoading] = (0, import_react.useState)(true);
  const { pop } = (0, import_api.useNavigation)();
  (0, import_react.useEffect)(() => {
    (async () => {
      setLoading(true);
      const apps2 = (await (0, import_api.getApplications)()).filter((app) => ALLOWED_APPS.includes(app.name));
      setApps(apps2);
      setLoading(false);
    })();
  }, []);
  return /* @__PURE__ */ (0, import_jsx_runtime.jsxs)(import_api.Form, {
    enableDrafts: true,
    isLoading: loading,
    navigationTitle: "Select Terminal App",
    actions: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.ActionPanel, {
      children: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Action.SubmitForm, {
        title: "Submit Terminal App Name",
        onSubmit: async (values) => {
          import_api2.LocalStorage.setItem("terminalAppName", values.terminalAppName);
          const toast = await (0, import_api.showToast)({
            style: import_api.Toast.Style.Animated,
            title: "Setup Terminal"
          });
          toast.style = import_api.Toast.Style.Success;
          toast.message = `Terminal ${values.terminalAppName} is setup successfully for tmux sessioner`;
          setIsTerminalSetup && setIsTerminalSetup(true);
          pop();
        }
      })
    }),
    children: [
      /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Description, {
        text: "Choose your default terminal App"
      }),
      /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Description, {
        text: "When switch to session, it will open the session in the selected terminal app."
      }),
      /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Dropdown, {
        id: "terminalAppName",
        isLoading: loading,
        children: apps?.map((app, index) => /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Form.Dropdown.Item, {
          value: app.name,
          title: app.name,
          icon: applicationIconFromPath(app.path)
        }, index))
      })
    ]
  });
};

// src/choose_terminal_app.tsx
var import_jsx_runtime = require("react/jsx-runtime");
function ChooseTerminalApp() {
  return /* @__PURE__ */ (0, import_jsx_runtime.jsx)(SelectTerminalApp, {});
}
// Annotate the CommonJS export names for ESM import in node:
0 && (module.exports = {});
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vLi4vZGV2L21lL3RtdXgtc2Vzc2lvbmVyLXJheWNhc3QtZXh0L3NyYy9jaG9vc2VfdGVybWluYWxfYXBwLnRzeCIsICIuLi8uLi8uLi8uLi9kZXYvbWUvdG11eC1zZXNzaW9uZXItcmF5Y2FzdC1leHQvc3JjL1NlbGVjdFRlcm1uaWFsQXBwLnRzeCIsICIuLi8uLi8uLi8uLi9kZXYvbWUvdG11eC1zZXNzaW9uZXItcmF5Y2FzdC1leHQvc3JjL3BhdGhVdGlscy50cyJdLAogICJzb3VyY2VzQ29udGVudCI6IFsiaW1wb3J0IHsgU2VsZWN0VGVybWluYWxBcHAgfSBmcm9tIFwiLi9TZWxlY3RUZXJtbmlhbEFwcFwiO1xuXG5leHBvcnQgZGVmYXVsdCBmdW5jdGlvbiBDaG9vc2VUZXJtaW5hbEFwcCgpIHtcbiAgcmV0dXJuIDxTZWxlY3RUZXJtaW5hbEFwcCAvPjtcbn1cbiIsICJpbXBvcnQgeyBBY3Rpb24sIEFjdGlvblBhbmVsLCBBcHBsaWNhdGlvbiwgRm9ybSwgVG9hc3QsIGdldEFwcGxpY2F0aW9ucywgc2hvd1RvYXN0LCB1c2VOYXZpZ2F0aW9uIH0gZnJvbSBcIkByYXljYXN0L2FwaVwiO1xuaW1wb3J0IHsgTG9jYWxTdG9yYWdlIH0gZnJvbSBcIkByYXljYXN0L2FwaVwiO1xuXG5pbXBvcnQgeyB1c2VFZmZlY3QsIHVzZVN0YXRlIH0gZnJvbSBcInJlYWN0XCI7XG5pbXBvcnQgeyBhcHBsaWNhdGlvbkljb25Gcm9tUGF0aCB9IGZyb20gXCIuL3BhdGhVdGlsc1wiO1xuXG5jb25zdCBBTExPV0VEX0FQUFMgPSBbXCJraXR0eVwiLCBcIkFsYWNyaXR0eVwiLCBcImlUZXJtMlwiLCBcIlRlcm1pbmFsXCIsIFwiV2FycFwiXTtcblxuZXhwb3J0IGNvbnN0IFNlbGVjdFRlcm1pbmFsQXBwID0gKHsgc2V0SXNUZXJtaW5hbFNldHVwIH06IHsgc2V0SXNUZXJtaW5hbFNldHVwPzogKHZhbHVlOiBib29sZWFuKSA9PiB2b2lkIH0pID0+IHtcbiAgY29uc3QgW2FwcHMsIHNldEFwcHNdID0gdXNlU3RhdGU8QXBwbGljYXRpb25bXT4oKTtcbiAgY29uc3QgW2xvYWRpbmcsIHNldExvYWRpbmddID0gdXNlU3RhdGUodHJ1ZSk7XG4gIGNvbnN0IHsgcG9wIH0gPSB1c2VOYXZpZ2F0aW9uKCk7XG5cbiAgdXNlRWZmZWN0KCgpID0+IHtcbiAgICAoYXN5bmMgKCkgPT4ge1xuICAgICAgc2V0TG9hZGluZyh0cnVlKTtcbiAgICAgIGNvbnN0IGFwcHMgPSAoYXdhaXQgZ2V0QXBwbGljYXRpb25zKCkpLmZpbHRlcigoYXBwKSA9PiBBTExPV0VEX0FQUFMuaW5jbHVkZXMoYXBwLm5hbWUpKTtcblxuICAgICAgc2V0QXBwcyhhcHBzKTtcbiAgICAgIHNldExvYWRpbmcoZmFsc2UpO1xuICAgIH0pKCk7XG4gIH0sIFtdKTtcblxuICByZXR1cm4gKFxuICAgIDxGb3JtXG4gICAgICBlbmFibGVEcmFmdHNcbiAgICAgIGlzTG9hZGluZz17bG9hZGluZ31cbiAgICAgIG5hdmlnYXRpb25UaXRsZT1cIlNlbGVjdCBUZXJtaW5hbCBBcHBcIlxuICAgICAgYWN0aW9ucz17XG4gICAgICAgIDxBY3Rpb25QYW5lbD5cbiAgICAgICAgICA8QWN0aW9uLlN1Ym1pdEZvcm1cbiAgICAgICAgICAgIHRpdGxlPVwiU3VibWl0IFRlcm1pbmFsIEFwcCBOYW1lXCJcbiAgICAgICAgICAgIG9uU3VibWl0PXthc3luYyAodmFsdWVzKSA9PiB7XG4gICAgICAgICAgICAgIExvY2FsU3RvcmFnZS5zZXRJdGVtKFwidGVybWluYWxBcHBOYW1lXCIsIHZhbHVlcy50ZXJtaW5hbEFwcE5hbWUpO1xuICAgICAgICAgICAgICBjb25zdCB0b2FzdCA9IGF3YWl0IHNob3dUb2FzdCh7XG4gICAgICAgICAgICAgICAgc3R5bGU6IFRvYXN0LlN0eWxlLkFuaW1hdGVkLFxuICAgICAgICAgICAgICAgIHRpdGxlOiBcIlNldHVwIFRlcm1pbmFsXCIsXG4gICAgICAgICAgICAgIH0pO1xuXG4gICAgICAgICAgICAgIHRvYXN0LnN0eWxlID0gVG9hc3QuU3R5bGUuU3VjY2VzcztcbiAgICAgICAgICAgICAgdG9hc3QubWVzc2FnZSA9IGBUZXJtaW5hbCAke3ZhbHVlcy50ZXJtaW5hbEFwcE5hbWV9IGlzIHNldHVwIHN1Y2Nlc3NmdWxseSBmb3IgdG11eCBzZXNzaW9uZXJgO1xuXG4gICAgICAgICAgICAgIHNldElzVGVybWluYWxTZXR1cCAmJiBzZXRJc1Rlcm1pbmFsU2V0dXAodHJ1ZSk7XG4gICAgICAgICAgICAgIHBvcCgpO1xuICAgICAgICAgICAgfX1cbiAgICAgICAgICAvPlxuICAgICAgICA8L0FjdGlvblBhbmVsPlxuICAgICAgfVxuICAgID5cbiAgICAgIDxGb3JtLkRlc2NyaXB0aW9uIHRleHQ9XCJDaG9vc2UgeW91ciBkZWZhdWx0IHRlcm1pbmFsIEFwcFwiIC8+XG4gICAgICA8Rm9ybS5EZXNjcmlwdGlvbiB0ZXh0PVwiV2hlbiBzd2l0Y2ggdG8gc2Vzc2lvbiwgaXQgd2lsbCBvcGVuIHRoZSBzZXNzaW9uIGluIHRoZSBzZWxlY3RlZCB0ZXJtaW5hbCBhcHAuXCIgLz5cbiAgICAgIDxGb3JtLkRyb3Bkb3duIGlkPVwidGVybWluYWxBcHBOYW1lXCIgaXNMb2FkaW5nPXtsb2FkaW5nfT5cbiAgICAgICAge2FwcHM/Lm1hcCgoYXBwLCBpbmRleCkgPT4gKFxuICAgICAgICAgIDxGb3JtLkRyb3Bkb3duLkl0ZW0ga2V5PXtpbmRleH0gdmFsdWU9e2FwcC5uYW1lfSB0aXRsZT17YXBwLm5hbWV9IGljb249e2FwcGxpY2F0aW9uSWNvbkZyb21QYXRoKGFwcC5wYXRoKX0gLz5cbiAgICAgICAgKSl9XG4gICAgICA8L0Zvcm0uRHJvcGRvd24+XG4gICAgPC9Gb3JtPlxuICApO1xufTtcbiIsICIvLyBJbnNwaXJlZCBpbiBoZXJlIGh0dHBzOi8vZ2l0aHViLmNvbS9yYXljYXN0L2V4dGVuc2lvbnMvYmxvYi9iYmRlMjI3ZTE3MTM0ZjI0NWVmZjEwZTU5YzhhN2MyNTU2ZGE5NzZjL2V4dGVuc2lvbnMvcXVpdC1hcHBsaWNhdGlvbnMvc3JjL2luZGV4LnRzeCNMNlxuXG5pbXBvcnQgeyBleGVjU3luYyB9IGZyb20gXCJjaGlsZF9wcm9jZXNzXCI7XG5cbmV4cG9ydCBmdW5jdGlvbiBhcHBsaWNhdGlvbkljb25Gcm9tUGF0aChwYXRoOiBzdHJpbmcpOiBzdHJpbmcge1xuICAvKiBFeGFtcGxlOlxuICAgKiAnL0FwcGxpY2F0aW9ucy9WaXN1YWwgU3R1ZGlvIENvZGUuYXBwJyAtPiAnL0FwcGxpY2F0aW9ucy9WaXN1YWwgU3R1ZGlvIENvZGUuYXBwL0NvbnRlbnRzL1Jlc291cmNlcy97ZmlsZSBuYW1lfS5pY25zJ1xuICAgKi9cblxuICAvLyByZWFkIHBhdGgvQ29udGVudHMvSW5mby5wbGlzdCBhbmQgbG9vayBmb3IgPGtleT5DRkJ1bmRsZUljb25GaWxlPC9rZXk+IG9yIDxrZXk+Q0ZCdW5kbGVJY29uTmFtZTwva2V5PlxuICAvLyB0aGUgYWN0dWFsIGljb24gZmlsZSBpcyBsb2NhdGVkIGF0IHBhdGgvQ29udGVudHMvUmVzb3VyY2VzL3tmaWxlIG5hbWV9LmljbnNcblxuICBjb25zdCBpbmZvUGxpc3QgPSBgJHtwYXRofS9Db250ZW50cy9JbmZvLnBsaXN0YDtcblxuICBjb25zdCBwb3NzaWJsZUljb25LZXlOYW1lcyA9IFtcIkNGQnVuZGxlSWNvbkZpbGVcIiwgXCJDRkJ1bmRsZUljb25OYW1lXCJdO1xuXG4gIGxldCBpY29uRmlsZU5hbWUgPSBudWxsO1xuXG4gIGZvciAoY29uc3Qga2V5TmFtZSBvZiBwb3NzaWJsZUljb25LZXlOYW1lcykge1xuICAgIHRyeSB7XG4gICAgICBpY29uRmlsZU5hbWUgPSBleGVjU3luYyhbXCJwbHV0aWxcIiwgXCItZXh0cmFjdFwiLCBrZXlOYW1lLCBcInJhd1wiLCAnXCInICsgaW5mb1BsaXN0ICsgJ1wiJ10uam9pbihcIiBcIikpXG4gICAgICAgIC50b1N0cmluZygpXG4gICAgICAgIC50cmltKCk7XG4gICAgICBicmVhaztcbiAgICB9IGNhdGNoIChlcnJvcikge1xuICAgICAgY29udGludWU7XG4gICAgfVxuICB9XG5cbiAgaWYgKCFpY29uRmlsZU5hbWUpIHtcbiAgICAvLyBubyBpY29uIGZvdW5kLiBmYWxsYmFjayB0byBlbXB0eSBzdHJpbmcgKG5vIGljb24pXG4gICAgcmV0dXJuIFwiXCI7XG4gIH1cblxuICAvLyBpZiBpY29uIGRvZXNuJ3QgZW5kIHdpdGggLmljbnMsIGFkZCBpdFxuICBpZiAoIWljb25GaWxlTmFtZS5lbmRzV2l0aChcIi5pY25zXCIpKSB7XG4gICAgaWNvbkZpbGVOYW1lID0gYCR7aWNvbkZpbGVOYW1lfS5pY25zYDtcbiAgfVxuXG4gIGNvbnN0IGljb25QYXRoID0gYCR7cGF0aH0vQ29udGVudHMvUmVzb3VyY2VzLyR7aWNvbkZpbGVOYW1lfWA7XG4gIGNvbnNvbGUubG9nKGljb25QYXRoKTtcbiAgcmV0dXJuIGljb25QYXRoO1xufVxuIl0sCiAgIm1hcHBpbmdzIjogIjs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBOzs7QUNBQSxpQkFBeUc7QUFDekcsSUFBQUEsY0FBNkI7QUFFN0IsbUJBQW9DOzs7QUNEcEMsMkJBQXlCO0FBRWxCLFNBQVMsd0JBQXdCLE1BQXNCO0FBUTVELFFBQU0sWUFBWSxHQUFHO0FBRXJCLFFBQU0sdUJBQXVCLENBQUMsb0JBQW9CLGtCQUFrQjtBQUVwRSxNQUFJLGVBQWU7QUFFbkIsYUFBVyxXQUFXLHNCQUFzQjtBQUMxQyxRQUFJO0FBQ0YseUJBQWUsK0JBQVMsQ0FBQyxVQUFVLFlBQVksU0FBUyxPQUFPLE1BQU0sWUFBWSxHQUFHLEVBQUUsS0FBSyxHQUFHLENBQUMsRUFDNUYsU0FBUyxFQUNULEtBQUs7QUFDUjtBQUFBLElBQ0YsU0FBUyxPQUFQO0FBQ0E7QUFBQSxJQUNGO0FBQUEsRUFDRjtBQUVBLE1BQUksQ0FBQyxjQUFjO0FBRWpCLFdBQU87QUFBQSxFQUNUO0FBR0EsTUFBSSxDQUFDLGFBQWEsU0FBUyxPQUFPLEdBQUc7QUFDbkMsbUJBQWUsR0FBRztBQUFBLEVBQ3BCO0FBRUEsUUFBTSxXQUFXLEdBQUcsMkJBQTJCO0FBQy9DLFVBQVEsSUFBSSxRQUFRO0FBQ3BCLFNBQU87QUFDVDs7O0FEMUNBO0FBTUEsSUFBTSxlQUFlLENBQUMsU0FBUyxhQUFhLFVBQVUsWUFBWSxNQUFNO0FBRWpFLElBQU0sb0JBQW9CLENBQUMsRUFBRSxtQkFBbUIsTUFBeUQ7QUFDOUcsUUFBTSxDQUFDLE1BQU0sT0FBTyxRQUFJLHVCQUF3QjtBQUNoRCxRQUFNLENBQUMsU0FBUyxVQUFVLFFBQUksdUJBQVMsSUFBSTtBQUMzQyxRQUFNLEVBQUUsSUFBSSxRQUFJLDBCQUFjO0FBRTlCLDhCQUFVLE1BQU07QUFDZCxLQUFDLFlBQVk7QUFDWCxpQkFBVyxJQUFJO0FBQ2YsWUFBTUMsU0FBUSxVQUFNLDRCQUFnQixHQUFHLE9BQU8sQ0FBQyxRQUFRLGFBQWEsU0FBUyxJQUFJLElBQUksQ0FBQztBQUV0RixjQUFRQSxLQUFJO0FBQ1osaUJBQVcsS0FBSztBQUFBLElBQ2xCLEdBQUc7QUFBQSxFQUNMLEdBQUcsQ0FBQyxDQUFDO0FBRUwsU0FDRSw2Q0FBQztBQUFBLElBQ0MsY0FBWTtBQUFBLElBQ1osV0FBVztBQUFBLElBQ1gsaUJBQWdCO0FBQUEsSUFDaEIsU0FDRSw0Q0FBQztBQUFBLE1BQ0Msc0RBQUMsa0JBQU8sWUFBUDtBQUFBLFFBQ0MsT0FBTTtBQUFBLFFBQ04sVUFBVSxPQUFPLFdBQVc7QUFDMUIsbUNBQWEsUUFBUSxtQkFBbUIsT0FBTyxlQUFlO0FBQzlELGdCQUFNLFFBQVEsVUFBTSxzQkFBVTtBQUFBLFlBQzVCLE9BQU8saUJBQU0sTUFBTTtBQUFBLFlBQ25CLE9BQU87QUFBQSxVQUNULENBQUM7QUFFRCxnQkFBTSxRQUFRLGlCQUFNLE1BQU07QUFDMUIsZ0JBQU0sVUFBVSxZQUFZLE9BQU87QUFFbkMsZ0NBQXNCLG1CQUFtQixJQUFJO0FBQzdDLGNBQUk7QUFBQSxRQUNOO0FBQUEsT0FDRjtBQUFBLEtBQ0Y7QUFBQSxJQUdGO0FBQUEsa0RBQUMsZ0JBQUssYUFBTDtBQUFBLFFBQWlCLE1BQUs7QUFBQSxPQUFtQztBQUFBLE1BQzFELDRDQUFDLGdCQUFLLGFBQUw7QUFBQSxRQUFpQixNQUFLO0FBQUEsT0FBaUY7QUFBQSxNQUN4Ryw0Q0FBQyxnQkFBSyxVQUFMO0FBQUEsUUFBYyxJQUFHO0FBQUEsUUFBa0IsV0FBVztBQUFBLFFBQzVDLGdCQUFNLElBQUksQ0FBQyxLQUFLLFVBQ2YsNENBQUMsZ0JBQUssU0FBUyxNQUFkO0FBQUEsVUFBK0IsT0FBTyxJQUFJO0FBQUEsVUFBTSxPQUFPLElBQUk7QUFBQSxVQUFNLE1BQU0sd0JBQXdCLElBQUksSUFBSTtBQUFBLFdBQS9FLEtBQWtGLENBQzVHO0FBQUEsT0FDSDtBQUFBO0FBQUEsR0FDRjtBQUVKOzs7QUQxREE7QUFFZSxTQUFSLG9CQUFxQztBQUMxQyxTQUFPLDRDQUFDLHFCQUFrQjtBQUM1QjsiLAogICJuYW1lcyI6IFsiaW1wb3J0X2FwaSIsICJhcHBzIl0KfQo=
