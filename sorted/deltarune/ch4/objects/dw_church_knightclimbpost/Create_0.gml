layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
        global.tempflag[90] = 1;
}
giant_door_marker = scr_dark_marker(237, 167, spr_giantdarkdoor);
with (giant_door_marker)
    scr_depth();
pillar = -4;
pillar_con = 0;
pillar_active = false;
pillar_pan = false;
pillar_pan_timer = 0;
con = -1;
_show_border = true;
if (global.plot < 195)
{
    con = 0;
    scr_setparty(1, 1);
    if (scr_debug())
    {
        if (!snd_is_playing(global.currentsong[1]) && global.tempflag[90] != 2)
            mus_play_ext("creepychase.ogg", 1, 0.7, 1.2);
    }
    var door_block = instance_create(giant_door_marker.x + 30, giant_door_marker.y + 273, obj_solidblockDark);
    with (door_block)
        image_xscale = 5;
    var door_readable = instance_create(giant_door_marker.x + 40, giant_door_marker.y + 250, obj_readable_room1);
    with (door_readable)
    {
        extflag = "grand_door";
        image_xscale = 8;
        image_yscale = 2;
    }
}
else
{
    giant_door_marker.image_index = 1;
    walk_timer = 0;
    blackall = -4;
    if (global.plot >= 240)
    {
        giant_door_marker.image_index = 0;
        if (global.plot < 243)
        {
            con = 20;
            scr_setparty(1, 1);
            blackall = scr_dark_marker(-10, -10, spr_pixel_white);
            blackall.image_xscale = 999;
            blackall.image_yscale = 999;
            blackall.depth = 100;
            blackall.image_blend = c_black;
            blackall.image_alpha = 1;
            blackall.visible = 1;
            _show_border = false;
        }
        if (global.flag[1658] == 1)
        {
            scr_setparty(1, 1);
            pillar = instance_create(1000, 524, obj_dw_leave_ch4);
            pillar_active = false;
            if (global.flag[1659] == 0 && global.plot >= 243)
            {
                if (blackall == -4)
                {
                    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
                    blackall.image_xscale = 999;
                    blackall.image_yscale = 999;
                    blackall.depth = 100;
                    blackall.image_blend = c_black;
                }
                blackall.image_alpha = 1;
                pillar.scene_mode = true;
                con = 40;
                global.interact = 1;
                _show_border = false;
            }
            else
            {
                pillar_active = true;
                pillar_trigger = instance_create(pillar.x - 160, pillar.y - 50, obj_trigger);
                with (pillar_trigger)
                {
                    image_xscale = 10;
                    image_yscale = 10;
                    if (global.flag[1660] == 1)
                        x += 40;
                }
                if (global.tempflag[58] == 1)
                {
                    pillar_con = 30;
                    global.tempflag[58] = 0;
                    scr_setparty(1, 1);
                    if (blackall == -4)
                    {
                        blackall = scr_dark_marker(-10, -10, spr_pixel_white);
                        blackall.image_xscale = 999;
                        blackall.image_yscale = 999;
                        blackall.depth = 100;
                    }
                    blackall.image_alpha = 1;
                    blackall.image_blend = c_white;
                    with (obj_border_controller)
                    {
                        stop_custom_effect();
                        hide_border();
                    }
                }
                _show_border = true;
            }
        }
    }
    else
    {
        var door_block = instance_create(giant_door_marker.x + 30, giant_door_marker.y + 273, obj_solidblockDark);
        with (door_block)
            image_xscale = 5;
        var door_readable = instance_create(giant_door_marker.x + 40, giant_door_marker.y + 250, obj_readable_room1);
        with (door_readable)
        {
            extflag = "grand_door";
            image_xscale = 8;
            image_yscale = 2;
        }
    }
}
customcon = 0;
timer = 0;
roaring_knight = instance_create(2000, 890, obj_ch4_DCA01_roaringknight);
roaring_knight.sprite_index = spr_roaringknight_arms_cross;
roaring_knight.image_index = 0;
roaring_knight.depth = 899990;
giant_door_marker.depth = roaring_knight.depth + 100;
camera_pan = false;
camera_pan_timer = 0;
camera_y_pos = 6880;
camera_x_pos = 6880;
camera_x_target = 1419;
camera_y_target = 1542;
switch_marker = scr_dark_marker(3040, 1300, spr_dw_church_switch);
with (switch_marker)
{
    image_index = 0;
    scr_depth();
}
switch_readable = instance_create(switch_marker.x + 10, switch_marker.y + 10, obj_readable_room1);
with (switch_readable)
    extflag = "switch";
