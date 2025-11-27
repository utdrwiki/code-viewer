if (actor_target == -4 || mode == 0)
    exit;
catch_timer++;
if (catch_timer == 1)
{
    ball_x = actor_target.x;
    ball_y = actor_target.y;
    target_angle = -150;
    if (mode == 2)
        target_angle = -180;
    if (mode == 3)
        target_angle = -100;
    var xoffset = 0;
    var yoffset = 0;
    if (actor_target == 1409)
    {
        xoffset = 0;
        yoffset = 0;
    }
    if (actor_target == 1411)
    {
        xoffset = -3;
        yoffset = 0;
    }
    scr_lerpvar("ball_alpha", 0, 1, 5);
    var x_offset = (mode == 3) ? 30 : 20;
    scr_lerpvar("ball_top_pos_x", actor_target.x - 40, actor_target.x + x_offset + xoffset, 12, 3, "out");
    scr_lerpvar("ball_top_pos_y", 109, actor_target.y + 40 + yoffset, 12, 3, "out");
    scr_lerpvar("ball_bottom_pos_x", actor_target.x + 40, actor_target.x + x_offset + xoffset, 12, 3, "out");
    scr_lerpvar("ball_bottom_pos_y", 221, actor_target.y + 40 + yoffset, 12, 3, "out");
    scr_script_delayed(scr_lerpvar, 6, "ball_angle", ball_angle, target_angle, 15, -1, "out");
}
