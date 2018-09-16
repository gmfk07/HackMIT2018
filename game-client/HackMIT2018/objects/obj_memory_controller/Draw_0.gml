///@description Draw pattern/scores
if (showing)
{
	for (i = 0; i < string_length(pattern); i++)
	{
		img_index = -1;
		switch (string_char_at(pattern, i))
		{
			case "R": img_index = 0; break;
			case "Y": img_index = 1; break;
			case "G": img_index = 2; break;
			case "B": img_index = 3; break;
		}
		draw_sprite(spr_color, img_index, room_width/2 + (i - 4)*64, room_height/2);
	}
} else {
	var current_player = ds_map_find_first(player_score);
	var current_player_score = player_score[? current_player];
	if (current_player_score[1] == false)
		draw_set_color(c_red);
	else
		draw_set_color(c_black);
	draw_text(128, room_height/2 - 26, current_player + ": " + string(current_player_score[0]));
	
	
	for (i = 1; i < ds_map_size(player_score); i++)
	{
		current_player = ds_map_find_next(player_score, current_player);
		current_player_score = player_score[? current_player];
		if (current_player_score[1] == false)
			draw_set_color(c_red);
		else
			draw_set_color(c_black);
		draw_text(128+16*i, room_height/2 - 26, current_player + ": " + string(current_player_score[0]));
	}
	
	
	
	/*
	
	
	var current_player = ds_map_find_first(player_score);
	var current_player_score = player_score[? current_player];
	if (current_player_score[1] == false)
		draw_set_color(c_red);
	else
		draw_set_color(c_black);
	draw_text(128, room_height/2 - 26, current_player + ": " + string(current_player_score[0]));
	
	
	var current_player = ds_map_find_first(player_score);
	var current_player_score = player_score[? current_player];
	var i = 0;
	while (!is_undefined(current_player_score)) {
	
		if (current_player_score[1] == false)
			draw_set_color(c_red);
		else
			draw_set_color(c_black);
		draw_text(128, room_height/2 - 26, current_player + ": " + string(current_player_score[0]));
		
	
		//Setup for next loop
		current_player = ds_map_find_next(player_score, current_player);
		current_player_score = player_score[? current_player];
		i++;	
	}
	
	
	*/
}