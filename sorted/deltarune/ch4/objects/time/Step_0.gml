if (scr_debug())
{
}
if (global.is_console && sunkus_kb_check_pressed(19))
{
    paused = !paused;
    if (!sprite_exists(screenshot))
        screenshot = sprite_create_from_surface(application_surface, 0, 0, view_wport, view_hport, 0, 0, 0, 0);
}
if (global.is_console)
{
    if (!i_ex(obj_border_controller))
    {
        var border_controller = instance_create(0, 0, obj_border_controller);
        border_controller.init_border();
    }
}
