siner++;
var mycol = image_blend;
draw_sprite_ext(sprite_index, image_index, x + (sin((siner + 0) / 15) * 2), y + (cos((siner + 0) / 30) * 2), 2, 2, 0, image_blend, image_alpha * 0.5);
draw_sprite_ext(sprite_index, image_index, x + (sin((siner + 8) / 15) * 2), y + (cos((siner + 8) / 30) * 2), 2, 2, 0, image_blend, image_alpha * 0.5);
gpu_set_blendmode(bm_add);
for (var i = 0; i < 3; i++)
    draw_sprite_ext(sprite_index, image_index + (0.5 * (i + 1)), x + (sin((siner + (i * 6)) / 15) * 2), y + (cos((siner + (i * 6)) / 30) * 2), 2, 2, 0, image_blend, image_alpha * 0.2);
gpu_set_blendmode(bm_normal);
