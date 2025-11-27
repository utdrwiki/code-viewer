depth = 91000;
static_pos = false;
actor_target = -4;
ball_x = -1;
ball_y = -1;
mode = 0;
ball_angle = 0;
target_angle = 0;
var x_offset = 20;
var y_offset = 28;
ball_target_top_pos = ball_x + x_offset;
ball_target_bottom_pos = 165 + y_offset;
ball_top_pos_x = 0;
ball_top_pos_y = 0;
ball_bottom_pos_x = 0;
ball_bottom_pos_y = 0;
ball_alpha = 0;
catch_timer = 0;
init = false;

catch_character = function()
{
    init = true;
    ball_x = actor_target.x;
    ball_y = actor_target.y;
    target_angle = -150;
    if (mode == 2)
        target_angle = -180;
    if (mode == 3 || mode == 4)
        target_angle = -100;
    scr_lerpvar("ball_alpha", 0, 1, 5);
    var x_offset = (mode == 3) ? 20 : 20;
    if (mode == 4)
        x_offset = 20;
    scr_lerpvar("ball_top_pos_x", actor_target.x - 40, actor_target.x + x_offset, 12, 3, "out");
    scr_lerpvar("ball_top_pos_y", 109, 195, 12, 3, "out");
    scr_lerpvar("ball_bottom_pos_x", actor_target.x + 40, actor_target.x + x_offset, 12, 3, "out");
    scr_lerpvar("ball_bottom_pos_y", 221, 195, 12, 3, "out");
    scr_script_delayed(scr_lerpvar, 6, "ball_angle", ball_angle, target_angle, 15, -1, "out");
};

set_pos = function(arg0, arg1)
{
    var x_offset = (mode == 3) ? 30 : 20;
    if (mode == 4)
        x_offset = 20;
    target_angle = -150;
    if (mode == 2)
        target_angle = -180;
    if (mode == 3 || mode == 4)
        target_angle = -100;
    ball_angle = target_angle;
    ball_alpha = 1;
    ball_top_pos_x = arg0 + x_offset;
    ball_bottom_pos_x = arg0 + x_offset;
    if (room == room_ch3_gameshowroom)
    {
        ball_top_pos_y = 329;
        ball_bottom_pos_y = 329;
    }
    else
    {
        ball_top_pos_y = arg1;
        ball_bottom_pos_y = arg1;
    }
    init = true;
};
