if (!init)
{
    camera_area = instance_find(obj_camera_area, 0);
    camera_advanced = instance_find(obj_camera_advanced, 0);
    if (camera_area != -4 && camera_advanced != -4)
        init = true;
}
if (!init)
    exit;
if (!is_disabled && obj_mainchara.sliding == 1)
{
    is_disabled = true;
    instance_deactivate_object(camera_area);
    instance_deactivate_object(camera_advanced);
}
if (is_disabled && obj_mainchara.sliding == 0)
{
    is_disabled = false;
    instance_activate_object(camera_advanced);
    instance_activate_object(camera_area);
}
