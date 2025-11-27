var onlyflyattack = true;
var flycount = 0;
for (var i = 0; i < instance_number(obj_dbulletcontroller); i++)
{
    dbulletcontroller[i] = instance_find(obj_dbulletcontroller, i);
    if (dbulletcontroller[i].type != 111)
        onlyflyattack = false;
    if (dbulletcontroller[i].type == 111)
        flycount++;
}
if (onlyflyattack == true)
{
    if (flycount == 1)
        ratio = 0.75;
    if (flycount == 2)
        ratio = 0.89 + (random(1) / 4);
    if (flycount == 3)
        ratio = 1 + random(1);
}
timer += 1;
if (init == 0)
{
    timer = 16 * ratio;
    init = 1;
}
if (timer >= (16 * ratio))
{
    timer -= (16 * ratio);
    repeat (sameattack)
    {
        fly = instance_create(scr_get_box(4) + irandom_range(-65, 65), scr_get_box(1) - 20, obj_ribbick_battle_fly);
        fly.target = target;
        fly.damage = damage;
    }
}
