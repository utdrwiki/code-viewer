con = -1;
customcon = 0;
solo_mode = !scr_havechar(3) && !scr_havechar(2);
mike_controller = -4;
shortened = false;
actor_talker = -4;
npc_animate = false;
npc_animate_target = -4;
mic_active = false;
mic_timer = 0;
mic_marker = scr_dark_marker(3820, 0, spr_mic_2x);
with (mic_marker)
{
    scr_depth();
    image_alpha = 0;
}
blackall_zone = scr_dark_marker(-10, -10, spr_pixel_white);
blackall_zone.image_xscale = 999;
blackall_zone.image_yscale = 999;
blackall_zone.depth = 999900;
blackall_zone.image_blend = c_black;
blackall_zone.image_alpha = 1;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 999900;
blackall.image_blend = c_black;
blackall.image_alpha = 1;
mike_shake = false;
mike_base_pos = [];
mike_shake_intensity = 1;
mike_flip = false;
mike_flip_timer = 0;
mike_track[0] = -4;
mike_track[1] = -4;
global.mike_skip = 0;
if (scr_debug())
    global.flag[1695] = 0;
if (snd_is_playing(global.currentsong[1]))
    mus_volume(global.currentsong[1], 0, 30);
if (global.flag[1695] == 0)
{
    con = 0;
    con = 5;
    global.interact = 1;
    board_marker = scr_dark_marker(-100, -100, spr_conspiracy_board);
    board_marker.visible = 0;
    with (board_marker)
        scr_depth();
}
else if (global.flag[1696] == 0)
{
    shortened = true;
    con = 0;
}

show_convo = function(arg0)
{
    switch (arg0)
    {
        case "board":
            con = 95;
            break;
    }
};
