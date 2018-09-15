///connect_server(ip, port)

var serverIp = argument0;
var serverPort = argument1;
socket_connect(serverIp, serverPort);
socket_add_listener("connect response", listener_connectresponse);
with (obj_network) {
	alarm[0] = 1;	
}