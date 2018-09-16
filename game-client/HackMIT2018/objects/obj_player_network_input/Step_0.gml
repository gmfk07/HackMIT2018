/// @description Joystick Movement

	
with (playerInst) {
	var mx = lengthdir_x(other.stickDist, other.stickDir);
	var my = lengthdir_y(other.stickDist, other.stickDir);
	
	
	var dist = point_distance(0, 0, mx, my);
	
	if (dist == 0){
		mx = 0;
		my = 0;
	} else {
		mx /= dist;
		my /= dist;
	}
	
	
	var accSpd = 3;
	hsp += mx * accSpd;
	vsp += my * accSpd;
	
	
	var maxSpd = 5;
	hsp = clamp(hsp, -maxSpd, maxSpd);
	vsp = clamp(vsp, -maxSpd, maxSpd);
		
	//log_debug("Hsp is " + hsp + " and Vsp is "+vsp);
	
}
