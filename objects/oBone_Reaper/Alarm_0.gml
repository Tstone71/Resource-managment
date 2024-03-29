path_delete(path);
path = path_add();


target_x = obj_player.x;
target_y = obj_player.y;

mp_grid_path(oPathway.grid,path,x,y,target_x, target_y, 1);

path_start(path,0.5,path_action_stop, true);




alarm_set(0,120);