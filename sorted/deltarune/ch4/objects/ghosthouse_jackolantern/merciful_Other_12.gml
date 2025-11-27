if (end_con >= 2)
    direction = point_direction(x, y, obj_heart.x + 4, obj_heart.y + 4);
else
    direction = point_direction(x, y, targ_x, targ_y);
debug_print("scrambling!");
