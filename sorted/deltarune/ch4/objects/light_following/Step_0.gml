siner++;
depth = 0;
if (preset != -1)
{
    target = -4;
    if (preset == 1)
    {
        target = 1049;
        xoff = 18;
        yoff = 38;
    }
    if (preset == 2)
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                other.target = id;
        }
        xoff = 26;
        yoff = 46;
    }
    if (preset == 3)
    {
        with (obj_caterpillarchara)
        {
            if (name == "ralsei")
                other.target = id;
        }
        xoff = 18;
        yoff = 40;
    }
    if (preset == 4)
    {
        with (obj_actor)
        {
            if (name == "susie")
                other.target = id;
        }
        xoff = 26;
        yoff = 46;
    }
    if (preset == 5)
    {
        with (obj_actor)
        {
            if (name == "ralsei")
                other.target = id;
        }
        xoff = 18;
        yoff = 40;
    }
    if (i_ex(target))
        preset = -1;
}
