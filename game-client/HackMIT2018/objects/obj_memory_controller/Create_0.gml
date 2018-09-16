/// @description Get pattern, init vars
pattern = ""
for (i = 0; i < 10; i++)
{
	switch (irandom(3)) {
		case 0: pattern += "R"; break;
		case 1: pattern += "G"; break;
		case 2: pattern += "B"; break;
		case 3: pattern += "Y"; break;
	}
}
alarm[0] = room_speed*3;

showing = true;