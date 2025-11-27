if (controlcon != 0)
{
    if (controlcon == 1 || controlcon == 102)
    {
        with (obj_dw_chaseenemy_cloud)
        {
            miny = y;
            minspeed = 0;
            maxspeed = 0;
        }
    }
    if (controlcon == 101 || controlcon == 20)
    {
        with (obj_dw_chaseenemy_cloud)
        {
            miny = 3040;
            y = cameray() + cameraheight() + 200;
            if (other.controlcon == 101)
            {
                minspeed = -0.5;
                maxspeed = -1.3;
            }
            else
            {
                minspeed = -0.5;
                maxspeed = -2.5;
            }
        }
    }
    if (controlcon == -2)
    {
        var pos = scr_genmarker("sugrab1");
        instance_create(pos.x, pos.y, obj_climb_climbable);
    }
    if (controlcon == -20)
    {
        var pos = scr_genmarker("sugrab2");
        instance_create(pos.x, pos.y, obj_climb_climbable);
    }
    controlcon = 0;
}
