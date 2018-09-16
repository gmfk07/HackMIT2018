/// @description Draw GUI
// You can write your code in this editor

draw_set_halign(fa_center);
draw_text(room_width*0.5, room_height*0.5, "Code is " + global.code);

var playerName = ds_map_find_first(global.playerMap);
var playerInfoMap = global.playerMap[? playerName];
var i = 0;
while (!is_undefined(playerInfoMap)) {
	draw_set_halign(fa_center);
	draw_text( (i+1) * room_width/6, room_height*5/6, playerName);
	
	//Setup for next loop
	playerName = ds_map_find_next(global.playerMap, playerName);
	playerInfoMap = global.playerMap[? playerName];
	i++;	
}