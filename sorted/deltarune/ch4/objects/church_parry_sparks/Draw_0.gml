image_yscale = 2;
var _brighttime = lifetime - fadetime;
if (speed > 10)
{
    image_alpha = 1;
}
else
{
    var _lerp = clamp01(inverselerp(10, 0, speed));
    image_alpha = lerp(1, 0, scr_ease_out(_lerp, 2));
    image_yscale = image_alpha + 1;
}
gpu_set_blendmode(bm_add);
shader_set(shader);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (image_alpha > 0.5)
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha - 0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha - 0.5);
}
shader_reset();
gpu_set_blendmode(bm_normal);
if (speed <= 0)
    instance_destroy();
