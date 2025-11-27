if (!instance_exists(obj_heart))
    instance_destroy();
if (wall_destroy == 1)
{
    if (x < (__view_get(e__VW.XView, 0) - 80))
        instance_destroy();
    if (x > (__view_get(e__VW.XView, 0) + 760))
        instance_destroy();
    if (y < (__view_get(e__VW.YView, 0) - 80))
        instance_destroy();
    if (y > (__view_get(e__VW.YView, 0) + 580))
        instance_destroy();
}
if (updateimageangle == 1)
    image_angle = direction;
if (spin == 1)
    image_angle += spinspeed;
if (bottomfade != 0)
{
    if (y > (cameray() + bottomfade))
        image_alpha *= 0.8;
}
var checkcol = collision_rectangle(bbox_left - image_xscale - 2, bbox_top - image_yscale - 1, bbox_right + image_xscale + 2, bbox_bottom + image_yscale + 1, object_index, true, true);
if (checkcol != -4)
{
    if (checkcol.sprite_index == sprite_index)
        exit;
    if (sprite_index == spr_lanino_fire)
        exit;
    if (i_ex(obj_elnina_rematch_enemy))
        exit;
    if (i_ex(obj_elnina_lanino_controller) && obj_elnina_lanino_controller.turns <= 2)
    {
        if (sprite_index != spr_ch3_bullet_heart && checkcol.sprite_index != spr_ch3_bullet_heart)
        {
            sprite_index = spr_ch3_bullet_heart;
            checkcol.sprite_index = spr_ch3_bullet_heart;
            snd_play_x(snd_coaster_kiss, 0.7, 1 + random(0.2));
            var mypink = merge_color(c_fuchsia, c_white, 0.8);
            image_blend = mypink;
            checkcol.image_blend = mypink;
        }
    }
    else
    {
        snd_stop(snd_bump);
        snd_play(snd_bump);
        var shrinkball = scr_marker(x, y, spr_ball_small);
        shrinkball.depth = depth;
        shrinkball.image_blend = c_gray;
        scr_lerp_var_instance(shrinkball, "image_xscale", image_xscale, 0, 8, -1, "in");
        scr_lerp_var_instance(shrinkball, "image_yscale", image_yscale, 0, 8, -1, "in");
        scr_doom(shrinkball, 8);
        with (checkcol)
        {
            shrinkball = scr_marker(x, y, spr_ball_small);
            shrinkball.depth = depth;
            shrinkball.image_blend = c_gray;
            scr_lerp_var_instance(shrinkball, "image_xscale", image_xscale, 0, 8, -1, "in");
            scr_lerp_var_instance(shrinkball, "image_yscale", image_yscale, 0, 8, -1, "in");
            scr_doom(shrinkball, 8);
        }
        instance_destroy();
        with (checkcol)
            instance_destroy();
    }
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
