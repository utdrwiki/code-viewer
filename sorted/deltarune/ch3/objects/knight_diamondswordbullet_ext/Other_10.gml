shakeme = false;
play_passing_sfx = false;
var aim = scr_at_player() + 180;
speed = 0;
var new_x = x + lengthdir_x(40, aim);
var new_y = y + lengthdir_y(40, aim);
scr_lerpvar("x", x, new_x, 12);
scr_lerpvar("y", y, new_y, 12);
var angle_diff = angle_difference(image_angle, scr_at_player());
var angle_sign = sign(angle_diff);
var thing = image_angle;
if (angle_sign == 1)
{
    if (image_angle > 180)
        thing = (image_angle - angle_diff) + 360;
    else
        thing = image_angle - angle_diff - 360;
}
if (angle_sign == -1)
{
    if (image_angle > 180)
        thing = image_angle - angle_diff - 360;
    else
        thing = (image_angle - angle_diff) + 360;
}
scr_lerpvar("image_angle", image_angle, thing, 12, 2, "out");
scr_lerpvar("direction", direction, thing, 12, 2, "out");
scr_script_delayed(scr_lerpvar, 13, "speed", -4, 0, 8, 2, "out");
scr_script_delayed(scr_lerpvar, 21, "speed", 0, 24, 12);
scr_script_delayed(scr_var, 21, "do_afterimage", 1);
