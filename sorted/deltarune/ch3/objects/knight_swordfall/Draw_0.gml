if (forcexfix && sprite_index == spr_roaringknight_attack_ol_center)
{
    _siner++;
    draw_sprite_ext(sprite_index, image_index, camerax() + 544, obj_knight_enemy.ystart + (cos(_siner / 8) * 8), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else if (sprite_index == spr_roaringknight_sword_ol)
{
    draw_sprite_ext(sprite_index, image_index, camerax() + 544, y + (sin(global.time * 0.1) * dip) + 30, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x, y + (sin(global.time * 0.1) * dip), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
