con = -1;
var _glass_readable = instance_create(324, 204, obj_readable_room1);
with (_glass_readable)
    extflag = "broken_glass";
var _poster = scr_dark_marker(170, 110, spr_dw_poster_distorted_green);
with (_poster)
{
    scr_depth();
    image_speed = 0.15;
    image_angle = 15;
}
var _poster_readable = instance_create(_poster.x, _poster.y + 40, obj_readable_room1);
with (_poster_readable)
{
    image_xscale = 2;
    image_yscale = 2;
    extflag = "poster";
}
_poster = scr_dark_marker(440, 175, spr_dw_poster_distorted_green);
with (_poster)
{
    scr_depth();
    image_speed = 0.15;
    image_angle = -15;
}
_poster_readable = instance_create(_poster.x, _poster.y + 40, obj_readable_room1);
with (_poster_readable)
{
    image_xscale = 2;
    image_yscale = 2;
    extflag = "poster";
}
var _phone_npc = instance_create(470, 275, obj_npc_room);
with (_phone_npc)
{
    extflag = "phone";
    sprite_index = spr_dw_ranking_z_phone;
}
var _manhole_marker = scr_dark_marker(176, 220, spr_dw_ranking_z_manhole);
with (_manhole_marker)
    depth = 999990;
var opened_manhole = scr_flag_get(1191) == 1;
if (global.plot >= 150)
    opened_manhole = scr_flag_get(1191) == 2;
if (!opened_manhole)
{
    var _manhole_readable = instance_create(_manhole_marker.x + 48, _manhole_marker.y, obj_readable_room1);
    with (_manhole_readable)
    {
        image_xscale = 2;
        image_yscale = 2;
        extflag = "manhole";
    }
}
else
{
    _manhole_marker.image_index = 1;
    var _door = instance_create(_manhole_marker.x + 48, _manhole_marker.y, obj_doorAny);
    with (_door)
    {
        image_yscale = 0.7;
        doorPreset = 2;
        doorRoom = room_dw_console_room;
        doorEntrance = 3;
        doorFadeMusic = true;
    }
}

enter_manhole = function()
{
    var flag_amount = (global.plot < 150) ? 1 : 2;
    scr_flag_set(1191, flag_amount);
    con = 10;
};
