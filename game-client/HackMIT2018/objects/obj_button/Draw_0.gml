/// @description Draw
// You can write your code in this editor
draw_set_color(color);
if (hovered)
	draw_set_color(colorHovered);
draw_rectangle(x, y, x + width, y + height, false);

draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(x + width * 0.5, y + height * 0.5, text);


