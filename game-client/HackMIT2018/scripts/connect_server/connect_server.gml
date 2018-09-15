///connect_server(ip, port)

var serverIp = argument0;
var serverPort = argument1;
socket_connect(serverIp, serverPort);
socket_add_listener("new game", listener_newgame);
with (obj_network) {
	alarm[0] = updateTime;	
}