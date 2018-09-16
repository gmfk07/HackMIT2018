/// player_win(player_name)
player_name = argument0;

data = ds_map_find_value(global.playermap, player_name);
ds_map_set(data, "points", ds_map_find_value(data, "points") + 1);

room_goto(rm_interlude);