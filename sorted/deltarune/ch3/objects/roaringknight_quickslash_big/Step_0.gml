timer++;
if (image_alpha < 1 && !slash)
    image_alpha += 0.05;
if (!slash && timer > 20)
    image_blend = merge_color(c_white, c_red, (timer - 20) / 19);
if (!slash)
{
    if (image_angle == 90)
    {
        y -= 20;
        if (y < (ystart - 66))
            y += 66;
        x = xstart;
    }
    else
    {
        x -= 20;
        if (x < (xstart - 66))
            x += 66;
    }
}
if (timer == 38)
{
    with (obj_roaringknight_quickslash_attack)
        final_slash_anim = true;
}
if (timer == 40)
{
    x = xstart;
    image_blend = c_white;
    active = true;
    slash = true;
    var _splitter = instance_create(obj_growtangle.x, obj_growtangle.y, obj_knight_split_growtangle);
    scr_bullet_inherit(_splitter);
    sprite_index = spr_rk_quickslash;
    image_speed = 1;
    image_index = 0;
    image_yscale *= 2;
    snd_stop(snd_wideslash_low);
    snd_stop(snd_knight_hurtb);
    snd_play_x(snd_wideslash_low, 0.8, 0.9 + (random(4) / 10));
    with (obj_roaringknight_quickslash_attack)
        event_user(1);
}
if (timer == 34)
    active = false;
if (timer == 60 && playerstrike == 1)
{
    playerstrike = 0;
    obj_heart.image_alpha = 1;
    if (target != 3)
        scr_damage_maxhp(1.25);
    instance_destroy();
}
if (image_angle == 90)
    x = obj_growtangle.xstart;
