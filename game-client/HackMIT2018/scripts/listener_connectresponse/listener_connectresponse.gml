///listener_newgame(name, data)
var name = argument0;
var data = argument1;


socket_add_listener("new game", listener_newgame);	
socket_emit("game", "the succ");
log_debug("Connect Response Message Recieved - Name: " + name + " , Data: " + data);