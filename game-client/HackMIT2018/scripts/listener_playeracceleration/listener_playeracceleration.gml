///listener_inputjoystick(name, data)
var name = argument0;
var data = argument1;


var dataList = string_split(data, "|");


log_debug("Player Acceleration Message Recieved - Name: " + name + " , Data: " + data);
with (ds_map_find_value(global.playerMap[? dataList[|0]], "inputInst")) {

	gyroX  = real(dataList[|1]);
	gyroY  = real(dataList[|2]);
	gyroZ  = real(dataList[|3]);
}