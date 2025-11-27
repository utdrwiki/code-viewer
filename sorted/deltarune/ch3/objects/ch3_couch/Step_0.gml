if (walkaway)
{
    if (finished_walking)
        exit;
    if (couch_marker.y != 42)
        couch_marker.y = 42;
    if (obj_mainchara.x < 850)
    {
        if (scr_flag_get(1021) == 0)
            scr_flag_set(1021, 1);
    }
    if (scr_flag_get(1021) == 1)
    {
        if (couch_marker.sprite_index != spr_dw_couch_walk)
        {
            with (couch_collider)
                instance_destroy();
            with (couch_marker)
            {
                image_speed = 0.2;
                sprite_index = spr_dw_couch_walk;
                depth = 100000;
            }
        }
        couch_marker.x = scr_movetowards(couch_marker.x, 0 - (couch_marker.sprite_width + 10), 0.5);
        couch_readable.x = couch_marker.x + 20;
        if (couch_marker.x <= (0 - (couch_marker.sprite_width + 10)))
            finished_walking = true;
    }
}
