"use strict";var i=Object.defineProperty;var s=Object.getOwnPropertyDescriptor;var u=Object.getOwnPropertyNames;var p=Object.prototype.hasOwnProperty;var m=(t,e)=>{for(var r in e)i(t,r,{get:e[r],enumerable:!0})},d=(t,e,r,f)=>{if(e&&typeof e=="object"||typeof e=="function")for(let a of u(e))!p.call(t,a)&&a!==r&&i(t,a,{get:()=>e[a],enumerable:!(f=s(e,a))||f.enumerable});return t};var l=t=>d(i({},"__esModule",{value:!0}),t);var g={};m(g,{default:()=>y});module.exports=l(g);var n=require("@raycast/api"),o=require("child_process");async function c(t=!0,e){if(t)try{await(0,n.launchCommand)({name:"index",type:n.LaunchType.Background,context:{caffinated:!1}})}catch(r){console.error(r)}return e&&await(0,n.showHUD)(e),(0,o.exec)("/usr/bin/killall caffeinate")}var y=async()=>{await c(!0,"Your Mac is now decaffeinated")};0&&(module.exports={});