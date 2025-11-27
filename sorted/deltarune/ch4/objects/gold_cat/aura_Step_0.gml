if (!init)
{
    image_alpha = 0.5;
    thresh = (level * 12) - 40;
    radius = 60 + (level * 15);
    init = true;
}
timer++;
if (active)
{
    with (obj_meteor)
    {
        if (point_distance(x, y, other.x, other.y) <= other.radius)
        {
            var _a = instance_create(x, y, obj_green_cat);
            _a.chance = other.level;
            if (_a.x > 0)
            {
                _a.hspeed = point_distance(x, y, room_width, y) / 32;
                _a.friction = 0.2;
            }
            scr_sparkle_colour(4, 32768);
            instance_destroy();
        }
    }
}
if (timer >= thresh)
{
    active = 0;
    snd_volume(mysound, image_alpha, 0);
}
if (active == 0)
{
    image_alpha -= 0.025;
    if (image_alpha <= 0)
        instance_destroy();
}
