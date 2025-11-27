if (ohmygodimonfire == 1 || ohmygodimonfire == 2)
{
    specialcontimer++;
    flameframe = (specialcontimer / 4) % 2;
    if (specialcontimer == 1)
        snd_play_pitch(snd_wing, 0.7);
    if ((specialcontimer % 2) == 0 || specialcontimer >= 20)
        draw_sprite_ext(spr_board_imonfire, flameframe, (round(x / 2) * 2) - 16, (round(y / 2) * 2) - 32, 2, 2, 0, c_red, 1);
}
draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round(y / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (telegraphtimer > 0)
{
    telegraphtimer--;
    if (telegraphtimer <= 60)
    {
    }
}
if (hurttimer > 0)
{
    hurttimer--;
    if ((hurttimer % 2) == 0)
    {
        d3d_set_fog(true, c_white, 0, 1);
        draw_self_board();
        d3d_set_fog(false, c_black, 0, 0);
    }
}
