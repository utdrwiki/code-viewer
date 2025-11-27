con = -1;
timer = 0;
solo_mode = !scr_havechar(3) && !scr_havechar(2);
if (!variable_global_exists("right_click_mic"))
    global.right_click_mic = 0;
if (!variable_global_exists("use_mic"))
    global.use_mic = !(global.is_console || onSteamDeck());
if (!variable_global_exists("microphone"))
    global.microphone = 0;
console_version = global.is_console || onSteamDeck();
if (console_version)
{
    maus_marker = scr_dark_marker(320, 330, spr_npc_maus_idle_overworld);
    maus_interact = instance_create(310, 320, obj_readable_room1);
    with (maus_marker)
        scr_depth(self, -40);
    maus_interact.extflag = "mouse";
    instance_create(310, 320, obj_solidblock);
    var cntrl = instance_create(310, 320, obj_mike_controller);
    cntrl.__usable = false;
    with (obj_mike_slot)
        instance_destroy();
}
else
{
    maus_marker = scr_dark_marker(440, 420, spr_npc_maus_idle_overworld);
    with (maus_marker)
        scr_depth(self, -10);
}
last_num = 0;
maus_action = 0;
maus_timer = 0;
maus_transform = false;
maus_transform_timer = 0;
mike_s = instance_create(120, 176, obj_mike);
mike_s.pickable = !console_version;
with (mike_s)
{
    sprite_index = spr_mike_s;
    readable = instance_create(x, y, obj_readable_room1);
    readable.extflag = "mike_s";
    readable.image_xscale = 2;
    readable.image_yscale = 2;
}
mike_l = instance_create(268, 92, obj_mike);
mike_l.pickable = !console_version;
with (mike_l)
{
    sprite_index = spr_mike_l;
    readable = instance_create(x, y, obj_readable_room1);
    readable.extflag = "mike_l";
    readable.image_xscale = 2;
    readable.image_yscale = 2;
}
mike_m = instance_create(418, 146, obj_mike);
mike_m.pickable = !console_version;
with (mike_m)
{
    sprite_index = spr_mike_m;
    image_speed = 0.25;
    readable = instance_create(x, y, obj_readable_room1);
    readable.extflag = "mike_m";
    readable.image_xscale = 2;
    readable.image_yscale = 2;
}
with (obj_mike)
{
    scr_depth();
    if (other.console_version)
    {
        var block = instance_create(bbox_left + 20, bbox_bottom - 20, obj_solidblocksized);
        block.image_xscale = (bbox_right - 40 - bbox_left) / 40;
        block.image_yscale = 0.55;
        if (sprite_index == spr_mike_l)
            block.image_xscale += 0.6;
    }
}

show_convo = function(arg0)
{
    switch (arg0)
    {
        case "mike_s":
            con = 1;
            break;
        case "mike_l":
            con = 2;
            break;
        case "mike_m":
            con = 3;
            break;
        case "mouse":
            con = 4;
            break;
        case "bomb":
            con = 5;
            break;
    }
};

bomb_marker = scr_dark_marker(540, 380, spr_mike_bomb);
bomb_interact = instance_create(540, 380, obj_readable_room1);
bomb_interact.image_xscale = 2;
bomb_interact.image_yscale = 2;
with (bomb_marker)
    scr_depth();
bomb_interact.extflag = "bomb";
instance_create(540, 380, obj_solidblocksized);
bomb_marker.image_speed = 0.1;
reset_blend = 0;
depth = 0;
