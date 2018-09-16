/// @description Variables
// You can write your code in this editor

//"https://playmobius.pagekite.me/"
serverIp = network_resolve("http://2e56dead.ngrok.io");
serverPort = 5000;

serverGame = "defaultGame";

updateTime = 1;

//name, color
global.playerMap = ds_map_create();
global.playerCount = 0;