if (init == 0)
{
    light = instance_find(obj_darkness_overlay, 0);
    if (light == -4)
    {
        debug_message("obj_lightTriggerArea couldn't find a obj_darkness_overlay: self-destructing");
        instance_destroy();
    }
    init = 1;
}
if (boss == 1)
{
    light.active = false;
    var activetrigs = 0;
    if (i_ex(obj_mainchara))
    {
        with (object_index)
        {
            if (place_meeting(x, y, obj_mainchara))
                activetrigs++;
        }
    }
    if (activetrigs != 0)
        light.active = true;
}
