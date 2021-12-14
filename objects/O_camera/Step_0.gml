if (window_get_fullscreen() == false) 
	window_set_fullscreen(true);

var cameraX = clamp(Car.x - camera_Show_width/2, 0, room_width - camera_Show_width);
var cameraY = clamp(Car.y - camera_Show_Height/2, 0, room_height - camera_Show_Height);

var current_x = camera_get_view_x(view_camera[0]);
var current_y = camera_get_view_y(view_camera[0]);

var SmoothScrollSpeed = .3;
camera_set_view_pos(view_camera[0], 
								lerp (current_x, cameraX, SmoothScrollSpeed),
								lerp (current_y, cameraY, SmoothScrollSpeed));
								
