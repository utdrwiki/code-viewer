if (killcount == 15)
{
    with (obj_mainchara_board)
    {
        if (swordlv < 4)
        {
            swordlv = 4;
            xp = 0;
        }
    }
    snd_play(snd_board_ominous);
    killcount++;
}
