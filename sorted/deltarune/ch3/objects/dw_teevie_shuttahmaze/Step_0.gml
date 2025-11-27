if (init == 0)
{
    depth = treasure.depth - 1;
    init = 1;
    if (didviolence)
    {
        with (obj_dw_teevie_cameras_cheer)
            instance_destroy();
        with (obj_trigger)
            extflag = "nah";
        safe_delete(treasure);
        safe_delete(treasuresolid);
    }
}
var audtrig = 0;
with (obj_trigger)
{
    if (extflag == "topleftCrowd" || extflag == "botRightCrowd")
    {
        if (place_meeting(x, y, obj_mainchara))
            audtrig = 1;
    }
}
with (obj_dw_teevie_cameras_cheer)
{
    if (extflag == "a" || extflag == "botRightCrowd")
        active = audtrig;
}
if (audtrig)
{
    if (cheer == 0)
    {
        cheervol = 1;
        cheer = snd_loop(snd_crowd_cheer_loop);
        snd_volume(cheer, cheervol, 0);
    }
    else
    {
        cheervol = lerp(cheervol, 1, 0.25);
        snd_volume(cheer, cheervol, 0);
    }
}
else if (cheer != 0)
{
    cheervol = lerp(cheervol, 0, 0.125);
    snd_volume(cheer, cheervol, 0);
}
if (laughcon == 0)
{
    var trig = 0;
    with (obj_mainchara)
    {
        if (x >= 1530 && y <= 400)
            trig = 1;
    }
    if (trig == 1)
    {
        global.flag[1005] = 1;
        laughcon = 1;
    }
}
if (laughcon == 1)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "laughingRightCrowd")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    with (obj_dw_teevie_cameras_cheer)
    {
        if (extflag == "b")
            active = trig;
    }
    if (trig)
    {
        if (boo == 0)
        {
            boovol = 1;
            boo = snd_loop(snd_crowd_ooh);
            snd_volume(boo, boovol, 0);
        }
        else
        {
            boovol = lerp(boovol, 1, 0.25);
            snd_volume(boo, boovol, 0);
        }
    }
    else if (boo != 0)
    {
        boovol = lerp(boovol, 0, 0.125);
        snd_volume(boo, boovol, 0);
    }
}
if (con == 0)
{
    var trig = 0;
    with (obj_triggervolume)
    {
        if (extflag == 2)
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig == 1 && global.flag[encounterflag] != 1)
        con = 1;
}
if (con == 1)
{
    con = 2;
    timer = 0;
    var time = 12;
    var endx = 850;
    var endy = 302;
    zap1 = instance_create(770, 426, obj_enemy_marker);
    with (zap1)
    {
        image_speed = 0;
        image_index = 4;
        image_blend = c_black;
        scr_darksize();
        sprite_index = spr_zapper_jump_noshadow;
        lsprite = spr_zapper_jump_noshadow;
        rsprite = spr_zapper_jump_noshadow_right;
        specialfacings = true;
        snd_play(snd_jump);
        scr_lerp_imageblend(id, c_black, c_white, time, 2, "out");
        scr_jump_to_point(endx, endy, 30, time, 1);
        scr_delay_var("image_index", 5, time);
        scr_delay_var("image_index", 6, time + 1);
        scr_delay_var("image_index", 7, time + 3);
        scr_delay_var("image_index", 8, time + 5);
    }
    endx = 454;
    zap2 = instance_create(546, 584, obj_enemy_marker);
    with (zap2)
    {
        image_speed = 0;
        image_index = 4;
        image_blend = c_black;
        scr_darksize();
        sprite_index = spr_zapper_jump_noshadow;
        lsprite = spr_zapper_jump_noshadow;
        rsprite = spr_zapper_jump_noshadow_right;
        specialfacings = true;
        scr_lerp_imageblend(id, c_black, c_white, time, 2, "in");
        scr_jump_to_point(endx, endy, 30, time, 1);
        scr_delay_var("image_index", 5, time);
        scr_delay_var("image_index", 6, time + 1);
        scr_delay_var("image_index", 7, time + 3);
        scr_delay_var("image_index", 8, time + 5);
    }
    scr_delay_var("maketrig", 1, time + 1);
    scr_delay_var("con", 3, time + 6);
}
if (maketrig == true)
{
    maketrig = false;
    zap1t = instance_create(x, y, obj_board_trigger);
    zap2t = instance_create(x, y, obj_board_trigger);
    if (scr_debug())
    {
    }
}
if (con == 3)
{
    var movespeed = 18;
    var pausetime = 4;
    if (global.interact == 0)
    {
        timer++;
        if (timer == (1 + ((movespeed + pausetime) * 1)))
        {
            movejump(zap1, 3, movespeed);
            movejump(zap2, 0, movespeed);
        }
        if (timer == (1 + ((movespeed + pausetime) * 2)))
        {
            movejump(zap1, 0, movespeed);
            movejump(zap2, 1, movespeed);
        }
        if (timer == (1 + ((movespeed + pausetime) * 3)))
        {
            movejump(zap1, 0, movespeed);
            movejump(zap2, 1, movespeed);
        }
        if (timer == (1 + ((movespeed + pausetime) * 4)))
        {
            movejump(zap1, 3, movespeed);
            movejump(zap2, 0, movespeed);
        }
        if (timer == (1 + ((movespeed + pausetime) * 5)))
        {
            movejump(zap1, 2, movespeed);
            movejump(zap2, 3, movespeed);
        }
        if (timer == (1 + ((movespeed + pausetime) * 6)))
        {
            movejump(zap1, 1, movespeed);
            movejump(zap2, 2, movespeed);
        }
        if (timer == (1 + ((movespeed + pausetime) * 7)))
        {
            movejump(zap1, 1, movespeed);
            movejump(zap2, 2, movespeed);
        }
        if (timer == (1 + ((movespeed + pausetime) * 8)))
        {
            movejump(zap1, 2, movespeed);
            movejump(zap2, 3, movespeed);
            timer = 0;
        }
    }
}
if (con == 4)
{
    timer++;
    if (timer == 1)
    {
        with (obj_lerpvar)
        {
            if (target == other.zap1)
                instance_destroy();
        }
        with (obj_lerpvar)
        {
            if (target == other.zap2)
                instance_destroy();
        }
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 8, 1, 1.1);
    }
    if (timer == 30)
    {
        var sourcezap = zap1;
        if (trigd == 2)
            sourcezap = zap2;
        zapmarker = scr_marker_ext(sourcezap.x, sourcezap.y, sourcezap.lsprite, 2, 2, 0, 0, c_white, 0);
        sourcezap.visible = false;
        global.flag[54] = encounterflag;
        encounterno = 118;
        if (global.flag[656] == 0)
            encounterno = 112;
        scr_battle(encounterno, 0, zapmarker);
    }
    if (timer == 31)
    {
        safe_delete(zap1);
        safe_delete(zap2);
        safe_delete(zap1t);
        safe_delete(zap2t);
    }
}
if (i_ex(treasure))
{
    depth = treasure.depth - 1;
    if (trcon == 0)
    {
        if (treasure.myinteract == 3)
        {
            global.flag[1004] = 1;
            trtimer = 0;
            trcon = 1;
            snd_play(snd_locker);
            treasure.image_index = 1;
        }
    }
    if (trcon == 1)
    {
        trtimer++;
        if (trtimer == 5)
        {
            var snd = 358;
            snd_stop(snd);
            snd_play_x(snd, 1, 1.2);
            scr_lerp_imageblend(id, c_black, c_white, 10);
            scr_lerpvar("tralpha", 0, 1, 4);
            scr_lerpvar("trscale", 0, 1, 18, -1, "out");
        }
        if (trtimer == 48)
        {
            trcon = 2;
            trtimer = 0;
        }
    }
    if (trcon == 2)
    {
        audtrig = 0;
        with (obj_trigger)
        {
            if (extflag == "treasureBottomLeft")
            {
                if (place_meeting(x, y, obj_mainchara))
                    audtrig = 1;
            }
        }
        with (obj_dw_teevie_cameras_cheer)
        {
            if (extflag == "c")
                active = audtrig;
        }
        if (audtrig)
        {
            if (cheer2 == 0)
            {
                cheer2vol = 1;
                cheer2 = snd_loop(snd_crowd_cheer_loop);
                snd_volume(cheer2, cheer2vol, 0);
            }
            else
            {
                cheer2vol = lerp(cheer2vol, 1, 0.25);
                snd_volume(cheer2, cheer2vol, 0);
            }
        }
        else if (cheer2 != 0)
        {
            cheer2vol = lerp(cheer2vol, 0, 0.125);
            snd_volume(cheer2, cheer2vol, 0);
        }
    }
}
