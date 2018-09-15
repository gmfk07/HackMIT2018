///listener_newgame(name, data)
var name = argument0;
var data = argument1;


var name = data;
ds_map_add(global.playerList, name, global.playerCount++);



log_debug("Player Joined Message Recieved - Name: " + name + " , Data: " + data);