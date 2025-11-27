if (active)
{
    if (kris == 0)
    {
        with (obj_mainchara_board)
        {
            if (name == "kris")
                other.kris = id;
        }
    }
    if (i_ex(kris))
    {
        if (kris.checkpoint != id)
        {
            if (place_meeting(x, y, kris))
                kris.checkpoint = id;
        }
    }
}
