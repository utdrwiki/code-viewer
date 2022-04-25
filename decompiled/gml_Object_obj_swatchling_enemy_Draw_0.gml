if (!color_init)
    return;
if (state == 3)
{
    pal_swap_set(sprite_palette, current_pal, 0)
    scr_enemy_drawhurt_generic()
    pal_swap_reset()
}
if (state == 0)
{
    if (flash == true)
        fsiner++
    timer += 1
    pal_swap_set(sprite_palette, current_pal, 0)
    draw_sprite_ext(spr_swatchling_legs, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    pal_swap_reset()
    if (flash == true)
        draw_sprite_ext_flash(spr_swatchling_legs, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, (((-(cos((fsiner / 5)))) * 0.4) + 0.6))
    pal_swap_set(sprite_palette, current_pal, 0)
    draw_sprite_ext(spr_swatchling_body, 0, x, (y + (sin((timer / 6)) * 3)), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    pal_swap_reset()
    if (flash == true)
        draw_sprite_ext_flash(spr_swatchling_body, 0, x, (y + (sin((timer / 6)) * 3)), image_xscale, image_yscale, image_angle, image_blend, (((-(cos((fsiner / 5)))) * 0.4) + 0.6))
    pal_swap_set(sprite_palette, current_pal, 0)
    draw_sprite_ext(spr_swatchling_head, 0, x, (y + sin((timer / 6))), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    pal_swap_reset()
    if (flash == true)
        draw_sprite_ext_flash(spr_swatchling_head, 0, x, (y + sin((timer / 6))), image_xscale, image_yscale, image_angle, image_blend, (((-(cos((fsiner / 5)))) * 0.4) + 0.6))
}
if (becomeflash == false)
    flash = false
becomeflash = false
