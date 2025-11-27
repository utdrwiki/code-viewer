if (!waterinit)
{
    if (watertype == 1 || watertype == 2)
    {
        beginy = y;
        scr_size(1, 1 * (activetime / spawnrate));
        waterheight = image_yscale;
        y -= ((image_yscale - 1) * 40);
        endy = y + (image_yscale * 40) + (tilelimit * 40);
        var altendy = -1;
        for (var i = 0; i < (tilelimit + 4); i++)
        {
            var buck;
            if (altendy == -1)
                buck = instance_place(x, y + (40 * i), obj_climb_waterbucket);
            if (i_ex(buck))
            {
                other.endy = buck.y;
                altendy = 1;
            }
        }
    }
    waterinit = 1;
}
