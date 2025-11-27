function scr_board_populatevars()
{
    if (!variable_instance_exists(id, "kris"))
        kris = 0;
    if (!variable_instance_exists(id, "susie"))
        susie = 0;
    if (!variable_instance_exists(id, "ralsei"))
        ralsei = 0;
    if (kris == 0)
    {
        with (obj_mainchara_board)
        {
            if (name == "kris")
                other.kris = id;
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
    if (susie == 0)
    {
        with (obj_mainchara_board)
        {
            if (name == "susie")
                other.susie = id;
        }
    }
}
