con = -1;
customcon = 0;
init = false;
init_heart = false;
var block_door = (scr_sideb_active() && global.plot == 63) || global.plot != 66;
if (block_door && i_ex(obj_homealone_heart))
{
    var cover_marker = scr_marker(120, 220, spr_pixel_white);
    with (cover_marker)
    {
        depth = 999990;
        image_xscale = 12;
        image_yscale = 10;
        image_blend = #201E33;
    }
    var _block = instance_create(126, 220, obj_homealone_solid);
    with (_block)
        image_xscale = 2;
}
if (global.plot == 66)
{
    con = 0;
    convo_controller = instance_create(0, 0, obj_homealone_dess_convo);
    var _id = id;
    with (convo_controller)
        init_parent(_id);
    convo_timer = 0;
    convo_active = false;
    hit_heart = false;
    kris_bed_timestamps = [200, 200, 200, 200, 200, 500, 330, 330, 500, 330, 1000, 330, 330, 330, 330, 200, 1000];
    heart_in_timestamps = [1000, 330, 330, 660, 100, 50, 50, 50, 330, 330, 200, 200, 200, 1000, 330, 330, 1000];
    anim_player = instance_create(0, 0, obj_anim_custom);
    kris_bed_hide = false;
    kris_bed_con = 0;
    kris_bed_marker = scr_marker(21, 50, spr_kris_bed_come_out);
    kris_bed_marker.depth = 80000;
    anim_timestamps = [200, 200, 200, 200, 200, 500];
    anim_modifier = 30;
    anim_index = 0;
    anim_timer = 0;
    heart_fall_timer = 0;
    heart_fall_ypos = 0;
    kris_get = false;
    kris_get_timer = 0;
    kris_marker = scr_marker(0, 0, spr_noellehouse_kitchen_kris_chase_dr);
    with (kris_marker)
    {
        visible = 0;
        depth = 80000;
    }
    heart_take = false;
    heart_take_timer = 0;
    fall_trigger = [];
    var guitar_x = 0;
    var guitar_y = 0;
    var guitar_depth = 0;
    with (obj_npc_room)
    {
        if (sprite_index == spr_dess_guitar)
        {
            guitar_x = x;
            guitar_y = y;
            guitar_depth = depth;
            visible = 0;
        }
    }
    guitar_marker = scr_marker(guitar_x, guitar_y, spr_dess_guitar);
    guitar_marker.depth = guitar_depth;
    guitar_take = false;
    guitar_take_timer = 0;
    hockey_throw = instance_create(54, 150, obj_homealone_dess_hockey_puck);
    hockey_throw.visible = 0;
    hockey_throw.depth = kris_bed_marker.depth - 10;
    wall_marker = -4;
    ceiling_collider = instance_create(60, 26, obj_homealone_solid);
    with (ceiling_collider)
        image_xscale = 10;
    ceiling_right = instance_create(260, 40, obj_homealone_solid);
    with (ceiling_right)
        image_yscale = 4;
    phone_speech = instance_create(0, 0, obj_homealone_dess_phone);
    kris_move = false;
    kris_move_timer = 0;
    kris_fall = false;
    kris_fall_timer = 0;
    kris_fall_x = 0;
    kris_fall_y = 0;
}
else
{
    var vent_collider = [];
    vent_collider[0] = instance_create(28, 46, obj_homealone_solid);
    with (vent_collider[0])
    {
        image_xscale = 1.2;
        image_yscale = 0.4;
    }
    vent_collider[1] = instance_create(68, 46, obj_homealone_solid);
    with (vent_collider[1])
    {
        image_xscale = 1.2;
        image_yscale = 0.4;
    }
    vent_collider[2] = instance_create(74, 55, obj_homealone_solid);
    with (vent_collider[2])
    {
        image_xscale = 1.2;
        image_yscale = 0.75;
    }
    vent_collider[3] = instance_create(22, 55, obj_homealone_solid);
    with (vent_collider[3])
    {
        image_xscale = 1.2;
        image_yscale = 0.75;
    }
    vent_collider[4] = instance_create(45, 68, obj_homealone_solid);
    with (vent_collider[4])
    {
        image_xscale = 1.5;
        image_yscale = 0.75;
    }
}

