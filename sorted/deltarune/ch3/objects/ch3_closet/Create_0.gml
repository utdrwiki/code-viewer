con = -1;
customcon = 0;
var _has_dealmaker = scr_armorcheck_inventory(21) || scr_armorcheck_equipped_any(21);
var _has_puppetscarf = scr_weaponcheck_inventory(21) || scr_weaponcheck_equipped_any(21);
alt_scene = (_has_dealmaker || _has_puppetscarf) && scr_flag_get(456) == 0;
item_name = "";
item_marker = -4;
item_transform = false;
item_transform_timer = 0;
item_transform_counter = 0;
item_transform_stop = false;
item_transform_speed = 1;
spamton_flash = -4;
item_flash = -4;
kris_flash = -4;
pipis_stick = false;
spamton_absorb = false;
spamton_absorb_timer = 0;
spamton_absorb_stop = false;
spray_event = false;
spray_event_timer = 0;
spray_event_stop = false;
spray_event_con = 0;
spray_triangle_width = 0;
if (alt_scene)
{
    if (_has_dealmaker)
    {
        scr_armorinfo(21);
        item_name = armornametemp;
        item_marker = scr_dark_marker(0, cameray() - 100, spr_dw_item_dealmaker);
    }
    else
    {
        scr_weaponinfo(21);
        item_name = weaponnametemp;
        item_marker = scr_dark_marker(0, cameray() - 100, spr_dw_item_puppetscarf);
    }
    with (item_marker)
        visible = 0;
}
drawer = scr_dark_marker(300, 120, spr_dw_closet);
with (drawer)
    scr_depth();
drawer_solid = instance_create(drawer.x, 180, obj_solidblocksized);
with (drawer_solid)
    image_xscale = 1.5;
drawer_readable = instance_create(drawer.x + 10, 180, obj_readable_room1);
with (drawer_readable)
{
    extflag = "wardrobe";
    image_xscale = 2;
}
both_talk = false;
both_talk_timer = 0;
both_talk_con = 0;
ralsei_face_marker = scr_dark_marker(camerax() + 463, cameray() + 341, spr_face_r_nohat);
ralsei_face_marker.image_index = 30;
ralsei_face_marker.visible = 0;
if (scr_flag_get(1039) == 1)
{
    drawer.image_index = 1;
    pipis_marker = scr_dark_marker(camerax() + 330, cameray() + 260, spr_pipis_egg);
    with (pipis_marker)
        scr_depth();
    pipis_collider = instance_create(pipis_marker.x - 10, pipis_marker.y - 10, obj_solidblock);
    pipis_readable = instance_create(pipis_marker.x - 10, pipis_marker.y - 10, obj_readable_room1);
}
else if (scr_flag_get(1039) == 2 || scr_flag_get(1151) == 1)
{
    drawer.image_index = 1;
}
else
{
    pipis_marker = scr_dark_marker(0, cameray() - 100, spr_pipis_egg);
    pipis_arrive = false;
    pipis_arrive_timer = 0;
    rabble_start = false;
    rabble_timer = 0;
    rabble_siner = 0;
    rabble_base_y = cameray() + 260;
    rabble_leave = false;
    rabble_leave_con = 0;
    fg_markers = [];
}
