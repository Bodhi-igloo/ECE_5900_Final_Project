if (countdown <= 0 and O_camera.lap_num != 0 and room == Track1){
	var stats_time = file_text_open_write(string(O_camera.userID) + "_time_statistics.csv");
	file_text_write_string(stats_time, string(O_camera.userID));
	file_text_writeln(stats_time);
	for(i = 0; i < 14; i++){
		if(i >= O_camera.lap_num && O_camera.lap_num != 14) file_text_write_string(stats_time, string(i) + ",DNF");
		else file_text_write_string(stats_time, string(i) + "," + string(laptime[i]));
		file_text_writeln(stats_time);
	}
	file_text_close(stats_time);
	
	var stats_fault = file_text_open_write(string(O_camera.userID) + "_fault_statistics.csv");
	file_text_write_string(stats_fault, string(O_camera.userID));
	file_text_writeln(stats_fault);
	for(i = 0; i < 14; i++){
		if(i >= O_camera.lap_num && O_camera.lap_num != 14) file_text_write_string(stats_fault, string(i) + ",DNF");
		else file_text_write_string(stats_fault, string(i) + "," + string(faults[i]));
		file_text_writeln(stats_fault);
	}
	file_text_close(stats_fault);
	
	room_goto_next();
}

if (pause == false){
	if(gamepad_is_connected(0) == true){
		xrot = gamepad_axis_value(0, gp_axisrh);
		ytrans =- gamepad_axis_value(0, gp_axislv);
	
		if (abs(xrot) > .2){ ds_list_insert(delayedInputX,0, xrot);}
		else { ds_list_insert(delayedInputX,0, 0);}
		if (abs(ytrans) > .2){ ds_list_insert(delayedInputY,0, ytrans);}
		else { ds_list_insert(delayedInputY,0, 0);}
		ds_list_delete(delayedInputX, 60);
		ds_list_delete(delayedInputY, 60);
		xaxis = ds_list_find_value(delayedInputX, delayedVal);
		yaxis = ds_list_find_value(delayedInputY, delayedVal);
	}
	else{
		left = keyboard_check(vk_left);
		right = keyboard_check(vk_right);
		up = keyboard_check(vk_up);
		down = keyboard_check(vk_down);
	
		xrot = right - left;
		ytrans = up - down;
		ds_list_insert(delayedInputX,0, xrot);
		ds_list_insert(delayedInputY,0, ytrans);
		ds_list_delete(delayedInputX, 60);
		ds_list_delete(delayedInputY, 60);
		xaxis = ds_list_find_value(delayedInputX, delayedVal);
		yaxis = ds_list_find_value(delayedInputY, delayedVal);
	}

	moving = (yaxis != 0);

	if (moving) {
		dir = yaxis;
	
		//turning
		if(xaxis != 0){
			if(yaxis > 0.1){ image_angle -= turnSpd*xaxis; }
			else if(yaxis < -0.1){ image_angle -= turnReverseSpd*xaxis; }
		}
	
		//moving forward
		if(yaxis > 0.1){
			if(len < maxSpd){ len += accSpd*yaxis;}
			else if(len > maxSpd) { len = maxSpd;}
		}
		else if(yaxis < -0.1){ 
			if(len > -maxReverseSpd){ len += accReverseSpd*yaxis;}
			else if(len < -maxReverseSpd) { len = -maxReverseSpd;}	
		}
	}
	else {
		if (dir > 0) {
			if (len > 0) { 
				len -= fricSpd;
				image_angle -= turnSpd*xaxis*.5;
			}
			else if ( len <= 0){ len = 0;}
		}
		else if (dir < 0) { 
			if (len < 0 ) { 
				len += fricSpd;
				image_angle -= turnReverseSpd*xaxis*.5;
			}
			else if (len >= 0 ) { len = 0; } 
		}
	}

	// calculate where to move
	hspd = lengthdir_x(len, image_angle);
	vspd = lengthdir_y(len, image_angle);

	//move the car
	x += hspd;
	y += vspd;

	if (cooldown > 0 ) cooldown--;
	if(countdown < 100) countdown++;

	laptimer += (1/room_speed);
}


