if (angel_mode)
{
    if (shake)
    {
        shake_timer++;
        if (shake_timer == 1)
        {
            var _offset = 4;
            if (i_ex(obj_noellehouse_basement) && obj_noellehouse_basement.move_wait)
                _offset = 8;
            shake_x_offset -= _offset;
        }
        if (shake_timer == 4)
        {
            var _offset = 4;
            if (i_ex(obj_noellehouse_basement) && obj_noellehouse_basement.move_wait)
                _offset = 8;
            shake_x_offset += _offset;
            shake = false;
            shake_timer = 0;
        }
    }
    else
    {
        shake_x_offset = 0;
    }
    draw_sprite_ext(spr_noellehouse_basement_angel, 0, x + 4, y + 2, 1, 1, image_angle + shake_x_offset, c_white, 1);
}
else
{
    draw_self();
}
