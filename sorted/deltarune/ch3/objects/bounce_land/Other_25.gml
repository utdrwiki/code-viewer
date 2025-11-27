if (init == 0)
{
    init = 1;
    start_xscale = target.image_xscale;
    start_yscale = target.image_yscale;
    original_origin_x = sprite_get_xoffset(target.sprite_index);
    original_origin_y = sprite_get_yoffset(target.sprite_index);
    x2 = target.x;
    y2 = target.y;
    var xx = original_origin_x - (target.sprite_width / 2);
    var yy = original_origin_y - target.sprite_height;
    target.x = target.x - xx;
    target.y = target.y - yy;
    sprite_set_offset(target.sprite_index, target.sprite_width / 2, target.sprite_height);
}
timer++;
var inverse_strength = 1 / strength;
if (timer == 1)
{
    target.image_xscale = start_xscale * 1.15 * strength;
    target.image_yscale = start_yscale * 0.85 * inverse_strength;
}
target.image_xscale = lerp_ease_in(start_xscale * 1.15 * strength, start_xscale, timer / 10, 0.5);
target.image_yscale = lerp_ease_in(start_yscale * 0.85 * inverse_strength, start_yscale, timer / 10, 0.5);
if (timer == 10)
{
    instance_destroy();
    sprite_set_offset(target.sprite_index, original_origin_x, original_origin_y);
    target.x = x2;
    target.y = y2;
}
