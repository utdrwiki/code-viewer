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
