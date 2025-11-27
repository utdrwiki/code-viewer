if (surface_exists(hell_surface))
    surface_free(hell_surface);
if (turn_type != "start" && turn_type != "short start" && turn_type != "short mid" && scr_bulletparent_count() < 2)
{
    knight.image_alpha = 1;
    global.turntimer = -1;
}
