if (active)
{
    if (mystring == "notfound")
    {
        mystring = obj_board_dungeon_2_roomWriterManager.mystring;
        obj_board_dungeon_2_roomWriterManager.con++;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        drawtext = true;
        var enemcount = 0;
        with (obj_board_enemy_lizard)
        {
            if (scr_board_onscreen())
                enemcount++;
        }
        with (obj_board_enemy_monster)
        {
            if (scr_board_onscreen())
            {
                if (type == 0)
                    enemcount++;
            }
        }
        if (enemcount == 0)
            con = 1;
    }
}
else
{
    timer = 0;
    texttimer = 0;
    drawtext = false;
}
