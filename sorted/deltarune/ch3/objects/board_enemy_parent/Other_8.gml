is_moving = false;
movecon = 0;
movetimer = 0;
is_moving_timer = 0;
speed = 0;
if (distance_to_object(obj_board_controller.kris_object) >= (distance_to_become_aggressive - 20))
    move_type = 0;
