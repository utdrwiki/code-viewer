if (con > 0)
{
    if (obj_heart.x < (obj_growtangle.xstart - 70))
        obj_heart.x = obj_growtangle.xstart - 70;
    if (obj_heart.x > (obj_growtangle.xstart + 52))
        obj_heart.x = obj_growtangle.xstart + 52;
    if (heart_y == -1)
    {
        if (obj_heart.y < (obj_growtangle.y - 122))
            obj_heart.y = obj_growtangle.y - 122;
        if (obj_heart.y > (obj_growtangle.y - 60))
            obj_heart.y = obj_growtangle.y - 60;
    }
    else
    {
        if (obj_heart.y > (obj_growtangle.y + 100))
            obj_heart.y = obj_growtangle.y + 100;
        if (obj_heart.y < (obj_growtangle.y + 40))
            obj_heart.y = obj_growtangle.y + 40;
    }
}
