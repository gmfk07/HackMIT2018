///@description Draw players with their score


var playerName = ds_map_find_first(global.playerMap);
var playerInfoMap = global.playerMap[? playerName];
var i = 0;
while (!is_undefined(playerInfoMap)) {
	
	
	
	var pScore = playerInfoMap[?"points"];
	
	draw_set_font(fnt_big);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(room_width*0.5, room_height*0.2 + i*room_height*0.1, playerName + " Score: " + string(pScore));
	
	
	
	//Setup for next loop
	playerName = ds_map_find_next(global.playerMap, playerName);
	playerInfoMap = global.playerMap[? playerName];
	i++;	
}