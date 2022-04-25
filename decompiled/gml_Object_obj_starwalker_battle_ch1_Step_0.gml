if (walkcon == 1)
{
    visible = false
    wings = scr_dark_marker_ch1((x + 92), (y + 74), spr_starwalker_wings_ch1)
    wings.image_index = image_index
    with (wings)
    {
        image_speed = 0.2
        depth = 1010
        hspeed = 5
        vspeed = -1
        gravity_direction = 90
        gravity = 0.2
    }
    body = scr_dark_marker_ch1((x + 70), (y + 52), spr_starwalker_walk_ch1)
    with (body)
    {
        depth = 1000
        image_speed = 0
        vspeed = 8
        image_speed = 0
    }
    walkcon = 2
}
if (walkcon == 2)
{
    with (body)
        scr_depth_ch1()
    walktimer += 1
    if (walktimer >= 20)
    {
        hspeed = 7
        with (body)
        {
            vspeed = 0
            hspeed = 7
            image_speed = 0.25
        }
        bodycheck = instance_create_ch1(body.x, (body.y + 20), obj_readable_room1_ch1)
        bodycheck.image_xscale = 2
        bodycheck.image_yscale = 2
        with (bodycheck)
            hspeed = 7
        walkcon = 3
        walktimer = 0
    }
}
