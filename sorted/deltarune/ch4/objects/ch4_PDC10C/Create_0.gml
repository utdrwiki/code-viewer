con = -1;
customcon = 0;
layer_set_visible("SafetyBlocks", false);
vent_entrance_marker = scr_marker(146, 106, spr_noellehouse_vent_open);
vent_entrance_marker.depth = 98900;
vent_cover_marker = scr_marker(vent_entrance_marker.x, vent_entrance_marker.y, spr_noellehouse_vent_open_cover);
vent_cover_marker.depth = vent_entrance_marker.depth - 150;
vent_collider_bottom = instance_create(142, 96, obj_homealone_solid);
vent_collider_bottom.image_yscale = 0.8;
vent_collider_bottom.image_xscale = 0.2;
vent_collider_right = instance_create(174, 96, obj_homealone_solid);
vent_collider_right.image_xscale = 0.2;
vent_collider_right.image_yscale = 1;
vent_collider_fallen = instance_create(135, 108, obj_homealone_solid);
vent_collider_fallen.image_yscale = 1.4;
vent_collider_fallen.image_xscale = 0.8;
temp_collider = instance_create(151, 116, obj_homealone_solid);
temp_collider.image_yscale = 1;
temp_collider.image_xscale = 3;
left_cover = scr_marker(142, 106, spr_pixel_white);
left_cover.depth = vent_cover_marker.depth;
left_cover.image_yscale = 4;
left_cover.image_blend = #C9A976;
right_cover = scr_marker(174, 106, spr_pixel_white);
right_cover.depth = vent_cover_marker.depth;
right_cover.image_yscale = 4;
right_cover.image_blend = #C9A976;
vent_cover_broken_marker = scr_marker(vent_entrance_marker.x + 1, vent_entrance_marker.y + 3, spr_noellehouse_vent_closed_cover_broken);
vent_cover_broken_marker.depth = vent_cover_marker.depth - 10;
vent_cover_broken_marker.image_angle -= 90;
vent_panel_marker = scr_marker(145, 100, spr_pixel_white);
vent_panel_marker.image_blend = #C9A976;
vent_panel_marker.image_xscale = 7.5;
vent_panel_marker.image_yscale = 1.5;
vent_panel_marker.depth = vent_cover_broken_marker.depth - 1000;
vent_close = false;
vent_close_timer = 0;
vent_fall = false;
vent_fall_timer = 0;
vent_shake = false;
present_marker = scr_marker(126, 165, spr_noellehouse_present_no_lid);
present_marker.depth = 98400;
present_cover_marker = scr_marker(126, 165, spr_noellehouse_present_no_lid_cover);
present_cover_marker.depth = 5900;
shake_present = false;
present_collider_left = instance_create(107, 166, obj_homealone_solid);
present_collider_right = instance_create(142, 166, obj_homealone_solid);
present_collider_right.image_xscale = 0.05;
present_collider_right.image_yscale = 0.8;
present_collider_bottom = instance_create(119, 182, obj_homealone_solid);
present_bottom_marker = scr_marker(120, 175, spr_noellehouse_present);
present_bottom_marker.depth = 5800;
if (global.plot < 62)
{
    con = 0;
    present_cover_marker.depth = 99000;
    present[0] = scr_marker(143, 114, spr_noellehouse_present_large);
    present[0].depth = vent_cover_broken_marker.depth - 10;
    present[1] = scr_marker(178, 137, spr_noellehouse_present_tall);
    present[1].depth = present[0].depth - 10;
    present[2] = scr_marker(168, 165, spr_noellehouse_present_wide);
    present[3] = scr_marker(183, 175, spr_noellehouse_present_small);
    with (present[2])
        scr_depth();
    present[3].depth = present[2].depth - 10;
    var top_collider = instance_create(144, 120, obj_solidblockLight);
    top_collider.image_xscale = 2;
    instance_create(120, 110, obj_solidblockLight);
    instance_create(180, 142, obj_solidblockLight);
    instance_create(124, 164, obj_solidblockLight);
    instance_create(119, 175, obj_solidblockLight);
    instance_create(168, 166, obj_solidblockLight);
    instance_create(188, 177, obj_solidblockLight);
    instance_create(150, 124, obj_readable_room1);
    instance_create(180, 144, obj_readable_room1);
    instance_create(170, 170, obj_readable_room1);
    instance_create(120, 170, obj_readable_room1);
    exit;
}
else
{
    present[0] = instance_create(143, 114, obj_homealone_present);
    present[0].sprite_index = spr_noellehouse_present_large;
    present[0].depth = vent_cover_broken_marker.depth - 10;
    if (global.tempflag[90] == 1)
        present[0].x += 100;
    present[1] = instance_create(178, 137, obj_homealone_present);
    present[1].sprite_index = spr_noellehouse_present_tall;
    present[1].depth = present[0].depth - 10;
    present[2] = instance_create(168, 165, obj_homealone_present);
    present[2].sprite_index = spr_noellehouse_present_wide;
    present[3] = instance_create(183, 175, obj_homealone_present);
    present[3].sprite_index = spr_noellehouse_present_small;
}
if (global.plot > 62)
{
    present[0].x = (scr_flag_get(739) == 0) ? present[0].x : scr_flag_get(739);
    present[1].x = (scr_flag_get(740) == 0) ? present[1].x : scr_flag_get(740);
    present[2].x = (scr_flag_get(741) == 0) ? present[2].x : scr_flag_get(741);
}
door_marker = scr_marker(140, 200, spr_pixel_white);
door_marker.depth = 6000;
door_marker.image_blend = c_black;
door_marker.image_xscale = 10;
door_marker.image_yscale = 20;
show_heart = false;
heart_control = false;
heart_timer = 0;
controls_timer = 0;
show_controls = false;
global.typer = 80;
msgsetsubloc(0, "Move: ~1 ~2 ~3 ~4", scr_get_input_name(3), scr_get_input_name(2), scr_get_input_name(1), scr_get_input_name(0), "obj_ch4_PDC10C_slash_Create_0_gml_163_0");
writer = instance_create(camerax() + 20, 240, obj_writer);
writer.mycolor = c_black;
writer_blend = 0;
writer_fadein = false;
writer_fadeout = false;
fix_vent = false;
if (global.plot == 62 || global.plot == 64 || scr_flag_get(737) == 1 || global.flag[1704] == 1)
{
    if (global.flag[1704] == 2 && scr_flag_get(737) != 1)
        exit;
    con = 0;
    door_marker.visible = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    scr_losechar();
    if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
            instance_destroy();
    }
    if (scr_flag_get(737) == 1)
        scr_flag_set(737, 2);
    if (global.flag[1704] == 1)
        global.flag[1704] = 2;
}
