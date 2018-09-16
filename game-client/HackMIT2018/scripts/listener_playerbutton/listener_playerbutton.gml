///listener_inputbutton(name, data)
var name = argument0;
var data = argument1;


var dataList = string_split(data, "|");


log_debug("Player Button Message Recieved - Name: " + name + " , Data: " + data);
log_debug("Player Button by " + dataList[|0] + " on button " + dataList[|1]);