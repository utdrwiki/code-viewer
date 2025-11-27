if ((timer % frequency) == 0)
{
    angle = (angle + random_range(30, 330)) % 360;
    var _length = random(size);
    var _xx = lengthdir_x(_length, angle);
    var _yy = lengthdir_x(_length, angle);
    if (timer == lifetime)
    {
        _xx = 0;
        _yy = 0;
    }
    else
    {
        _xx += 25;
        _yy += 25;
    }
    var fx = instance_create(x + _xx, y + _yy, obj_animation);
    fx.sprite_index = spr_explosion_round;
    fx.image_xscale = (timer == lifetime) ? 2 : 1;
    fx.image_yscale = (timer == lifetime) ? 2 : 1;
    fx.image_speed = 0.5;
    fx.depth = (timer == lifetime) ? (depth - 1) : depth;
    if (lastSound != 0)
        audio_stop_sound(lastSound);
    lastsound = snd_play_pitch(snd_explosion_firework, 1.1 + random(0.4));
    if (timer == lifetime)
        instance_destroy();
}
timer++;
