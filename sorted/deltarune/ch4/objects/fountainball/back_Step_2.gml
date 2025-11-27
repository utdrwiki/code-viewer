if (i_ex(parentid))
{
    x = parentid.x;
    y = parentid.y;
    depth = parentid.depth + 1;
}
else
{
    instance_destroy();
}
if (image_xscale < 0.37)
{
    image_xscale += 0.01;
    image_yscale += 0.01;
}
