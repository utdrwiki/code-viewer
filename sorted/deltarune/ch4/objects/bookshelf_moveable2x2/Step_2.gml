var xshift = x - xprevious;
var yshift = y - yprevious;
for (var i = 0; i < array_length(block); i++)
{
    with (block[i])
    {
        x += xshift;
        y += yshift;
    }
}
for (var i = 0; i < array_length(edge); i++)
{
    with (edge[i])
    {
        x += xshift;
        y += yshift;
    }
}
base.x = x;
base.y = y + 80;
scr_depth_alt();
if (i_ex(obj_dw_church_bookshelfpuzzle))
{
    var nope = false;
    with (obj_dw_church_remote_piano)
    {
        if (engaged)
            nope = true;
    }
    if (obj_dw_church_bookshelfpuzzle.flooractive == 2 || (obj_dw_church_bookshelfpuzzle.flooractive == 1 && nope))
        depth += 10000;
}
if (i_ex(obj_dw_church_pianopiece_right))
{
    var nope = false;
    with (obj_dw_church_remote_piano)
    {
        if (engaged)
            nope = true;
    }
    if (obj_dw_church_pianopiece_right.flooractive == 2 || (obj_dw_church_pianopiece_right.flooractive == 1 && nope))
        depth += 10000;
}
if (con == 40)
    depth = 5000;
