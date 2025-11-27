if (init == 0)
{
    timer = lifetime;
    var _variation = (lifetime * scroll_speed * scroll_dir) / 2;
    var _scroll = 240 - (_variation / 2);
    scan_x = random_range(_variation + (_variation * -scroll_dir), _scroll + (_variation * -scroll_dir));
    init = 1;
}
if (scr_debug_keycheck(vk_numpad5))
{
    if (active)
    {
        timer = 0.01;
        debug_print("STOP");
    }
    else
    {
        image_index = 0;
        if (infinite)
        {
            sprite_index = infinite_sprite;
            image_speed = 0.25;
        }
        else
        {
            sprite_index = effect_sprite;
            image_speed = 0;
        }
        event_user(0);
        debug_print("GO");
    }
}
if (scr_debug_keycheck(vk_numpad4))
{
    infinite = !infinite;
    debug_print("infinite set to " + string(infinite));
    if (timer > 0)
    {
        image_index = 0;
        if (infinite)
        {
            sprite_index = infinite_sprite;
            image_speed = 0.25;
        }
        else
        {
            sprite_index = effect_sprite;
            image_speed = 0;
        }
    }
}
x = camerax();
y = cameray();
