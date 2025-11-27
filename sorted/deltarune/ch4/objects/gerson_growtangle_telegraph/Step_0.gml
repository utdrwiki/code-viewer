if (con == 0)
{
    image_alpha += 0.2;
    if (image_alpha == 1)
        con = 1;
}
else
{
    image_alpha -= 0.2;
    if (image_alpha < 0)
        instance_destroy();
}
if (global.turntimer < 1)
    instance_destroy();
