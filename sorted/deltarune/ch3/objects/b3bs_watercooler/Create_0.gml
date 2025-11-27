timer = 0;
con = 0;
watercooler = scr_dark_marker(1242, 936, spr_watercooler);
with (watercooler)
    scr_depth();
watercon = 0;
watertimer = 0;
watertrig = instance_create(1236, 996, obj_trigger_interact);
with (watertrig)
{
    visible = false;
    image_alpha = 0.2;
    image_xscale = 4;
    image_yscale = 2;
}
wcamx = 0;
wcamy = 0;
camcontrol = false;
treasure = instance_create(1146, 980, obj_treasure_room);
stealthend = 0;
if (global.flag[1138] == 1)
    stealthend = 1;
stealth = instance_create(0, 0, obj_b3bs_stealth);
gouldenson = scr_dark_marker(884, 684, spr_dw_ch3_gouldenson);
with (gouldenson)
    scr_depth();
sonread = instance_create(884, 684, obj_readable_room1);
with (sonread)
{
    extflag = "sam";
    image_yscale = 2;
    image_xscale = 1.5;
}
block = 0;
black = 0;
doorcon = 99;
if (global.flag[1103] == 0)
{
    doorcon = 0;
    block = instance_create(0, 40, obj_solidblocksized);
    with (block)
    {
        image_xscale = 2;
        image_yscale = 6;
    }
    black = scr_dark_marker(0, 40, spr_pxwhite);
    with (black)
    {
        image_blend = c_black;
        image_xscale = 80;
        image_yscale = 240;
        depth = 1000049;
    }
}
zone = "";
for (var i = 0; i < 5; i++)
{
    h1[i] = instance_create(1476, 600, obj_dw__backstagelight);
    with (h1[i])
    {
        wally = 600;
        type = 1;
        movetype = 4;
        range = 140;
        xrange = 170;
        if (obj_mainchara.x > 2100)
            xrange = -170;
        amplitude = 28;
        timer = i * amplitude;
        detecttype = 2;
    }
}
h1[5] = instance_create(1852, 560, obj_dw__backstagelight);
with (h1[5])
{
    wally = 600;
    type = 1;
    movetype = 4;
    xrange = 0;
    range = 140;
    amplitude = 60;
    detecttype = 2;
}
for (var i = 0; i < 4; i++)
{
    h2[i] = instance_create(1436 + (i * 120), 972, obj_dw__backstagelight);
    with (h2[i])
    {
        type = 1;
        movetype = 4;
        range = 120;
        xrange = 0;
        range = 146;
        amplitude = 36;
        detecttype = 2;
        timer = i * 12;
        wally = 1040;
    }
}
for (var i = 1; i < 2; i++)
{
    tl_light[i] = instance_create(296 + (i * 170), 136, obj_dw__backstagelight);
    with (tl_light[i])
    {
        wally = 200;
        type = 1;
        movetype = 4;
        range = 120;
        xrange = 0;
        range = 120;
        amplitude = 15;
        detecttype = 2;
        timer = i * 12;
    }
}
bl_light[1] = instance_create(526, 688, obj_dw__backstagelight);
bl_light[2] = instance_create(406, 688, obj_dw__backstagelight);
for (var i = 1; i < 3; i++)
{
    with (bl_light[i])
    {
        wally = 720;
        type = 1;
        movetype = 4;
        range = 120;
        xrange = 0;
        range = 160;
        amplitude = 20;
        detecttype = 2;
        timer -= (4 + i);
        timerrate = 1.5;
    }
}
for (var i = 0; i < 1; i++)
{
    tr_light[i] = instance_create(1484, 136, obj_dw__backstagelight);
    with (tr_light[i])
    {
        type = 1;
        wally = 200;
        movetype = 4;
        range = 140;
        xrange = 170;
        amplitude = 28;
        timer = (i * xrange) / 2;
        detecttype = 2;
    }
}
with (obj_dw__backstagelight)
    drawlamp = false;
if (stealthend == 1)
{
    with (obj_b3bs_stealtharea)
        instance_destroy();
    with (obj_b3bs_stealthSolid)
        instance_destroy();
    with (obj_dw__backstagelight)
        instance_destroy();
    stealthend = 2;
}
scr_stealth_drawmarkers();
