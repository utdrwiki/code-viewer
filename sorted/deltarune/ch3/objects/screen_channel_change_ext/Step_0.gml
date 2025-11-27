if (init == 0)
{
    timer = lifetime;
    var _variation = (lifetime * scroll_speed * scroll_dir) / 2;
    var _scroll = 240 - (_variation / 2);
    scan_x = random_range(_variation + (_variation * -scroll_dir), _scroll + (_variation * -scroll_dir));
    init = 1;
}
x = camerax();
y = cameray();
