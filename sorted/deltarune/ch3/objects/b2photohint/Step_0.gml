scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 6)
        {
            var walkstring = "0L";
            var amount = 10 + irandom(64);
            for (var i = 0; i < amount; i++)
                walkstring += "0L";
            walkstring += "0D0D0D";
            scr_play_recording("susie", walkstring);
            suwalk = 1;
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
