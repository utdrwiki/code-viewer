var _things = array_length(things_to_outline);
for (var i = 0; i < _things; i++)
{
    if (doomed)
        things_to_outline[i][2] = false;
    if (things_to_outline[i][2])
        things_to_outline[i][1] = min(things_to_outline[i][1] + 0.04, 0.7);
    else
        things_to_outline[i][1] = max(things_to_outline[i][1] - 0.04, 0);
    var _alpha = things_to_outline[i][1];
    if (_alpha > 0)
    {
        with (things_to_outline[i][0])
        {
            gpu_set_fog(true, c_red, 0, 1);
            draw_sprite_ext(sprite_index, image_index, x, y - image_yscale, image_xscale, image_yscale, 0, c_white, _alpha);
            draw_sprite_ext(sprite_index, image_index, x + image_xscale, y - image_yscale, image_xscale, image_yscale, 0, c_white, _alpha);
            draw_sprite_ext(sprite_index, image_index, x - image_xscale, y - image_yscale, image_xscale, image_yscale, 0, c_white, _alpha);
            draw_sprite_ext(sprite_index, image_index, x, y + image_yscale, image_xscale, image_yscale, 0, c_white, _alpha);
            draw_sprite_ext(sprite_index, image_index, x + image_xscale, y + image_yscale, image_xscale, image_yscale, 0, c_white, _alpha);
            draw_sprite_ext(sprite_index, image_index, x - image_xscale, y + image_yscale, image_xscale, image_yscale, 0, c_white, _alpha);
            gpu_set_fog(false, c_black, 0, 0);
            draw_self();
            gpu_set_fog(true, #202020, 0, 1);
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, _alpha);
            gpu_set_fog(false, c_black, 0, 0);
        }
    }
}
