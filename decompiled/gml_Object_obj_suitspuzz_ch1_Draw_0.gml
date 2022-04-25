vic = 0
for (i = 0; i < max_suit; i += 1)
{
    if (drawclue == 1)
        draw_sprite_ext(spr_suitsicon_fade_ch1, (sol[i] - 1), (x + (i * 40)), y, 2, 2, 0, c_white, 1)
    draw_sprite_ext(spr_suitsicon_ch1, 4, (x + (i * 40)), (y + 40), 2, 2, 0, c_white, 1)
    if (suit[i] > 0)
    {
        draw_sprite_ext(spr_suitsicon_ch1, (suit[i] - 1), (x + (i * 40)), (y + 40), 2, 2, 0, c_white, 1)
        if (suit[i] == sol[i])
            vic += 1
    }
}
if (vic == max_suit)
    won = 1
