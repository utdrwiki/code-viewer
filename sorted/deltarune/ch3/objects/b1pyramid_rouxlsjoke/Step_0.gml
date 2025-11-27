if (init == 0 && obj_board_camera.con == 0)
{
    init = 1;
    rouxls = instance_create(x + 128, y + 96, obj_board_solid);
    rouxls.sprite_index = spr_board_rouxls;
    scr_darksize(rouxls);
    with (rouxls)
        scr_board_depth();
    rouxls.visible = true;
    pyramid = instance_create(x + 160, y + 96, obj_board_solid);
    pyramid.sprite_index = spr_board_evensmallerpyramid;
    scr_darksize(pyramid);
    with (pyramid)
        scr_board_depth();
    pyramid.visible = true;
}
scr_board_populatevars();
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (susiereal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susiereal = id;
    }
}
if (ralseireal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralseireal = id;
    }
}
if (krisreal == 0)
{
    with (obj_mainchara)
        other.krisreal = id;
}
if (active == 1)
{
    if (visit == 0)
    {
        visit = 1;
        kris.cantleave = true;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        timer++;
        if (timer == 1)
        {
            kris.cantleave = true;
            var talk = stringsetloc("THE SMALL#PYRAMID!!!", "obj_b1pyramid_rouxlsjoke_slash_Step_0_gml_46_0");
            scr_couchtalk(talk, "susie", 2, 60);
            scr_couchtalk(talk, "ralsei", 2, 60);
        }
        if (timer == 45)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Who left that there!!!", "obj_b1pyramid_rouxlsjoke_slash_Step_0_gml_52_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        var rouxtalk = 110;
        var tetalker = 49;
        var destroyer = 50;
        if (timer == rouxtalk)
        {
            global.interact = 1;
            var rouxlsline = stringsetloc("Just Thoughte It Mighte Be Conveniente If I", "obj_b1pyramid_rouxlsjoke_slash_Step_0_gml_62_0");
            scr_speaker("rouxls");
            msgset(0, rouxlsline);
            bw_make();
        }
        if (timer == (rouxtalk + tetalker))
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Who is that guy? Get him out of here!!", "obj_b1pyramid_rouxlsjoke_slash_Step_0_gml_69_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        if (timer == (rouxtalk + tetalker + destroyer))
        {
            safe_delete(obj_board_writer);
            safe_delete(obj_writer);
            safe_delete(rouxls);
            safe_delete(pyramid);
            snd_play_pitch(snd_board_splat, 1.4);
            global.interact = 0;
            global.flag[1001] = 2;
            kris.cantleave = false;
            endwatch = 1;
        }
    }
}
else
{
}
if (endwatch == 1)
{
    if (obj_board_camera.shift != "none")
    {
        debug_print("blocked");
        endwatch = 2;
        with (obj_board_trigger)
        {
            if (extflag == "rouxlsEnd")
            {
                var blok = instance_create(x, y, obj_board_solid);
                with (blok)
                    scr_sizeexact(other.sprite_width, other.sprite_height);
            }
        }
    }
}
