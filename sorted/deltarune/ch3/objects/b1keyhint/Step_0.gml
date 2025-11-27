if (active && obj_board_camera.con == 0)
{
    if (!triggered)
    {
        triggered = true;
        with (obj_b1oasis)
        {
            if (keyline == 0)
                keyline = 1;
        }
        with (obj_b1keyhint)
            instance_destroy();
        instance_destroy();
    }
}
