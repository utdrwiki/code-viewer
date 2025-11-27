event_inherited();
fallen = false;
pushed = false;
push_timer = 0;
roll_timer = 0;
can_push = true;
target_y = 0;
has_hit = false;

clean_up = function()
{
    with (obj_homealone_present_fallen_ball_floor)
        instance_destroy();
    instance_destroy();
};
