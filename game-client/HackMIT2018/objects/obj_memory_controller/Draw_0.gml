///@description Draw pattern if showing
if (showing)
{
	for (i = 0; i < string_length(showing); i++)
	{
		img_index = -1;
		switch (string_char_at(showing, i))
		{
			case "R": img_index = 0; break;
			case "Y": img_index = 1; break;
			case "G": img_index = 2; break;
			case "B": img_index = 3; break;
		}
		draw_sprite(spr_color, img_index, room_width/2 + (i - 4)*32, room_height/2);
	}
}