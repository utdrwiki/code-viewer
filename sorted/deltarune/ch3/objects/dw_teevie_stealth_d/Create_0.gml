if (scr_debug())
    scr_setparty(1, 1, 0);
timer = 0;
con = 0;
if (global.flag[1230] == 1)
    global.flag[1230] = 2;
for (var i = 0; i < 4; i++)
    instance_create(760 + (i * 1000), 0, obj_dw_teevie_tv_screens);
with (instance_create(4760, 0, obj_dw_teevie_tv_screens))
{
    height = 4;
    depth = 96920;
}
instance_create(x, y, obj_dw_teevie_bg);
scr_stealth_drawmarkers();
nobacksies = 0;
stopfirstlight = 0;
var makelights = true;
if (global.flag[1230])
    makelights = 0;
if (!makelights)
{
    caught = -9999;
    nobacksies = 99;
}
if (scr_ch3_violencecheck() >= 5)
{
    caught = 0;
    makelights = true;
    with (obj_trigger)
        instance_destroy();
}
if (makelights)
{
    var xx = 480;
    var yy = 160;
    var light = instance_create(xx, yy, obj_dw__backstagelight);
    xx = 1120;
    yy = 160;
    light[0] = instance_create(xx + 0, 160, obj_dw__backstagelight);
    light[1] = instance_create(xx + 200, 160, obj_dw__backstagelight);
    light[2] = instance_create(xx + 400, 160, obj_dw__backstagelight);
    light[0] = instance_create(xx + 1000, 160, obj_dw__backstagelight);
    light[1] = instance_create(xx + 1200, 160, obj_dw__backstagelight);
    light[2] = instance_create(xx + 1400, 160, obj_dw__backstagelight);
    light[0] = instance_create(xx + 2000, 160, obj_dw__backstagelight);
    light[1] = instance_create(xx + 2200, 160, obj_dw__backstagelight);
    light[2] = instance_create(xx + 2400, 160, obj_dw__backstagelight);
    light[0] = instance_create(xx + 3000, 160, obj_dw__backstagelight);
    light[1] = instance_create(xx + 3200, 160, obj_dw__backstagelight);
    light[2] = instance_create(xx + 3400, 160, obj_dw__backstagelight);
    light[2].extflag = "replacementlight";
    if (scr_ch3_violencecheck() >= 5)
    {
        light[0] = instance_create(xx + 4000, 160, obj_dw__backstagelight);
        light[1] = instance_create(xx + 4200, 160, obj_dw__backstagelight);
        light[2] = instance_create(xx + 4400, 160, obj_dw__backstagelight);
    }
    with (obj_dw__backstagelight)
    {
        timer = -round(x / 30);
        type = 1;
        drawlamp = false;
        image_blend = #FFCB3E;
        movetype = 1;
        mt1off -= 32;
        movespeed = 120;
        rate = 21.33;
        wally = 320;
    }
    splight = instance_create(5240, yy, obj_dw__backstagelight);
    with (splight)
    {
        timer = -round(x / 30);
        type = 1;
        drawlamp = false;
        image_blend = #FFCB3E;
        movetype = 1;
        mt1off -= 32;
        wally = 320;
        special = 1;
        rate = 2;
        movespeed = 0;
    }
    if (scr_ch3_violencecheck() >= 5)
    {
        safe_delete(splight);
        splight = 0;
    }
    if (scr_debug())
    {
        with (obj_dw__backstagelight)
        {
        }
    }
}
sontrig = 0;
var makeson = global.flag[1229];
if (global.flag[1230] == 2)
    makeson = false;
son = 0;
if (makeson)
{
    son = scr_marker_ext(106, 202, spr_dw_ch3_gouldenson, 2, 2, undefined, undefined, undefined, undefined, 1);
    block = instance_create(134, 244, obj_solidblocksized);
    with (block)
    {
        sprite_index = spr_pxwhite;
        scr_size(52, 4);
    }
    sontrig = instance_create(106, 218, obj_trigger_interact);
    with (sontrig)
    {
        strict = true;
        face3allowed = false;
        scr_delay_var("face3allowed", true, 30);
        scr_size(1.5, 1.75);
    }
}
zapper = 0;
caught = 0;
caughttimer = 0;
visible = true;
if (obj_mainchara.x == 142 && obj_mainchara.y == 166)
{
    global.facing = 0;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            x -= 16;
        if (name == "ralsei")
            x += 14;
        scr_caterpillar_interpolate();
        facing[target] = 0;
    }
}
make = "none";
noleft = 0;
leavecount = 0;
success = 0;
suctimer = 0;
if (global.flag[1230] == 2)
{
    with (instance_create(210, 190, obj_teevie_spring))
        name = "left";
    with (instance_create(6060, 230, obj_teevie_spring))
        name = "right";
}
