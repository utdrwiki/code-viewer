if (global.chapter == 4)
{
    if (global.flag[20] == 1)
    {
        global.flag[20] = 0;
        if (!puzzle_master_blush)
        {
            puzzle_master_blush = true;
            with (puzzle_master_npc)
                sprite_index = spr_puzzlemaster_frown_blush;
        }
    }
    if (puzzle_master_blush && !d_ex())
    {
        puzzle_master_blush = false;
        global.flag[20] = 0;
        with (puzzle_master_npc)
            sprite_index = spr_puzzlemaster_frown;
    }
}
