if (normalanim == 1)
{
    if (myinteract > 0 && instance_exists(obj_writer_ch1))
    {
        if (obj_writer_ch1.halt > false)
        {
            image_speed = 0
            image_index = 0
        }
        if (obj_writer_ch1.halt == false)
            image_speed = remanimspeed
    }
}
if (normalanim == 1 || normalanim == 2)
{
    if (myinteract == 0)
    {
        facing = dfacing
        image_index = 0
        image_speed = 0
    }
}
scr_npcdir_ch1()
