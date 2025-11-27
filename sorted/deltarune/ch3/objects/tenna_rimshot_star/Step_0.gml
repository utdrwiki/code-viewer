image_angle = sin(sway) * 12;
if (dosway)
    sway += 0.25;
if ((sway % 7.5) == 0)
{
    grazed = false;
    with (bullet1)
        grazed = false;
    with (bullet2)
        grazed = false;
}
if (((x + hspeed) > (obj_growtangle.x + 64) && hspeed > 0) || ((x + hspeed) < (obj_growtangle.x - 64) && hspeed < 0))
    hspeed *= -1;
if (((y + vspeed) > (obj_growtangle.y + 64) && vspeed > 0) || ((y + vspeed) < (obj_growtangle.y - 64) && vspeed < 0))
    vspeed *= -1;
bullet1.x = xx[ceil(max_trail / 2)];
bullet1.y = yy[ceil(max_trail / 2)];
bullet2.x = xx[max_trail];
bullet2.y = yy[max_trail];
if (rimshot_timer > 0)
{
    rimshot_timer--;
    laugh_timer += 0.25;
    if (rimshot_timer == 73)
    {
        with (bullet2)
        {
            scr_lerpvar("image_xscale", 4, 1, 10);
            scr_lerpvar("image_yscale", 4, 1, 10);
            scr_lerpvar("image_xscale", 1, 3, 3);
            scr_lerpvar("image_yscale", 1, 3, 3);
            scr_afterimage_grow();
        }
    }
    if (rimshot_timer == 70)
    {
        with (bullet1)
        {
            scr_lerpvar("image_xscale", 4, 1, 10);
            scr_lerpvar("image_yscale", 4, 1, 10);
            scr_lerpvar("image_xscale", 1, 3, 3);
            scr_lerpvar("image_yscale", 1, 3, 3);
            scr_afterimage_grow();
        }
    }
    if (rimshot_timer == 67)
    {
        active = 0;
        image_xscale = 0.8;
        image_yscale = 0.8;
    }
    if (rimshot_timer == 66)
    {
        scr_lerpvar("image_xscale", 1, 2, 6, 2, "out");
        scr_lerpvar("image_yscale", 1, 2, 6, 2, "out");
        dosway = 0;
        sway = 0;
    }
    if (rimshot_timer == 65)
    {
        for (var dir = 90; dir < 450; dir += 72)
        {
            var mybullet = scr_fire_bullet(x + lengthdir_x(16, dir) + hspeed, y + lengthdir_y(16, dir) + vspeed, obj_regularbullet, dir, 3, spr_triangle, true, true, depth - 1);
            with (mybullet)
            {
                grazepoints = 2.5;
                image_blend = merge_color(c_red, c_white, 0.8);
                scr_doom(id, 90);
                scr_lerpvar("image_alpha", 4, 0, 48);
                scr_var_delay("active", 0, 36);
            }
        }
    }
    if (rimshot_timer == 61)
    {
        dosway = 1;
        scr_lerpvar("image_xscale", 2, 1, 6, 2, "out");
        scr_lerpvar("image_yscale", 2, 1, 6, 2, "out");
    }
    if (rimshot_timer == 56)
        active = 1;
    if (rimshot_timer == 0)
    {
        laugh_timer = 1;
        rimshot_timer = -1;
    }
}
