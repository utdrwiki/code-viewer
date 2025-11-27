if (!init)
{
    size.x = sprite_width;
    size.y = sprite_height;
    if (camera == -4)
    {
        if (i_ex(obj_fx_zoom_camera))
        {
            camera = 1582;
        }
        else
        {
            camera = instance_create(x, y, obj_fx_zoom_camera);
            camera.size = size;
        }
    }
    init = true;
}
