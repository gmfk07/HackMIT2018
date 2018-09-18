/// player_win(player_name)
player_name = argument0;

data = ds_map_find_value(global.playerMap, player_name);
ds_map_set(data, "points", ds_map_find_value(data, "points") + 1);


if (room == rm_memory)
	room_goto(rm_mazegame)
else
	room_goto_next();
//room_goto(rm_interlude);