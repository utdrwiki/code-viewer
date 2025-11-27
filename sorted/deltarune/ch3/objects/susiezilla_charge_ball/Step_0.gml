with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
succ = scr_approach(succ, 20, 1);
x = scr_approach(x, goal_x, abs(x - goal_x) * 0.02 * succ);
y = scr_approach(y, goal_y, abs(y - goal_y) * 0.03 * succ);
image_xscale *= (1 - (0.01 * succ));
image_yscale *= (1 - (0.01 * succ));
if (point_distance(x, y, goal_x, goal_y) < 4)
    instance_destroy();
