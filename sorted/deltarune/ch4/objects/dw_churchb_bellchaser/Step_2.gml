var dovanish = function()
{
    var trig = 0;
    with (obj_climbstartertrig)
    {
        if (myinteract >= 1)
            trig = 1;
    }
    if (trig)
    {
        with (scr_afterimage())
        {
            speed = other.remspeed;
            direction = other.remdir;
            friction = 1;
            gravity = -0.5;
        }
        instance_destroy();
    }
};

if (autodepth)
    scr_depth();
var difficulty = 0;
var delaytime = 10;
var secretpiano = instance_exists(obj_dw_church_secretpiano);
if (global.flag[encounterflag] != 0)
    difficulty = 1;
if (difficulty == 0)
    delaytime = 8;
if (secretpiano)
{
    delaytime = 20;
    difficulty = 1;
}
if (con == 0.5)
{
    drawaura = true;
    waitsiner++;
    x = xstart + (sin(waitsiner / 15) * 12);
    y = ystart + (sin(waitsiner / 8) * 4);
    if (scr_trigcheck("enemtrig"))
        con = 1;
}
if (con == 1)
{
    if (makeexcl == true)
    {
        makeexcl = false;
        snd_play(snd_b);
        var doomtime = 20;
        with (scr_marker_ext(x + (sprite_width / 2), y - 20, spr_exc, 2, 2, undefined, undefined, undefined, depth - 1, undefined, doomtime))
        {
            vspeed = -3;
            gravity = 0.7;
            scr_limitval_upper(id, "y", y);
        }
    }
    scr_delay_var("con", 1.1, delaytime);
    con = -1;
}
if (con == 1.1)
{
    var diff = 0;
    if (global.flag[encounterflag] != 0)
        diff = 1;
    var maxspeed = 18;
    var accel = 1/3;
    if (diff == 1)
    {
        maxspeed = 8;
        accel = 0.125;
    }
    if (secretpiano)
    {
        maxspeed = 8;
        accel = 0.0625;
    }
    drawaura = true;
    if (global.interact == 0)
    {
        myspeed = lerp(myspeed, maxspeed, accel);
        var myx = x + (sprite_width / 2);
        var myy = (y + sprite_height) - 10;
        var targx = obj_mainchara.bbox_left + ((obj_mainchara.bbox_right - obj_mainchara.bbox_left) / 2);
        var targy = obj_mainchara.bbox_top + ((obj_mainchara.bbox_bottom - obj_mainchara.bbox_top) / 2);
        var dir = point_direction(myx, myy, targx, targy);
        x += lengthdir_x(myspeed, dir);
        y += lengthdir_y(myspeed, dir);
        var size = 48;
        if (i_ex(collision_circle(myx, myy - size, size, obj_mainchara, false, true)))
        {
            donebattle = true;
            global.interact = 1;
            con = 2;
            scr_lerpvar("auraalph", auraalph, 0, 8, 2, "out");
            depth = 5000;
            targx = scr_even(obj_mainchara.x + 60);
            targy = scr_even(obj_mainchara.y - 38);
            var movetime = 20;
            scr_lerpvar("x", x, targx, movetime, 2, "out");
            scr_lerpvar("y", y, targy, movetime, -1, "out");
            snd_play(snd_tensionhorn);
            snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
            scr_delay_var("con", 3, 36);
            global.facing = 1;
        }
        remspeed = myspeed;
        remdir = dir;
    }
}
if (con == 3)
{
    visible = false;
    var mark = scr_marker_ext(x, y, sprite_index, 2, 2, 0, 0, image_blend, 500, undefined, undefined);
    global.flag[54] = encounterflag;
    scr_battle(encounterno, 0, mark);
    instance_destroy();
}
if (con > 0.5 || con == -1)
    dovanish();
