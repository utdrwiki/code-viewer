pawtype = 0;
counter = paw_reload;
var newx = camerax() + (camerawidth() / 2) + choose(-(obj_mike_controller.line_width / 2), 0, obj_mike_controller.line_width / 2);
while (x == newx)
    newx = camerax() + (camerawidth() / 2) + choose(-(obj_mike_controller.line_width / 2), 0, obj_mike_controller.line_width / 2);
if (attacks < 3)
{
    if (obj_mike_controller.x > (camerax() + (camerawidth() / 2) + 30))
        newx = camerax() + (camerawidth() / 2) + (obj_mike_controller.line_width / 2);
    else if (obj_mike_controller.x < ((camerax() + (camerawidth() / 2)) - 30))
        newx = (camerax() + (camerawidth() / 2)) - (obj_mike_controller.line_width / 2);
    else
        newx = camerax() + (camerawidth() / 2);
}
mid_reload -= 1;
if (choose(0, 1) && mid_attack && mid_reload <= 0)
{
    pawtype = 1;
    mid_reload = 2;
    newx = camerax() + (camerawidth() / 2);
}
if (paw_aim)
{
    paw_aim = 0;
    newx = obj_mike_controller.x;
}
x = newx;
attacks -= 1;
if (attacks > 0)
    alarm[1] = paw_reload + 5;
