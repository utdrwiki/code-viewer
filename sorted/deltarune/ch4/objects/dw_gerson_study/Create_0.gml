layer_set_visible("DEBUG_ASSETS", 0);
con = -1;
convo_flag = "";
customcon = 0;
var bg_lights = instance_create(0, 0, obj_dw_gerson_study_lights);
bg_lights.depth = 5100;
var desk_marker = scr_dark_marker(366, 770, bg_dw_gerson_desk);
with (desk_marker)
    depth = 91640;
var chair_marker = scr_dark_marker(430, 740, bg_dw_gerson_chair);
chair_marker.depth = desk_marker.depth + 10;
table_active = false;
fountain_active = false;
var item_fountain_marker = scr_dark_marker(722, 196, spr_dw_gerson_fountain);
with (item_fountain_marker)
{
    image_speed = 0.2;
    scr_depth();
}
var fountain_readable = instance_create(730, 207, obj_readable_room1);
with (fountain_readable)
{
    image_xscale = 4;
    image_yscale = 2;
    extflag = "item_fountain";
}
paper_marker = -4;
jack_look = false;
cute_active = false;
cute_timer = 0;
_blush = -4;
gerson_door = scr_dark_marker(400, 120, spr_dw_gerson_study_door);
with (gerson_door)
    depth = 100000;
if (scr_flag_get(847) > 0)
{
    gerson_door.image_index = 1;
}
else
{
    var door_block = instance_create(gerson_door.x, gerson_door.y + 120, obj_solidblocksized);
    with (door_block)
        image_xscale = 4;
    var door_readable = instance_create(door_block.x, door_block.y, obj_readable_room1);
    with (door_readable)
    {
        extflag = "central_door";
        image_xscale = 8;
        image_yscale = 2;
    }
}
if (global.plot >= 230)
{
    if (scr_flag_get(1642) == 1)
    {
        gerson_door.image_index = 0;
        var door_block = instance_create(gerson_door.x, gerson_door.y + 120, obj_solidblocksized);
        with (door_block)
            image_xscale = 4;
        var door_readable = instance_create(door_block.x, door_block.y, obj_readable_room1);
        with (door_readable)
        {
            extflag = "central_door_dog";
            image_xscale = 8;
            image_yscale = 2;
        }
    }
}
gerson_npc = instance_create(446, 750, obj_npc_gerson);
with (gerson_npc)
{
    current_state = 17;
    scr_depth();
}
gerson_npc.depth = desk_marker.depth - 10;
paper_marker = scr_dark_marker(gerson_npc.x - 4, gerson_npc.y + 50, spr_gerson_writing_paper);
paper_marker.depth = gerson_npc.depth + 4;
sparkle_marker = -4;
if (global.plot >= 242)
{
    with (gerson_npc)
        instance_destroy();
    with (paper_marker)
        instance_destroy();
}

show_fireplace = function()
{
    var fireplace_marker = scr_dark_marker(414, 616, spr_dw_gerson_study_fireplace);
    with (fireplace_marker)
    {
        depth = 999990;
        image_speed = 0.2;
    }
    fireplace_block = instance_create(400, 640, obj_solidblocksized);
    with (fireplace_block)
        image_xscale = 4;
    plaque_marker = scr_dark_marker(444, 570, spr_dw_gerson_study_plaque);
    with (plaque_marker)
        scr_depth();
    var plaque_readable = instance_create(plaque_marker.x, plaque_marker.y + 20, obj_readable_room1);
    with (plaque_readable)
    {
        image_xscale = 4;
        image_yscale = 4;
        extflag = "plaque";
    }
    if (scr_flag_get(1548) == 0)
    {
        sparkle_marker = scr_dark_marker(plaque_marker.x + 34, plaque_marker.y + 20, spr_shine_white);
        sparkle_marker.depth = plaque_marker.depth - 10;
        with (sparkle_marker)
            image_speed = 0.1;
    }
    if (global.plot >= 242)
    {
        with (plaque_readable)
            instance_destroy();
        with (sparkle_marker)
            instance_destroy();
    }
};

