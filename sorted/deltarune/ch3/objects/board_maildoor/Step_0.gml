opentime = 10;
closetime = 5;
if (con == 1)
{
    scr_lerpvar("image_index", 0, 3, opentime, 2, "out");
    scr_delay_var("con", 2, opentime);
    snd_play(snd_board_splash);
    snd_play_delay(snd_board_door_close, opentime);
    con = -1;
}
if (con == 10)
{
    scr_lerpvar("image_index", 3, 0, closetime, 2, "out");
    scr_delay_var("con", 2, closetime);
    snd_play_delay(snd_board_door_close, closetime);
    con = -1;
}
