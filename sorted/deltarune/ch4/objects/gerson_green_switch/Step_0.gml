if (image_index > 4)
{
    if (timer < 1)
    {
        chev = instance_create(x - 15, y, obj_gerson_green_chevron);
        chev.image_blend = merge_color(c_lime, c_black, 0.2 * timer);
    }
    timer++;
}
if (image_index <= 3 && image_alpha == 1)
{
    y = lerp(y, cameray() + (cameraheight() / 2), 0.3);
    if (i_ex(_oflash))
        _oflash.y = y;
}
if (image_index > 6.5)
{
    with (obj_hammer_of_justice_enemy)
        image_alpha = 1;
    with (obj_sound_of_justice_enemy)
        image_alpha = 1;
    image_alpha = 0;
    image_speed = 0;
    timer2++;
    if (timer2 > 3)
        y = lerp(y, ystart, 0.4);
    if (i_ex(obj_hammer_of_justice_enemy))
        obj_hammer_of_justice_enemy.y = y;
    if (i_ex(obj_sound_of_justice_enemy))
        obj_sound_of_justice_enemy.y = y;
    if (timer2 == 10)
    {
        if (i_ex(obj_hammer_of_justice_enemy))
            obj_hammer_of_justice_enemy.y = obj_hammer_of_justice_enemy.ystart;
        if (i_ex(obj_sound_of_justice_enemy))
            obj_sound_of_justice_enemy.y = obj_sound_of_justice_enemy.ystart;
        instance_destroy();
    }
}
if (image_index > 3 && type == 1)
    image_index = 3;
