/// @description Win Condition
// You can write your code in this editor

if (global.playerCount > 1) {
	if (instance_number(obj_player) == 1) {
		var winningInst = instance_find(obj_player, 0);
	
	
		var playerName = ds_map_find_first(global.playerMap);
		var playerInfoMap = global.playerMap[? playerName];
		var i = 0;
		while (!is_undefined(playerInfoMap)) {
	
			var input = playerInfoMap[?"inputInst"];
			if (input.playerInst == winningInst) {
				player_win(playerName);	
			}
	
			//Setup for next loop
			playerName = ds_map_find_next(global.playerMap, playerName);
			playerInfoMap = global.playerMap[? playerName];
			i++;	
		}
	}
}