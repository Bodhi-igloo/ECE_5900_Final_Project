camera_Show_width = 960;
camera_Show_Height = 540;


window_set_size(2*camera_Show_width, 2*camera_Show_Height);
alarm[0] = 1;
camera_set_view_size(view_camera[0], camera_Show_width, camera_Show_Height);

if(room == Track1) {
	userID = "";
	surface_resize(application_surface, 2*960, 2*540);
	lap_num = 0;
}
else {surface_resize(application_surface, 960, 540);}