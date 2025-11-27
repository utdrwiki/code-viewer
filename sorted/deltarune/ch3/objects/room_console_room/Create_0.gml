with (obj_caterpillarchara)
    visible = 0;
visible = true;
shadow = 0;
var console_readable = instance_create(285, 300, obj_readable_room1);
with (console_readable)
{
    image_xscale = 18;
    image_yscale = 2;
    extflag = "console";
}
var schedule_readable = instance_create(726, 300, obj_readable_room1);
with (schedule_readable)
{
    image_xscale = 2;
    image_yscale = 2;
    extflag = "schedule";
}
con = 0;
timer = 0;
star = 0;
block = 0;
ramb_npc = -4;

block_door = function()
{
    var entrance_cover = scr_dark_marker(455, 418, spr_pixel_white);
    with (entrance_cover)
    {
        image_blend = c_black;
        image_xscale = 20;
        image_yscale = 20;
        depth = 8000;
    }
    var entrance_block = instance_create(entrance_cover.x, entrance_cover.y, obj_solidblocksized);
    with (entrance_block)
        image_xscale = 2;
};

if (global.flag[1176] == 1)
{
    star = instance_create(302, 388, obj_trigger_interact);
    with (star)
    {
        visible = true;
        sprite_index = spr_shine;
        image_speed = 0.125;
        scr_darksize();
        siner = 0;
    }
    block = instance_create(star.x - 4, star.y - 16, obj_solidblocksized);
}
var _curtain_marker = scr_marker(840, 250, spr_dw_console_room_curtain);
with (_curtain_marker)
{
    if (global.plot >= 280)
        sprite_index = spr_dw_console_room_curtain_dark;
    depth = 8000;
}
var opened_manhole = scr_flag_get(1191) == 1;
if (global.plot >= 150)
    opened_manhole = scr_flag_get(1191) == 2;
if (!opened_manhole)
{
    var _manhole_readable = instance_create(880, 380, obj_readable_room1);
    with (_manhole_readable)
    {
        extflag = "manhole";
        image_xscale = 2;
        image_yscale = 2;
    }
}
else
{
    var _door = instance_create(920, 380, obj_doorAny);
    with (_door)
    {
        doorPreset = 2;
        doorRoom = room_dw_ranking_z;
        doorEntrance = 2;
        doorFadeMusic = true;
    }
}
var ramb_moved = scr_flag_get(1029) >= 1;
if (global.plot < 280 && !ramb_moved)
    block_door();
if (global.plot >= 150 && scr_flag_get(1174) <= 0)
{
    ramb_moved = scr_flag_get(1029) >= 2;
    if (!ramb_moved)
        block_door();
}
with (obj_border_controller)
    stop_custom_effect();
if (global.plot >= 280)
{
    var lay_id = layer_get_id("BGCOLOR");
    var back_id = layer_background_get_id(lay_id);
    layer_background_sprite(back_id, 3981);
    with (obj_doorAny)
    {
        if (y >= 400)
            doorPreset = -1;
    }
    if (scr_flag_get(1055) < 4)
    {
        ramb_npc = instance_create(32, 350, obj_npc_ramb);
        if (scr_flag_get(1238) > 0)
            ramb_npc.y -= 30;
        with (ramb_npc)
            depth = 97000;
    }
    if (scr_flag_get(1055) < 6)
    {
        var glow_light = scr_marker(0, 371, spr_dw_console_room_dark_glow);
        glow_light.depth = 97010;
    }
    shadow = scr_dark_marker(obj_mainchara.x + 14, obj_mainchara.y + 66, spr_dw_console_room_shadow);
}
