draw_set_valign(fa_top);
if (i_ex(writer))
{
    animindex += tanimrate;
    var xloc = ((camerax() + 176) - 50) + txoff;
    var yloc = cameray() + 390 + tyoff;
    pal_swap_set(spr_tenna_palette, 1, false);
    draw_sprite_ext(tennasprite, other.animindex, xloc, yloc, txscale, tyscale, 0, c_white, 1);
    pal_swap_reset();
    tone_off();
}
