image_speed = 0;
xanchor = x;
yanchor = y;
xdist = 0;
ydist = 0;
xspeed = 0;
yspeed = 0;
the_max = choose(pi, 2 * pi);
time_req = 16 + irandom(12);
interval = the_max / time_req;
amplitude = 16 + irandom(16);
counter = 0;
abs_counter = 0;
amp_choice = choose(-1, 1);
if (i_ex(obj_susiezilla_statue))
{
    xdist = (obj_susiezilla_statue.x + irandom_range(-32, 32)) - x;
    ydist = obj_susiezilla_statue.y - 64 - irandom(64) - y;
    xspeed = xdist / time_req;
    yspeed = ydist / time_req;
}
else
{
    instance_destroy();
}
