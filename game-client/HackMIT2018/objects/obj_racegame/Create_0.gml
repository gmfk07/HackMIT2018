/// @description Race Spawning

socket_add_listener("device acceleration", listener_playeracceleration);

var spawns = instance_number(obj_player_spawn);

var playerName = ds_map_find_first(global.playerMap);
var playerInfoMap = global.playerMap[? playerName];
var i = 0;
while (!is_undefined(playerInfoMap)) {
	
	var spawn = instance_find(obj_player_spawn, i % spawns);
	var inst = instance_create_depth(spawn.x, spawn.y, 0, obj_racer);
	var input = playerInfoMap[?"inputInst"];
	input.playerInst = inst;
	inst.name = playerName;
	
	//Setup for next loop
	playerName = ds_map_find_next(global.playerMap, playerName);
	playerInfoMap = global.playerMap[? playerName];
	i++;	
}