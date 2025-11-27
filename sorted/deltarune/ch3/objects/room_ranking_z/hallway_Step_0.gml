if (con < 0)
    exit;
if (con == 0 && !d_ex() && global.interact == 0)
{
    con = 1;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    if (scr_flag_get(1031) == 0)
    {
        scr_flag_set(1031, 1);
        c_sel(kr);
        c_walkdirect(339, 145, 10);
        c_delayfacing(11, "d");
        var su_max_speed = 10;
        var ra_max_speed = 10;
        with (su_actor)
        {
            var su_distance = distance_to_point(345, 240);
            su_max_speed = clamp(su_distance / 8, 10, 30);
        }
        with (ra_actor)
        {
            var ra_distance = distance_to_point(308, 268);
            ra_max_speed = clamp(ra_distance / 8, 10, 30);
        }
        c_sel(su);
        c_walkdirect(345, 220, su_max_speed);
        c_sel(ra);
        c_walkdirect_wait(308, 268, ra_max_speed);
        c_facing("u");
        c_sel(su);
        c_facing("u");
        c_msgside("top");
        c_speaker("susie");
        c_msgsetloc(0, "\\EK* Uhh^1, that's like a bathroom^1, right?/", "obj_room_ranking_z_hallway_slash_Step_0_gml_49_0");
        c_facenext("ralsei", 26);
        c_msgnextloc("\\EQ* We'll just^1, um^1, go play games./%", "obj_room_ranking_z_hallway_slash_Step_0_gml_51_0");
        c_talk_wait();
        c_wait(15);
        c_sel(kr);
        c_facing("u");
        c_walkdirect(339, 135, 30);
    }
    else
    {
        c_sel(kr);
        c_walkdirect(339, 145, 10);
        if (i_ex(obj_caterpillarchara))
        {
            var su_max_speed = 10;
            var ra_max_speed = 10;
            with (su_actor)
            {
                var su_distance = distance_to_point(345, 220);
                su_max_speed = clamp(su_distance / 8, 10, 30);
            }
            with (ra_actor)
            {
                var ra_distance = distance_to_point(308, 268);
                ra_max_speed = clamp(ra_distance / 8, 10, 30);
            }
            c_sel(su);
            c_walkdirect(345, 220, su_max_speed);
            c_sel(ra);
            c_walkdirect_wait(308, 268, ra_max_speed);
            c_facing("u");
            c_sel(su);
            c_facing("u");
            c_wait(5);
        }
        c_sel(kr);
        c_facing("u");
        c_walkdirect(339, 135, 30);
    }
    c_waitcustom();
}
if (con == 1 && customcon == 1)
{
    con = 2;
    alarm[0] = 30;
    var fadeout = instance_create(0, 0, obj_fadeout);
    fadeout.fadespeed = 0.06;
    with (door_marker)
        image_index = 1;
    snd_play(snd_dooropen);
}
if (con == 3 && customcon == 1)
{
    instance_create(0, 0, obj_persistentfadein);
    snd_play(snd_doorclose);
    con = -1;
    customcon = 0;
    global.interact = 3;
    global.entrance = 1;
    scr_losechar();
    room_goto(room_dw_ranking_z);
}
