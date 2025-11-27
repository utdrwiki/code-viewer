if (_border_image != _border_image_temp)
    exit;
if (overlay_alpha != overlay_alpha_target)
{
    overlay_alpha += overlay_fade_speed;
    if (overlay_alpha_target == 0)
    {
        if (overlay_alpha <= 0)
            overlay_alpha = overlay_alpha_target;
    }
    else if (overlay_alpha_target == 1)
    {
        if (overlay_alpha >= 1)
            overlay_alpha = overlay_alpha_target;
    }
}
