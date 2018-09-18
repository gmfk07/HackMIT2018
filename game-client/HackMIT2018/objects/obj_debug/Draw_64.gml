/// @description Draw debug messages
// You can write your code in this editor

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_font(fnt_main);
for (var i = 0; i < ds_list_size(debugMessages); ++i) {
    // code here
	draw_text(10, 10 + i * 20, string(debugMessages[|i]) );
	draw_rectangle(0,0,10,10,false);
}


var playerName = ds_map_find_first(global.playerMap);
var playerInfoMap = global.playerMap[? playerName];
var i = 0;
while (!is_undefined(playerInfoMap)) {
	
	
	
	var pScore = playerInfoMap[?"points"];
	
	draw_set_font(fnt_big);
	draw_set_halign(fa_right);
	draw_set_color(c_white);
	draw_text(room_width*0.99, room_height*0.05 + i*room_height*0.1, playerName + " Score: " + string(pScore));
	
	
	
	//Setup for next loop
	playerName = ds_map_find_next(global.playerMap, playerName);
	playerInfoMap = global.playerMap[? playerName];
	i++;	
}