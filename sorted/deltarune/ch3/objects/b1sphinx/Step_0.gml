if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (susie == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.susie = id;
    }
}
if (ralsei == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
        con = 1;
}
else
{
    con = 0;
    timer = 0;
    susiewalkcon = 0;
}
