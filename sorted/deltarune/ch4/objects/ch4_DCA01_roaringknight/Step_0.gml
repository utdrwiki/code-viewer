siner2++;
y = ystart + (cos(siner2 / 8) * 8);
aetimer++;
if ((aetimer % move_speed) == 0 && image_alpha != 0)
{
    if (state == 0)
    {
        afterimage = instance_create_depth(x, y, depth + 1, obj_afterimage);
        afterimage.sprite_index = sprite_index;
        afterimage.image_alpha = 0.6;
        afterimage.fadeSpeed = 0.02;
        afterimage.hspeed = after_image_rate * after_image_dir;
        afterimage.image_index = image_index;
        afterimage.image_speed = 0;
        afterimage.image_xscale = image_xscale;
        afterimage.image_yscale = image_yscale;
    }
}
if (beam_shoot)
{
    beam_shoot_timer++;
    if ((beam_shoot_timer % 8) == 0)
    {
        beam_counter++;
        var beam = scr_dark_marker(x + 55, y + 55, spr_roaringknight_beam);
        beam.depth = depth - 10;
        with (beam)
        {
            scr_lerpvar("image_xscale", 0, 2, 5, 4, "out");
            scr_lerpvar("image_yscale", 0, 2, 10, 4, "out");
            scr_lerpvar("y", beam.y, cameray() - 100, 30, 4, "out");
        }
        scr_doom(beam, 60);
    }
    if (beam_shoot_timer >= 40)
        beam_shoot = false;
}
