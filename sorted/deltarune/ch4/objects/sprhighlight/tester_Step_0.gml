if (init == false && i_ex(obj_caterpillarchara))
{
    var _highlight = scr_sprhighlight(1049);
    _highlight.darkness = 1;
    var _shadow = instance_create(x, y, obj_floorshadow);
    _shadow.target = 1049;
    _shadow.image_alpha = 0;
    _shadow.name = "kris";
    with (obj_caterpillarchara)
    {
        _shadow = instance_create(x, y, obj_floorshadow);
        _shadow.target = id;
        _shadow.name = name;
        _shadow.image_alpha = 0;
        _highlight = scr_sprhighlight(id);
        _highlight.darkness = 1;
    }
    global.currentsong[0] = snd_init("church_hymn.ogg");
    global.currentsong[1] = mus_loop(global.currentsong[0]);
    mus_volume(global.currentsong[1], 1, 0);
    init = true;
}
if (keyboard_check(vk_lcontrol))
{
    if (up_p())
    {
        with (obj_sprhighlight)
            yoffset -= 2;
    }
    if (down_p())
    {
        with (obj_sprhighlight)
            yoffset += 2;
    }
    if (left_p())
    {
        with (obj_sprhighlight)
            xoffset -= 2;
    }
    if (right_p())
    {
        with (obj_sprhighlight)
            xoffset += 2;
    }
}
var _vpress = keyboard_check_pressed(ord("V"));
if (_vpress)
{
    lerp_target = 1 - lerp_target;
    if (keyboard_check(vk_lshift))
        lerper = lerp_target;
}
if (lerper != lerp_target || _vpress)
{
    lerper = scr_movetowards(lerper, lerp_target, 0.05);
    strength = scr_ease_out(lerper, 2);
    with (obj_sprhighlight)
    {
        strength = other.strength;
        image_alpha = other.strength;
    }
    if (palette == 1)
    {
        with (obj_floorshadow)
        {
            stretch = 1 + (other.strength * 2);
            image_alpha = other.strength;
        }
        mus_volume(global.currentsong[1], strength, 0);
    }
}
if (keyboard_check_pressed(ord("N")))
{
    palette++;
    if (palette == 2)
        palette = 0;
    if (palette == 0)
    {
        tint = 4210752;
        with (obj_sprhighlight)
        {
            image_blend = scr_get_outline_color(target);
            darkness_tint = other.tint;
        }
        with (obj_floorshadow)
            image_alpha = 0;
    }
    else if (palette == 1)
    {
        tint = 16726314;
        with (obj_sprhighlight)
        {
            image_blend = #42D0FF;
            darkness_tint = other.tint;
        }
        with (obj_floorshadow)
            image_alpha = other.strength;
    }
}
