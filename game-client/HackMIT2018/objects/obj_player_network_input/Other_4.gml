/// @description Memory game setup
if (instance_exists(obj_memory_controller))
	ds_map_add(obj_memory_controller.player_score, name, [0, true]);