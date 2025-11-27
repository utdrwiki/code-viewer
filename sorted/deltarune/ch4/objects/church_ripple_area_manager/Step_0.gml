scr_populatechars();
var silent = 0;
if (i_ex(obj_dw_churchb_ripple1))
    silent = 1;
var ripplealphaoffset = 0;
with (obj_dw_churchb_gersonchase)
    ripplealphaoffset = darkindex;
if (init == 0)
{
    with (obj_church_ripple_area)
        visible = false;
    member[0] = kris;
    member[1] = susie;
    member[2] = ralsei;
    init = 1;
}
if (active)
{
    for (var i = 0; i < 1; i++)
    {
        if (i_ex(member[i]))
        {
            var ripple;
            with (member[i])
                ripple = instance_place(x, y, obj_church_ripple_area);
            if (i_ex(ripple) || other.alwaysrip)
            {
                var ripkind = 0;
                with (member[i])
                {
                    with (instance_place(x, y, obj_slowwalk))
                    {
                        ripkind = 1;
                        if (maxwalkspeed <= 3)
                            ripkind = 2;
                    }
                }
                if ((member[i].image_index == 1 || other.makefirstrip == true) && stepped[i] == false)
                {
                    other.makefirstrip = false;
                    var vx = 0;
                    var vy = 0;
                    stepped[i] = true;
                    var snd = 348;
                    if (ripkind == 1)
                        snd = 118;
                    if (ripkind == 2)
                        snd = 118;
                    var pitchmod = 1;
                    if (ripkind == 1)
                        pitchmod = 0.8;
                    if (ripkind == 2)
                        pitchmod = 0.6;
                    if (!silent)
                    {
                        if (i == 0)
                            snd_play_x(snd, 1, 0.8 * pitchmod);
                        if (i == 1)
                            snd_play_x(snd, 0.2, 0.8 * pitchmod);
                        if (i == 2)
                            snd_play_x(snd, 0.2, 1.1 * pitchmod);
                    }
                    for (var j = 0; j < 2; j++)
                    {
                        if (j == 0)
                        {
                            if (i_ex(obj_dw_church_waterfallroom))
                            {
                                with (obj_dw_church_waterfallroom.bellint)
                                {
                                    var maxdist = 480;
                                    var dist = distance_to_point(other.member[0].x, other.member[0].y);
                                    if (dist < maxdist)
                                        scr_fancy_ripple(x + (sprite_width / 2), y + (sprite_height / 2), 60, 65535, 120, 1, 15, 1999000);
                                }
                            }
                        }
                        var _sizeMod = 1;
                        if (instance_exists(obj_dw_churchc_treasurechest))
                            ripkind = 3;
                        if (ripkind == 1)
                            _sizeMod = 0.5;
                        if (ripkind == 2)
                            _sizeMod = 0.4;
                        if (ripkind == 3)
                            _sizeMod = 0.7;
                        scr_fancy_ripple(member[i].x + 18 + vx, member[i].y + 72 + vy, 60, 16159050, 220 * _sizeMod, 1, 18 * _sizeMod, 1999000, member[i].px * 1.05, member[i].py * 1.05);
                        scr_fancy_ripple(member[i].x + 18 + vx, member[i].y + 72 + vy, 60, 16159050, 140 * _sizeMod, 1, 15 * _sizeMod, 1999000, member[i].px * 1.05, member[i].py * 1.05);
                    }
                }
                if (member[i].image_index == 0 || member[i].image_index == 2 || member[i].image_index == 3)
                    stepped[i] = false;
            }
        }
    }
}
if (lightcon == -1)
{
    active = false;
    var start_x_pos = 0;
    if (i_ex(obj_ch4_DCA04))
        start_x_pos = 8440;
    var dostart = 0;
    if (kris.x >= start_x_pos)
        dostart = true;
    with (obj_ch4_DCA04)
    {
        if (con > 1)
            dostart = true;
    }
    if (dostart)
    {
        if (instance_exists(obj_ch4_DCA04))
        {
        }
        active = true;
        if (layer_exists("WALLTILES"))
            layer_set_visible("WALLTILES", 1);
        if (layer_exists("FLOORTILES"))
            layer_set_visible("FLOORTILES", 0);
        with (obj_mainchara)
            image_blend = c_black;
        with (obj_treasure_room)
            image_blend = c_black;
        with (obj_caterpillarchara)
            image_blend = c_black;
        lightcon = 0;
    }
}
if (lightcon == 0)
{
    var end_pos = new Vector2(room_width, room_height);
    if (i_ex(obj_ch4_DCA04))
        end_pos = new Vector2(2582, 0);
    if (i_ex(kris))
    {
        if ((kris.x >= end_pos.x && kris.y >= end_pos.y) || (scr_debug() && keyboard_check_pressed(ord("M"))))
            lightcon = 1;
    }
}
if (lightcon == 1)
{
    lightcon = 2;
    with (obj_mainchara)
        image_blend = c_white;
    with (obj_caterpillarchara)
        image_blend = c_white;
    safe_delete(obj_church_ripple);
    safe_delete(obj_fancy_ripples);
    safe_delete(obj_fancy_ripples_alt);
    with (obj_treasure_room)
    {
        image_blend = c_white;
        if (image_index != 1)
            instance_destroy();
    }
    layer_set_visible("WALLTILES", 0);
    layer_set_visible("FLOORTILES", 1);
    active = false;
}
