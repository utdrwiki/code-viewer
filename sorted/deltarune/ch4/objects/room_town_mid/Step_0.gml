if (global.chapter == 4)
{
    if (warrior_construct)
    {
        if (i_ex(warrior_marker))
        {
            if (warrior_marker.image_index == 4)
            {
                audio_play_sound_on(emitter, snd_impact, false, 0);
                with (tarp_marker)
                    scr_shakeobj();
            }
            audio_listener_position(warrior_marker.x + (warrior_marker.x - obj_mainchara.x), obj_mainchara.y, 0);
        }
    }
    if (global.plot < 95)
    {
        if (obj_mainchara.x >= 1790)
        {
            susie_hang_timer++;
            if (susie_hang_timer == 1)
            {
                with (obj_caterpillarchara)
                {
                    fun = 1;
                    sprite_index = spr_susie_surprised_right_lw;
                    if (follow == 1)
                        follow = 0;
                }
            }
            if (susie_hang_timer == 8)
            {
                with (obj_caterpillarchara)
                {
                    sprite_index = spr_susie_shifty;
                    image_speed = 0.15;
                }
            }
        }
        else
        {
            susie_hang_timer = 0;
            with (obj_caterpillarchara)
            {
                if (follow == 0)
                {
                    fun = 0;
                    follow = 1;
                    scr_caterpillar_interpolate();
                }
            }
        }
    }
    if (con == 0 && global.interact == 0)
    {
        con = 1;
        alarm[0] = 30;
        global.interact = 1;
        with (obj_caterpillarchara)
            facing[target] = 2;
        scr_speaker("no_name");
        msgsetloc(0, "* (Knock knock knock...)/", "obj_room_town_mid_slash_Step_0_gml_76_0");
        msgnextloc("* Hey^1! Human^1! Doesn't monsters scare you? Like if that girl bited you!/", "obj_room_town_mid_slash_Step_0_gml_77_0");
        scr_anyface_next("susie", "9");
        msgnextloc("\\E9* Nah^1, Kris's got nothing to worry about./", "obj_room_town_mid_slash_Step_0_gml_79_0");
        msgnextloc("\\EY* I only like to eat little rabbits./%", "obj_room_town_mid_slash_Step_0_gml_80_0");
        d_make();
    }
    if (con == 2 && !d_ex())
    {
        con = 3;
        alarm[0] = 30;
        snd_play(snd_escaped);
        var window_marker = scr_marker(1514, 6, spr_town_mid_child_leave);
        with (window_marker)
        {
            scr_depth();
            scr_animate(0, 3, 0.4);
        }
        scr_speaker("no_name");
        msgsetloc(0, "* MOOOOOOOOOOOOOOOOOM!!!!!!!!!/%", "obj_room_town_mid_slash_Step_0_gml_99_0");
        d_make();
    }
    if (con == 4 && !d_ex())
    {
        con = 99;
        global.interact = 0;
    }
    if (global.flag[20] == 1)
    {
        if (sans_face == -4)
        {
            sans_face = scr_marker_animated(camerax() + 80, cameray() + 170, spr_conbini_sign_sans_white, 0.05);
            sans_face.depth = -100;
        }
        else if (!d_ex())
        {
            global.flag[20] = 0;
            with (sans_face)
                instance_destroy();
            sans_face = -4;
        }
    }
}
