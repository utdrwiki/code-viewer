draw_self();
draw_sprite_ext(spr_tenna_allstars_laugh, laugh_timer, x, y, image_xscale * image_xscale, image_yscale * image_yscale, 0, image_blend, image_alpha);
if (i_ex(bullet1))
    draw_sprite_ext(spr_tenna_allstars_laugh, laugh_timer, bullet1.x, bullet1.y, bullet1.image_xscale / 3, bullet1.image_yscale / 3, 0, image_blend, image_alpha);
if (i_ex(bullet2))
    draw_sprite_ext(spr_tenna_allstars_laugh, laugh_timer, bullet2.x, bullet2.y, bullet2.image_xscale / 3, bullet2.image_yscale / 3, 0, image_blend, image_alpha);
