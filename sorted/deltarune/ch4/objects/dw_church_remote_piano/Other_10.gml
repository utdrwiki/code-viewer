var usable = true;
with (obj_dw_church_bookshelfpuzzle)
{
    if (flooractive == 1)
        usable = false;
}
with (obj_dw_church_pianopiece_right)
{
    if (flooractive == 1)
        usable = false;
}
if (global.facing == 2)
{
    if (usable)
    {
        if (!engaged && buffer <= 0)
        {
            engaged = true;
            timer = 0;
            con = 0.1;
        }
    }
}
