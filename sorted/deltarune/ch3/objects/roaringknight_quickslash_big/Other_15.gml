if (active == 1)
{
    playerstrike = 1;
    active = 0;
    memheartx = obj_heart.x;
    memhearty = obj_heart.y;
    obj_heart.image_alpha = 0;
    global.inv = -1;
    cuty = round(remap_clamped(-16, 16, 1, 14, obj_heart.y - (y - 8)));
}
