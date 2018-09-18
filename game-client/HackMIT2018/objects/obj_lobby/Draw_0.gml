/// @description Draw GUI
// You can write your code in this editor

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_font(fnt_big);
draw_text(room_width*0.5, room_height*0.25, "Code is: " + global.code);
draw_set_font(fnt_main);

var playerName = ds_map_find_first(global.playerMap);
var playerInfoMap = global.playerMap[? playerName];
var i = 0;
while (!is_undefined(playerInfoMap)) {
	draw_set_halign(fa_center);
	var xx = (i+1) * room_width/6;
	var yy =  room_height*4.5/6;
	draw_text( xx,yy, playerName);
	
	yy -= 20;
	
	draw_sprite(global.playerImages[playerInfoMap[?"id"] % 4], 0, xx, yy);
	
	//Setup for next loop
	playerName = ds_map_find_next(global.playerMap, playerName);
	playerInfoMap = global.playerMap[? playerName];
	i++;	
	if (i == 2) 
		i++;
}