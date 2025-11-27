ball_x = actor_target.x;
ball_y = actor_target.y;
ball_top_pos_x = ball_x + x_offset;
ball_top_pos_y = ball_y + a;
target_angle = -150;
if (mode == 2)
    target_angle = -180;
if (mode == 3 || mode == 4)
    target_angle = -100;
scr_lerpvar("ball_alpha", 0, 1, 5);
var x_offset = (mode == 3) ? 30 : 20;
if (mode == 4)
    x_offset = 20;
scr_lerpvar("ball_top_pos_x", actor_target.x - 40, actor_target.x + x_offset, 12, 3, "out");
scr_lerpvar("ball_top_pos_y", 109, 199, 12, 3, "out");
scr_lerpvar("ball_bottom_pos_x", actor_target.x + 40, actor_target.x + x_offset, 12, 3, "out");
scr_lerpvar("ball_bottom_pos_y", 221, 199, 12, 3, "out");
scr_script_delayed(scr_lerpvar, 6, "ball_angle", ball_angle, target_angle, 15, -1, "out");
