if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        snd_play(snd_ghostappear, 0.6, 1.4);
        snd_play(snd_ghostappear, 0.6, 0.8);
        alpha = 1;
        alpha2 = 0;
        scr_lerpvar("alpha2", 0, 1, 3);
    }
    if (timer == 3)
    {
        scr_lerpvar("alpha2", 1, 0, 16);
        scr_lerpvar("alpha", 1, 0, 8);
        scr_doom(id, 16);
    }
    for (var i = 0; i < (image_xscale / 2); i++)
    {
        for (var j = 0; j < (image_yscale / 2); j++)
        {
            draw_sprite_ext(sprite_index, 0, x + (i * 40), y + (j * 40), 2, 2, 0, c_white, alpha);
            draw_sprite_ext(sprite_index, 1, x + (i * 40), y + (j * 40), 2, 2, 0, #3064E9, alpha2);
        }
    }
}
