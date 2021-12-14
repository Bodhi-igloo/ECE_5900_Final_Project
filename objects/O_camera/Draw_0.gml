if (room == Track1){
	draw_text(32+camera_get_view_x(view_camera[0]),32+camera_get_view_y(view_camera[0]),"Lap Number:  " + string(lap_num));
	draw_text(32+camera_get_view_x(view_camera[0]),46+camera_get_view_y(view_camera[0]),"Lap Time:  " + string(Car.laptimer));
	//draw_text(32+camera_get_view_x(view_camera[0]),56+camera_get_view_y(view_camera[0]),"Cooldown:  " + string(Car.cooldown));
	//draw_text(32+camera_get_view_x(view_camera[0]),68+camera_get_view_y(view_camera[0]),"Delay:  " + string(Car.delayedVal * .033));
	//draw_text(32+camera_get_view_x(view_camera[0]),80+camera_get_view_y(view_camera[0]),"Countdown:  " + string(Car.countdown));
	draw_text(32+camera_get_view_x(view_camera[0]),60+camera_get_view_y(view_camera[0]),"faults:  " + string(Car.faults[lap_num]));
	draw_text(32+camera_get_view_x(view_camera[0]),80+camera_get_view_y(view_camera[0]),"UserID:  " + userID);
}

if(Car.pause == true and lap_num == 0 and room == Track1){
    draw_text(240+camera_get_view_x(view_camera[0]),50+camera_get_view_y(view_camera[0]),"       TYPE IN NEW USER ID\nNO SPACES OR SPECIAL CHARACTERS");
	draw_text(330+camera_get_view_x(view_camera[0]),86+camera_get_view_y(view_camera[0]), keyboard_string);
	userID = keyboard_string;
	draw_text(240+camera_get_view_x(view_camera[0]),102+camera_get_view_y(view_camera[0]),"    PRESS 'SPACE' TO CONTINUE");
}
else if(Car.pause == true and lap_num != 0 and room == Track1){
		draw_text(240+camera_get_view_x(view_camera[0]),90+camera_get_view_y(view_camera[0]),
								"PLEASE TAKE THE TIME TO FILL OUT THE SURVEY FOR LAP " + string(lap_num-2) + " AND " +string(lap_num-1));
		draw_text(240+camera_get_view_x(view_camera[0]),102+camera_get_view_y(view_camera[0]),"PRESS 'SPACE' TO CONTINUE");
}
