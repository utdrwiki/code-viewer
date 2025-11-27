if (global.chapter == 2)
{
    if (con == 0)
    {
        if (obj_mainchara.y < 1220)
        {
            con = 1;
            global.interact = 1;
        }
    }
    if (con == 1)
    {
        con = 2;
        scr_speaker("ralsei");
        msgsetloc(0, "\\E2* (Kris... I bet you have a lot of people to talk to.)/", "obj_ch2_room_castle_transformed_slash_Step_0_gml_17_0");
        msgnextloc("\\E2* (But, you don't have to do \\cYeverything at once\\c0.)/", "obj_ch2_room_castle_transformed_slash_Step_0_gml_18_0");
        msgnextloc("\\E2* (\\cYSAVE\\c0 and take a break anytime you want, OK?)/%", "obj_ch2_room_castle_transformed_slash_Step_0_gml_19_0");
        var d = d_make();
        d.side = 1;
    }
    if (con == 2 && !d_ex())
    {
        con = 99;
        global.interact = 0;
        global.flag[443] = 1;
    }
}
if (global.chapter == 4)
{
    if (con == 10 && !d_ex() && global.interact == 0 && obj_mainchara.x >= 960 && obj_mainchara.y >= 1220 && scr_flag_get(706) == 1)
    {
        con = 11;
        scr_flag_set(793, 1);
        var sus_x = 0;
        var sus_y = 0;
        var sus_sprite = -4;
        var sus_depth = 0;
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                sus_x = x;
                sus_y = y;
                sus_sprite = sprite_index;
                sus_depth = depth;
                visible = 0;
            }
        }
        susie_marker = scr_dark_marker(sus_x, sus_y, sus_sprite);
        susie_marker.depth = sus_depth;
    }
    if (con == 11)
    {
        if (susie_marker.x != 1020 || susie_marker.y != 1209)
        {
            with (susie_marker)
                scr_depth();
            susie_marker.sprite_index = spr_susie_walk_right_dw;
            susie_marker.image_speed = 0.2;
            susie_marker.x = scr_movetowards(susie_marker.x, 1020, 6);
            susie_marker.y = scr_movetowards(susie_marker.y, 1209, 6);
        }
        else
        {
            with (lancer_marker)
                sprite_index = spr_lancer_dt;
            susie_marker.image_speed = 0;
            susie_marker.image_index = 0;
            con = 12;
            alarm[0] = 30;
        }
    }
    if (con == 13)
    {
        lancer_jump_timer++;
        var offset = 1;
        if (lancer_jump_timer == 1)
        {
            susie_marker.sprite_index = spr_susie_catch;
            susie_marker.x -= 4;
            susie_marker.y += 2;
            with (lancer_marker)
            {
                sprite_index = spr_lancer_jump_ready;
                image_speed = 0.5;
            }
        }
        if (lancer_jump_timer == (1 + offset))
        {
            snd_play(snd_jump);
            with (lancer_marker)
            {
                sprite_index = spr_lancer_ball;
                image_speed = 0.5;
                x += 10;
                vspeed = -20;
                gravity = 2;
                hspeed = -4.7;
                friction = 0.25;
            }
        }
        if (lancer_jump_timer == (15 + offset))
            lancer_marker.depth = susie_marker.depth + 10;
        if (lancer_jump_timer == (24 + offset))
        {
            con = 14;
            alarm[0] = 1;
            susie_marker.sprite_index = spr_susie_carry_down;
            susie_marker.x += 4;
            susie_marker.y -= 2;
            lancer_marker.y = susie_marker.y - 32;
            with (lancer_marker)
            {
                sprite_index = spr_lancer_dt;
                image_speed = 0;
                image_index = 0;
                x -= 10;
                vspeed = 0;
                gravity = 0;
                hspeed = 0;
            }
        }
    }
    if (con == 15)
    {
        con = 16;
        alarm[0] = 16;
        snd_play(snd_bell);
        susie_marker.sprite_index = spr_susie_carry_pose;
        lancer_marker.sprite_index = spr_lancer_wave;
        lancer_marker.image_speed = 0.5;
    }
    if (con == 17)
    {
        con = 18;
        alarm[0] = 30;
        lancer_marker.image_speed = 0;
    }
    if (con == 19)
    {
        con = 20;
        susie_marker.sprite_index = spr_susie_lancer_carry_walk_down;
        with (lancer_marker)
            instance_destroy();
    }
    if (con == 20)
    {
        var rejoin = false;
        var sus_x = susie_marker.x + 10;
        with (obj_mainchara)
        {
            if (y >= 1210 && abs(x - sus_x) < 90)
                rejoin = true;
        }
        if (rejoin)
            con = 21;
    }
    if (con == 21)
    {
        con = 99;
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                x = 1020;
                y = 1209;
                visible = 1;
            }
            scr_caterpillar_interpolate();
        }
        with (susie_marker)
            instance_destroy();
    }
}
