if (parentid == -1 || !i_ex(parentid))
{
    instance_destroy();
    exit;
}
depth = 1000000 - (((y + 10) * 10) + ((sprite_height - sprite_yoffset) * 10));
x = round(parentid.x / 2) * 2;
y = round(parentid.y / 2) * 2;
