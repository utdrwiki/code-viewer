timer--;
if (!init)
{
    heartlight = instance_create(x, y, obj_lightsource_heartlight);
    heartlight.radius = 75;
    if (difficulty < 2)
    {
        lightsource = instance_create(x, y, obj_lightsource_static);
        lightsource.visible = false;
        lightsource.radius = 300 - (difficulty * 150);
    }
    init = true;
    choice = irandom(3);
    length = string_length(pattern[choice]);
}
if (timer <= 0 && index < length)
{
    var _bullet = instance_create(x, y, obj_darkness_sound_bullet);
    _bullet.dir = real(string_char_at(pattern[choice], index + 1));
    _bullet.delay = delay * 2;
    _bullet.depth = 8;
    scr_bullet_inherit(_bullet);
    timer = delay * real(string_char_at(timing[choice], index + 1));
    index++;
}
