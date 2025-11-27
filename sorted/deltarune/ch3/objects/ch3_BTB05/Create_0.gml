con = -1;
customcon = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 10000;
create_writer = false;
speech_index = 0;
if (!snd_is_playing(global.currentsong[1]))
{
    global.currentsong[0] = snd_init("flashback_excerpt.ogg");
    global.currentsong[1] = mus_loop(global.currentsong[0]);
}
if (global.plot < 300)
{
    con = 0;
    wind_song[0] = -4;
    wind_song[1] = -4;
    carol_marker = scr_dark_marker(1156, 262, spr_sepia_carol_silhouette);
    with (carol_marker)
        scr_depth();
    rudy_marker = scr_dark_marker(1110, 260, spr_sepia_rudy_silhouette);
    with (rudy_marker)
        scr_depth();
    asgore_marker = scr_dark_marker(750, 244, spr_sepia_asgore_silhouette);
    with (asgore_marker)
        scr_depth();
    toriel_marker = scr_dark_marker(850, 260, spr_sepia_toriel_silhouette);
    with (toriel_marker)
        scr_depth();
    dess_marker = scr_dark_marker(960, 243, spr_sepia_dess_silhouette);
    with (dess_marker)
        scr_depth();
    asriel_marker = scr_dark_marker(916, 262, spr_sepia_asriel_silhouette);
    with (asriel_marker)
        scr_depth();
    kris_marker = scr_dark_marker(1015, 282, spr_sepia_kris_silhouette);
    with (kris_marker)
        scr_depth();
    noelle_marker = scr_dark_marker(1054, 278, spr_sepia_noelle_silhouette);
    with (noelle_marker)
        scr_depth();
    tv_marker = scr_dark_marker(280, 228, spr_sepia_room_tv);
    tv_marker.depth = blackall.depth - 10;
    tv_marker.visible = 0;
    tv_stand_marker = scr_dark_marker((view_wport[0] / 2) - sprite_get_width(spr_sepia_tv_stand), 172, spr_sepia_tv_stand);
    tv_stand_marker.depth = tv_marker.depth - 5;
    tv_stand_marker.visible = 0;
    tv_smile_bg_marker = scr_dark_marker(tv_stand_marker.x + 18, tv_stand_marker.y + 44, spr_sepia_tv_static);
    tv_smile_bg_marker.depth = tv_marker.depth - 10;
    tv_smile_bg_marker.image_speed = 0.2;
    tv_smile_bg_marker.visible = 0;
    tv_smile_marker = scr_dark_marker(tv_smile_bg_marker.x + 5, tv_smile_bg_marker.y + 8, spr_sepia_tv_smile);
    tv_smile_marker.depth = tv_smile_bg_marker.depth - 10;
    tv_smile_marker.visible = 0;
    obj_mainchara.y = cameray() - 200;
    scr_lerp_instance_var(blackall, "image_alpha", 1, 0, 60);
}
else
{
    instance_destroy();
}
