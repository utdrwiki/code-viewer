with (target_object)
{
    if (object_index == obj_character_church_window_silhouette || object_index == obj_darkness_unlit_object || object_index == obj_darkness_illusion || object_index == obj_darkness_bullet || object_index == obj_dw_church_pushableshelf_3x3)
    {
        continue;
    }
    else
    {
        var _yoff = 4;
        if (object_index == obj_caterpillarchara)
        {
            if (name == "susie")
            {
                _yoff = 0;
            }
            else if (name == "ralsei")
            {
                if (facing[target] == 0)
                    _yoff = 8;
                else if (facing[target] == 2)
                    _yoff = 12;
            }
        }
        draw_sprite_ext(sprite_index, image_index, screenx(), (screeny() + ((sprite_height - sprite_yoffset) * 2)) - _yoff, image_xscale, -image_yscale, image_angle, c_black, image_alpha);
    }
}
