if (con == 0)
{
    if (stealth.alert == 2)
    {
        global.interact = 1;
        con = 1;
        timer = 0;
        debug_print("caught time");
    }
}
if (con == 1)
{
    headct[0] = 0;
    var headrange = 50;
    with (obj_dw_ch3_b3bs_zapperhead)
    {
        if (x > (camerax() + headrange) && x < ((camerax() + 640) - headrange))
            array_push(other.headct, id);
    }
    array_delete(headct, 0, 1);
    show_debug_message(string(headct));
    head = headct[irandom_range(0, array_length(headct) - 1)];
    zapper = scr_dark_marker(head.x + 64, head.y - 36, spr_zapper_jump_noshadow);
    with (zapper)
        scr_lerpvar("image_index", 0, 4, 7);
    zapper.vspeed = -36;
    zapper.gravity = 2;
    zapper.image_xscale = -2;
    zapper.image_blend = c_black;
    scr_lerp_imageblend(zapper, c_black, c_white, 8, 2, "out");
    snd_play(snd_jump);
    var desxloc = obj_mainchara.x - 48;
    if (head.x > (obj_mainchara.x + 17))
    {
        desxloc = obj_mainchara.x + 90;
        zapper.image_xscale = 2;
        zapper.x -= 92;
    }
    with (zapper)
        scr_lerpvar("x", x, desxloc, 30, 2, "out");
    safe_delete(head);
    con = 2;
}
var groundpos = scr_even(obj_mainchara.y - 60);
if (con == 2)
{
    if (zapper.y < groundpos)
        con = 3;
}
if (con == 3)
{
    if (zapper.y >= groundpos)
    {
        zapper.y = groundpos;
        zapper.image_index = 7;
        with (zapper)
            scr_delay_var("image_index", 8, 4);
        zapper.gravity = 0;
        zapper.vspeed = 0;
        zapper.depth = obj_mainchara.depth;
        snd_play(snd_wing);
        con = 4;
    }
}
if (con == 4)
{
    if (endreached == false)
    {
        if (global.flag[1243] == 0)
            global.flag[1243] = 1;
        scr_speaker("zapper");
        msgsetloc(0, "* Hey^1! Youse ain't supposed to be back here!/%", "obj_b3bs_zapper_b_slash_Step_0_gml_98_0");
        d_make();
        con = 12;
    }
}
if (con == 12 && !d_ex())
{
    change = instance_create(x, y, obj_tvturnoff_manager);
    change.kind = 1;
    change.roomtarg = room;
    global.entrance = 6;
    con++;
}
if (global.interact == 0)
{
    var icount = 0;
    lighttimer++;
    type = 0;
    if (type == 0)
    {
        if ((lighttimer % rate) == 0)
        {
            for (var i = 0; i < count; i++)
            {
                if (lightconfig == 0)
                {
                    light1 = instance_create(xloc + (xspace * i), -130 - (70 * i), obj_dw__backstagelight);
                    light1.type = 1;
                    light1.vspeed = lightspeed;
                    light1.wally = 280;
                    light1.drawlamp = false;
                    light2 = instance_create(xloc + secondXloc + (xspace * i), -130 - (70 * i), obj_dw__backstagelight);
                    light2.type = 1;
                    light2.vspeed = lightspeed;
                    light2.wally = 280;
                    light2.drawlamp = false;
                }
                if (lightconfig == 1)
                {
                    light1 = instance_create(xloc + (xspace * i), -130 - (70 * i), obj_dw__backstagelight);
                    light1.type = 1;
                    light1.vspeed = lightspeed;
                    light1.wally = 280;
                    light1.drawlamp = false;
                    light2 = instance_create(xloc + secondXloc + (xspace * i), -130 - (70 * i), obj_dw__backstagelight);
                    light2.type = 1;
                    light2.vspeed = lightspeed;
                    light2.wally = 280;
                    light2.drawlamp = false;
                }
                if (lightconfig == 2)
                {
                    light1 = instance_create((xloc + (xspace * (count - 1))) - (xspace * i), -130 - (70 * i), obj_dw__backstagelight);
                    light1.type = 1;
                    light1.vspeed = lightspeed;
                    light1.wally = 280;
                    light1.drawlamp = false;
                    light2 = instance_create((xloc + secondXloc + (xspace * (count - 1))) - (xspace * i), -130 - (70 * i), obj_dw__backstagelight);
                    light2.type = 1;
                    light2.vspeed = lightspeed;
                    light2.wally = 280;
                    light2.drawlamp = false;
                }
                icount++;
            }
        }
    }
}
with (obj_dw__backstagelight)
{
    if (global.interact == 0)
        vspeed = other.lightspeed;
    else
        vspeed = 0;
}
if (watercon == 0)
{
    var trig = 0;
    with (obj_trigger_interact)
    {
        if (extflag == "watercooler")
        {
            if (place_meeting(x, y, obj_mainchara) || myinteract == 3)
            {
                other.des = id;
                trig = true;
            }
        }
    }
    if (trig)
        watercon = 1;
}
if (watercon == 1)
{
    watertimer++;
    if (watertimer == 1)
    {
        snd_play_x(snd_b, 1, 0.8);
        with (des)
        {
            excl = instance_create(x + (sprite_width / 2), y - 20, obj_excblcon);
            scr_doom(excl, 20);
        }
        global.interact = 1;
    }
    if (watertimer == 35)
    {
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 8, 1, 1.1);
    }
    if (watertimer == 65)
    {
        des.depth = -1;
        global.flag[54] = encounterflag;
        scr_battle(139, 0, des);
        global.flag[1143] = 50;
        watercon = 2;
        watertimer = 0;
        watermarker = 0;
        watercon = 999;
    }
}
if (watercon == 999)
{
    if (i_ex(obj_battleback))
    {
        watercon = -1;
        scr_delay_var("watercon", 1000, 30);
    }
}
if (watercon == 1000)
{
    with (obj_trigger_interact)
    {
        if (extflag == "watercooler")
            instance_destroy();
    }
    watercon++;
}
if (tempsave == 0)
{
    with (obj_doorAny)
    {
        if (doorRoom == room_dw_teevie_watercooler)
        {
            if (touched)
            {
                other.tempsave = 1;
                scr_tempsave();
                debug_print("Temp save!!");
            }
        }
    }
}
