with (obj_floorTrigger)
{
    if (other.activeFloor != floortarg)
    {
        if (place_meeting(x, y, obj_mainchara))
        {
            other.activeFloor = floortarg;
            other.switchFloors = 1;
        }
    }
}
if (switchFloors == 1)
{
    with (obj_solid_floor)
    {
        if (myfloor != other.activeFloor)
        {
            active = false;
            init = 0;
        }
        else
        {
            active = true;
            init = 0;
        }
    }
    if (activeFloor == 0)
    {
        if (floor1 != -1)
            layer_depth(floor1, 6000);
        if (floor2 != -1)
            layer_depth(floor2, 5000);
    }
    if (activeFloor == 1)
    {
        if (floor1 != -1)
            layer_depth(floor1, floor1depthmem);
        if (floor2 != -1)
            layer_depth(floor2, 5000);
    }
    if (activeFloor == 2)
    {
        if (floor1 != -1)
            layer_depth(floor1, floor1depthmem);
        if (floor2 != -1)
            layer_depth(floor2, floor2depthmem);
    }
    switchFloors = 0;
}
if (i_ex(obj_ladderarea))
{
    with (obj_ladderarea)
    {
        if (place_meeting(x, y, obj_mainchara))
        {
            engaged = true;
            global.interact = 1;
        }
        else if (engaged == true)
        {
            engaged = false;
            global.interact = 0;
        }
        if (engaged == true)
        {
            obj_mainchara.sprite_index = spr_krisu_dark;
            global.facing = 2;
            if (up_h())
            {
                obj_mainchara.y -= 4;
                image_speed = 0.25;
            }
            if (down_h())
            {
                obj_mainchara.y += 4;
                image_speed = 0.25;
            }
            if ((up_h() && down_h()) || (!up_h() && !down_h()))
                obj_mainchara.image_speed = 0;
        }
    }
}
