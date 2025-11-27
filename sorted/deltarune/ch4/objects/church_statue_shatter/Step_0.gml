if (scr_debug())
{
    if (keyboard_check_pressed(ord("R")))
        room_restart();
}
if (scr_debug() && room == room_vfx_tester)
{
    if (focus > 0 && keyboard_check_pressed(vk_right))
        focus++;
    if (focus > 1 && keyboard_check_pressed(vk_left))
        focus--;
    if (keyboard_check_pressed(ord("V")))
        show_debug = !show_debug;
    if (keyboard_check_pressed(ord("B")))
        shatter = true;
}
if ((!shattered && timer > 0) || shatter)
{
    shatter = false;
    if (!shattered)
    {
        timer++;
        if (timer == 10)
        {
            with (obj_church_old_man_ripple)
                snd_stop(hurt_noise);
        }
        if (timer >= delay)
        {
            shattered = true;
            snd_play(snd_damage, 1, 0.5);
            for (var i = 6; i < image_number; i++)
            {
                var _debris = instance_create(x + (pivot[i].x * 2), y + (pivot[i].y * 2), obj_vfx_debris);
                _debris.speed = remap_clamped(70, 0, 12, 24, abs(pivot[i].y - 76)) - (pivot[i].x / 20);
                _debris.image_index = i;
                _debris.sprite_index = sprite_index;
                _debris.depth = depth;
                _debris.fader = remap(6, image_number - 1, 2, 1, i);
                _debris.image_xscale = 2;
                _debris.interval = irandom_range(3, 6);
                if (i == 6)
                    _debris.interval = 3;
                if (i == 10)
                {
                    _debris.speed -= 6;
                    _debris.interval = 5;
                    _debris.split = true;
                    _debris.rot *= -1;
                }
                if (i == 13)
                    _debris.rot *= -1;
                _debris.image_yscale = 2;
                _debris.bottomy = (y + (sprite_height * 2)) - round(i / 2);
                _debris.direction = point_direction(x + (sprite_width * 2.5), y + (sprite_height * 1.4), x + (pivot[i].x * 2), y + (pivot[i].y * 2));
                _debris.hspeed *= 0.5;
                _debris.hspeed += 2;
                _debris.depth = depth + (i - 6);
                var _cap = -14;
                if (_debris.vspeed < _cap)
                    _debris.vspeed = _cap - ((_debris.vspeed + _cap) / 2);
            }
        }
    }
    else
    {
        timer = 0;
        shattered = false;
    }
}
if (shattered)
{
    if (timer == (delay + 15))
        snd_play(snd_damage, 0.5, 0.5);
    if (timer == (delay + 30))
        snd_play(snd_damage, 0.25, 0.5);
    if (timer == (delay + 45))
        snd_play(snd_damage, 0.125, 0.5);
    if (timer == (delay + 60))
        snd_play(snd_damage, 0.0625, 0.5);
    if (timer == (delay + 75))
        snd_play(snd_damage, 0.03125, 0.5);
}
if (shattered && timer < 100)
    timer++;
