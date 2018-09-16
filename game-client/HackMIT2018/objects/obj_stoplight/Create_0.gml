/// @description Init vars
// You can write your code in this editor
stop_time = random(room_speed*4) + room_speed*3;
hold_time = random(room_speed*2) + room_speed;
alert_time = stop_time - room_speed;
alarm[0] = alert_time;
alarm[1] = stop_time;

can_move = true;
image_speed = 0;
image_index = 0;