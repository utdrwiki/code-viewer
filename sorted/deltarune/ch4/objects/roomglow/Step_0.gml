if (init == false)
{
    if (!i_ex(obj_sprhighlight))
        instance_create(x, y, obj_sprhighlight);
    create_highlight(obj_mainchara);
    create_highlight(obj_caterpillarchara);
    create_highlight(obj_actor);
    lerper = glow;
    if (fadeparallax)
    {
        if (layer_exists("PARALLAX_1"))
        {
            var targdepth = layer_get_depth("PARALLAX_1") - 1;
            var bgmark = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_black, targdepth);
            array_push(legendmarker, bgmark);
        }
    }
}
if (scr_debug() && keyboard_check_pressed(vk_add))
{
    falling = true;
    fall_timer = 0;
}
if (falling == true)
{
    if (fall_timer == 0)
    {
        shadows = false;
        active = true;
        glow = 1;
        with (obj_sprhighlight)
            yoffset = -2;
        transition_length = 30;
    }
    if (fall_timer == 30)
    {
        snd_play(snd_glassbreak, 1, 0.5);
        snd_play_delay(snd_glassbreak, 4, 0.5, 0.5);
    }
    if (fall_timer >= 30 && fall_timer <= 33)
    {
        with (obj_sprhighlight)
            yoffset = remap(30, 33, -2, 2, other.fall_timer);
    }
    if (fall_timer >= 40)
    {
        active = false;
        fall_timer = 0;
        falling = false;
    }
    else
    {
        fall_timer++;
    }
}
var _debug_toggle = scr_debug() && keyboard_check_pressed(ord("V"));
if (_debug_toggle)
{
    shadows = true;
    active = !active;
    debug_print("roomglow toggled");
    glow = round(clamp01(1 - glow));
    if (keyboard_check(vk_lshift))
        lerper = glow;
}
if (lerper != glow || !init || _debug_toggle)
{
    lerper = scr_movetowards(lerper, glow, 1 / transition_length);
    strength = scr_ease_out(lerper, 2);
    with (obj_sprhighlight)
        image_alpha = other.strength;
    if (shadows)
    {
        with (obj_floorshadow)
        {
            stretch = lerp(other.min_stretch, other.stretch, other.strength);
            image_alpha = other.strength;
        }
    }
}
init = true;
if (init)
{
    if (active)
        actind = lerp(actind, 1.05, lerpstrength);
    else
        actind = lerp(actind, -0.05, lerpstrength);
    if (stayactive != -1)
        actind = stayactive;
    actind = clamp(actind, 0, 1);
    with (obj_sprhighlight)
    {
        if (!i_ex(target))
            continue;
        image_alpha = other.actind;
        target.image_angle = 0;
    }
    if (shadows)
    {
        with (obj_floorshadow)
        {
            stretch = other.actind * 2;
            if (scr_debug())
            {
            }
            image_alpha = other.actind;
        }
    }
    for (var i = 0; i < array_length(legendmarker); i++)
    {
        with (legendmarker[i])
            image_alpha = other.actind;
    }
    strength = actind;
}
if (shadow_kill)
{
    with (obj_floorshadow)
        instance_destroy();
}
