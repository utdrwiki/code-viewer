if (!i_ex(obj_homealone_heart))
    instance_create(x - 8, y, obj_readable_room1);
event_inherited();
fallen = false;
pushed = false;
push_timer = 0;
roll_timer = 0;
can_push = true;
finished = scr_flag_get(783) == 1;
if (finished)
{
    var ornament_collider = instance_create(587, 489, obj_homealone_solid);
    ornament_collider.image_xscale = 0.8;
    ornament_collider.image_yscale = 0.8;
    var ornament_marker = scr_marker(595, 498, sprite_index);
    ornament_marker.image_angle = -90;
    with (ornament_marker)
        scr_depth();
    with (obj_homealone_treat_catcher)
    {
        is_disabled = true;
        x = 507;
        y = 510;
        image_angle = 90;
    }
    instance_destroy();
    exit;
}
