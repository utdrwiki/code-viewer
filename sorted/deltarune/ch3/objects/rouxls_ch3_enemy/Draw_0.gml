if (bowanim == true)
{
    if (i_ex(obj_confetti))
        depth = obj_confetti.depth - 10;
    if (i_ex(obj_confetti_overworld))
        depth = obj_confetti_overworld.depth - 10;
    danceindex += (1/3);
    if (danceindex > 2)
        danceindex = 2;
    image_xscale = -2;
    draw_monster_body_part(spr_rouxls_chef_respect, danceindex, x + 104, y);
}
else if (danceanim == true)
{
    danceindex += (1/3);
    draw_monster_body_part(spr_rouxls_chef_dance, danceindex, x, y);
}
else if ((cardsummon == true && cardsummontimer > 0) || (intro >= 0.75 && intro < 1))
{
    if (intro < 3)
    {
        if (danceindex < 2)
            danceindex += (1/3);
        draw_monster_body_part(spr_rouxls_chef_card, danceindex, x, y);
    }
    else
    {
        if (danceindex < 2)
            danceindex += (1/3);
        if (danceindex == 1)
        {
            scr_confetti(x + 0, y + 50, 150, 5);
            snd_play(snd_wing);
        }
        draw_monster_body_part(spr_rouxls_chef_card3, danceindex, x, y);
    }
}
else
{
    scr_enemy_drawhurt_generic();
    scr_enemy_drawidle_generic(0);
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
