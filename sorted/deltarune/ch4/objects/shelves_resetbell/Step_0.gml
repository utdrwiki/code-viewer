if (con == 1)
{
    snd_play(snd_bell);
    timer = 0;
    with (obj_dw_church_pushableshelf_3x3)
        scr_lerpvar("image_alpha", 1, 0, 10);
    con = 2;
}
if (con == 2)
{
    timer++;
    if (timer == 11)
    {
        with (obj_dw_church_pushableshelf_3x3)
            resetblocks = true;
    }
    if (timer == 12)
    {
        with (obj_dw_church_pushableshelf_3x3)
            scr_lerpvar("image_alpha", 0, 1, 10);
    }
    if (timer >= 22)
    {
        global.interact = 0;
        global.facing = 2;
        con = 0;
        timer = 0;
    }
}
if (con != 0 && timer < 10)
{
    animtimer++;
    if ((animtimer % 2) == 0)
        image_index++;
}
else
{
    animtimer = 0;
    image_index = 0;
}
