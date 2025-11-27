x = scr_get_box(4);
y = scr_get_box(5);
max_radius = 140;
spotlight_radius = 1.5707963267948966;
counter = 0;
counter_speed = 1;
counter_speed_goal = choose(-2, 2);
alert = false;
spot_rate = 0.1;
timer = 0;
sameattack = 0;
eye_power = 0;
scr_lerpvar("counter_speed", counter_speed_goal * 0.5, counter_speed_goal, 24);
var _dir = 28;
var _len = 150;
for (var aa = 0; aa < 5; aa++)
    instance_create(x + lengthdir_x(_len, _dir + (30 * aa)), y + lengthdir_y(_len, _dir + (30 * aa)), obj_mizzle_spotlight_eye);
spotlight[0] = instance_create(x, y, obj_mizzle_spotlight);
spotlight[1] = instance_create(x, y, obj_mizzle_spotlight);
spotlight[2] = instance_create(x, y, obj_mizzle_spotlight);

spotlight_set_goal = function(arg0, arg1, arg2, arg3, arg4)
{
    scr_lerp_var_instance(id, "spotlight_radius", spotlight_radius, spotlight_radius + arg2, arg4);
    scr_lerp_var_instance(id, "counter_speed", counter_speed, arg3, arg4);
    if (eye_power == 0)
    {
        scr_lerp_var_instance(id, "x", x, arg0, arg4, 1, "out");
        scr_lerp_var_instance(id, "y", y, arg1, arg4, 1, "out");
    }
};

update_spotlights = function()
{
    if (!alert)
    {
        if (eye_power == 0)
        {
            for (var aa = 0; aa < 3; aa++)
            {
                spotlight[aa].x = x + lengthdir_x(sin(spotlight_radius) * max_radius, counter + (120 * aa));
                spotlight[aa].y = y + lengthdir_y(sin(spotlight_radius) * max_radius, counter + (120 * aa));
            }
        }
        else if (eye_power == 1)
        {
            for (var aa = 0; aa < 3; aa++)
            {
                spotlight[aa].x = x + (sin(timer * 0.02) * 30) + lengthdir_x(110 + (sin(spotlight_radius) * 10), counter + (120 * aa));
                spotlight[aa].y = y + (cos(timer * 0.027) * 30) + lengthdir_y(110 + (sin(spotlight_radius) * 10), counter + (120 * aa));
            }
        }
        else
        {
            for (var aa = 0; aa < 3; aa++)
            {
                spotlight[aa].x = x + lengthdir_x(120, counter + (120 * aa));
                spotlight[aa].y = y + lengthdir_y(120, counter + (120 * aa));
            }
        }
    }
    else
    {
        with (obj_mizzle_spotlight)
        {
            x = scr_approach(x, obj_heart.x + 10, clamp(abs(x - (obj_heart.x + 10)) * other.spot_rate, 3, 10));
            y = scr_approach(y, obj_heart.y + 10, clamp(abs(y - (obj_heart.y + 10)) * other.spot_rate, 3, 10));
        }
        spot_rate = scr_approach(spot_rate, 1, 0.025);
    }
};

set_info = function()
{
    if (scr_monsterpop() == sameattack)
        eye_power = 0;
    else
        eye_power = scr_monsterpop() - sameattack;
    if (i_ex(obj_balthizard_enemy) && scr_monsterpop() == 3)
        eye_power = 1;
    if (i_ex(obj_balthizard_enemy) && scr_monsterpop() == 2)
        eye_power = 1;
    if (scr_monsterpop() == sameattack)
    {
        with (obj_mizzle_spotlight)
        {
            image_xscale -= ((3 - other.sameattack) * 0.15);
            image_yscale -= ((3 - other.sameattack) * 0.15);
        }
    }
    update_spotlights();
};

update_spotlights();
alarm[0] = 32;
