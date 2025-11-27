image_angle = direction + 180;
if (i_ex(obj_heart))
    depth = obj_heart.depth - 1;
timer--;
if (timer == 0 && ammo > 0)
{
    bomb = instance_create(x, y, obj_rouxls_helicopter_bomb);
    bomb.damage = damage;
    bomb.target = target;
    ammo--;
    timer = 6 + irandom(16);
}
if (global.turntimer < 1)
    instance_destroy();
if (x < (obj_growtangle.x - 80))
    fade = 1;
if (fade == 1)
{
    image_alpha -= 0.1;
    if (image_alpha < 0)
        instance_destroy();
}
