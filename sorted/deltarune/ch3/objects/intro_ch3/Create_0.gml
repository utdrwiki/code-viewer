if (scr_is_switch_os())
    instance_create_depth(0, 0, 0, obj_switchAsyncHelper);
con = 0;
timer = 0;
snd_free_all();
files_exist = scr_chapter_save_file_exists(global.chapter);
init = 0;
type = 0;
logotimer = 0;
static_anim = 0;
logo_piece[0][0] = 48;
logo_piece[0][1] = 21;
logo_piece[0][2] = 0;
logo_piece[1][0] = 252;
logo_piece[1][1] = 19;
logo_piece[1][2] = 10;
logo_piece[2][0] = 76;
logo_piece[2][1] = 19;
logo_piece[2][2] = 10;
logo_piece[3][0] = 226;
logo_piece[3][1] = 19;
logo_piece[3][2] = 10;
logo_piece[4][0] = 102;
logo_piece[4][1] = 7;
logo_piece[4][2] = 0;
logo_piece[5][0] = 200;
logo_piece[5][1] = 19;
logo_piece[5][2] = 10;
logo_piece[6][0] = 116;
logo_piece[6][1] = 19;
logo_piece[6][2] = 0;
logo_piece[7][0] = 174;
logo_piece[7][1] = 19;
logo_piece[7][2] = 10;
logo_piece[8][0] = 142;
logo_piece[8][1] = 25;
logo_piece[8][2] = 10;
char_y_pos = 83;
char_height = 33;
max_logo_pieces = 0;
revealed_pieces = 0;
chapter_display = false;
cheer_track[0] = -1;
cheer_track[1] = -1;
cheer_track[2] = -1;
fade_alpha = 0;
fade_time_max = 90;
show_overlay = true;
tv_timer = 0;
tv_time_vfx = -4;
tv_time_max = 240;
is_canceled = false;

play_cheer = function()
{
    for (var i = 0; i < array_length(cheer_track); i++)
    {
        cheer_track[i] = audio_play_sound(snd_crowd_cheer_single, 50, true);
        audio_sound_gain(cheer_track[i], 0.8, 0);
        audio_sound_pitch(cheer_track[i], 0.7 + (0.1 * i));
    }
};

fade_out = function()
{
    scr_lerpvar("fade_alpha", 0, 1, fade_time_max);
    for (var i = 0; i < array_length(cheer_track); i++)
        mus_volume(cheer_track[i], 0, fade_time_max);
};

exit_screen = function()
{
    for (var i = 0; i < array_length(cheer_track); i++)
        snd_free(cheer_track[i]);
    room_goto(PLACE_MENU);
};
