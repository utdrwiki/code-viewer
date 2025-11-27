asgore_mode = false;
if (!scr_sideb_active() && scr_flag_get(742) >= 7 && scr_flag_get(1558) < 11)
    asgore_mode = true;
var vent_marker = scr_marker(147, 63, spr_noellehouse_vent_north);
with (vent_marker)
    depth = 6000;
if (!asgore_mode)
{
    instance_destroy();
}
else
{
    convo_controller = instance_create(0, 0, obj_homealone_north_convo);
    var _id = id;
    with (convo_controller)
        init_parent(_id);
    convo_timer = 0;
    convo_active = false;
    asgore_marker = scr_marker(100, 70, spr_asgore_walk_up_housekeeper);
    asgore_marker.image_speed = 0;
    with (asgore_marker)
        scr_depth();
    with (convo_controller)
        start_convo();
    
    trigger_event = function(arg0)
    {
    };
}
