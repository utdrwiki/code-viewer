if global.is_console
{
    if (chaptertoload_temp == 2)
    {
        chapter_is_loading = 1
        var car = scr_dark_marker((320 - sprite_get_width(spr_dog_sleep_launcher)), (240 - (sprite_get_height(spr_dog_sleep_launcher) * 2)), spr_dog_sleep_launcher)
        car.image_speed = 0.15
    }
}
