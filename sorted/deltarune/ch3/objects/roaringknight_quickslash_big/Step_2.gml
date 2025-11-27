if (playerstrike == 1)
{
    if (obj_heart.x != memheartx)
        obj_heart.x = memheartx + sign(obj_heart.x - memheartx);
    if (obj_heart.y != memhearty)
        obj_heart.y = memhearty + sign(obj_heart.y - memhearty);
    memheartx = obj_heart.x;
    memhearty = obj_heart.y;
}
