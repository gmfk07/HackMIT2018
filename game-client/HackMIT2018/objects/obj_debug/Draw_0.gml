/// @description Draw debug messages
// You can write your code in this editor

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_font(fnt_main);
for (var i = 0; i < ds_list_size(debugMessages); ++i) {
    // code here
	draw_text(10, 10 + i * 20, string(debugMessages[|i]) );
	draw_rectangle(0,0,10,10,false);
}