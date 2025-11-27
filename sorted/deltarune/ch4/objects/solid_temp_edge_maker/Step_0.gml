if (!init)
{
    for (var i = 0; i < image_xscale; i++)
    {
        for (var ii = 0; ii < image_yscale; ii++)
        {
            with (instance_create(x + (i * 40), y + (ii * 40), obj_solid_temp_edge))
            {
                extflag = other.extflag;
                negasoliddisable = other.negasoliddisable;
                edge = other.edge;
            }
        }
    }
    init = 1;
    instance_destroy();
}
