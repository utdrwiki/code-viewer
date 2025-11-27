function scr_rhythmgame_score_save(arg0, arg1, arg2 = false, arg3 = 0, arg4 = true)
{
    if (arg3 == 0)
        arg3 = scr_rhythmgame_song_flag(arg0, arg2);
    if (!arg4 || arg1 >= global.flag[arg3])
        global.flag[arg3] = arg1;
}
