if (con == 0)
{
    radius++;
    if (radius >= max_radius)
    {
        radius = max_radius;
        con = 1;
    }
}
else if (con == 1)
{
    radius--;
    if ((radius + siner + rim) <= 0)
        instance_destroy();
}
siner++;
