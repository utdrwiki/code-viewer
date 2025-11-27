if (image_angle < 1)
{
    if (i_ex(obj_sound_of_justice_enemy))
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(sprite_index, image_index, x + 14, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    else
    {
        draw_sprite_ext(sprite_index, image_index, x + 14, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    if (eye_con == 1)
    {
        if (eye_index == 0)
        {
            snd_play_pitch(snd_eye_telegraph, 1);
            var _x = 0;
            if (version == 1)
                _x = -6;
            var _image_angle = image_angle;
            if (image_angle < 0)
                _image_angle = 0;
            inst = instance_create(x + _x + lengthdir_x(15, 270 + _image_angle), y + lengthdir_y(15, 270 + _image_angle), obj_gerson_growtangle_telegraph_new);
            inst.image_angle = _image_angle;
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        if (alphacon == 0)
        {
            alpha += 0.2;
            if (alpha == 1.2)
                alphacon = 1;
        }
        else
        {
            alpha -= 0.2;
        }
        d3d_set_fog(true, c_white, 0, 1);
        draw_sprite_ext(sprite_index, image_index, x + 14, y, image_xscale, image_yscale, image_angle, image_blend, alpha);
        d3d_set_fog(false, c_black, 0, 0);
        eye_index += 0.4;
        if (swingdowntype == 1)
            eye_index += 0.6;
        if (eye_index >= 5)
            eye_con = 0;
    }
}
else
{
    if (i_ex(obj_sound_of_justice_enemy))
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(14, image_angle + 90), y + lengthdir_y(14, image_angle + 90), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    else
    {
        draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(14, image_angle + 90), y + lengthdir_y(14, image_angle + 90), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    if (eye_con == 1)
    {
        if (eye_index == 0)
        {
            snd_play_pitch(snd_eye_telegraph, 1);
            var _x = 0;
            if (version == 1)
                _x = -6;
            var _image_angle = image_angle;
            if (image_angle < 0)
                _image_angle = 0;
            inst = instance_create(x + _x + lengthdir_x(15, 270 + _image_angle), y + lengthdir_y(15, 270 + _image_angle), obj_gerson_growtangle_telegraph_new);
            inst.image_angle = _image_angle;
            if (image_angle == 270)
            {
                with (inst)
                {
                    image_xscale = 1;
                    sprite_index = spr_gerson_swing_down_telegraph3;
                }
            }
            if (i_ex(obj_heart))
                inst.depth = obj_heart.depth + 1;
        }
        if (alphacon == 0)
        {
            alpha += 0.2;
            if (alpha == 1.2)
                alphacon = 1;
        }
        else
        {
            alpha -= 0.2;
        }
        d3d_set_fog(true, c_white, 0, 1);
        draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(14, image_angle + 90), y + lengthdir_y(14, image_angle + 90), image_xscale, image_yscale, image_angle, image_blend, alpha);
        d3d_set_fog(false, c_black, 0, 0);
        eye_index += 0.4;
        if (swingdowntype == 1)
            eye_index += 0.6;
        if (eye_index >= 5)
            eye_con = 0;
    }
}
