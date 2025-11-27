if (pickup_stick)
{
    animate_timer++;
    if (animate_timer == 1)
        sprite_index = spr_noellehouse_dess_kris_reach_down;
    if (animate_timer == 6)
    {
        snd_play(snd_grab);
        stick_marker.visible = 0;
        sprite_index = spr_noellehouse_dess_kris_hockey_up;
        if (i_ex(obj_homealone_heart))
        {
            if (x > obj_homealone_heart.x)
                sprite_index = spr_noellehouse_dess_kris_hockey_up_left;
        }
    }
    if (animate_timer == 10)
    {
        pickup_stick = false;
        animate_timer = 0;
        kris_ready = true;
        sprite_index = spr_noellehouse_dess_kris_hockey_mid;
        if (i_ex(obj_homealone_heart))
        {
            if (x > obj_homealone_heart.x)
                sprite_index = spr_noellehouse_dess_kris_hockey_mid_left;
        }
        scr_shakeobj();
    }
}
if (press_santa)
{
    animate_timer++;
    if (animate_timer == 1)
    {
        sprite_index = spr_noellehouse_dess_kris_reach_stick;
        if (x < 180)
            sprite_index = spr_noellehouse_dess_kris_hockey_mid_stand_press_left;
        image_index = 0;
    }
    if (animate_timer == 6)
    {
        press_santa = false;
        animate_timer = 0;
        snd_play(snd_noise);
        image_index = 1;
        scr_shakeobj();
    }
}
if (kris_swing)
{
    animate_timer++;
    if (animate_timer == 1)
    {
        sprite_index = spr_noellehouse_dess_kris_hockey_swing;
        if (i_ex(obj_homealone_heart))
        {
            if (x > obj_homealone_heart.x)
                sprite_index = spr_noellehouse_dess_kris_hockey_swing_left;
        }
        scr_animate(0, 3, 0.65);
    }
    if (animate_timer == 4)
        snd_play(snd_swing);
    if (animate_timer == 8)
        scr_shakeobj();
    if (animate_timer == 16)
    {
        kris_swing = false;
        animate_timer = 0;
        sprite_index = spr_noellehouse_dess_kris_hockey_mid;
        if (i_ex(obj_homealone_heart))
        {
            if (x > obj_homealone_heart.x)
                sprite_index = spr_noellehouse_dess_kris_hockey_mid_left;
        }
    }
}
