if (scr_debug())
    scr_setparty(1, 1, 0);
beatcon = 0;
var fadewait = 0;
if (global.tempflag[92] == 1)
{
    instance_create(x, y, obj_fadein);
    global.tempflag[92] = 0;
    global.facing = 2;
    global.flag[1143] = 0;
    fadewait = 1;
    with (obj_mainchara)
        setxy(1360, 220);
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            setxy(1392, 228);
        if (name == "susie")
            setxy(1314, 224);
        scr_caterpillar_interpolate();
        for (var i = 0; i < 25; i += 1)
            facing[i] = 2;
    }
}
with (instance_create(x, y, obj_musicer_gen))
{
    song = "tv_world.ogg";
    if (fadewait == 1)
        fadein = 60;
}
timer = 0;
con = 0;
zapper1 = 0;
zapper2 = 0;
stealth = instance_create(x, y, obj_b3bs_stealth);
lighttimer = 0;
head = 0;
lightspeed = 6;
rate = 40;
type = 0;
xloc = 420;
secondXloc = 1260;
xspace = 180;
count = 4;
lightconfig = 0;
if (obj_mainchara.x > 1110)
    lightconfig = 1;
if (obj_mainchara.x > 1880)
    lightconfig = 2;
for (var i = 0; i < count; i++)
{
    for (var ii = 0; ii < count; ii++)
    {
        if (lightconfig == 0)
        {
            light = instance_create(xloc + (xspace * i), (-130 - (70 * i)) + (lightspeed * rate * ii), obj_dw__backstagelight);
            light.type = 1;
            light.vspeed = lightspeed;
            light.wally = 280;
            light.drawlamp = false;
            light2 = instance_create(xloc + secondXloc + (xspace * i), (-130 - (70 * i)) + (lightspeed * rate * ii), obj_dw__backstagelight);
            light2.type = 1;
            light2.vspeed = lightspeed;
            light2.wally = 280;
            light2.drawlamp = false;
        }
        if (lightconfig == 1)
        {
            light1 = instance_create((xloc + (xspace * (count - 1))) - (xspace * i), (-130 - (70 * i)) + (lightspeed * rate * ii), obj_dw__backstagelight);
            light1.type = 1;
            light1.vspeed = lightspeed;
            light1.wally = 280;
            light1.drawlamp = false;
            light2 = instance_create(xloc + secondXloc + (xspace * i), (-130 - (70 * i)) + (lightspeed * rate * ii), obj_dw__backstagelight);
            light2.type = 1;
            light2.vspeed = lightspeed;
            light2.wally = 280;
            light2.drawlamp = false;
        }
        if (lightconfig == 2)
        {
            light1 = instance_create((xloc + (xspace * (count - 1))) - (xspace * i), (-130 - (70 * i)) + (lightspeed * rate * ii), obj_dw__backstagelight);
            light1.type = 1;
            light1.vspeed = lightspeed;
            light1.wally = 280;
            light1.drawlamp = false;
            light2 = instance_create((xloc + secondXloc + (xspace * (count - 1))) - (xspace * i), (-130 - (70 * i)) + (lightspeed * rate * ii), obj_dw__backstagelight);
            light2.type = 1;
            light2.vspeed = lightspeed;
            light2.wally = 280;
            light2.drawlamp = false;
        }
    }
}
endreached = false;
scr_stealth_drawmarkers();
var xoff1 = 160;
encounterflag = 592;
watercooler = 0;
if (global.flag[1143] < 50 && global.flag[1143] > 0)
{
    if (global.flag[1143] > 0)
    {
        watercooler = instance_create(1042 + xoff1, 224, obj_trigger_interact);
        watercooler.sprite_index = spr_watercooler;
        watercooler.visible = true;
        watercooler.extflag = "watercooler";
        scr_darksize(watercooler);
        scr_depth(watercooler);
        watercooler2 = instance_create(1360 + xoff1, 224, obj_trigger_interact);
        watercooler2.sprite_index = spr_watercooler;
        watercooler2.visible = true;
        watercooler2.extflag = "watercooler";
        scr_darksize(watercooler2);
        scr_depth(watercooler2);
    }
    if (global.flag[1143] == 2)
    {
        with (watercooler)
            setxy(1054 + xoff1, 224);
        with (watercooler2)
            setxy(1348 + xoff1, 224);
    }
    if (global.flag[1143] == 3)
    {
        with (watercooler)
            setxy(1070 + xoff1, 224);
        with (watercooler2)
            setxy(1332 + xoff1, 224);
    }
    if (global.flag[1143] == 4)
    {
        with (watercooler)
            setxy(1088 + xoff1, 224);
        with (watercooler2)
            setxy(1314 + xoff1, 224);
    }
    if (global.flag[1143] == 5)
    {
        with (watercooler)
            setxy(1134 + xoff1, 202);
        with (watercooler2)
            setxy(1268 + xoff1, 202);
        watercooler3 = instance_create(1168 + xoff1, 232, obj_trigger_interact);
        watercooler3.sprite_index = spr_watercooler;
        watercooler3.visible = true;
        watercooler3.extflag = "watercooler";
        scr_darksize(watercooler3);
        scr_depth(watercooler3);
        watercooler3 = instance_create(1234 + xoff1, 232, obj_trigger_interact);
        watercooler3.sprite_index = spr_watercooler;
        watercooler3.visible = true;
        watercooler3.extflag = "watercooler";
        scr_darksize(watercooler3);
        scr_depth(watercooler3);
    }
}
watercon = 0;
watertimer = 0;
watertrig = 0;
des = 0;
tempsave = 0;
if (global.flag[1143] != 0)
    tempsave = -1;
