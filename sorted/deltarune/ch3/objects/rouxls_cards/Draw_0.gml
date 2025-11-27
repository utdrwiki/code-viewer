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
    angle += 10;
    if (timer >= 8)
    {
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    image_alpha -= 0.1;
    if (image_alpha < 0)
        instance_destroy();
}
siner += 4;
var scale = 0.7 + (sin(siner / 6) * 0.1);
draw_sprite_ext(spr_sneo_bigcircle, image_index, x, y - 36, scale, scale, image_angle, image_blend, circlealpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle - angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle + angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle - (angle / 2), image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle + (angle / 2), image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
