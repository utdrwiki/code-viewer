if (ball_open)
{
    ball_open = false;
    scr_lerp_var_instance(id, "ballbot_pos_x", ballbot_pos_x, ballbot_pos_x + 80, 12, 2, "in");
    scr_lerp_var_instance(id, "ballbot_pos_y", ballbot_pos_y, ballbot_pos_y + 80, 12, 2, "in");
    scr_lerp_var_instance(id, "ballcover_pos_x", ballcover_pos_x, ballcover_pos_x + 80, 12, 2, "in");
    scr_lerp_var_instance(id, "ballcover_pos_y", ballcover_pos_y, ballcover_pos_y + 80, 12, 2, "in");
    scr_lerp_var_instance(id, "balltop_pos_x", balltop_pos_x, balltop_pos_x - 80, 12, 2, "in");
    scr_lerp_var_instance(id, "balltop_pos_y", balltop_pos_y, balltop_pos_y - 80, 12, 2, "in");
    scr_lerp_var_instance(id, "ball_top_alpha", ball_top_alpha, 0, 12, 2, "in");
    scr_lerp_var_instance(id, "ball_alpha", 1, 0, 12, 2, "in");
}
if (ball_move)
{
    ball_move_timer++;
    if (ball_move_timer == 1)
    {
    }
}
if (torielfloatcon > 0)
{
    tsin++;
    if (torielfloatcon == 1)
    {
        if ((tsin % 4) == 0)
        {
            var shine = instance_create(x + irandom_range(-30, 30), y + 56, obj_afterimage);
            shine.image_speed = 0.25;
            shine.image_alpha = 2;
            shine.sprite_index = spr_shine;
            shine.visible = true;
            shine.gravity = 0.25;
            shine.depth = depth - 10;
            scr_darksize(shine);
        }
    }
}
