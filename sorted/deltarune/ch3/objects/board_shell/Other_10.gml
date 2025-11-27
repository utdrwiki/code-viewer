var skip = 0;
with (obj_mainchara_board)
{
    if (boat == true)
        skip = true;
}
if (global.interact == 0 && obj_board_camera.con == 0 && con == 0 && buffer <= 0 && !skip)
    con = 1;
