var trigd = false;
with (obj_dw_teevie_cameras)
{
    if (glitz_active)
        trigd = 1;
}
with (obj_dw_teevie_cameras_cheer)
{
    if (active)
        trigd = 1;
}
if (room == room_dw_teevie_lightmaze)
{
    trigd = 0;
    if (manualtrigger)
        trigd = 1;
}
if (init == 0)
{
    xstart = x;
    ystart = y;
    init = 1;
}
var lightcolactive = 65535;
var lightcolinactive = 9801727;
var homedist = point_distance(x, y, xstart, ystart);
var cancatch = false;
if (global.interact == 0)
    siner++;
if (con == 0)
{
    image_blend = lightcolactive;
    var tolerance = -80;
    if (!((x > (camerax() + tolerance) && x < ((camerax() + 640) - tolerance)) && (y > (cameray() + tolerance) && y < ((cameray() + 480) - tolerance))))
        trigd = 0;
    if (homedist > 40)
        trigd = 0;
    if (trigd == 1)
    {
        awaretime++;
        if (awaretime >= 2)
        {
            timer = 0;
            alert = 60;
            con = 1;
            awaretime = 0;
        }
    }
    else
    {
        awaretime = 0;
    }
    gohome--;
    if (gohome <= 0)
    {
        x = lerp(x, xstart, 0.1);
        y = lerp(y, ystart, 0.1);
    }
    if (point_distance(x, y, xstart, ystart) < 8)
        cancatch = true;
}
if (con == 1)
{
    if (!trigd || homedist > 600)
    {
        alert--;
    }
    else
    {
        cancatch = true;
        friction = 0;
        alert = 1;
        if (i_ex(obj_mainchara))
        {
            var memx = x;
            var memy = y;
            var memspeed = myspeed;
            var dist = point_distance(x, y, obj_mainchara.x + 18, obj_mainchara.y + 72);
            move_towards_point(obj_mainchara.x + 18, obj_mainchara.y + 72, min(speed, dist));
            var speedacctype = 0;
            if (room == room_dw_teevie_lightmaze)
                speedacctype = 1;
            if (speedacctype == 0)
                myspeed = lerp(myspeed, 12, 0.25);
            if (speedacctype == 1)
                myspeed = lerp(myspeed, 16, 0.04);
            if (global.interact == 0)
            {
                speed = myspeed;
            }
            else
            {
                x = memx;
                y = memy;
                myspeed = memspeed;
                speed = 0;
            }
            if (speed > dist)
                speed = dist;
        }
    }
    if (alert <= 0)
    {
        speed = 0;
        alert = 0;
        timer = 0;
        con = 0;
        gohome = 1;
    }
}
if (cancatch)
{
    if (global.interact == 0)
    {
        if (i_ex(collision_rectangle(x - 15, y - 10, x + 15, y + 10, obj_mainchara, 0, 0)))
        {
            global.interact = 1;
            con = 2;
            speed = 0;
            myspeed = 0;
            timer = 0;
            debug_print("caught");
        }
    }
}
if (con == 2)
{
    image_blend = lightcolactive;
    timer++;
    if (timer == 1)
    {
        snd_play(snd_bluh);
        scr_lerpvar("x", x, obj_mainchara.x + 18, 6, 2, "out");
        scr_lerpvar("y", y, obj_mainchara.y + 72, 6, 2, "out");
    }
    if (timer == 6)
        caught = true;
}