if (global.plot >= 195)
{
    with (roaring_knight)
        instance_destroy();
}
if (global.plot >= 240)
{
    with (switch_marker)
        instance_destroy();
    with (switch_readable)
        instance_destroy();
}
exit_block = instance_create(3080, 1360, obj_solidblockDark);
with (exit_block)
    image_yscale = 2;
cover_markers = [];
for (var i = 0; i < 6; i++)
{
    var cover_marker = scr_marker(3080 + (i * 80), 1360, spr_blank_tile_black);
    with (cover_marker)
    {
        depth = layer_get_depth("ASSETS_Bridge") - 10;
        image_xscale = 2;
        image_yscale = 2;
    }
    cover_markers[i] = cover_marker;
}

unlock_bridge = function()
{
    with (exit_block)
        instance_destroy();
    var i = array_length(cover_markers) - 1;
    while (i >= 0)
    {
        with (cover_markers[i])
        {
            with (instance_create(x, y, obj_dw_church_magicalglass_breakable))
                scr_darksize(id);
            instance_destroy();
        }
        i--;
    }
    with (switch_readable)
        instance_destroy();
};

unlock_anim = function()
{
    if (scr_flag_get(1567) == 0)
        scr_flag_set(1567, 1);
    with (switch_marker)
        image_index = 1;
    snd_play(snd_locker);
    scr_shakescreen();
    for (var i = 0; i < array_length(cover_markers); i++)
    {
        with (cover_markers[i])
        {
            with (instance_create(x, y, obj_dw_church_magicalglass_breakable))
            {
                scr_darksize(id);
                image_alpha = 0;
                idlealpha = 0;
                scr_script_delayed(scr_lerp_var_instance, 1 + (i * 4), id, "idlealpha", 0, 0.2, 20, 3, "out");
            }
            instance_destroy();
        }
    }
    with (exit_block)
        instance_destroy();
    with (switch_readable)
        instance_destroy();
};

if (global.plot < 242 && scr_flag_get(1567) == 1)
{
    unlock_bridge();
    with (switch_marker)
        instance_destroy();
}

regain_control = function()
{
    global.interact = 0;
    global.facing = 0;
    var kr_x = kr_actor.x;
    var kr_y = kr_actor.y;
    obj_mainchara.x = kr_x;
    obj_mainchara.y = kr_y;
    obj_mainchara.visible = 1;
    obj_mainchara.cutscene = 0;
    var su_x = su_actor.x;
    var su_y = su_actor.y;
    var ra_x = ra_actor.x;
    var ra_y = ra_actor.y;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            x = su_x;
            y = su_y;
        }
        else if (name == "ralsei")
        {
            x = ra_x;
            y = ra_y;
        }
        scr_caterpillar_interpolate();
        visible = 1;
    }
    with (obj_actor)
        visible = 0;
};

lose_control = function()
{
    global.interact = 1;
    global.facing = 0;
    kr_actor.x = obj_mainchara.x;
    kr_actor.y = obj_mainchara.y;
    kr_actor.sprite_index = obj_mainchara.sprite_index;
    var su_x = 0;
    var su_y = 0;
    var su_sprite = -4;
    var ra_x = 0;
    var ra_y = 0;
    var ra_sprite = -4;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            su_x = x;
            su_y = y;
            su_sprite = sprite_index;
        }
        else if (name == "ralsei")
        {
            ra_x = x;
            ra_y = y;
            ra_sprite = sprite_index;
        }
    }
    su_actor.x = su_x;
    su_actor.y = su_y;
    su_actor.sprite_index = su_sprite;
    ra_actor.x = ra_x;
    ra_actor.y = ra_y;
    ra_actor.sprite_index = ra_sprite;
    with (obj_actor)
        visible = 1;
    with (obj_caterpillarchara)
        visible = 0;
    with (obj_mainchara)
        visible = 0;
};

greenflame = -4;
flamefade = false;
if (global.plot >= 243)
    event_user(9);
