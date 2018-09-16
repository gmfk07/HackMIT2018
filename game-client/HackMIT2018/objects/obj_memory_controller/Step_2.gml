/// @description End the game if everyone's done
var current_player = ds_map_find_first(player_score);
var winner = current_player;
var current_player_score = player_score[? current_player];
var highest_score = current_player_score[0];
if (current_player_score[1])
	exit;
	
for (i = 1; i < ds_map_size(player_score); i++)
{
	current_player = ds_map_find_next(player_score, current_player);
	current_player_score = player_score[? current_player];
	if (highest_score <= current_player_score[0])
	{
		highest_score = current_player_score[0];
		winner = current_player;
	}
	if (current_player_score[1])
		exit;
}

player_win(winner);