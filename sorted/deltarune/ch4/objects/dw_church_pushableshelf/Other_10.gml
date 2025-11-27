var __check = 0;
with (object_index)
{
    if (con != 0)
        __check++;
}
if (__check == 0 && con == 0 && global.interact == 0)
{
    global.interact = 1;
    con = 1;
    timer = 0;
    mydir = global.facing;
}
