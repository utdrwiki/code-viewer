if (im_done)
    exit;
var a = (global.hp[2] - 30) / 250;
if (a < 0)
    a = 0;
damage = lerp(12, 90, a);
if (active == 1)
{
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all();
    if (destroyonhit == 1)
        instance_destroy();
}
