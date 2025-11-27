var speedmod = 2;
if (difficulty == 1)
    speedmod = 1.75;
if (global.turntimer <= 20 && fadetype == 0)
{
    fadetype = 1;
    with (obj_tenna_allstars_bullet)
        state = 1;
}
fademax = 1 + (sin(global.time * 0.05) * 0.1);
fade = scr_approach(fade, fademax, abs(fade - fademax) * 0.15);
if (fadetype == 0)
    opaq = scr_approach(opaq, 0.75, abs(opaq - 0.75) * 0.15);
if (fadetype == 1)
    opaq = scr_approach(opaq, 0, 0.05);
for (a = 0; a < ds_list_size(bullet_list); a++)
{
    var next = ds_list_find_value(bullet_list, a);
    if (i_ex(next))
    {
        var oldangle = point_direction(x, y, next.x, next.y);
        var oldlength = point_distance(x, y, next.x, next.y);
        next.x = x + lengthdir_x(oldlength, oldangle + (next.mydir * speedmod));
        next.y = y + lengthdir_y(oldlength, oldangle + (next.mydir * speedmod));
        next.timer += abs(next.mydir) * speedmod;
    }
}
timer++;
if (difficulty == 0)
{
    if ((timer % 13) == 0 && global.turntimer > 20)
        spawn_new(0);
}
else if (global.turntimer > 20)
{
    if ((timer % 32) == 16)
        spawn_new(0);
    if ((timer % 32) == 0)
        spawn_new(1);
}
