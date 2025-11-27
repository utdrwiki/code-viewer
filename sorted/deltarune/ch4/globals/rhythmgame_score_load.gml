function scr_rhythmgame_score_load(arg0, arg1 = false, arg2 = 0)
{
    if (arg2 == 0)
        arg2 = scr_rhythmgame_song_flag(arg0, arg1);
    return global.flag[arg2];
}
