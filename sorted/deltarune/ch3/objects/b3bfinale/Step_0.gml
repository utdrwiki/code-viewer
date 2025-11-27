scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (scr_debug())
        {
        }
        kris.controlled = 0;
        susie.controlled = 1;
        susie.x = board_tilex(5.5);
        ralsei.follow = 0;
        con = 1;
        clamper = true;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 10)
            tenna.bounce = 1;
        if (timer == 20)
            scr_pathfind_to_point("kris", 4, 5, 2);
        if (timer == 30)
        {
            scr_pathfind_to_point("ralsei", 7, 5, 2);
            racon = 1;
        }
        if (timer == 80)
        {
            tenna.bounce = 1;
            con++;
            timer = 0;
        }
    }
    if (glassbreak == 0)
    {
        with (obj_board_trigger)
        {
            if (extflag == "b3bfinale")
            {
                if (place_meeting(x, y, obj_mainchara_board))
                {
                    other.timer = 0;
                    other.con = 6;
                    other.glassbreak = 1;
                }
                if (place_meeting(x, y, obj_board_grabbleObject))
                {
                    other.glassbreak = 1;
                    other.con = 10;
                    other.timer = 0;
                }
            }
        }
    }
    if (con == 6)
    {
        ralsei.visible = false;
        ramarker = scr_board_marker(ralsei.x, ralsei.y, spr_board_ralsei_hurt, 0, ralsei.depth, 2);
        snd_play(snd_board_splat);
        con++;
        timer = 0;
    }
    if (con == 7)
    {
        timer++;
        if (timer == 30)
        {
            with (ramarker)
                scr_lerpvar("y", y, y + 8, 12, 2, "in");
        }
        if (timer == 90)
        {
            with (ramarker)
                scr_lerpvar("y", y, y + 8, 12, 2, "in");
        }
        if (timer == 118)
        {
            with (ramarker)
                gravity = 0.5;
        }
        if (timer > 110)
        {
            with (ramarker)
                scr_depth_board();
            if (raland == 0)
            {
                if (ramarker.y >= 180)
                {
                    ramarker.sprite_index = spr_board_ralsei_walk_down;
                    ramarker.y = 180;
                    ramarker.gravity = 0;
                    ramarker.vspeed = 0;
                    ramarker.speed = 0;
                    snd_play_x(snd_board_splash, 0.8, 1.4);
                    raland = 1;
                }
            }
        }
        if (timer == 1)
        {
            ra_real.sprite_index = spr_ralsei_couch_shocked_left;
            snd_play_x(snd_wing, 0.6, 1);
            scr_shakeobj(ra_real);
        }
        if (timer == 60)
        {
            su_real.sprite_index = spr_susie_walk_right_dw;
            ra_real.sprite_index = spr_ralsei_walk_left_unhappy;
        }
        if (timer == 120)
        {
            scr_resetgameshowcharacter("ralsei");
            ra_real.sprite_index = spr_ralsei_couch_shocked_left;
        }
        if (timer == 180)
        {
            scr_resetgameshowcharacter("ralsei");
            ra_real.sprite_index = spr_ralsei_walk_left_unhappy;
            snd_play_x(snd_wing, 0.9, 1);
            scr_shakeobj(ra_real);
            scr_couchtalk(ratalk_su, "ralsei", 2, 60);
        }
        if (timer == 150)
        {
            snd_play(snd_suslaugh);
            su_real.sprite_index = spr_susier_dark_laugh;
            su_real.image_speed = 0.16;
            with (su_real)
                scr_delay_var("image_speed", 0, 42);
        }
        if (timer == 250)
        {
            su_real.sprite_index = spr_susie_right_dw;
            scr_resetgameshowcharacter("ralsei");
            ra_real.sprite_index = spr_ralsei_walk_right_unhappy;
            kr_real.sprite_index = kr_real.rsprite;
            tenna.bounce = 1;
        }
        if (timer == 320)
        {
            safe_delete(obj_couchwriter);
            timer = 0;
            con = 10;
        }
    }
    if (con == 10)
    {
        timer++;
        if (timer == 1)
        {
            snd_play(snd_board_door_close);
            with (obj_couchwriter)
                instance_destroy();
            scr_resetgameshowcharacter("kris");
            scr_resetgameshowcharacter("ralsei");
            scr_resetgameshowcharacter("susie");
            var getdepth = 997880;
            with (obj_board_grabbleObject)
            {
                if (sprite_index == spr_board_key)
                    depth = 997881;
            }
            with (scr_board_marker(288, 98, spr_pxwhite))
            {
                image_xscale = 64;
                image_yscale = 94;
                image_blend = c_black;
                depth = 999998;
            }
            with (obj_board_grabbleObject)
                instance_destroy();
        }
        if (timer == 60)
        {
            snd_play(snd_locker);
            with (scr_marker(0, 0, spr_pxwhite))
            {
                depth = -999;
                image_blend = c_black;
                image_xscale = 640;
                image_yscale = 480;
            }
        }
        if (timer == 90)
        {
            global.plot = 215;
            global.interact = 0;
            scr_flag_set(1080, 0);
            room_goto(room_dw_susiezilla);
        }
    }
}
else
{
}
