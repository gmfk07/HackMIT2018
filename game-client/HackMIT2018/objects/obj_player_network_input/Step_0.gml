/// @description Joystick Movement

if (room == rm_mazegame) {
	with (playerInst) {
		var mx = lengthdir_x(other.stickDist, other.stickDir);
		var my = lengthdir_y(other.stickDist, other.stickDir);
	
	
		var dist = point_distance(0, 0, mx, my);
	
		if (dist == 0){
			mx = 0;
			my = 0;
		
			var fric = 1;
			hsp = approach(hsp, 0, fric);
			vsp = approach(vsp, 0, fric);
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
}

if (room == rm_stoplight) {
	
	with (playerInst) {
		var mag = point_distance_3d(0, 0, 0, other.gyroX, other.gyroY, other.gyroZ);
	
		if (mag > min_accel) {
			vspeed -= 0.02;
		} else {
			vspeed += 0.15;
		}
		vspeed = clamp(vspeed, -max_speed, 0);
	}
	
	
}





