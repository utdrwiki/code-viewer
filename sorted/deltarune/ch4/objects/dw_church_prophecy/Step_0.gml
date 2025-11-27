if (!init)
{
    init = true;
    if (i_ex(obj_dw_churchb_prophecymaze))
        church = 2;
    if (i_ex(obj_dw_churchb_darkclimb))
        church = 3;
    if (i_ex(obj_dw_church_pianopiece_left_b))
        musickind = 1;
    if (i_ex(obj_dw_church_pianopiece_rightprophecy))
        musickind = 2;
    if (room == room_dw_church_bellhall_curtain)
        musickind = 3;
    sprite_index = spr_dw_church_prophecy_initial1;
    var tempname = asset_get_index("spr_dw_church_prophecy_" + extflag);
    if (sprite_exists(tempname))
        sprite_index = tempname;
    if (extflag == "knight2")
        sprite_index = spr_dw_church_prophecy_knight1;
    scr_darksize();
    var _text = scr_prophecytext(extflag);
    with (prophecy_text)
        initialize_text(_text, 0, 0);
    var _icon = asset_get_index("spr_dw_church_prophecy_" + extflag + "_icon");
    if (sprite_exists(_icon))
    {
        if (extflag == "knight2")
            _icon = 2478;
        prophecy_icon.initialize_sprite(_icon);
    }
}
siner++;
if (falltest && active && destroy == 0 && y < (cameray() + 240))
    destroy = 1;
if (destroy == 1)
{
    destroy = 2;
    var delaytime = 30;
    if (destroykind == 2)
        delaytime = 10;
    if (destroykind == 3)
        delaytime = 5;
    if (breakdelay != -1)
        delaytime = breakdelay;
    scr_delay_var("destroy", 3, delaytime);
    var type = destroykind;
    if (!nodestroysound)
    {
        var snd = snd_play_complex(0, 0, undefined);
        if (!nodestroysecondsound)
        {
            snd_add_complex(snd, 0, 236, 0.6, 0.4, (delaytime - 1) + 2, -1, 0);
            snd_add_complex(snd, 1, 390, 0.8, 0.5, (delaytime - 1) + 0, -1, 0);
            snd_add_complex(snd, 2, 390, 0.71, 0.5, (delaytime - 1) + 0, -1, 0);
            snd_add_complex(snd, 3, 269, 0.7, 0.95, (delaytime - 1) + 0, -1, 0);
        }
        if (destroykind != 3)
            snd_add_complex(snd, 4, 321, 1, 0.95, 0, -1, 0);
    }
    var _shattersprite = (type != 2) ? 5059 : 907;
    var count = sprite_get_number(_shattersprite);
    for (var i = 0; i < count; i++)
    {
        with (scr_marker_ext(x - 199, y - 120, _shattersprite, 2, 2, 0, i, c_white, depth))
        {
            if (type == 0)
            {
                depth = other.depth;
                if (depth < 5000)
                    depth = 5000;
                image_alpha = 0.8;
                speed = 2;
                friction = 0.5;
                direction = random(360);
                scr_delay_var("gravity", 0.5 + random(0.1), delaytime);
                scr_delay_var("friction", 0, delaytime);
                scr_delay_var("speed", 2, delaytime);
                scr_doom(id, 120);
            }
            if (type == 1)
            {
                depth = other.depth;
                if (depth < 5000)
                    depth = 5000;
                image_alpha = 0.8;
                speed = 2;
                friction = 0.5;
                direction = random(360);
                scr_doom(id, 120);
                scr_delay_var("speed", 4, delaytime);
                scr_delay_var("friction", 0.4, delaytime);
                scr_script_delayed(scr_lerpvar, delaytime, "image_alpha", image_alpha, 0, 20);
            }
            if (type == 2)
            {
                depth = other.depth;
                image_alpha = 0.8;
                speed = 7;
                friction = 0.75;
                direction = 270 + random_range(-3, 3);
                if (i == (count - 2) || i == (count - 4))
                    hspeed = 0.5;
                if (i == (count - 1) || i == (count - 3))
                    hspeed = -0.5;
                gravity_direction = 90;
                scr_delay_var("gravity", 0.25 + random(0.1), delaytime);
                scr_delay_var("friction", 0, delaytime);
                scr_delay_var("speed", 2 + (((count - i) / count) * 15), delaytime);
                if (i > (count - 5) || (i % 2) == 0)
                    scr_delay_var("depth", depth + 30, delaytime);
            }
            if (type == 3)
            {
                depth = other.depth;
                if (depth < 5000)
                    depth = 5000;
                image_alpha = 0.3;
                speed = 0;
                friction = 0.5;
                direction = 270;
                var delay = (delaytime * random(5)) + 1;
                scr_delay_var("gravity", 0.5 + random(0.1), delay);
                scr_delay_var("friction", 0, delay);
                scr_delay_var("speed", 2, delay);
                scr_doom(id, 120);
            }
        }
    }
}
if (destroy == 3)
{
    if (nodestroysparkles == false)
    {
        var sparklecount = 30;
        for (var i = 0; i < sparklecount; i++)
        {
            with (instance_create((x - 199) + ((i * 398) / sparklecount) + random_range(-30, 30), y + random(120), obj_dw_church_prophecy_groundshards))
            {
                ytarg = other.y + 120 + 120;
                if (other.destroykind == 3)
                {
                    ytarg += 10000;
                    scr_doom(self, 280);
                }
            }
        }
    }
    if (destroykind < 2)
        instance_destroy();
    else
        destroy = 4;
}
if (destroy)
    image_alpha = -99;
