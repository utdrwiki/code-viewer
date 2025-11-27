if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
if (instance_exists(obj_heart))
{
    if (obj_heart.x < (x1 + 3))
        obj_heart.x = x1 + 3;
    if (obj_heart.x > (x2 - 3 - 15))
        obj_heart.x = x2 - 3 - 15;
    if (obj_heart.y < (y1 + 3))
        obj_heart.y = y1 + 3;
    if (obj_heart.y > (y2 - 3 - 15))
        obj_heart.y = y2 - 3 - 15;
}
