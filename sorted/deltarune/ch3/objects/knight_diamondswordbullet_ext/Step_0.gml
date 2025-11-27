event_inherited();
if (shakeme && !fake)
{
    g = scr_approach(g, 0, 21.25);
    b = scr_approach(b, 0, 21.25);
}
if (do_afterimage == 1)
{
    do_afterimage = 2;
    if (do_afterimage)
    {
        with (scr_afterimage_grow())
            image_blend = c_red;
    }
}
if (do_afterimage == 2)
{
    with (scr_afterimagefast())
    {
        fadeSpeed = 0.33;
        image_blend = c_red;
    }
}
if (play_passing_sfx == true && x < (obj_heart.x + 30) && y > obj_heart.y)
{
    play_passing_sfx = false;
    snd_play_x(snd_object_passing, 1, 1);
}
