if (init && i_ex(d) && i_ex(d.writer))
{
    animindex++;
    var yloc = 32 + (side * 310);
    pal_swap_set(spr_tenna_palette, 1, false);
    draw_sprite(spr_tenna_dance_cabbage_small, other.animindex, camerax() + 70, cameray() + yloc);
    pal_swap_reset();
    tone_off();
}
