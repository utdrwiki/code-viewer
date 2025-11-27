if (!init)
{
    depth = obj_wave_fx.depth - 50;
    init = true;
}
timer--;
if (timer < 0)
{
    timer = 2;
    var _drop = instance_create(x + random(174) + 10, y + random(220) + 10, obj_animation);
    _drop.sprite_index = spr_rain_splash;
    _drop.depth = depth + 20;
    _drop.image_speed = 0.5;
}
