if (scr_debug())
{
    if (keyboard_check_pressed(ord("1")))
    {
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        drawpos = 0;
        scr_lerpvar("armxpos", 0, 6, 10, 2, "out");
        scr_lerpvar("armypos", 0, -20, 10, 2, "out");
    }
    if (timer == 5)
    {
        drawpos = 1;
        armypos = 0;
        armxpos = 0;
    }
    if (timer == 13)
    {
        scr_lerpvar("armxpos", 6, -6, 6, 2, "in");
        scr_lerpvar("armypos", -20, 2, 6, 2, "in");
    }
    if (timer == 21)
    {
        with (scr_dark_marker(x - 64 - 8, y - 150 - 8, spr_dogcar_hit))
        {
            depth = other.depth + 1;
            scr_lerpvar("image_alpha", 2, 0, 3);
            scr_lerpvar("image_xscale", 2, 3, 3);
            scr_lerpvar("image_yscale", 2, 3, 3);
            xspeed = -1;
            yspeed = 1;
            scr_doom(id, 4);
        }
        if (playsnapsnd)
            snd_play(snd_whip_crack_only);
        snapped = 1;
        drawpos = 2;
        animindex = 2;
        scr_lerpvar("animindex", 2, 4, 2);
    }
}
if (animindex > (sprite_get_number(spr_tenna_snap) - 1))
    animindex = 0;
if (animindex < 0)
    animindex = sprite_get_number(spr_tenna_snap) - 1;
