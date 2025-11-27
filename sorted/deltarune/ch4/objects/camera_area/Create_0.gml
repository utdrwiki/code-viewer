init = 0;
inside = 0;
ignorebuffer = -1;
checkid = id;
event_user(0);
if (!instance_exists(obj_camera_advanced))
{
    advancedcamera = instance_create(0, 0, obj_camera_advanced);
    event_user(0);
    event_user(1);
    with (advancedcamera)
        event_user(1);
}
