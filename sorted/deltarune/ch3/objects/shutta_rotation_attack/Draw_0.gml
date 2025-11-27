if (con == 1)
{
    if (take_photo)
        event_user(0);
    if (surface_alpha > 0 && surface_exists(snapshot))
    {
        draw_surface_ext(snapshot, framex - (shotsize / 2), framey - (shotsize / 2), 1, 1, 0, c_white, surface_alpha);
        surface_alpha -= (1/15);
    }
}
if (con >= 1 && max_rotate_speed > 0)
    draw_sprite_ext(spr_shutta_reticle, 0, pivotx - 1, pivoty - 1, 2, 2, 0, #959595, border.image_alpha);
