if (con == 0)
{
    timer++;
    if (timer == 1)
        snd_play_pitch(snd_spellcast, 1.4);
    y = lerp(y, ystart - 45, 0.16);
    if (timer > 14)
        circlealpha -= 0.2;
    if (timer == 20)
    {
        timer = 0;
        con = 1;
        snd_play(snd_stardrop);
    }
}
if (con == 1)
{
    timer++;
    if (timer < 11)
        whitefgalpha += 0.1;
    if (timer >= 14)
    {
        whitefgalpha -= 0.1;
        circlealpha = 0;
        image_alpha = 0;
        splatsoundtimer++;
        if (splatsoundtimer == 1)
            snd_play_x(snd_splat, 1, 0.9);
        if (splatsoundtimer == 12)
            snd_play_x(snd_splat, 0.6, 0.9);
        if (splatsoundtimer == 24)
            snd_play_x(snd_splat, 0.3, 0.9);
        if (splatsoundtimer == 36)
            snd_play_x(snd_splat, 0.1, 0.9);
        if (splatsoundtimer == 48)
            snd_play_x(snd_splat, 0.05, 0.9);
    }
    if (timer >= 64)
    {
        instance_destroy();
        audio_resume_sound(global.batmusic[1]);
    }
}
siner += 4;
var scale = 0.7 + (sin(siner / 6) * 0.1);
draw_sprite_ext(spr_sneo_bigcircle, image_index, x, y - 36, scale, scale, image_angle, image_blend, circlealpha);
draw_sprite_ext(sprite_index, image_index, x - 1, y - 10, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
