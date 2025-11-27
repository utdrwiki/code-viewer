if (con == 0)
    depth = -9999;
if (con > 0 && con < 4)
{
    if (su_pomark == 0)
        su_pomark = instance_create(camerax() + 100, cameray() + 410, obj_quiz_podium);
    if (kr_pomark == 0)
        kr_pomark = instance_create(camerax() + 250, cameray() + 410, obj_quiz_podium);
    if (ra_pomark == 0)
        ra_pomark = instance_create(camerax() + 400, cameray() + 410, obj_quiz_podium);
    var _faux_depth = bg.depth;
    with (kr_pomark)
        scr_depth_ext_alt(_faux_depth);
    kr_pomark.mystring = kr_name;
    with (ra_pomark)
        scr_depth_ext_alt(_faux_depth);
    ra_pomark.mystring = "RAL";
    with (su_pomark)
        scr_depth_ext_alt(_faux_depth);
    su_pomark.mystring = "ASS";
    if (global.lang == "ja")
    {
        ra_pomark.mystring = "ラルセ";
        su_pomark.mystring = "クソダ";
    }
    var _board4 = board4;
    if (susie_punch)
    {
        susie_punch_timer++;
        if (susie_punch_timer == 8)
        {
            with (susie)
            {
                sprite_index = spr_susie_trapped_punch;
                image_index = 0;
                image_speed = 0.5;
            }
        }
        if (susie_punch_timer > 8)
        {
            if (susie_punch_timer == 12)
            {
                with (susie)
                    scr_shakeobj();
            }
            if (susie_punch_timer == 16)
            {
                susie_punch_timer = 0;
                susie.image_speed = 0;
            }
        }
    }
    with (susie)
    {
        if (!_board4)
        {
            sprite_index = other.su_sprite;
            if (other.su_pose)
                image_index = other.su_index;
            else
                image_index = clamp01(other.su_press);
        }
        scr_depth_ext(_faux_depth);
    }
    with (kris)
    {
        if (!_board4)
        {
            sprite_index = other.kr_sprite;
            if (other.kr_pose)
                image_index = other.kr_index;
            else
                image_index = clamp01(other.kr_press);
        }
        scr_depth_ext(_faux_depth);
    }
    with (ralsei)
    {
        if (!_board4)
        {
            sprite_index = other.ra_sprite;
            if (other.ra_pose)
                image_index = other.ra_index;
            else if (!_board4)
                image_index = clamp01(other.ra_press);
        }
        scr_depth_ext(_faux_depth);
    }
    with (tenna)
        scr_depth_ext(_faux_depth);
    if (!su_pose && su_press > -8)
    {
        su_press--;
        if (su_podium > 0 && su_press == -8)
            su_sprite = su_ready;
    }
    if (!kr_pose && kr_press > -8)
    {
        kr_press--;
        if (kr_podium > 0 && kr_press == -8)
            kr_sprite = kr_ready;
    }
    if (!ra_pose && ra_press > -8)
    {
        ra_press--;
        if (ra_podium > 0 && ra_press == -8)
            ra_sprite = ra_ready;
    }
}
if (con == 4)
{
    safe_delete(kr_pomark);
    safe_delete(ra_pomark);
    safe_delete(su_pomark);
}
