/// @description Yellow Button Press
// You can write your code in this editor
if (instance_exists(obj_memory_controller) && !obj_memory_controller.showing)
{
	var current_score = obj_memory_controller.player_score[? name];
	if (current_score[1]) 
	{
		if (string_char_at(obj_memory_controller.pattern, current_score[0]) == "Y")
			ds_map_set(obj_memory_controller.player_score, name, [current_score[0]+1, current_score[0]+1 != 10]);
		else
			ds_map_set(obj_memory_controller.player_score, name, [current_score[0], false]);
	}
}