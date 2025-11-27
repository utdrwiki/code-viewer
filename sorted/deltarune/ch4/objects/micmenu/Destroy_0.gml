for (i = 0; i < (mic_max - 2); i++)
    ds_map_destroy(mic_name[i]);
with (obj_volumebar)
    instance_destroy();
global.microphone = selected;
with (obj_mike_controller)
{
    event_user(10);
    mic_reset();
}
