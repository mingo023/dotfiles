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

// src/index.tsx
var src_exports = {};
__export(src_exports, {
  default: () => Command
});
module.exports = __toCommonJS(src_exports);
var import_react2 = require("react");
var import_api3 = require("@raycast/api");
var import_child_process2 = require("child_process");
var import_api4 = require("@raycast/api");

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

// src/index.tsx
var import_jsx_runtime = require("react/jsx-runtime");
var env = Object.assign({}, process.env, { PATH: "/usr/local/bin:/usr/bin:/opt/homebrew/bin" });
async function openTerminal() {
  const localTerminalAppName = await import_api4.LocalStorage.getItem("terminalAppName");
  (0, import_child_process2.execSync)(`open -a ${localTerminalAppName}`);
}
async function switchToSession(session) {
  const toast = await (0, import_api3.showToast)({ style: import_api3.Toast.Style.Animated, title: "Permission Checking" });
  (0, import_child_process2.exec)(`tmux switch -t ${session}`, { env }, async (error, stdout, stderr) => {
    if (error) {
      console.error(`exec error: ${error}`);
      toast.style = import_api3.Toast.Style.Failure;
      toast.title = "No tmux client found \u{1F622}";
      toast.message = error.message;
      return;
    }
    try {
      await openTerminal();
      toast.style = import_api3.Toast.Style.Success;
      toast.title = `Switched to session ${session}`;
      await (0, import_api4.showHUD)(`Switched to session ${session}`);
    } catch (e) {
      toast.style = import_api3.Toast.Style.Failure;
      toast.title = "Terminal not supported \u{1F622}";
    }
    return;
  });
}
function Command() {
  const [sessions, setSessions] = (0, import_react2.useState)([]);
  const [isLoading, setIsLoading] = (0, import_react2.useState)(true);
  const [isTerminalSetup, setIsTerminalSetup] = (0, import_react2.useState)(false);
  async function checkTerminalSetup() {
    const localTerminalAppName = await import_api4.LocalStorage.getItem("terminalAppName");
    const toast = await (0, import_api3.showToast)({
      style: import_api3.Toast.Style.Animated,
      title: "Checking terminal App setup"
    });
    if (!localTerminalAppName) {
      toast.style = import_api3.Toast.Style.Failure;
      toast.title = "No default terminal setup for tmux sessioner";
      setIsTerminalSetup(false);
      return false;
    } else {
      toast.hide();
      setIsTerminalSetup(true);
      return true;
    }
  }
  (0, import_react2.useEffect)(() => {
    (async () => {
      setIsLoading(true);
      const isSetup = await checkTerminalSetup();
      if (!isSetup) {
        setIsLoading(false);
        return;
      }
    })();
  }, []);
  (0, import_react2.useEffect)(() => {
    if (!isTerminalSetup) {
      return;
    }
    (0, import_child_process2.exec)(`tmux list-sessions | awk '{print $1}' | sed 's/://'`, { env }, (error, stdout, stderr) => {
      if (error) {
        console.error(`exec error: ${error}`);
        setIsLoading(false);
        return;
      }
      const lines = stdout.trim().split("\n");
      if (lines?.length > 0) {
        setSessions(lines);
      }
      setIsLoading(false);
    });
  }, [isTerminalSetup]);
  return /* @__PURE__ */ (0, import_jsx_runtime.jsxs)(import_jsx_runtime.Fragment, {
    children: [
      /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api3.List, {
        isLoading,
        children: sessions.map((session, index) => /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api3.List.Item, {
          icon: import_api3.Icon.Terminal,
          title: session,
          actions: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api3.ActionPanel, {
            children: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api3.Action, {
              title: "Switch To Selected Session",
              onAction: () => switchToSession(session)
            })
          })
        }, index))
      }),
      !isTerminalSetup && !isLoading && /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api3.Detail, {
        markdown: "**Setup Default Terminal App Before Usage** `Go to Actions or using Cmd + k`",
        actions: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api3.ActionPanel, {
          children: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api3.Action.Push, {
            title: "Setup Here",
            target: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(SelectTerminalApp, {
              setIsTerminalSetup
            })
          })
        })
      })
    ]
  });
}
// Annotate the CommonJS export names for ESM import in node:
0 && (module.exports = {});
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vLi4vZGV2L21lL3RtdXgtc2Vzc2lvbmVyLXJheWNhc3QtZXh0L3NyYy9pbmRleC50c3giLCAiLi4vLi4vLi4vLi4vZGV2L21lL3RtdXgtc2Vzc2lvbmVyLXJheWNhc3QtZXh0L3NyYy9TZWxlY3RUZXJtbmlhbEFwcC50c3giLCAiLi4vLi4vLi4vLi4vZGV2L21lL3RtdXgtc2Vzc2lvbmVyLXJheWNhc3QtZXh0L3NyYy9wYXRoVXRpbHMudHMiXSwKICAic291cmNlc0NvbnRlbnQiOiBbImltcG9ydCB7IHVzZVN0YXRlLCB1c2VFZmZlY3QgfSBmcm9tIFwicmVhY3RcIjtcbmltcG9ydCB7IExpc3QsIEljb24sIEFjdGlvbiwgQWN0aW9uUGFuZWwsIFRvYXN0LCBzaG93VG9hc3QsIERldGFpbCB9IGZyb20gXCJAcmF5Y2FzdC9hcGlcIjtcbmltcG9ydCB7IGV4ZWMsIGV4ZWNTeW5jIH0gZnJvbSBcImNoaWxkX3Byb2Nlc3NcIjtcbmltcG9ydCB7IExvY2FsU3RvcmFnZSwgc2hvd0hVRCB9IGZyb20gXCJAcmF5Y2FzdC9hcGlcIjtcbmltcG9ydCB7IFNlbGVjdFRlcm1pbmFsQXBwIH0gZnJvbSBcIi4vU2VsZWN0VGVybW5pYWxBcHBcIjtcblxuY29uc3QgZW52ID0gT2JqZWN0LmFzc2lnbih7fSwgcHJvY2Vzcy5lbnYsIHsgUEFUSDogXCIvdXNyL2xvY2FsL2JpbjovdXNyL2Jpbjovb3B0L2hvbWVicmV3L2JpblwiIH0pO1xuXG5hc3luYyBmdW5jdGlvbiBvcGVuVGVybWluYWwoKSB7XG4gIGNvbnN0IGxvY2FsVGVybWluYWxBcHBOYW1lID0gYXdhaXQgTG9jYWxTdG9yYWdlLmdldEl0ZW08c3RyaW5nPihcInRlcm1pbmFsQXBwTmFtZVwiKTtcbiAgZXhlY1N5bmMoYG9wZW4gLWEgJHtsb2NhbFRlcm1pbmFsQXBwTmFtZX1gKTtcbn1cblxuYXN5bmMgZnVuY3Rpb24gc3dpdGNoVG9TZXNzaW9uKHNlc3Npb246IHN0cmluZykge1xuICBjb25zdCB0b2FzdCA9IGF3YWl0IHNob3dUb2FzdCh7IHN0eWxlOiBUb2FzdC5TdHlsZS5BbmltYXRlZCwgdGl0bGU6IFwiUGVybWlzc2lvbiBDaGVja2luZ1wiIH0pO1xuXG4gIGV4ZWMoYHRtdXggc3dpdGNoIC10ICR7c2Vzc2lvbn1gLCB7IGVudiB9LCBhc3luYyAoZXJyb3IsIHN0ZG91dCwgc3RkZXJyKSA9PiB7XG4gICAgaWYgKGVycm9yKSB7XG4gICAgICBjb25zb2xlLmVycm9yKGBleGVjIGVycm9yOiAke2Vycm9yfWApO1xuXG4gICAgICB0b2FzdC5zdHlsZSA9IFRvYXN0LlN0eWxlLkZhaWx1cmU7XG4gICAgICB0b2FzdC50aXRsZSA9IFwiTm8gdG11eCBjbGllbnQgZm91bmQgXHVEODNEXHVERTIyXCI7XG4gICAgICB0b2FzdC5tZXNzYWdlID0gZXJyb3IubWVzc2FnZTtcblxuICAgICAgcmV0dXJuO1xuICAgIH1cblxuICAgIHRyeSB7XG4gICAgICBhd2FpdCBvcGVuVGVybWluYWwoKTtcblxuICAgICAgdG9hc3Quc3R5bGUgPSBUb2FzdC5TdHlsZS5TdWNjZXNzO1xuICAgICAgdG9hc3QudGl0bGUgPSBgU3dpdGNoZWQgdG8gc2Vzc2lvbiAke3Nlc3Npb259YDtcbiAgICAgIGF3YWl0IHNob3dIVUQoYFN3aXRjaGVkIHRvIHNlc3Npb24gJHtzZXNzaW9ufWApO1xuICAgIH0gY2F0Y2ggKGUpIHtcbiAgICAgIHRvYXN0LnN0eWxlID0gVG9hc3QuU3R5bGUuRmFpbHVyZTtcbiAgICAgIHRvYXN0LnRpdGxlID0gXCJUZXJtaW5hbCBub3Qgc3VwcG9ydGVkIFx1RDgzRFx1REUyMlwiO1xuICAgIH1cbiAgICByZXR1cm47XG4gIH0pO1xufVxuXG5leHBvcnQgZGVmYXVsdCBmdW5jdGlvbiBDb21tYW5kKCkge1xuICBjb25zdCBbc2Vzc2lvbnMsIHNldFNlc3Npb25zXSA9IHVzZVN0YXRlPEFycmF5PHN0cmluZz4+KFtdKTtcbiAgY29uc3QgW2lzTG9hZGluZywgc2V0SXNMb2FkaW5nXSA9IHVzZVN0YXRlKHRydWUpO1xuICBjb25zdCBbaXNUZXJtaW5hbFNldHVwLCBzZXRJc1Rlcm1pbmFsU2V0dXBdID0gdXNlU3RhdGUoZmFsc2UpO1xuXG4gIGFzeW5jIGZ1bmN0aW9uIGNoZWNrVGVybWluYWxTZXR1cCgpOiBQcm9taXNlPGJvb2xlYW4+IHtcbiAgICBjb25zdCBsb2NhbFRlcm1pbmFsQXBwTmFtZSA9IGF3YWl0IExvY2FsU3RvcmFnZS5nZXRJdGVtPHN0cmluZz4oXCJ0ZXJtaW5hbEFwcE5hbWVcIik7XG5cbiAgICBjb25zdCB0b2FzdCA9IGF3YWl0IHNob3dUb2FzdCh7XG4gICAgICBzdHlsZTogVG9hc3QuU3R5bGUuQW5pbWF0ZWQsXG4gICAgICB0aXRsZTogXCJDaGVja2luZyB0ZXJtaW5hbCBBcHAgc2V0dXBcIixcbiAgICB9KTtcblxuICAgIGlmICghbG9jYWxUZXJtaW5hbEFwcE5hbWUpIHtcbiAgICAgIHRvYXN0LnN0eWxlID0gVG9hc3QuU3R5bGUuRmFpbHVyZTtcbiAgICAgIHRvYXN0LnRpdGxlID0gXCJObyBkZWZhdWx0IHRlcm1pbmFsIHNldHVwIGZvciB0bXV4IHNlc3Npb25lclwiO1xuICAgICAgc2V0SXNUZXJtaW5hbFNldHVwKGZhbHNlKTtcblxuICAgICAgcmV0dXJuIGZhbHNlO1xuICAgIH0gZWxzZSB7XG4gICAgICB0b2FzdC5oaWRlKCk7XG4gICAgICBzZXRJc1Rlcm1pbmFsU2V0dXAodHJ1ZSk7XG5cbiAgICAgIHJldHVybiB0cnVlO1xuICAgIH1cbiAgfVxuXG4gIHVzZUVmZmVjdCgoKSA9PiB7XG4gICAgKGFzeW5jICgpID0+IHtcbiAgICAgIHNldElzTG9hZGluZyh0cnVlKTtcblxuICAgICAgY29uc3QgaXNTZXR1cCA9IGF3YWl0IGNoZWNrVGVybWluYWxTZXR1cCgpO1xuXG4gICAgICBpZiAoIWlzU2V0dXApIHtcbiAgICAgICAgc2V0SXNMb2FkaW5nKGZhbHNlKTtcbiAgICAgICAgcmV0dXJuO1xuICAgICAgfVxuICAgIH0pKCk7XG4gIH0sIFtdKTtcblxuICB1c2VFZmZlY3QoKCkgPT4ge1xuICAgIGlmICghaXNUZXJtaW5hbFNldHVwKSB7XG4gICAgICByZXR1cm47XG4gICAgfVxuXG4gICAgLy8gTGlzdCBkb3duIGFsbCB0bXV4IHNlc3Npb25cbiAgICBleGVjKGB0bXV4IGxpc3Qtc2Vzc2lvbnMgfCBhd2sgJ3twcmludCAkMX0nIHwgc2VkICdzLzovLydgLCB7IGVudiB9LCAoZXJyb3IsIHN0ZG91dCwgc3RkZXJyKSA9PiB7XG4gICAgICBpZiAoZXJyb3IpIHtcbiAgICAgICAgY29uc29sZS5lcnJvcihgZXhlYyBlcnJvcjogJHtlcnJvcn1gKTtcbiAgICAgICAgc2V0SXNMb2FkaW5nKGZhbHNlKTtcbiAgICAgICAgcmV0dXJuO1xuICAgICAgfVxuXG4gICAgICBjb25zdCBsaW5lcyA9IHN0ZG91dC50cmltKCkuc3BsaXQoXCJcXG5cIik7XG5cbiAgICAgIGlmIChsaW5lcz8ubGVuZ3RoID4gMCkge1xuICAgICAgICBzZXRTZXNzaW9ucyhsaW5lcyk7XG4gICAgICB9XG5cbiAgICAgIHNldElzTG9hZGluZyhmYWxzZSk7XG4gICAgfSk7XG4gIH0sIFtpc1Rlcm1pbmFsU2V0dXBdKTtcblxuICByZXR1cm4gKFxuICAgIDw+XG4gICAgICA8TGlzdCBpc0xvYWRpbmc9e2lzTG9hZGluZ30+XG4gICAgICAgIHtzZXNzaW9ucy5tYXAoKHNlc3Npb24sIGluZGV4KSA9PiAoXG4gICAgICAgICAgPExpc3QuSXRlbVxuICAgICAgICAgICAga2V5PXtpbmRleH1cbiAgICAgICAgICAgIGljb249e0ljb24uVGVybWluYWx9XG4gICAgICAgICAgICB0aXRsZT17c2Vzc2lvbn1cbiAgICAgICAgICAgIGFjdGlvbnM9e1xuICAgICAgICAgICAgICA8QWN0aW9uUGFuZWw+XG4gICAgICAgICAgICAgICAgPEFjdGlvbiB0aXRsZT1cIlN3aXRjaCBUbyBTZWxlY3RlZCBTZXNzaW9uXCIgb25BY3Rpb249eygpID0+IHN3aXRjaFRvU2Vzc2lvbihzZXNzaW9uKX0gLz5cbiAgICAgICAgICAgICAgPC9BY3Rpb25QYW5lbD5cbiAgICAgICAgICAgIH1cbiAgICAgICAgICAvPlxuICAgICAgICApKX1cbiAgICAgIDwvTGlzdD5cblxuICAgICAgeyFpc1Rlcm1pbmFsU2V0dXAgJiYgIWlzTG9hZGluZyAmJiAoXG4gICAgICAgIDxEZXRhaWxcbiAgICAgICAgICBtYXJrZG93bj1cIioqU2V0dXAgRGVmYXVsdCBUZXJtaW5hbCBBcHAgQmVmb3JlIFVzYWdlKiogYEdvIHRvIEFjdGlvbnMgb3IgdXNpbmcgQ21kICsga2BcIlxuICAgICAgICAgIGFjdGlvbnM9e1xuICAgICAgICAgICAgPEFjdGlvblBhbmVsPlxuICAgICAgICAgICAgICA8QWN0aW9uLlB1c2ggdGl0bGU9XCJTZXR1cCBIZXJlXCIgdGFyZ2V0PXs8U2VsZWN0VGVybWluYWxBcHAgc2V0SXNUZXJtaW5hbFNldHVwPXtzZXRJc1Rlcm1pbmFsU2V0dXB9IC8+fSAvPlxuICAgICAgICAgICAgPC9BY3Rpb25QYW5lbD5cbiAgICAgICAgICB9XG4gICAgICAgIC8+XG4gICAgICApfVxuICAgIDwvPlxuICApO1xufVxuIiwgImltcG9ydCB7IEFjdGlvbiwgQWN0aW9uUGFuZWwsIEFwcGxpY2F0aW9uLCBGb3JtLCBUb2FzdCwgZ2V0QXBwbGljYXRpb25zLCBzaG93VG9hc3QsIHVzZU5hdmlnYXRpb24gfSBmcm9tIFwiQHJheWNhc3QvYXBpXCI7XG5pbXBvcnQgeyBMb2NhbFN0b3JhZ2UgfSBmcm9tIFwiQHJheWNhc3QvYXBpXCI7XG5cbmltcG9ydCB7IHVzZUVmZmVjdCwgdXNlU3RhdGUgfSBmcm9tIFwicmVhY3RcIjtcbmltcG9ydCB7IGFwcGxpY2F0aW9uSWNvbkZyb21QYXRoIH0gZnJvbSBcIi4vcGF0aFV0aWxzXCI7XG5cbmNvbnN0IEFMTE9XRURfQVBQUyA9IFtcImtpdHR5XCIsIFwiQWxhY3JpdHR5XCIsIFwiaVRlcm0yXCIsIFwiVGVybWluYWxcIiwgXCJXYXJwXCJdO1xuXG5leHBvcnQgY29uc3QgU2VsZWN0VGVybWluYWxBcHAgPSAoeyBzZXRJc1Rlcm1pbmFsU2V0dXAgfTogeyBzZXRJc1Rlcm1pbmFsU2V0dXA/OiAodmFsdWU6IGJvb2xlYW4pID0+IHZvaWQgfSkgPT4ge1xuICBjb25zdCBbYXBwcywgc2V0QXBwc10gPSB1c2VTdGF0ZTxBcHBsaWNhdGlvbltdPigpO1xuICBjb25zdCBbbG9hZGluZywgc2V0TG9hZGluZ10gPSB1c2VTdGF0ZSh0cnVlKTtcbiAgY29uc3QgeyBwb3AgfSA9IHVzZU5hdmlnYXRpb24oKTtcblxuICB1c2VFZmZlY3QoKCkgPT4ge1xuICAgIChhc3luYyAoKSA9PiB7XG4gICAgICBzZXRMb2FkaW5nKHRydWUpO1xuICAgICAgY29uc3QgYXBwcyA9IChhd2FpdCBnZXRBcHBsaWNhdGlvbnMoKSkuZmlsdGVyKChhcHApID0+IEFMTE9XRURfQVBQUy5pbmNsdWRlcyhhcHAubmFtZSkpO1xuXG4gICAgICBzZXRBcHBzKGFwcHMpO1xuICAgICAgc2V0TG9hZGluZyhmYWxzZSk7XG4gICAgfSkoKTtcbiAgfSwgW10pO1xuXG4gIHJldHVybiAoXG4gICAgPEZvcm1cbiAgICAgIGVuYWJsZURyYWZ0c1xuICAgICAgaXNMb2FkaW5nPXtsb2FkaW5nfVxuICAgICAgbmF2aWdhdGlvblRpdGxlPVwiU2VsZWN0IFRlcm1pbmFsIEFwcFwiXG4gICAgICBhY3Rpb25zPXtcbiAgICAgICAgPEFjdGlvblBhbmVsPlxuICAgICAgICAgIDxBY3Rpb24uU3VibWl0Rm9ybVxuICAgICAgICAgICAgdGl0bGU9XCJTdWJtaXQgVGVybWluYWwgQXBwIE5hbWVcIlxuICAgICAgICAgICAgb25TdWJtaXQ9e2FzeW5jICh2YWx1ZXMpID0+IHtcbiAgICAgICAgICAgICAgTG9jYWxTdG9yYWdlLnNldEl0ZW0oXCJ0ZXJtaW5hbEFwcE5hbWVcIiwgdmFsdWVzLnRlcm1pbmFsQXBwTmFtZSk7XG4gICAgICAgICAgICAgIGNvbnN0IHRvYXN0ID0gYXdhaXQgc2hvd1RvYXN0KHtcbiAgICAgICAgICAgICAgICBzdHlsZTogVG9hc3QuU3R5bGUuQW5pbWF0ZWQsXG4gICAgICAgICAgICAgICAgdGl0bGU6IFwiU2V0dXAgVGVybWluYWxcIixcbiAgICAgICAgICAgICAgfSk7XG5cbiAgICAgICAgICAgICAgdG9hc3Quc3R5bGUgPSBUb2FzdC5TdHlsZS5TdWNjZXNzO1xuICAgICAgICAgICAgICB0b2FzdC5tZXNzYWdlID0gYFRlcm1pbmFsICR7dmFsdWVzLnRlcm1pbmFsQXBwTmFtZX0gaXMgc2V0dXAgc3VjY2Vzc2Z1bGx5IGZvciB0bXV4IHNlc3Npb25lcmA7XG5cbiAgICAgICAgICAgICAgc2V0SXNUZXJtaW5hbFNldHVwICYmIHNldElzVGVybWluYWxTZXR1cCh0cnVlKTtcbiAgICAgICAgICAgICAgcG9wKCk7XG4gICAgICAgICAgICB9fVxuICAgICAgICAgIC8+XG4gICAgICAgIDwvQWN0aW9uUGFuZWw+XG4gICAgICB9XG4gICAgPlxuICAgICAgPEZvcm0uRGVzY3JpcHRpb24gdGV4dD1cIkNob29zZSB5b3VyIGRlZmF1bHQgdGVybWluYWwgQXBwXCIgLz5cbiAgICAgIDxGb3JtLkRlc2NyaXB0aW9uIHRleHQ9XCJXaGVuIHN3aXRjaCB0byBzZXNzaW9uLCBpdCB3aWxsIG9wZW4gdGhlIHNlc3Npb24gaW4gdGhlIHNlbGVjdGVkIHRlcm1pbmFsIGFwcC5cIiAvPlxuICAgICAgPEZvcm0uRHJvcGRvd24gaWQ9XCJ0ZXJtaW5hbEFwcE5hbWVcIiBpc0xvYWRpbmc9e2xvYWRpbmd9PlxuICAgICAgICB7YXBwcz8ubWFwKChhcHAsIGluZGV4KSA9PiAoXG4gICAgICAgICAgPEZvcm0uRHJvcGRvd24uSXRlbSBrZXk9e2luZGV4fSB2YWx1ZT17YXBwLm5hbWV9IHRpdGxlPXthcHAubmFtZX0gaWNvbj17YXBwbGljYXRpb25JY29uRnJvbVBhdGgoYXBwLnBhdGgpfSAvPlxuICAgICAgICApKX1cbiAgICAgIDwvRm9ybS5Ecm9wZG93bj5cbiAgICA8L0Zvcm0+XG4gICk7XG59O1xuIiwgIi8vIEluc3BpcmVkIGluIGhlcmUgaHR0cHM6Ly9naXRodWIuY29tL3JheWNhc3QvZXh0ZW5zaW9ucy9ibG9iL2JiZGUyMjdlMTcxMzRmMjQ1ZWZmMTBlNTljOGE3YzI1NTZkYTk3NmMvZXh0ZW5zaW9ucy9xdWl0LWFwcGxpY2F0aW9ucy9zcmMvaW5kZXgudHN4I0w2XG5cbmltcG9ydCB7IGV4ZWNTeW5jIH0gZnJvbSBcImNoaWxkX3Byb2Nlc3NcIjtcblxuZXhwb3J0IGZ1bmN0aW9uIGFwcGxpY2F0aW9uSWNvbkZyb21QYXRoKHBhdGg6IHN0cmluZyk6IHN0cmluZyB7XG4gIC8qIEV4YW1wbGU6XG4gICAqICcvQXBwbGljYXRpb25zL1Zpc3VhbCBTdHVkaW8gQ29kZS5hcHAnIC0+ICcvQXBwbGljYXRpb25zL1Zpc3VhbCBTdHVkaW8gQ29kZS5hcHAvQ29udGVudHMvUmVzb3VyY2VzL3tmaWxlIG5hbWV9LmljbnMnXG4gICAqL1xuXG4gIC8vIHJlYWQgcGF0aC9Db250ZW50cy9JbmZvLnBsaXN0IGFuZCBsb29rIGZvciA8a2V5PkNGQnVuZGxlSWNvbkZpbGU8L2tleT4gb3IgPGtleT5DRkJ1bmRsZUljb25OYW1lPC9rZXk+XG4gIC8vIHRoZSBhY3R1YWwgaWNvbiBmaWxlIGlzIGxvY2F0ZWQgYXQgcGF0aC9Db250ZW50cy9SZXNvdXJjZXMve2ZpbGUgbmFtZX0uaWNuc1xuXG4gIGNvbnN0IGluZm9QbGlzdCA9IGAke3BhdGh9L0NvbnRlbnRzL0luZm8ucGxpc3RgO1xuXG4gIGNvbnN0IHBvc3NpYmxlSWNvbktleU5hbWVzID0gW1wiQ0ZCdW5kbGVJY29uRmlsZVwiLCBcIkNGQnVuZGxlSWNvbk5hbWVcIl07XG5cbiAgbGV0IGljb25GaWxlTmFtZSA9IG51bGw7XG5cbiAgZm9yIChjb25zdCBrZXlOYW1lIG9mIHBvc3NpYmxlSWNvbktleU5hbWVzKSB7XG4gICAgdHJ5IHtcbiAgICAgIGljb25GaWxlTmFtZSA9IGV4ZWNTeW5jKFtcInBsdXRpbFwiLCBcIi1leHRyYWN0XCIsIGtleU5hbWUsIFwicmF3XCIsICdcIicgKyBpbmZvUGxpc3QgKyAnXCInXS5qb2luKFwiIFwiKSlcbiAgICAgICAgLnRvU3RyaW5nKClcbiAgICAgICAgLnRyaW0oKTtcbiAgICAgIGJyZWFrO1xuICAgIH0gY2F0Y2ggKGVycm9yKSB7XG4gICAgICBjb250aW51ZTtcbiAgICB9XG4gIH1cblxuICBpZiAoIWljb25GaWxlTmFtZSkge1xuICAgIC8vIG5vIGljb24gZm91bmQuIGZhbGxiYWNrIHRvIGVtcHR5IHN0cmluZyAobm8gaWNvbilcbiAgICByZXR1cm4gXCJcIjtcbiAgfVxuXG4gIC8vIGlmIGljb24gZG9lc24ndCBlbmQgd2l0aCAuaWNucywgYWRkIGl0XG4gIGlmICghaWNvbkZpbGVOYW1lLmVuZHNXaXRoKFwiLmljbnNcIikpIHtcbiAgICBpY29uRmlsZU5hbWUgPSBgJHtpY29uRmlsZU5hbWV9LmljbnNgO1xuICB9XG5cbiAgY29uc3QgaWNvblBhdGggPSBgJHtwYXRofS9Db250ZW50cy9SZXNvdXJjZXMvJHtpY29uRmlsZU5hbWV9YDtcbiAgY29uc29sZS5sb2coaWNvblBhdGgpO1xuICByZXR1cm4gaWNvblBhdGg7XG59XG4iXSwKICAibWFwcGluZ3MiOiAiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7OztBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQSxJQUFBQSxnQkFBb0M7QUFDcEMsSUFBQUMsY0FBMEU7QUFDMUUsSUFBQUMsd0JBQStCO0FBQy9CLElBQUFELGNBQXNDOzs7QUNIdEMsaUJBQXlHO0FBQ3pHLElBQUFFLGNBQTZCO0FBRTdCLG1CQUFvQzs7O0FDRHBDLDJCQUF5QjtBQUVsQixTQUFTLHdCQUF3QixNQUFzQjtBQVE1RCxRQUFNLFlBQVksR0FBRztBQUVyQixRQUFNLHVCQUF1QixDQUFDLG9CQUFvQixrQkFBa0I7QUFFcEUsTUFBSSxlQUFlO0FBRW5CLGFBQVcsV0FBVyxzQkFBc0I7QUFDMUMsUUFBSTtBQUNGLHlCQUFlLCtCQUFTLENBQUMsVUFBVSxZQUFZLFNBQVMsT0FBTyxNQUFNLFlBQVksR0FBRyxFQUFFLEtBQUssR0FBRyxDQUFDLEVB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QjtBQUNwQjtBQUFBLElBQ0Y7QUFHQSxvQ0FBSyx1REFBdUQsRUFBRSxJQUFJLEdBQUcsQ0FBQyxPQUFPLFFBQVEsV0FBVztBQUM5RixVQUFJLE9BQU87QUFDVCxnQkFBUSxNQUFNLGVBQWUsT0FBTztBQUNwQyxxQkFBYSxLQUFLO0FBQ2xCO0FBQUEsTUFDRjtBQUVBLFlBQU0sUUFBUSxPQUFPLEtBQUssRUFBRSxNQUFNLElBQUk7QUFFdEMsVUFBSSxPQUFPLFNBQVMsR0FBRztBQUNyQixvQkFBWSxLQUFLO0FBQUEsTUFDbkI7QUFFQSxtQkFBYSxLQUFLO0FBQUEsSUFDcEIsQ0FBQztBQUFBLEVBQ0gsR0FBRyxDQUFDLGVBQWUsQ0FBQztBQUVwQixTQUNFO0FBQUEsSUFDRTtBQUFBLGtEQUFDO0FBQUEsUUFBSztBQUFBLFFBQ0gsbUJBQVMsSUFBSSxDQUFDLFNBQVMsVUFDdEIsNENBQUMsaUJBQUssTUFBTDtBQUFBLFVBRUMsTUFBTSxpQkFBSztBQUFBLFVBQ1gsT0FBTztBQUFBLFVBQ1AsU0FDRSw0Q0FBQztBQUFBLFlBQ0Msc0RBQUM7QUFBQSxjQUFPLE9BQU07QUFBQSxjQUE2QixVQUFVLE1BQU0sZ0JBQWdCLE9BQU87QUFBQSxhQUFHO0FBQUEsV0FDdkY7QUFBQSxXQU5HLEtBUVAsQ0FDRDtBQUFBLE9BQ0g7QUFBQSxNQUVDLENBQUMsbUJBQW1CLENBQUMsYUFDcEIsNENBQUM7QUFBQSxRQUNDLFVBQVM7QUFBQSxRQUNULFNBQ0UsNENBQUM7QUFBQSxVQUNDLHNEQUFDLG1CQUFPLE1BQVA7QUFBQSxZQUFZLE9BQU07QUFBQSxZQUFhLFFBQVEsNENBQUM7QUFBQSxjQUFrQjtBQUFBLGFBQXdDO0FBQUEsV0FBSTtBQUFBLFNBQ3pHO0FBQUEsT0FFSjtBQUFBO0FBQUEsR0FFSjtBQUVKOyIsCiAgIm5hbWVzIjogWyJpbXBvcnRfcmVhY3QiLCAiaW1wb3J0X2FwaSIsICJpbXBvcnRfY2hpbGRfcHJvY2VzcyIsICJpbXBvcnRfYXBpIiwgImFwcHMiXQp9Cg==
