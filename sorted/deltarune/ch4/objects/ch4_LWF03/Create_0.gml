con = -1;
customcon = 0;
make_npcs = false;
upstairs_check = false;
upstairs_con = 0;
play_music = true;
play_timer = 0;
toriel_fall = false;
toriel_fall_timer = 0;
music_faster = false;
dance_npc = false;
toriel_npc = -4;
sans_npc = -4;
dance_kick = false;
dance_speed = 0.15;
dance_timer = 0;
dance_pitch = 1;
siner0 = 0;
siner_add0 = 0.2;
siner_amplitude0 = 2;
siner_direction0 = 0;
npc_talked = 0;
npc_talked_faster = 0;
if (global.plot >= 300 && global.plot < 310)
{
    con = 0;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    arm_marker = scr_marker(422, 106, spr_chairiel_empty_arm);
    arm_marker.depth = 98405;
    phono_marker = scr_marker(443, 112, spr_torhouse_phonograph);
    phono_marker.depth = 98415;
    phono_marker.image_speed = 0.15;
    door_marker = scr_marker(572, 116, spr_torhouse_door);
    with (door_marker)
        depth = 98340;
    door_marker.visible = 0;
    door_frame_marker = scr_marker(611, 56, spr_torhouse_door_frame);
    with (door_frame_marker)
        scr_depth();
    tv_marker = scr_marker(472, 85, spr_torhouse_tv_cover);
    tv_marker.depth = 98670;
    with (obj_solidblock)
    {
        if (x >= 460 && x < 470)
            instance_destroy();
    }
    with (obj_readable_room1)
    {
        if (x >= 475 && x < 485)
            instance_destroy();
    }
    with (obj_doorX_musfade)
        instance_destroy();
    var chair_marker = scr_marker(422, 106, spr_chairiel_empty);
    with (chair_marker)
        scr_depth();
    var chair_block = instance_create(chair_marker.x, chair_marker.y + 30, obj_solidblockLight);
    with (chair_block)
        image_xscale = 2;
    var chair_readable = instance_create(chair_marker.x + 10, chair_marker.y + 20, obj_readable_room1);
    with (chair_readable)
        extflag = "record_player";
    with (obj_npc_room)
        instance_destroy();
    door_readable = instance_create(595, 150, obj_readable_room1);
    with (obj_doorA)
        instance_destroy();
    with (obj_markerB)
        instance_destroy();
    bathroom_readable = instance_create(84, 164, obj_readable_room1);
    var window_marker_a = (scr_flag_get(654) == 1) ? scr_marker(237, 54, spr_torhouse_windows_dark_small) : scr_marker(237, 54, spr_torhouse_windows_dark_small_figures_left);
    with (window_marker_a)
        scr_depth();
    var window_marker_b = (scr_flag_get(654) == 1) ? scr_marker(315, 54, spr_torhouse_windows_dark_small) : scr_marker(315, 54, spr_torhouse_windows_dark_small_figures_right);
    with (window_marker_b)
        scr_depth();
    var window_marker_c = (scr_flag_get(654) == 1) ? scr_marker(443, 68, spr_torhouse_windows_dark_big) : scr_marker(443, 68, spr_torhouse_windows_dark_big_figures);
    with (window_marker_c)
        scr_depth();
    scr_losechar();
    if (i_ex(obj_caterpillarchara))
        instance_destroy(obj_caterpillarchara);
    snd_free_all();
    with (obj_border_controller)
        hide_border(0.025);
}
else
{
    instance_destroy();
}
