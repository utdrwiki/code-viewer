var forcedark = false;
if (scr_debug())
{
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("1")))
        {
            var pos = -4;
            with (obj_markerAny)
            {
                if (image_index == 6)
                    pos = id;
            }
            if (i_ex(pos))
            {
                setxy(pos.x, pos.y, 1049);
                forcedark = true;
            }
        }
    }
}
scr_populatechars();
if (!init)
{
    var loc = -4;
    with (obj_markerAny)
    {
        if (image_index == 6)
            loc = id;
    }
    if (scr_checklocation(1049, loc.x, loc.y, 40))
    {
        forcedark = 1;
        with (obj_dw_church_organikchaser)
        {
            if (extflag == "chasec")
                instance_destroy();
        }
    }
    init = 1;
}
if (global.flag[1595] == 1 && global.flag[1616] == true)
{
    if (scr_trigcheck("TRIGGER_BLACKOUT"))
    {
        debug_print("blackout");
        event_user(1);
        global.flag[1595] = 2;
    }
}
if (lightstate == 0)
{
    with (obj_trigger)
    {
        if (extflag == "night")
        {
            if (scr_onscreen_tolerance(id, 80))
            {
                with (scr_marker_ext(x + 20, y + 20, spr_weather_moon, 2, 2, 0, undefined, undefined, layer_get_depth("RIPPLEWALLS") - 1))
                {
                    scr_lerpvar("image_alpha", 0.25, 0, 12);
                    scr_lerpvar("image_xscale", 2, 2.5, 12);
                    scr_lerpvar("image_yscale", 2, 2.5, 12);
                    gravity = -0.2;
                    scr_doom(id, 12);
                }
            }
        }
    }
    with (obj_dw_church_organikchaser)
    {
        image_blend = c_white;
        drawaura = true;
        auraalph = 1;
    }
    with (obj_dw_church_glowtile)
        glow = false;
    with (obj_church_ripple)
        visible = false;
    with (obj_fancy_ripples)
        visible = false;
    with (obj_fancy_ripples_alt)
        visible = false;
    if (scr_trigcheck("night") || forcedark)
    {
        with (obj_dw_church_glowtile)
            glow = true;
        if (!instance_exists(ripplemanager))
            ripplemanager = instance_create(0, 0, obj_church_ripple_area_manager);
        lightstate = 1;
        if (!forcedark)
            snd_play(snd_wing);
        ripplemanager.active = true;
        for (var i = 0; i < array_length(nighttimetiles); i++)
            layer_set_visible(nighttimetiles[i], true);
        for (var i = 0; i < array_length(daytimetiles); i++)
            layer_set_visible(daytimetiles[i], false);
    }
}
if (lightstate == 1)
{
    riptimer++;
    with (obj_mainchara)
        image_blend = c_black;
    with (obj_caterpillarchara)
        image_blend = c_black;
    with (obj_trigger)
    {
        if (extflag == "day")
        {
            if (scr_onscreen_tolerance(id, 80))
            {
                with (scr_marker_ext(x + 20, y + 20, spr_weather_sun, 2, 2, 0, undefined, undefined, layer_get_depth("RIPPLEWALLS") - 1))
                {
                    scr_lerpvar("image_alpha", 0.25, 0, 12);
                    scr_lerpvar("image_xscale", 2, 2.5, 12);
                    scr_lerpvar("image_yscale", 2, 2.5, 12);
                    gravity = -0.2;
                    scr_doom(id, 12);
                }
            }
        }
    }
    with (obj_dw_church_organikchaser)
    {
        image_blend = c_black;
        drawaura = false;
        auraalph = 0;
        var cx = x + 36;
        var cy = y + 70;
        var makerip = false;
        var modamt = 180;
        if (global.flag[encounterflag] != 0)
            modamt = 120;
        if (con != -1)
            modamt = 15;
        if ((other.riptimer % modamt) == 1)
            makerip = true;
        if (makerip)
            scr_fancy_ripple(cx, cy, 60, 255, 120, 1, 10);
    }
    with (obj_church_ripple)
        visible = true;
    with (obj_fancy_ripples)
        visible = true;
    with (obj_fancy_ripples_alt)
        visible = true;
    if (scr_trigcheck("day"))
    {
        with (obj_mainchara)
            image_blend = c_white;
        with (obj_caterpillarchara)
            image_blend = c_white;
        ripplemanager.active = false;
        with (obj_church_ripple)
            visible = false;
        with (obj_fancy_ripples)
            visible = false;
        with (obj_fancy_ripples_alt)
            visible = false;
        lightstate = 0;
        snd_play(snd_wing);
        for (var i = 0; i < array_length(nighttimetiles); i++)
            layer_set_visible(nighttimetiles[i], false);
        for (var i = 0; i < array_length(daytimetiles); i++)
            layer_set_visible(daytimetiles[i], true);
    }
}
