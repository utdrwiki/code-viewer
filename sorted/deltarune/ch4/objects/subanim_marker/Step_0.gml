if (!init && refresh)
{
    init = true;
    refresh = false;
    if (sub_sprites == 0)
        sub_sprites = 1;
    subframes = image_number / sub_sprites;
}
if (sub_speed != 0)
    sub_index += sub_speed;
