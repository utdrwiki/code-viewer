function scr_rhythmgame_song_flag(arg0, arg1)
{
    if (arg0 == 2)
        return arg1 ? 1667 : 1666;
    else if (arg0 == 10)
        return arg1 ? 1669 : 1668;
    else
        return arg1 ? 1279 : 1195;
}
