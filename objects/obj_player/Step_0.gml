// A-W-S-D Movement

var normalSpeed = 3;
var diagonalSpeed = normalSpeed * 0.7;

var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var up = keyboard_check(vk_up);
var down = keyboard_check(vk_down);

var horizontal = (right - left); // -1 0 1
var vertical = (down - up); // -1 0 1

var hSpeed = 0;
var vSpeed = 0;

if(horizontal != 0 and vertical != 0) {
	hSpeed = horizontal * diagonalSpeed;
	vSpeed = vertical * diagonalSpeed;
} else {
	var hSpeed = horizontal * normalSpeed;
	var vSpeed = vertical * normalSpeed;
}

var dir = point_direction(0, 0, horizontal, vertical);
//var moveX = lengthdir_x(spd, dir);
//var moveY = lengthdir_y(spd, dir);

switch(dir) {
	// 8 direction movement. I just changes the sprite based on the direction you are looking
	case 0: sprite_index = Astronaut_left; 
			sprite_set_speed(Astronaut_left, 0.3, 1); break;
	
	case 45: sprite_index = Astronaut_back_left; 
			sprite_set_speed(Astronaut_back_left, 0.3, 1); break;
	
	case 90: sprite_index = Astronaut_back; 
			sprite_set_speed(Astronaut_back, 0.3, 1); break;
	
	case 135: sprite_index = Astronaut_back_right; 
			image_xscale = -1; sprite_set_speed(Astronaut_back_right, 0.3, 1); break;
	
	case 180: sprite_index = Astronaut_right; 
			image_xscale = -1; sprite_set_speed(Astronaut_right, 0.3, 1); break;
	
	case 225: sprite_index = Astronaut_front_right; 
			image_xscale = -1; sprite_set_speed(Astronaut_front_right, 0.3, 1); break;
	
	case 270: sprite_index = Astronaut_front; 
			sprite_set_speed(Astronaut_front, 0.3, 1); break;
	
	case 315: sprite_index = Astronaut_front_left; 
			sprite_set_speed(Astronaut_front_left, 0.3, 1); break;
	//default: image_index = 0;
} 
// stopping animation if you are not moving
if(horizontal == 0 and vertical == 0) {
	image_index = 0;
}

x += hSpeed;
y += vSpeed;

// camera follow
var half_view_width = camera_get_view_width(view_camera[0]) / 2;
var half_view_height = camera_get_view_height(view_camera[0]) / 2;

var target_x = obj_player.x - half_view_width;
var target_y = obj_player.y - half_view_height;

var lerp_speed = 0.1;
camera_set_view_pos(view_camera[0], lerp(camera_get_view_x(view_camera[0]), target_x, lerp_speed),
					lerp(camera_get_view_y(view_camera[0]), target_y, lerp_speed));
					



	