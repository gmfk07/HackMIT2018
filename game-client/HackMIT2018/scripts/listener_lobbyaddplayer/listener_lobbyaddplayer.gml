///listener_newgame(name, data)
var name = argument0;
var data = argument1;


var playerName = data;

var inputInst = instance_create_depth(0,0,0, obj_player_network_input);

var playerInfo = ds_map_create();
playerInfo[?"inputInst"] = inputInst;
playerInfo[?"id"] = global.playerCount;
playerInfo[?"name"] = playerName; //reference for when looping through map

ds_map_add(global.playerMap, playerName, playerInfo);
//Increase playerCount
++global.playerCount;

log_debug("Player Joined Message Recieved - Name: " + name + " , Data: " + data);
