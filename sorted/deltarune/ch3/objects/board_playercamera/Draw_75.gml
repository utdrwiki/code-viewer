if (camshot == true)
{
    camshot = false;
    appsurfx = application_surface_x();
    appsurfy = application_surface_y();
    appsurfscale = application_surface_scale();
    if (!global.is_console)
        screen_save_part("vacationmemories.png", appsurfx + camerax() + (x * appsurfscale), appsurfy + cameray() + (y * appsurfscale), camwidth * 32 * appsurfscale, camheight * 32 * appsurfscale);
}
