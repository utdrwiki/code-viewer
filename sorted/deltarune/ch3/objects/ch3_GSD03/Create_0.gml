con = -1;
customcon = 0;
if (scr_flag_get(1232) == 1)
{
    var game_controller = instance_create_depth(0, -32, depth, obj_shootout_controller);
    game_controller.shootout_type = 1;
    game_controller.tutorialmode = false;
}
else if ((global.plot >= 250 && global.plot < 255) || scr_debug())
{
    con = 0;
    bg_layer_names = ["fg", "md", "md_back", "bg"];
    bg_ids = [];
    bg_speeds = [];
    for (var i = 0; i < array_length_1d(bg_layer_names); i++)
    {
        bg_ids[i] = layer_get_id(bg_layer_names[i]);
        bg_speeds[i] = layer_get_hspeed(bg_ids[i]);
    }
    move_bg = false;
    pause_bg = false;
    game_start = false;
    both_talk = false;
    both_talk_timer = 0;
    both_writer = -4;
    ralsei_face_marker = -4;
    letterbox = instance_create(0, 0, obj_ch3_GSD03_letterbox);
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 1;
}
