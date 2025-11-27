if (!init)
{
    for (var i = 0; i < 3; i++)
        global.hp[i] = global.maxhp[i];
    scr_tempsave();
    init = 1;
    with (obj_mainchara)
    {
        var found = 0;
        with (obj_climb_marker)
        {
            if (found == 0)
            {
                if (image_index == 1)
                {
                    found = 1;
                    with (instance_create(x + 20, y + 20, obj_climb_kris))
                    {
                        var roomw = room_width;
                        var roomh = room_height;
                        var vieww = view_wport[0];
                        var viewh = view_hport[0];
                        var camx = clamp(x - floor(vieww / 2), 0, roomw - vieww);
                        var camy = clamp(y - floor(viewh / 2), 0, roomh - viewh);
                        var lclamp = 0;
                        var rclamp = roomw - vieww;
                        var uclamp = 0;
                        var dclamp = roomh - viewh;
                        camx = clamp(camx, lclamp, rclamp);
                        camy = clamp(camy, uclamp, dclamp);
                        camerax_set(camx);
                        cameray_set(camy);
                        startofroom = true;
                    }
                    global.interact = 0;
                }
            }
        }
        camerax_set(0);
        if (found)
        {
            visible = false;
            freeze = true;
            cutscene = true;
        }
        with (obj_cloud_controller_new)
            y += 120;
        with (obj_cloud_render_new)
            distance_from_kris += 120;
    }
    with (obj_climb_kris)
        forceclimb = true;
    with (instance_create((camerax() + (0.5 * camerawidth())) - 70, cameray() + (0.5 * cameraheight()), obj_marker))
    {
        vspeed = -8;
        sprite_index = spr_susie_climb;
        image_speed = 0.25;
        scr_darksize();
        depth = 1000;
        scr_doom(self, 100);
    }
    with (instance_create(camerax() + (0.5 * camerawidth()) + 30, cameray() + (0.5 * cameraheight()), obj_marker))
    {
        vspeed = -8;
        sprite_index = spr_ralsei_climb;
        image_speed = 0.25;
        scr_darksize();
        depth = 1000;
        scr_doom(self, 100);
    }
    with (scr_genmarker("susie"))
    {
        var sus = instance_create(x, y, obj_climb_susie);
        sus.reach = 1;
    }
}
timer++;
if (con == 0 && timer == 1)
{
    with (obj_cloud_controller_new)
    {
        minspeed = -0.3;
        maxspeed = -6.3;
    }
}
if (con == 0 && timer == 80)
{
    con = 1;
    timer = 0;
    with (obj_cloud_controller_new)
    {
        minspeed = -0.3;
        maxspeed = -1.3;
    }
    with (obj_climb_kris)
        forceclimb = false;
}
if (i_ex(monologue_writer))
{
    monologue_writer.writingx = camerax() + 80;
    if (write_top)
        monologue_writer.writingy = cameray() + 20;
    else
        monologue_writer.writingy = cameray() + 340;
}
if (monocon == 0)
{
    if (i_ex(monologue_writer))
    {
        monocon = 1;
        monotime = 0;
    }
}
if (monocon == 1)
{
    if (i_ex(monologue_writer))
    {
        if (monologue_writer.halt > 0)
        {
            monotime++;
            var max_timer = (global.lang == "ja") ? 100 : 70;
            if (monotime >= max_timer)
            {
                with (obj_writer)
                    forcebutton1 = 1;
                monotime = 0;
                monocon = 0;
            }
        }
    }
}
