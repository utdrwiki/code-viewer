if (!can_push)
    exit;
if (!pushed && x >= 210)
{
    fallen = true;
    pushed = true;
}
if (pushed)
{
    push_timer++;
    if (!has_hit)
    {
        if (place_meeting(x, y, obj_homealone_dess_snowflake))
        {
            has_hit = true;
            with (obj_homealone_dess_closet_controller)
                hit_snowflake = true;
        }
    }
    if (push_timer == 1)
    {
        gravity = 0.8;
        hspeed = 0.5;
        friction = 0.1;
        target_y = 108;
    }
    if (push_timer == 13)
    {
        hspeed = -hspeed;
        vspeed = -vspeed / 2;
    }
    if (push_timer == 16)
        vspeed = -vspeed / 2;
    if (y >= target_y)
    {
        hspeed = scr_movetowards(hspeed, 0, 0.1);
        vspeed = 0;
        gravity = 0;
        if (hspeed == 0)
        {
            can_push = false;
            var fallen_ball = instance_create(x, y, obj_homealone_present_fallen_ball_floor);
            fallen_ball.depth = 39900;
            with (obj_homealone_present_fallen)
            {
                ball = -4;
                interact_event = true;
            }
            instance_destroy();
            exit;
        }
    }
}
