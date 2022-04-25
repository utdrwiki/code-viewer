siner += 1
if (spec < 2)
{
    draw_sprite_ext(spr_blocktree_parts_ch1, 1, x, y, 2, 2, 0, image_blend, 1)
    draw_sprite_ext(spr_blocktree_parts_ch1, 2, (x + (sin((siner / 12)) * 2)), (y + (cos((siner / 20)) * 2)), 2, 2, 0, image_blend, 1)
    draw_sprite_ext(spr_blocktree_parts_ch1, 3, (x + (sin((siner / 14)) * 1)), (y + (cos((siner / 24)) * 1)), 2, 2, 0, image_blend, 1)
}
else
    draw_sprite_ext(spr_blocktree_switch_ch1, (siner / 6), x, y, 2, 2, 0, image_blend, 1)
