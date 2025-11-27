if (active)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (!made)
        {
            if (obj_mainchara_board.sword)
            {
                var shopwriter = instance_create(x, y, obj_board_shopwriter);
                if (obj_mainchara_board.swordlv < 3)
                {
                    shopwriter.shopstring = text1;
                }
                else if (obj_mainchara_board.swordlv == 3)
                {
                    shopwriter.shopstring = stringsetloc("BECAME STRONGER", "obj_board_1_sword_b1store_slash_Step_0_gml_18_0");
                }
                else
                {
                    shopwriter.shopstring = text2;
                    shopwriter.textcol = 0;
                    shopwriter.depth = 100000;
                }
                made = 1;
            }
        }
    }
    if (sndpause == 0 && obj_board_camera.con == 0)
    {
        sndpause = 1;
        snd_pause(global.currentsong[1]);
    }
    if (sndpause == 1 && obj_board_camera.con != 0)
    {
        sndpause = 0;
        snd_resume(global.currentsong[1]);
    }
}
else
{
    if (made)
    {
        with (obj_board_shopwriter)
            instance_destroy();
        made = 0;
    }
    con = 0;
    timer = 0;
    texttimer = 0;
    drawtext = false;
    mystring = "";
}
