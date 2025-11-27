con++;
picturetaken = true;
snd_play_x(snd_camera_flash, 1, 1);
if (room == room_dw_puzzlecloset_3)
{
    if (global.flag[1231] == 0)
        global.flag[1245]++;
    debug_message("photocount=" + string(global.flag[1245]));
}
