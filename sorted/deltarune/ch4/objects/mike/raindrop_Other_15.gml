if (active == 1)
{
    if (destroyonhit == 1)
        instance_destroy();
}
if (global.inv > 0)
    exit;
if (!instance_exists(obj_shake))
    instance_create(0, 0, obj_shake);
with (obj_heart)
    dmgnoise = 1;
global.inv = global.invc * 40;
with (obj_mike_minigame_controller)
    event_user(11);
