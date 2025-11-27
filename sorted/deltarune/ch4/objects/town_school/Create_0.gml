con = -1;
if (global.chapter == 4)
{
    if (global.plot >= 300)
    {
        con = 0;
        with (obj_doorAny)
            instance_destroy();
    }
}
