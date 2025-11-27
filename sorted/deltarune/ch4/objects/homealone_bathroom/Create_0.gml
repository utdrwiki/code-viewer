con = -1;
asgore_mode = false;
if (!scr_sideb_active() && scr_flag_get(742) < 7 && global.plot < 90)
    asgore_mode = true;
if (!asgore_mode)
{
    instance_destroy();
}
else
{
    scr_flag_set(7, 1);
    convo_controller = instance_create(0, 0, obj_homealone_bathroom_convo);
    var _id = id;
    with (convo_controller)
        init_parent(_id);
    convo_timer = 0;
    convo_active = false;
    asgore_marker = scr_marker(134, 68, spr_asgore_piss);
    asgore_marker.image_speed = 0;
    with (asgore_marker)
        scr_depth();
    
    trigger_event = function(arg0)
    {
        switch (arg0)
        {
            case "face_up":
                asgore_marker.sprite_index = spr_asgore_walk_up_housekeeper;
                break;
            case "face_down":
                asgore_marker.sprite_index = spr_asgore_walk_down_housekeeper;
                break;
            case "face_left":
                asgore_marker.sprite_index = spr_asgore_walk_left_housekeeper;
                break;
            case "head_down":
                asgore_marker.sprite_index = spr_asgore_walk_up_housekeeper_head_down;
                break;
            case "convo_tree_finished":
                asgore_marker.sprite_index = spr_asgore_walk_down_housekeeper;
                with (asgore_marker)
                {
                    scr_delay_var("image_speed", 0.2, 30);
                    scr_script_delayed(scr_lerpvar, 30, "y", y, room_height + 60, 80);
                }
                scr_script_delayed(snd_play, 90, snd_dooropen);
                scr_script_delayed(snd_play, 100, snd_doorclose);
                break;
            default:
                break;
        }
    };
    
    switch (scr_flag_get(742))
    {
        case 1:
            trigger_event("face_up");
            break;
        case 2:
            trigger_event("face_down");
            break;
        case 3:
            trigger_event("face_left");
            break;
        case 4:
            trigger_event("face_up");
            break;
        default:
            trigger_event("head_down");
            break;
    }
    with (convo_controller)
        start_convo();
}
