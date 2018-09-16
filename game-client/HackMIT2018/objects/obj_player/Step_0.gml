/// @description Move character
// You can write your code in this editor
if (!place_meeting(x+hsp, y+vsp, obj_block))
{
	x += hsp;
	y += vsp;
} else

if (!place_meeting(x+hsp, y, obj_block)) {
	x += hsp;
} else 

if (!place_meeting(x, y+vsp, obj_block)) {
	y += vsp;
} 