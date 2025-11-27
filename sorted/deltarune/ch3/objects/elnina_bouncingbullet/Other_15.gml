if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con >= 2)
    exit;
target = 4;
if (active == 1)
{
    with (obj_tenna_zoom)
        hurt_counter++;
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all();
    if (destroyonhit == 1)
        instance_destroy();
}
