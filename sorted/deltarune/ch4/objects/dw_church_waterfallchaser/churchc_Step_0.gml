touchradius = 20;
var ripcol = 255;
if (init == 0)
{
    init = 1;
    con = 2;
}
if (con == 0)
{
    timer++;
    var speedup = clamp(((timer / 90) * timer) / 90, 0, 1);
    sinertarg = 30 - lerp(0, 28, speedup);
    depth = 500;
    var chasespeed = lerp(-1, 11, speedup);
    var offscreen = false;
    var cx = camerax();
    if (x < cx || x > (cx + 640))
        offscreen = true;
    var cy = cameray();
    if (y < cy || y > (cy + 480))
        offscreen = true;
    if (offscreen)
        chasespeed = 24;
    var targ = 1049;
    var player_in_light = scr_in_light(1214, 10, 10);
    if (player_in_light)
    {
        siner = random_range(0, 48);
        sinertarg = 9999;
        x = startx;
        y = starty;
        vspeed = 0;
        hspeed = 0;
        timer = 0;
        con = 2;
        exit;
    }
    move_towards_point(targ.x + 40, targ.y + 60, chasespeed);
    if (i_ex(collision_circle(x, y, touchradius, obj_mainchara, 0, true)))
    {
        con = 0.5;
        scr_delay_var("con", 1, 15);
        image_alpha = 0;
        var ripcount = 6;
        for (var i = 0; i < ripcount; i++)
        {
            var ripple = instance_create(x, y, obj_church_ripple);
            with (ripple)
            {
                ripplecount = 1;
                ripplethicc = 6;
                lifetime = 60;
                alpha = 2;
                dodraw = false;
                color = ripcol;
                maxsize = 120;
                depth = obj_mainchara.depth + 1000;
                direction = (360 / ripcount) * i;
                speed = 2;
            }
        }
        speed = 0;
        snd_stop(snd_hurt1);
        snd_play(snd_hurt1);
        var highesthp = 0;
        for (var i = 0; i < 4; i++)
        {
            if (global.maxhp[i] > highesthp)
                highesthp = global.maxhp[i];
        }
        var target = 0;
        damage = round(highesthp / 2) + 5;
        with (obj_dw_church_waterfallchaser_churchc)
        {
            if (con == 0)
                con = 1;
        }
        global.inv = -10;
        scr_damage_all_overworld();
        with (obj_darkcontroller)
            charcon = 1;
        global.interact = 1;
        with (obj_mainchara)
            alarm[1] = 7;
        timer = 0;
    }
}
if (con == 1)
{
    var resettime = 15;
    timer++;
    if (timer == 1)
    {
        sinertarg = 2;
        scr_lerpvar("x", x, camerax() + 640, resettime, 2, "out");
        scr_lerpvar("y", y, cameray(), resettime, 2, "out");
    }
    if (timer == (1 + resettime))
    {
        sinertarg = 30;
        timer = 0;
        con = -1;
        scr_delay_var("con", 0, 15);
        scr_delay_var("image_alpha", 1, 15);
    }
}
if (con == 2)
{
    timer++;
    sinertarg = 50;
    if (siner == 49)
    {
        x = random_range(startx - 20, startx + 20);
        y = random_range(starty - 20, starty + 20);
    }
    var offscreen = false;
    var cx = camerax();
    if (x < cx || x > (cx + 640))
        offscreen = true;
    var cy = cameray();
    if (y < cy || y > (cy + 480))
        offscreen = true;
    var player_in_light = scr_in_light(1214, 10, 10);
    if (!player_in_light && !offscreen)
    {
        con = 0;
        timer = 0;
    }
}
if (con == 400)
{
    move_towards_point(targx, targy, 2);
    if (scr_checklocation(undefined, targx, targy, 2))
    {
        con = 401;
        speed = 0;
    }
}
if (con == 401)
{
    var sinamt = 40 + (sin(siner / 10) * 20);
    x = lerp(x, targx + (sin(siner / 30) * sinamt), 0.125);
    y = lerp(y, targy + (cos(siner / 30) * sinamt), 0.125);
}
siner++;
if (siner >= sinertarg)
{
    siner = 0;
    var target = 1049;
    var speedd = 2;
    if (i_ex(obj_ch4_DCA04))
    {
        with (obj_actor)
        {
            if (name == "susie")
                target = id;
        }
    }
    if (con == 2)
        speedd = 0;
    var ripple = instance_create(x, y, obj_church_ripple);
    with (ripple)
    {
        ripplecount = 1;
        ripplethicc = 6;
        lifetime = 60;
        alpha = 2;
        dodraw = false;
        color = ripcol;
        maxsize = 120;
        depth = other.depth + 10;
        direction = point_direction(x, y, target.x + 40, target.y + 60);
        speed = speedd;
    }
}
