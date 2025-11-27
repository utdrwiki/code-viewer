if (ohmygodimonfire == 1)
{
    specialcontimer++;
    flameframe = (specialcontimer / 4) % 2;
    if (specialcontimer == 1)
        snd_play_pitch(snd_wing, 0.7);
    if ((specialcontimer % 2) == 0 || specialcontimer >= 20)
        draw_sprite_ext(spr_board_imonfire, flameframe, (round(x / 2) * 2) - 16, (round(y / 2) * 2) - 32, 2, 2, 0, c_red, 1);
}
draw_self_board();
