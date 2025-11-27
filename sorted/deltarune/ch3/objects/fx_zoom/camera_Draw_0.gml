if (init >= 1)
{
    size.x = 320;
    size.y = 240;
    surface_resize(cam_surf, size.x, size.y);
    surface_set_target(cam_surf);
    draw_clear(clear_color);
    surface_reset_target();
    surface_copy_part(cam_surf, 0, 0, application_surface, screenx(pos.x - (size.x / 2)), screeny(pos.y - (size.y / 2)), size.x, size.y);
}
if (init == 1)
    init = 2;
if (showcamera || i_ex(obj_debug_xy))
{
    draw_sprite_ext(sprite_index, 1, pos.x, pos.y, size.x / 64, size.y / 48, 0, c_white, 1);
    draw_sprite(sprite_index, 2, x, y);
    if (pos.x != x || pos.y != y)
    {
        var _col = merge_color(c_black, c_red, inverselerp(-1, 1, sin(siner / 15)));
        draw_sprite_ext(sprite_index, 1, x, y, size.x / 64, size.y / 48, 0, c_white, 1);
        draw_sprite(sprite_index, 2, x, y);
        siner++;
    }
    else
    {
        siner = 0;
    }
}
