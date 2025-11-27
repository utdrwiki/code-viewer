timer--;
if (timer <= 0)
{
    if (spreader)
    {
        var _xoff = -20;
        repeat (floor(sprite_width / 40))
        {
            d = instance_create(bbox_left + _xoff, y, obj_darkness_bullet);
            d.direction = 270;
            d.damage = 18;
            d.speed = 2;
            d.friction = -0.2;
            d.lightBullet = choose(true, false);
            _xoff += 40;
        }
        timer = 30;
    }
    else
    {
        var _spawnDir = direction;
        repeat (2)
        {
            d = instance_create(x, y, obj_darkness_bullet);
            d.direction = _spawnDir;
            d.damage = 18;
            d.speed = 5;
            if (light_mode != double_flip)
                d.lightBullet = true;
            _spawnDir -= 180;
        }
        if (double_mode)
            double_flip = !double_flip;
        timer = 4;
        direction += (light_mode ? 10 : -10);
    }
}
if (keyboard_check_pressed(ord("V")))
{
    if (keyboard_check_direct(vk_lshift))
    {
        double_mode = !double_mode;
        double_flip = false;
    }
    else
    {
        light_mode = !light_mode;
    }
}
