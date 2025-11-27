with (cheese)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (This cheese seems slightly out of place.)/", "obj_dw_teevie_lightmaze_slash_Step_0_gml_11_0");
        scr_anyface_next("susie", 17);
        msgnextloc("* Aw hell yeah^1, free cheese./%", "obj_dw_teevie_lightmaze_slash_Step_0_gml_13_0");
        d_make();
        myinteract = 4;
    }
    if (myinteract == 4 && scr_getmsgno_d(2) && other.cheesejump == 0)
    {
        other.cheesejump = 1;
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                for (i = 0; i < 25; i += 1)
                    facing[i] = 0;
                scr_jump_in_place(12, 8);
            }
        }
    }
    if (myinteract == 4 && !d_ex())
    {
        myinteract = -1;
        snd_play(snd_item);
        image_index = 1;
        scr_delay_var("myinteract", 5, 30);
    }
    if (myinteract == 5)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The cheese has been consumed)/", "obj_dw_teevie_lightmaze_slash_Step_0_gml_43_0");
        msgnextloc("* (The lights didn't like that)/%", "obj_dw_teevie_lightmaze_slash_Step_0_gml_44_0");
        d_make();
        myinteract = 6;
    }
    if (myinteract == 6 && !d_ex())
    {
        global.interact = 0;
        scr_marker_ext(x, y, sprite_index, 2, 2, 0, 1, undefined, depth);
        setxy(room_width * 2, room_height * 2);
        myinteract = 7;
    }
}
if (con == 0)
{
    with (obj_board_trigger)
    {
        if (place_meeting(x, y, obj_mainchara))
        {
            other.finishline.visible = true;
            instance_destroy();
        }
    }
    if (treasuretrig == 1)
    {
        if (obj_treasure_room.image_index == 1)
        {
            con = 1;
            timer = 0;
        }
    }
    if (cheese.myinteract == 7 && !d_ex())
    {
        timer = 29;
        con = 2;
    }
    var amcaught = false;
    with (obj_dw_teevie_stealth_chaselamp)
    {
        if (caught)
            amcaught = true;
    }
    if (amcaught)
    {
        snd_stop(snd_crowd_cheer_single);
        timer = 0;
        con = 4;
    }
}
if (con == 1 && !d_ex())
{
    con = 2;
    timer = 0;
}
if (con == 2)
{
    timer++;
    if (timer == 1)
    {
        with (obj_dw_teevie_cameras_cheer)
            active = true;
        with (obj_dw_teevie_cameras_crowd)
            active = true;
        snd_play(snd_crowd_cheer_single);
    }
    if (timer == 30)
    {
        triggeralarm = 1;
        con = 3;
        timer = 0;
    }
}
if (con == 3)
{
    var amcaught = false;
    with (obj_dw_teevie_stealth_chaselamp)
    {
        if (caught)
            amcaught = true;
    }
    if (amcaught)
    {
        snd_stop(snd_crowd_cheer_single);
        snd_play(snd_b);
        con++;
    }
}
if (con == 4)
{
    var side = 0;
    var xloc = obj_mainchara.x + 46;
    var sizex = 2;
    if (global.facing == 3)
        side = 1;
    if (obj_mainchara.x < (camerax() + 210))
        side = 0;
    if (obj_mainchara.x > (camerax() + 488))
        side = 1;
    if (side == 1)
    {
        xloc = obj_mainchara.x - 8;
        sizex = -2;
    }
    var yloc = obj_mainchara.bbox_bottom - 137;
    timer++;
    if (timer == 15)
    {
        zapper = scr_marker_ext(xloc, cameray() - 120, spr_zapper_jump_noshadow, sizex, 2, 0, 5, undefined, obj_mainchara.depth);
        zapper.gravity = 3;
        scr_limitval_upper(zapper, "y", yloc, 30);
    }
    if (timer >= 15 && zapper.y >= yloc)
    {
        zapper.gravity = 0;
        zapper.vspeed = 0;
        zapper.speed = 0;
        with (zapper)
            scr_lerpvar("image_index", 5, 8, 6, 3, "out");
        snd_play_delay(snd_noise, 2, 0.8, 0.9);
        con = 5;
        timer = 0;
    }
}
if (con == 5)
{
    timer++;
    if (timer == 3)
    {
        scr_speaker("zapper");
        msgsetloc(0, "* Time for youse to skee-daddle!/%", "obj_dw_teevie_lightmaze_slash_Step_0_gml_173_0");
        d_make();
        timer = 0;
        con = 6;
    }
}
if (con == 6 && !d_ex())
{
    if (global.flag[1149] == 0)
    {
        con = 7;
    }
    else
    {
    }
}
if (con == 7)
{
    zapper.sprite_index = spr_zapper_jump;
    if (zapper.image_xscale == -2)
    {
        zapper.image_xscale = 2;
        zapper.x -= 134;
    }
    zapper.image_index = 0;
    zapper.depth = -999;
    scr_battle(112, 0, zapper);
    con = 8;
}
if (con == 8 && i_ex(obj_battleback))
{
    timer = 0;
    con = 9;
}
if (con == 9)
{
    timer++;
    if (timer == 15)
    {
        global.flag[1164] = 1;
        with (obj_dw_teevie_stealth_chaselamp)
            instance_destroy();
        with (obj_dw_teevie_cameras_cheer)
            instance_destroy();
        with (obj_dw_teevie_cameras_crowd)
            instance_destroy();
        finishline.visible = false;
        safe_delete(cheese);
        con = 10;
    }
}
if (endcon == 0)
{
    var trig = false;
    with (obj_triggervolume)
    {
        if (place_meeting(x, y, obj_mainchara))
            trig = true;
    }
    if (trig == true)
    {
        endcon = 1;
        endcontimer = 0;
    }
}
if (endcon == 1)
{
    endcontimer++;
    if (endcontimer == 1)
    {
        with (obj_dw_teevie_cameras_cheer)
            active = true;
        with (obj_dw_teevie_cameras_crowd)
            active = true;
        if (i_ex(obj_dw_teevie_cameras_crowd))
            snd_play(snd_crowd_cheer_single);
    }
    if (endcontimer == 4)
        triggeralarm = 1;
}
if (triggeralarm == 1)
{
    triggeralarm = 2;
    with (obj_dw_teevie_stealth_chaselamp)
        scr_delay_var("manualtrigger", true, 1 + irandom(7));
}
