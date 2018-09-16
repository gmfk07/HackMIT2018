/// @description Check if game won
var current_player = ds_map_find_first(player_score);
var current_player_score = player_score[? current_player];
var highest_score = current_player_score[0];
winner = current_player;
if (current_player_score[1])
	exit;

for (i = 1; i < ds_map_size(player_score); i++)
{
	current_player = ds_map_find_next(player_score, current_player);
	if (current_player_score[1])
		exit;
	if (current_player_score[0] > highest_score)
	{
		highest_score = current_player_score[0];
		winner = current_player;
	}
}
alarm[1] = room_speed*1.5;