hide_fireplace = function()
{
    var fireplace_marker = scr_dark_marker(280, 520, spr_dw_gerson_study_fireplace_empty);
    with (fireplace_marker)
        depth = 999990;
    plaque_marker = scr_dark_marker(444, 522, spr_dw_gerson_study_plaque);
    with (plaque_marker)
        scr_depth();
};

hide_sparkle = function()
{
    if (sparkle_marker == -4)
        exit;
    with (sparkle_marker)
        instance_destroy();
};

if (scr_flag_get(1547) == 0 || global.plot >= 242)
    show_fireplace();
else
    hide_fireplace();
if (scr_flag_get(850) >= 3)
{
    if (global.plot < 242)
    {
        jack_marker = scr_dark_marker(600, 724, spr_npc_jackenstein_cleaning);
        with (jack_marker)
        {
            sprite_index = spr_npc_jackenstein_cleaning;
            image_speed = 0.2;
            depth = 91430;
        }
        var jack_readable = instance_create(jack_marker.x + 15, jack_marker.y + 130, obj_readable_room1);
        with (jack_readable)
        {
            extflag = "jackenstein";
            image_xscale = 8;
            image_yscale = 1;
        }
        var jack_solid_bottom = instance_create(jack_marker.x + 15, jack_marker.y + 90, obj_solidblockDark);
        with (jack_solid_bottom)
        {
            image_xscale = 4;
            image_yscale = 2;
        }
        var jack_solid_broom = instance_create(jack_marker.x + 50, jack_marker.y + 140, obj_solidblockDark);
        with (jack_solid_broom)
            image_yscale = 1.2;
    }
}
else
{
    var statue_right = scr_dark_marker(690, 758, bg_dw_gerson_statue_right);
    with (statue_right)
        scr_depth();
    var statue_block = instance_create(722, 800, obj_solidblockDark);
    with (statue_block)
    {
        image_xscale = 1.95;
        image_yscale = 2.7;
    }
}
fireplace_grow_marker = -4;
if (global.tempflag[90] == 400)
{
    con = 100;
    hide_sparkle();
    fireplace_grow_marker = scr_dark_marker(280, 520, spr_dw_gerson_study_fireplace_grow);
    fireplace_grow_marker.visible = 0;
    fireplace_grow_marker.depth = 100000;
    plaque_marker.depth = fireplace_grow_marker.depth - 10;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_alpha = 1;
    blackall.image_blend = c_black;
}
if (global.tempflag[94] == 1)
{
    con = 200;
    gerson_door = scr_dark_marker(400, 120, spr_dw_gerson_study_door);
    gerson_door.image_index = 0;
    with (gerson_door)
        depth = 90000;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_alpha = 1;
    blackall.image_blend = c_black;
}

answer_choice = function(arg0, arg1)
{
    switch (arg0)
    {
        case 1424:
            if (arg1 == 0)
                con = 10;
            break;
    }
};

show_convo = function(arg0)
{
    convo_flag = arg0;
    con = 20;
};

greenflame = -4;
cup = -4;
if (global.plot >= 242)
{
    scr_script_delayed(event_user, 1, 9);
    var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
    for (var i = 0; i < array_length(spritesArray); i++)
    {
        if (layer_sprite_get_sprite(spritesArray[i]) == 5585)
            cup = scr_makenpc_fromasset(spritesArray[i]);
        if (!i_ex(fireplace_grow_marker))
        {
            fireplace_grow_marker = scr_dark_marker(280, 520, spr_dw_gerson_study_fireplace_grow);
            fireplace_grow_marker.visible = true;
            fireplace_grow_marker.depth = 100000;
            fireplace_grow_marker.image_index = 2;
        }
        if (i_ex(plaque_marker))
            plaque_marker.x = room_width * 4;
    }
}
hammerTreasure = -4;
if (global.flag[1688] == 2)
{
    var chest = findspriteinfo(spr_treasurebox, "DEBUG_ASSETS");
    hammerTreasure = instance_create(chest.x, chest.y, obj_treasure_room);
    with (hammerTreasure)
    {
        scr_darksize();
        itemflag = 1688;
        itemtype = "weapon";
        itemidchest = 52;
        depth = 92750;
        shine = scr_marker_ext(x + 14, y + 18, spr_shine_white, 2, 2, 0.125, undefined, undefined, depth - 5);
        siner = 0;
    }
}
