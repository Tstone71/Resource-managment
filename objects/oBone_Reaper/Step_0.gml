if((distance_to_object(obj_player) > 320)) {
	
	tmp_path = path_add();
	
	goX = random(room_width);
	goY = random(room_height);


	mp_grid_path(global.grid_id, tmp_path, x, y + sprite_height / 2, goX, goY , true);
	
	if(!path_get_closed(tmp_path)) {
		if(path_exists(path)) path_delete(path);
		path = path_duplicate(tmp_path);
		pos = 1;
	}
	
	if(path_exists(tmp_path)) path_delete(tmp_path);
	
	
} else if(distance_to_object(oPlayer) <= 320){
		
	tmp_path = path_add();
	
	mp_grid_path(global.grid_id, tmp_path, x, y + sprite_height / 2, obj_player.x, obj_player.y + oPlayer.sprite_height / 2, true);

	if(!path_get_closed(tmp_path)) {
		if(path_exists(path)) path_delete(path);
		path = path_duplicate(tmp_path);
		pos = 1;
		state = eState.hunting;
	}
	
	if(path_exists(tmp_path)) path_delete(tmp_path);

}


if(path_exists(path) && path_get_length(path) != 0) {
			
	x_goto = path_get_point_x(path, pos);
	y_goto = path_get_point_y(path, pos);

	if (point_distance(x, y + sprite_height / 2, x_goto, y_goto) < 1 || path_get_number(path) == 0 )
	{
		if (++pos == path_get_number(path) ) {
			if(path_exists(path)) path_delete(path);

			state = eState.arrived;
		} else {
			x_goto = path_get_point_x(path, pos);
			y_goto = path_get_point_y(path, pos); 
		}
	}
	
	if(state == eState.wandering) {
		mp_linear_step(x_goto, y_goto - sprite_height / 2, eWanderingSpeed, false);
	} else if(state == eState.hunting) {
		mp_linear_step(x_goto, y_goto - sprite_height / 2, eHuntingSpeed, false);
	}
} else if(!path_exists(path) || path_get_closed(path)){
	
	tmp_path = path_add();
	
	goX = random(room_width);
	goY = random(room_height);

	mp_grid_path(global.grid_id, tmp_path, x, y + sprite_height / 2, goX, goY , true);
	
	if(!path_get_closed(tmp_path)) {
		if(path_exists(path)) path_delete(path);
		path = path_duplicate(tmp_path);
		pos = 1;
		state = eState.wandering;
	} else {
		y--;	
	}
	
	if(path_exists(tmp_path)) path_delete(tmp_path);
	
}