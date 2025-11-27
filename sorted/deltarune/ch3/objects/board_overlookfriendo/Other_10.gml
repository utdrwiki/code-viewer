var inboat = 0;
with (obj_mainchara_board)
{
    if (controlled == 1)
    {
        if (boat == true)
            inboat = 1;
    }
}
if (global.interact == 0 && myinteract < 3 && obj_board_camera.con == 0 && inboat == 0)
{
    myinteract = 3;
    global.interact = 1;
}
