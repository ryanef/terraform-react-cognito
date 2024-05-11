// To fix the "global is not defined" issue with Vite
// simply import this before any other libraries load at entry point of app
// Vite does not expose a global field in window like webpack 

window.global ||= window;
