if (y < (cameray() + 110))
    return;
if (y > (cameray() + 233))
    return;
if (image_alpha < 0.5)
    return;
if (destroyable == true && active == true)
{
    if (hitshot.big == 0)
    {
        with (hitshot)
            event_user(0)
    }
    snd_play_pitch(snd_bomb, (1.1 + random(0.2)))
    scr_afterimage_cut()
    anim = instance_create(x, y, obj_yshot_anim)
    anim.image_xscale = image_xscale
    anim.image_yscale = image_yscale
    with (anim)
        sprite_index = spr_yheart_shot_hit3
    instance_destroy()
}
else if (destroyable == false && active == true)
{
    with (hitshot)
        event_user(0)
    snd_play(snd_bell)
}
