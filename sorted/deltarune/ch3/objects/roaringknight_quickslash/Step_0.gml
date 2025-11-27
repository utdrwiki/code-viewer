timer++;
if (!init)
{
    image_alpha = 1;
    xdir = lengthdir_x(250, image_angle);
    ydir = lengthdir_y(250, image_angle);
    init = true;
}
if (!slash)
{
    if (timer <= 6)
    {
        xdraw = xdir * (1 - (timer / 6));
        ydraw = ydir * (1 - (timer / 6));
        if (flip)
        {
            xdraw *= -1;
            ydraw *= -1;
        }
    }
    thickness = lerp(3, 1, scr_ease_out(inverselerp(0, 30, timer), 6));
    trailthickness = thickness + 2;
    if (timer > 10)
        image_blend = merge_color(c_gray, c_red, (timer - 10) / 20);
}
if (timer == 30)
{
    image_blend = c_white;
    active = true;
    slash = true;
    sprite_index = spr_rk_quickslash;
    image_speed = 1;
    image_index = 0;
    snd_stop(snd_wideslash_low);
    snd_stop(snd_knight_hurtb);
    snd_play_x(snd_wideslash_low, 0.8, 0.9 + (random(4) / 10));
    snd_play_x(snd_knight_hurtb, 0.7, 0.9 + (random(4) / 10));
    with (obj_roaringknight_quickslash_attack)
    {
        if (omae_wa_timer < 40)
        {
            if (other.flip)
                event_user(2);
            else
                event_user(1);
        }
    }
}
if (timer == 32)
    active = false;
