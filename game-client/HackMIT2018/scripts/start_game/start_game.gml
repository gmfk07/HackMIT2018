///start_game()

/*
var playerName = ds_map_find_first(global.playerMap);
var playerInfoMap = global.playerMap[? playerName];
var i = 0;
while (!is_undefined(playerInfoMap)) {
	
	//Setup for next loop
	playerName = ds_map_find_next(global.playerMap, playerName);
	playerInfoMap = global.playerMap[? playerName];
	i++;	
}
*/

socket_add_listener("button press", listener_playerbutton);
socket_add_listener("joystick", listener_playerjoystick);
socket_add_listener("device acceleration", listener_playeracceleration);


room_goto(rm_mazegame);

socket_emit("game start", "");
