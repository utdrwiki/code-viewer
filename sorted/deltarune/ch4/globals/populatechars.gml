function scr_populatechars()
{
    if (!variable_instance_exists(id, "kris"))
        kris = 0;
    if (!variable_instance_exists(id, "ralsei"))
        ralsei = 0;
    if (!variable_instance_exists(id, "susie"))
        susie = 0;
    if (!variable_instance_exists(id, "noelle"))
        noelle = 0;
    if (kris == 0)
    {
        with (obj_mainchara)
            other.kris = id;
    }
    if (susie == 0)
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                other.susie = id;
        }
    }
    if (ralsei == 0)
    {
        with (obj_caterpillarchara)
        {
            if (name == "ralsei")
                other.ralsei = id;
        }
    }
    if (noelle == 0)
    {
        with (obj_caterpillarchara)
        {
            if (name == "noelle")
                other.noelle = id;
        }
    }
}
