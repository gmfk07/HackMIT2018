///@description Pick random game
switch (irandom(2))
{
	case 0: room_goto(rm_mazegame); break;
	case 1: room_goto(rm_stoplight); break;
	case 2: room_goto(rm_memory); break;
}