with (shadow)
{
    depth = obj_mainchara.depth + 1;
    setxy(obj_mainchara.x + 18, obj_mainchara.y + 66);
    if (obj_mainchara.image_index == 1 || obj_mainchara.image_index == 3)
        x -= 2;
}
