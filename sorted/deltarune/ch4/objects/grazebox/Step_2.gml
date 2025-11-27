if (instance_exists(obj_heart))
{
    sizexoff = 0;
    sizeyoff = 0;
    x = obj_heart.x + (obj_heart.sprite_width / 2) + sizexoff;
    y = obj_heart.y + (obj_heart.sprite_height / 2) + sizeyoff;
}
else
{
    instance_destroy();
}
