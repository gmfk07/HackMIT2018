/// @description Functionality
// You can write your code in this editor
hovered = false;
if (point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + height)) {
	hovered = true;	
}

if (hovered && mouse_check_button_pressed(mb_left)) {
	event_perform(ev_other, ev_user0);
}