if (scr_debug())
{
    var _change = false;
    if (keyboard_check_pressed(ord("K")))
        toggle_effect();
    if (keyboard_check_pressed(ord("P")))
    {
        if (!active)
            active = true;
        show_debug = !show_debug;
        if (!show_debug)
            scr_debug_delete_persistent("Rainshader");
        _change = true;
    }
    if (keyboard_check_pressed(ord("O")))
    {
        color_overlay = !color_overlay;
        event_user(0);
    }
    if (show_debug)
    {
        if (keyboard_check_pressed(ord("Q")))
        {
            _change = true;
            rain_style--;
        }
        if (keyboard_check_pressed(ord("E")))
        {
            _change = true;
            rainsplash = !rainsplash;
        }
        if (keyboard_check_pressed(ord("W")))
        {
            _change = true;
            rain_style++;
        }
        if (keyboard_check_pressed(ord("H")))
        {
            _change = true;
            xdir = 0 - xdir;
            scr_debug_print("Flipped rain direction");
        }
        if (keyboard_check_pressed(ord("T")))
        {
            _change = true;
            genspeed--;
        }
        if (keyboard_check_pressed(ord("Y")))
        {
            _change = true;
            genspeed++;
        }
        if (keyboard_check_pressed(ord("U")))
        {
            _change = true;
            speed_mul--;
            if (speed_mul <= 0)
                speed_mul = 1;
        }
        if (keyboard_check_pressed(ord("I")))
        {
            _change = true;
            speed_mul++;
        }
    }
    if (_change)
    {
        rain_style = scr_loop(rain_style, 6);
        if (rain_style < 2 || rain_style == 4)
        {
            xspeed = 1;
            yspeed = 2;
        }
        else if (rain_style < 4)
        {
            xspeed = 2;
            yspeed = 2;
        }
        else
        {
            xspeed = 0;
            yspeed = 1;
        }
        if (rain_style >= 4)
        {
            sprite_index = rain_sprite[rain_style];
            if (rain_style == 4 && xdir == -1)
                sprite_index = spr_lw_rain_style_e_flip;
        }
    }
    event_user(0);
}
if (!active)
    exit;
if (global.interact == 3 && !room_exit)
{
    room_door = true;
    var _found = false;
    with (obj_doorAny)
    {
        if (touched == 1 && doorRoom == room_schoollobby)
        {
            _found = true;
            break;
        }
    }
    if (!_found)
    {
        with (obj_doorX_musfade)
        {
            if (touched == 1)
            {
                _found = true;
                break;
            }
        }
    }
    if (_found)
        event_user(2);
}
if (!init)
{
    var _entering = false;
    if (array_length(global.currentsong) <= 2 || !snd_is_playing(global.currentsong[3]))
    {
        global.currentsong[2] = snd_init("raining.ogg");
        global.currentsong[3] = mus_loop(global.currentsong[2]);
        global.currentsong[4] = snd_init("raining_in_church2.ogg");
        global.currentsong[5] = mus_loop(global.currentsong[4]);
        mus_volume(global.currentsong[5], 0, 0);
        _entering = true;
    }
    if (prewarm)
    {
        if (!crossfade)
            mus_volume(global.currentsong[3], 0.5, 14);
        build_timer = 120;
    }
    else
    {
        mus_volume(global.currentsong[3], 0, 0);
        build_timer = 0;
    }
    if (room == room_beach)
        instance_create(obj_wave_fx.x, obj_wave_fx.y, obj_wave_fx_raining);
}
var _gen = genspeed;
if (build_timer < 120 && !wrap_up)
{
    build_timer++;
    _gen = floor(lerp(genspeed - 20, genspeed, build_timer / 120));
    if (build_timer == 100)
        rainsplash = true;
    if (build_timer < 120)
    {
        drop_timer++;
        if (drop_timer >= drop_wait)
        {
            drop_timer = 0;
            drop_wait = max(drop_wait * 0.75, 2);
        }
    }
    if (build_timer == 10)
        mus_volume(global.currentsong[3], 0.5, 110);
}
if (wrap_up)
{
    if (build_timer > 0)
        build_timer--;
    if (build_timer < 100)
        exit;
    if (build_timer == 0)
        instance_destroy();
}
dropcount = instance_number(obj_lw_raindrop);
if (rain_style < 4)
{
    if (timer >= 0 && dropcount < max_particles)
    {
        if (prewarm)
            cam_x = camerax();
        var _xbuffer = xspeed * 240;
        var _xrange = 320 + (xspeed * 240);
        var _offx = 320;
        if (!prewarm && cam_y != cameray() && !ypan)
        {
            var _ydiff = abs(cam_y - cameray());
            if (dropcount < (genspeed * 25))
                _gen += _ydiff;
            else if (dropcount > (genspeed * 30))
                _gen -= _ydiff;
        }
        var _spawncount = max(_gen, 1);
        if (prewarm)
            _spawncount *= 25;
        if (xdir > 0)
            _offx = 0;
        var _speed = speed_mul;
        speed_sin++;
        repeat (_spawncount)
        {
            var _raindrop;
            if (prewarm)
            {
                _raindrop = instance_create(camerax() + irandom(360) + (32 * xdir), (cameray() - 38) + irandom(278), obj_lw_raindrop);
                if (inherit_visibility)
                    _raindrop.visible = visible;
            }
            else
            {
                var _side_random = irandom(360) + (32 * xdir);
                var _foff = irandom(speed_mul * yspeed);
                _raindrop = instance_create((camerax() + _side_random) - (_foff * xspeed * xdir), cameray() - (_foff * yspeed), obj_lw_raindrop);
                if (inherit_visibility)
                    _raindrop.visible = visible;
            }
            _raindrop.sprite_index = rain_sprite[rain_style];
            _raindrop.image_speed = 0;
            _raindrop.image_index = irandom(9);
            _raindrop.hspeed = xspeed * xdir * _speed;
            _raindrop.vspeed = yspeed * _speed;
            _raindrop.depth = depth - 10;
            _raindrop.image_xscale *= xdir;
        }
        dropcount += _spawncount;
        if (prewarm)
            prewarm = false;
        timer = _gen;
    }
    else
    {
        timer++;
    }
}
else
{
    timer++;
    if (timer >= (sprite_height * sprite_width))
        timer -= (sprite_height * sprite_width);
}
cam_y = cameray();
init = true;
