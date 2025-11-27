function scr_gameshow_populatevars()
{
    if (!variable_instance_exists(id, "kr_real"))
        kr_real = 0;
    if (!variable_instance_exists(id, "su_real"))
        su_real = 0;
    if (!variable_instance_exists(id, "ra_real"))
        ra_real = 0;
    if (!variable_instance_exists(id, "tenna"))
        tenna = 0;
    if (kr_real == 0)
    {
        with (obj_mainchara)
            other.kr_real = id;
    }
    if (su_real == 0)
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                other.su_real = id;
        }
    }
    if (ra_real == 0)
    {
        with (obj_caterpillarchara)
        {
            if (name == "ralsei")
                other.ra_real = id;
        }
    }
    if (tenna == 0)
    {
        with (obj_actor_tenna)
            other.tenna = id;
    }
}
