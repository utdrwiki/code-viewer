event_inherited();
radius = 22;
light = 0;
image_blend = c_red;
tracking_val2 = 1;
destroyonhit = false;
speed_max *= 2.5;

do_shrivel = function()
{
};

do_pushback = function()
{
};

check_death = function()
{
};

chase_heart = function()
{
    var hx = obj_heart.x + 10;
    var hy = obj_heart.y + 10;
    if (i_ex(obj_heart))
    {
        if (point_distance(x, y, hx, hy) < (obj_darkshape_light_aura.radius + 8) || light > 0)
            speed = scr_approach(speed, speed_max * speed_max_multiplier * 0.5, speed * 0.25);
        else
            speed = scr_approach(speed, speed_max * speed_max_multiplier, accel * speed_max_multiplier * (1 - light));
        var anglediff = angle_difference(direction, point_direction(x, y, hx, hy));
        if (tracking_val2 > 0)
            direction = scr_angle_lerp(direction, point_direction(x, y, hx, hy), tracking_val2 * 0.3);
    }
};

image_xscale = 1;
image_yscale = 1;
scalefactor = 1;
alarm[0] = 60;
