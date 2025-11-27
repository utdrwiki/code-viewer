if (i_ex(highlight))
{
    var kractor = -4;
    with (obj_actor)
    {
        if (name == "kris")
            kractor = id;
    }
    if (instance_exists(kractor))
        highlight.target = kractor;
    else
        highlight.target = 1185;
}
