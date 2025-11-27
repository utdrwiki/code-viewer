function scr_update_lightbeams(arg0, arg1)
{
    with (obj_darkness_overlay)
    {
        if (!updated_this_frame)
        {
            image_alpha = lerp(0, mem_darkness, arg0);
            updated_this_frame = true;
        }
        else
        {
            exit;
        }
    }
    with (obj_light_area_mask)
        on_amount = lerp(0.1, 1, arg0);
    with (obj_lightbeamfx)
        image_alpha = lerp(0.1, 1, arg0);
}
