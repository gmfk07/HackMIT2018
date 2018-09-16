///@description Disable showing
showing = false;
var current_player = ds_map_find_first(player_score);
	if (ds_map_find_value(player_score, current_player)[1] != false)
	
	draw_text(128, room_height/2 - 26, current_player + ": " + string(ds_map_find_value(player_score, current_player)[0]));
	
	for (i = 1; i < ds_map_size(player_score); i++)
	{
		current_player = ds_map_find_next(player_score, current_player);
		if (ds_map_find_value(player_score, current_player)[1] == false)
			draw_set_color(c_red);
		else
			draw_set_color(c_black);
		draw_text(128+16*i, room_height/2 - 26, current_player + ": " + string(ds_map_find_value(player_score, current_player)[0]));
	}