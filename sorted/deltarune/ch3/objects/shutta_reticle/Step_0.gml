if (con == 0 && i_ex(obj_growtangle))
{
    if (image_alpha < 1)
        image_alpha += 0.1;
}
if (con == 1 || !i_ex(obj_growtangle))
{
    if (image_alpha > 0)
        image_alpha -= 0.1;
    if (image_alpha == 0)
        instance_destroy();
}
