if (i_ex(my_flash))
{
    with (my_flash)
    {
        x = other.x;
        y = other.y;
    }
}
with (obj_growtangle)
{
    obj_heart.x = clamp(obj_heart.x, x - 71, x + 53);
    obj_heart.y = clamp(obj_heart.y, y - 71, y + 53);
}
