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
var import_react = require("react");
var import_api = require("@raycast/api");
var import_child_process = require("child_process");
var import_jsx_runtime = require("react/jsx-runtime");
var DetailPassword = ({
  networkName,
  setIsLoading
}) => {
  const [text, setText] = (0, import_react.useState)("");
  (0, import_react.useEffect)(() => {
    (0, import_child_process.exec)(`security find-generic-password -wa ${networkName}`, (error, stdout, stderr) => {
      if (error) {
        console.error(`exec error: ${error}`);
        setText("You didn't connect to this network yet");
        setIsLoading(false);
        return;
      }
      setText(stdout.trim());
      setIsLoading(false);
    });
  }, []);
  return /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Detail, {
    markdown: `${text}`
  });
};
function Command() {
  const [networks, setNetworks] = (0, import_react.useState)([]);
  const [isLoading, setIsLoading] = (0, import_react.useState)(false);
  (0, import_react.useEffect)(() => {
    setIsLoading(true);
    (0, import_child_process.exec)(
      "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s | sed '1d; s/^[ *]//g' | awk '{print $1}' | sort | uniq",
      (error, stdout, stderr) => {
        if (error) {
          console.error(`exec error: ${error}`);
          setIsLoading(false);
          return;
        }
        const networkList = stdout.trim().split("\n").slice(1).map((line) => line.trim().split(/\s+/)[0]);
        if (networkList?.length > 0) {
          setNetworks(networkList);
        }
        setIsLoading(false);
      }
    );
  }, []);
  return /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.List, {
    isLoading,
    children: networks.map((network, index) => /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.List.Item, {
      icon: import_api.Icon.Wifi,
      title: network,
      actions: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.ActionPanel, {
        children: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(import_api.Action.Push, {
          title: "Show Details",
          target: /* @__PURE__ */ (0, import_jsx_runtime.jsx)(DetailPassword, {
            networkName: network,
            setIsLoading
          })
        })
      })
    }, index))
  });
}
// Annotate the CommonJS export names for ESM import in node:
0 && (module.exports = {});
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiLi4vLi4vLi4vLi4vZGV2L21lL3dpZmktcGFzc3dvcmQtcmV2ZWFsLXJheWNhc3QtZXh0ZW5zaW9uL3NyYy9pbmRleC50c3giXSwKICAic291cmNlc0NvbnRlbnQiOiBbImltcG9ydCB7IHVzZVN0YXRlLCB1c2VFZmZlY3QgfSBmcm9tIFwicmVhY3RcIjtcbmltcG9ydCB7IEFjdGlvblBhbmVsLCBEZXRhaWwsIExpc3QsIEFjdGlvbiwgSWNvbiB9IGZyb20gXCJAcmF5Y2FzdC9hcGlcIjtcbmltcG9ydCB7IGV4ZWMgfSBmcm9tIFwiY2hpbGRfcHJvY2Vzc1wiO1xuXG5jb25zdCBEZXRhaWxQYXNzd29yZCA9ICh7XG4gIG5ldHdvcmtOYW1lLFxuICBzZXRJc0xvYWRpbmcsXG59OiB7XG4gIG5ldHdvcmtOYW1lOiBzdHJpbmc7XG4gIHNldElzTG9hZGluZzogKGxvYWRpbmc6IGJvb2xlYW4pID0+IHZvaWQ7XG59KSA9PiB7XG4gIGNvbnN0IFt0ZXh0LCBzZXRUZXh0XSA9IHVzZVN0YXRlKFwiXCIpO1xuXG4gIHVzZUVmZmVjdCgoKSA9PiB7XG4gICAgZXhlYyhgc2VjdXJpdHkgZmluZC1nZW5lcmljLXBhc3N3b3JkIC13YSAke25ldHdvcmtOYW1lfWAsIChlcnJvciwgc3Rkb3V0LCBzdGRlcnIpID0+IHtcbiAgICAgIGlmIChlcnJvcikge1xuICAgICAgICBjb25zb2xlLmVycm9yKGBleGVjIGVycm9yOiAke2Vycm9yfWApO1xuICAgICAgICBzZXRUZXh0KFwiWW91IGRpZG4ndCBjb25uZWN0IHRvIHRoaXMgbmV0d29yayB5ZXRcIik7XG4gICAgICAgIHNldElzTG9hZGluZyhmYWxzZSk7XG4gICAgICAgIHJldHVybjtcbiAgICAgIH1cblxuICAgICAgc2V0VGV4dChzdGRvdXQudHJpbSgpKTtcbiAgICAgIHNldElzTG9hZGluZyhmYWxzZSk7XG4gICAgfSk7XG4gIH0sIFtdKTtcblxuICByZXR1cm4gPERldGFpbCBtYXJrZG93bj17YCR7dGV4dH1gfSAvPjtcbn07XG5cbmV4cG9ydCBkZWZhdWx0IGZ1bmN0aW9uIENvbW1hbmQoKSB7XG4gIGNvbnN0IFtuZXR3b3Jrcywgc2V0TmV0d29ya3NdID0gdXNlU3RhdGU8QXJyYXk8c3RyaW5nPj4oW10pO1xuICBjb25zdCBbaXNMb2FkaW5nLCBzZXRJc0xvYWRpbmddID0gdXNlU3RhdGUoZmFsc2UpO1xuXG4gIHVzZUVmZmVjdCgoKSA9PiB7XG4gICAgc2V0SXNMb2FkaW5nKHRydWUpO1xuXG4gICAgZXhlYyhcbiAgICAgIFwiL1N5c3RlbS9MaWJyYXJ5L1ByaXZhdGVGcmFtZXdvcmtzL0FwcGxlODAyMTEuZnJhbWV3b3JrL1ZlcnNpb25zL0N1cnJlbnQvUmVzb3VyY2VzL2FpcnBvcnQgLXMgfCBzZWQgJzFkOyBzL15bICpdLy9nJyB8IGF3ayAne3ByaW50ICQxfScgfCBzb3J0IHwgdW5pcVwiLFxuICAgICAgKGVycm9yLCBzdGRvdXQsIHN0ZGVycikgPT4ge1xuICAgICAgICBpZiAoZXJyb3IpIHtcbiAgICAgICAgICBjb25zb2xlLmVycm9yKGBleGVjIGVycm9yOiAke2Vycm9yfWApO1xuICAgICAgICAgIHNldElzTG9hZGluZyhmYWxzZSk7XG4gICAgICAgICAgcmV0dXJuO1xuICAgICAgICB9XG5cbiAgICAgICAgY29uc3QgbmV0d29ya0xpc3Q6IEFycmF5PHN0cmluZz4gPSBzdGRvdXRcbiAgICAgICAgICAudHJpbSgpIC8vIHJlbW92ZSB0cmFpbGluZyBuZXdsaW5lXG4gICAgICAgICAgLnNwbGl0KFwiXFxuXCIpIC8vIHNwbGl0IGludG8gbGluZXNcbiAgICAgICAgICAuc2xpY2UoMSkgLy8gcmVtb3ZlIGhlYWRlciByb3dcbiAgICAgICAgICAubWFwKChsaW5lKSA9PiBsaW5lLnRyaW0oKS5zcGxpdCgvXFxzKy8pWzBdKTsgLy8gZXh0cmFjdCB0aGUgbmV0d29yayBuYW1lc1xuXG4gICAgICAgIGlmIChuZXR3b3JrTGlzdD8ubGVuZ3RoID4gMCkge1xuICAgICAgICAgIHNldE5ldHdvcmtzKG5ldHdvcmtMaXN0KTtcbiAgICAgICAgfVxuICAgICAgICBzZXRJc0xvYWRpbmcoZmFsc2UpO1xuICAgICAgfVxuICAgICk7XG4gIH0sIFtdKTtcblxuICByZXR1cm4gKFxuICAgIDxMaXN0IGlzTG9hZGluZz17aXNMb2FkaW5nfT5cbiAgICAgIHtuZXR3b3Jrcy5tYXAoKG5ldHdvcmssIGluZGV4KSA9PiAoXG4gICAgICAgIDxMaXN0Lkl0ZW1cbiAgICAgICAgICBrZXk9e2luZGV4fVxuICAgICAgICAgIGljb249e0ljb24uV2lmaX1cbiAgICAgICAgICB0aXRsZT17bmV0d29ya31cbiAgICAgICAgICBhY3Rpb25zPXtcbiAgICAgICAgICAgIDxBY3Rpb25QYW5lbD5cbiAgICAgICAgICAgICAgPEFjdGlvbi5QdXNoXG4gICAgICAgICAgICAgICAgdGl0bGU9XCJTaG93IERldGFpbHNcIlxuICAgICAgICAgICAgICAgIHRhcmdldD17PERldGFpbFBhc3N3b3JkIG5ldHdvcmtOYW1lPXtuZXR3b3JrfSBzZXRJc0xvYWRpbmc9e3NldElzTG9hZGluZ30gLz59XG4gICAgICAgICAgICAgIC8+XG4gICAgICAgICAgICA8L0FjdGlvblBhbmVsPlxuICAgICAgICAgIH1cbiAgICAgICAgLz5cbiAgICAgICkpfVxuICAgIDwvTGlzdD5cbiAgKTtcbn1cbiJdLAogICJtYXBwaW5ncyI6ICI7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBLG1CQUFvQztBQUNwQyxpQkFBd0Q7QUFDeEQsMkJBQXFCO0FBRnJCO0FBSUEsSUFBTSxpQkFBaUIsQ0FBQztBQUFBLEVBQ3RCO0FBQUEsRUFDQTtBQUNGLE1BR007QUFDSixRQUFNLENBQUMsTUFBTSxPQUFPLFFBQUksdUJBQVMsRUFBRTtBQUVuQyw4QkFBVSxNQUFNO0FBQ2QsbUNBQUssc0NBQXNDLGVBQWUsQ0FBQyxPQUFPLFFBQVEsV0FBVztBQUNuRixVQUFJLE9BQU87QUFDVCxnQkFBUSxNQUFNLGVBQWUsT0FBTztBQUNwQyxnQkFBUSx3Q0FBd0M7QUFDaEQscUJBQWEsS0FBSztBQUNsQjtBQUFBLE1BQ0Y7QUFFQSxjQUFRLE9BQU8sS0FBSyxDQUFDO0FBQ3JCLG1CQUFhLEtBQUs7QUFBQSxJQUNwQixDQUFDO0FBQUEsRUFDSCxHQUFHLENBQUMsQ0FBQztBQUVMLFNBQU8sNENBQUM7QUFBQSxJQUFPLFVBQVUsR0FBRztBQUFBLEdBQVE7QUFDdEM7QUFFZSxTQUFSLFVBQTJCO0FBQ2hDLFFBQU0sQ0FBQyxVQUFVLFdBQVcsUUFBSSx1QkFBd0IsQ0FBQyxDQUFDO0FBQzFELFFBQU0sQ0FBQyxXQUFXLFlBQVksUUFBSSx1QkFBUyxLQUFLO0FBRWhELDhCQUFVLE1BQU07QUFDZCxpQkFBYSxJQUFJO0FBRWpCO0FBQUEsTUFDRTtBQUFBLE1BQ0EsQ0FBQyxPQUFPLFFBQVEsV0FBVztBQUN6QixZQUFJLE9BQU87QUFDVCxrQkFBUSxNQUFNLGVBQWUsT0FBTztBQUNwQyx1QkFBYSxLQUFLO0FBQ2xCO0FBQUEsUUFDRjtBQUVBLGNBQU0sY0FBNkIsT0FDaEMsS0FBSyxFQUNMLE1BQU0sSUFBSSxFQUNWLE1BQU0sQ0FBQyxFQUNQLElBQUksQ0FBQyxTQUFTLEtBQUssS0FBSyxFQUFFLE1BQU0sS0FBSyxFQUFFLEVBQUU7QUFFNUMsWUFBSSxhQUFhLFNBQVMsR0FBRztBQUMzQixzQkFBWSxXQUFXO0FBQUEsUUFDekI7QUFDQSxxQkFBYSxLQUFLO0FBQUEsTUFDcEI7QUFBQSxJQUNGO0FBQUEsRUFDRixHQUFHLENBQUMsQ0FBQztBQUVMLFNBQ0UsNENBQUM7QUFBQSxJQUFLO0FBQUEsSUFDSCxtQkFBUyxJQUFJLENBQUMsU0FBUyxVQUN0Qiw0Q0FBQyxnQkFBSyxNQUFMO0FBQUEsTUFFQyxNQUFNLGdCQUFLO0FBQUEsTUFDWCxPQUFPO0FBQUEsTUFDUCxTQUNFLDRDQUFDO0FBQUEsUUFDQyxzREFBQyxrQkFBTyxNQUFQO0FBQUEsVUFDQyxPQUFNO0FBQUEsVUFDTixRQUFRLDRDQUFDO0FBQUEsWUFBZSxhQUFhO0FBQUEsWUFBUztBQUFBLFdBQTRCO0FBQUEsU0FDNUU7QUFBQSxPQUNGO0FBQUEsT0FURyxLQVdQLENBQ0Q7QUFBQSxHQUNIO0FBRUo7IiwKICAibmFtZXMiOiBbXQp9Cg==