get_susie_sprite = function(arg0)
{
    var sprite = spr_susie_sit_arms_crossed;
    switch (arg0)
    {
        case "A":
            sprite = spr_susie_sit_arms_crossed;
            break;
        case "B":
            sprite = spr_susie_sit_arms_crossed_shocked;
            break;
        case "C":
            sprite = spr_susie_sit_arms_crossed_unhappy;
            break;
        case "D":
            sprite = spr_susie_sit_arms_crossed_tsun;
            break;
        case "E":
            sprite = spr_susie_sit_normal_left;
            break;
        case "F":
            sprite = spr_susie_sit_normal_left_look_back;
            break;
        case "G":
            sprite = spr_susie_sit_arms_crossed_look_back;
            break;
    }
    return sprite;
};

get_noelle_sprite = function(arg0)
{
    var sprite_base = string_char_at(arg0, 0);
    var index_code = string_digits(arg0);
    var _image_index = real(index_code);
    var sprite = spr_noelle_sit;
    switch (sprite_base)
    {
        case "A":
            sprite = spr_noelle_sit;
            break;
        case "B":
            sprite = spr_noelle_sit_expressions;
            break;
        case "C":
            sprite = spr_noelle_sit_strangleface;
            break;
        case "D":
            sprite = spr_noelle_sit_blush_expressions;
            break;
        case "E":
            sprite = spr_noelle_sit_sad_down;
            break;
    }
    var _image = [];
    _image[0] = sprite;
    _image[1] = _image_index;
    return _image;
};

trigger_event = function(arg0)
{
    var noelle_base_pos = new Vector2(69, 110);
    var susie_base_pos = new Vector2(45, 112);
    if (string_pos("susie_", arg0) != 0)
    {
        var parts = string_split(arg0, "_", false, 999);
        var sprite_code = string(parts[1]);
        if (sprite_code == "Z")
            exit;
        var susie_sprite = get_susie_sprite(sprite_code);
        with (su_actor)
        {
            sprite_index = susie_sprite;
            x = susie_base_pos.x;
            y = susie_base_pos.y;
        }
    }
    else if (string_pos("noelle_", arg0) != 0)
    {
        var parts = string_split(arg0, "_", false, 999);
        var sprite_code = string(parts[1]);
        if (sprite_code == "Z")
            exit;
        with (no_actor)
        {
            image_speed = 0;
            auto_walk = 0;
            x = noelle_base_pos.x;
            y = noelle_base_pos.y;
        }
        var noelle_sprite = get_noelle_sprite(sprite_code);
        no_actor.sprite_index = noelle_sprite[0];
        no_actor.image_index = noelle_sprite[1];
    }
    else
    {
        switch (arg0)
        {
            case "kris_notice":
                with (obj_homealone_dess_closet_kris)
                    notice = true;
                break;
            case "kris_cringe":
                with (obj_homealone_dess_closet_kris)
                    cringe = true;
                break;
            case "convo_branch_finished":
                with (obj_homealone_dess_closet_kris)
                    tired_mode = true;
                with (convo_controller)
                    start_final_convo();
                break;
            case "convo_tree_finished":
                break;
            case "convo_interrupted":
                with (su_actor)
                {
                    sprite_index = spr_susie_sit_awkward;
                    image_speed = 0;
                    x = susie_base_pos.x;
                    y = susie_base_pos.y;
                }
                with (no_actor)
                {
                    sprite_index = spr_noelle_sit_awkward;
                    image_index = 0;
                    x = noelle_base_pos.x;
                    y = noelle_base_pos.y;
                }
                break;
        }
    }
};

kris_get_heart = function()
{
    kris_bed_hide = false;
    guitar_take = false;
    con = 1;
};

heart_burst_event = function()
{
    scr_shakescreen();
    instance_create(kr_actor.x + 16, kr_actor.y + 16, obj_heartburst);
    snd_play(snd_grab);
    snd_play(snd_hurt1);
};

cutscene_end = function()
{
    con = 53;
};
