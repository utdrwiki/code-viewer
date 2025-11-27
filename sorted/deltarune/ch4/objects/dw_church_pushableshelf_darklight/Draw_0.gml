draw_self();
for (var i = 0; i < array_length(upstairs); i++)
{
    with (upstairs[i])
    {
        depth = other.depth - 10;
        if (extflag != "inactive")
            draw_self();
    }
}
