if (alertcon >= 1 && frozen == false && ignoresolid == false)
{
    if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solidblock_ch1, 0, 1) || collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solidenemy_ch1, 0, 1))
    {
        x -= hspeed
        y -= vspeed
        hspeed = 0
        vspeed = 0
    }
}
