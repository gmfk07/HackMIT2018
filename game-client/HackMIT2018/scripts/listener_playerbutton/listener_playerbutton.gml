///listener_inputbutton(name, data)
var name = argument0;
var data = argument1;


var dataList = string_split(data, "|");


log_debug("Player Button Message Recieved - Name: " + name + " , Data: " + data);
log_debug("Player Button by " + dataList[|0] + " on button " + dataList[|1]);

with (ds_map_find_value(global.playerMap[? dataList[|0]], "inputInst")) {
	switch (dataList[|1]) {
	
		case "red": 
			event_perform(ev_other, ev_user0);
			break;
			
		case "yellow":
			event_perform(ev_other, ev_user1);
			break;
		
		case "blue":
			event_perform(ev_other, ev_user2);
			break;
			
		case "green":
			event_perform(ev_other, ev_user3);
			break;
	}
}