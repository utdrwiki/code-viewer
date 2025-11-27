var inst = instance_place(x, y, obj_climb_setpathenemy);
if (inst != -4)
{
    with (inst)
    {
        if (image_alpha == 1)
        {
            scr_lerpvar("image_alpha", 1, 0, 15, 1, "out");
            scr_doom(self, 15);
        }
    }
}
