/// @description Flip direction
// You can write your code in this editor
if (bbox_right > room_width || bbox_left < 0)
	hspeed = -hspeed;
	
if (bbox_bottom > room_height || bbox_top < 0)
	vspeed = -vspeed;