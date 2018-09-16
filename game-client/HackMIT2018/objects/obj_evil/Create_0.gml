/// @description Init vars
direction = random(360);
speed = 3;

speed_up_timer = room_speed*3;
spawn_clone_timer = room_speed*7;

alarm[0] = speed_up_timer;
alarm[1] = spawn_clone_timer;