if (cooldown == 0){
	
	laptime[O_camera.lap_num] = laptimer;
	O_camera.lap_num += 1;

	if (O_camera.lap_num  == 2) { delayedVal = 7;}
	else if (O_camera.lap_num  == 4) { delayedVal = 12;}
	else if (O_camera.lap_num  == 6) { delayedVal = 15;}
	else if (O_camera.lap_num  == 8) { delayedVal = 18;}
	else if (O_camera.lap_num  == 10) { delayedVal = 21;}
	else if (O_camera.lap_num  == 12) { delayedVal = 24;}
	else if (O_camera.lap_num  == 14) { 
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
	
	laptimer = 0;
	
	if (O_camera.lap_num % 2 == 0 and O_camera.lap_num != 14) pause = true;
	
	cooldown = 100;
}

	