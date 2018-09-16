///listener_inputjoystick(name, data)
var name = argument0;
var data = argument1;


var dataList = string_split(data, "|");


log_debug("Player Joystick Message Recieved - Name: " + name + " , Data: " + data);
with (ds_map_find_value(global.playerMap[? dataList[|0]], "inputInst")) {

	stickDir  = real(dataList[|1]);
	stickDist = real(dataList[|2]);
}