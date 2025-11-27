if (global.turntimer < 1 || global.fighting == 0)
{
    image_alpha -= 0.2;
    if (image_alpha < 0.1)
    {
        instance_destroy();
        exit;
    }
}
with (obj_growtangle)
{
    var ydiff = y - yprevious;
    with (obj_heart)
        y = clamp(y + ydiff, scr_get_box(1) + 3, obj_growtangle.y + 53);
    with (obj_gerson_shell_pinball)
        y += ydiff;
}
if (i_ex(my_flash))
    my_flash.x = x;
