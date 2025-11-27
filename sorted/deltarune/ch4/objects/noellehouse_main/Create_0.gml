vent_closet = scr_marker(325, 440, spr_noellehouse_vent_main_left);
vent_closet.depth = 4999;
vent_kitchen = scr_marker(585, 440, spr_noellehouse_vent_main_right);
vent_kitchen.depth = 4999;

disable_vents = function()
{
    vent_closet.sprite_index = spr_noellehouse_vent_closed_cover;
    with (vent_closet)
        scr_depth();
    vent_kitchen.sprite_index = spr_noellehouse_vent_closed_cover;
    with (vent_kitchen)
        scr_depth();
    with (obj_homealone_vent_overlay)
        instance_destroy();
};

var santa_table = scr_marker(704, 486, spr_noellehouse_table);
with (santa_table)
    depth = 100000;
var santa_normal = instance_create(713, 451, obj_homealone_dancing_santa);
with (santa_normal)
    santa_type = 0;
santa_normal.depth = santa_table.depth - 10;
var santa_starved_table = scr_marker(150, 486, spr_noellehouse_table);
with (santa_starved_table)
    depth = 100000;
var santa_starved = instance_create(158, 451, obj_homealone_dancing_santa);
with (santa_starved)
{
    santa_type = 1;
    scr_depth();
}
var santa_hyper = instance_create(468, 308, obj_homealone_dancing_santa);
with (santa_hyper)
{
    santa_type = 2;
    scr_depth();
}
couch_marker = scr_marker(405, 512, spr_noellehouse_main_couch_big);
with (couch_marker)
    scr_depth();
if (global.plot >= 50 && global.plot < 95)
{
    with (obj_doorAny)
    {
        if (x > 790 && y > 490)
            instance_destroy();
    }
}
if (global.plot >= 50 && global.plot < 55)
    instance_create(0, 0, obj_ch4_PDC09);
if (global.plot < 60)
    instance_create(0, 0, obj_ch4_PDC09A);
if (global.plot >= 50 && global.plot < 60)
    instance_create(0, 0, obj_ch4_PDC10);
var noelle_npc = -4;
var susie_npc = -4;
if (global.plot >= 60 && global.plot <= 63)
{
    noelle_npc = instance_create(497, 527, obj_npc_room);
    noelle_npc.normalanim = 4;
    noelle_npc.sprite_index = spr_noelle_walk_up_lw;
    noelle_npc.depth = 94140;
    noelle_npc.extflag = "phone_look_noelle";
    susie_npc = instance_create(473, 530, obj_npc_room);
    susie_npc.normalanim = 4;
    susie_npc.sprite_index = spr_susie_walk_up_lw;
    susie_npc.depth = 94150;
    susie_npc.extflag = "phone_look_susie";
    if (!scr_sideb_active())
    {
        var phone_npc = instance_create(400, 542, obj_ch4_PDC10_phone);
        phone_npc.sprite_index = spr_phone_prop;
        phone_npc.depth = 94475;
        if (global.plot == 61)
        {
            with (noelle_npc)
                instance_destroy();
            with (susie_npc)
                instance_destroy();
            var susie_marker = scr_marker(430, 520, spr_susie_sit_normal);
            susie_marker.depth = 94140;
            var noelle_marker = scr_marker(450, 515, spr_noelle_sit_blush);
            noelle_marker.depth = 94150;
        }
    }
    else
    {
        noelle_npc.y = 512;
        noelle_npc.sprite_index = spr_noelle_sit_blush_left;
        noelle_npc.depth = 94300;
        noelle_npc.extflag = "phone_look_noelle_weird";
        susie_npc.y = 515;
        susie_npc.sprite_index = spr_susie_sit_normal;
        susie_npc.depth = 94300;
        susie_npc.extflag = "phone_look_susie_weird";
    }
}
if (global.plot == 61)
{
    disable_vents();
    instance_create(0, 0, obj_ch4_PDC10B);
}
if (scr_flag_get(737) == 1)
{
    disable_vents();
    instance_create(0, 0, obj_homealone_main_kris_closet);
    if (noelle_npc == -4)
    {
        noelle_npc = instance_create(497, 527, obj_npc_room);
        noelle_npc.normalanim = 4;
    }
    if (susie_npc == -4)
    {
        susie_npc = instance_create(473, 530, obj_npc_room);
        susie_npc.normalanim = 4;
    }
    noelle_npc.y = 512;
    noelle_npc.sprite_index = spr_noelle_sit_blush_left;
    noelle_npc.depth = 94300;
    susie_npc.y = 515;
    susie_npc.sprite_index = spr_susie_sit_normal;
    susie_npc.depth = 94300;
}
snacktray_marker = instance_create(460, 590, obj_marker_palette);
snacktray_marker.sprite_index = spr_noellehouse_platter;
snacktray_marker.depth = 93560;
if (global.plot >= 65)
{
    disable_vents();
    with (obj_homealone_vent_hidden)
        instance_destroy();
    with (obj_homealone_solid)
    {
        if (y >= 415 && y <= 460 && x >= 300 && x < 660)
            instance_destroy();
    }
    door_marker = scr_marker(423, 295, spr_noellehouse_door_dess);
    with (door_marker)
    {
        image_index = 1;
        scr_depth();
    }
    var door_entrance = instance_create(428, 320, obj_homealone_vent_hidden);
    with (door_entrance)
    {
        image_xscale = 0.8;
        image_yscale = 0.65;
        room_name = room_lw_noellehouse_dess;
        vent_name = "door";
        load_type = "bottom";
    }
    if (global.plot == 65)
    {
        with (snacktray_marker)
            instance_destroy();
        instance_create(0, 0, obj_ch4_PDC13D);
    }
    if (global.plot > 65 && global.plot < 67)
    {
        with (snacktray_marker)
            instance_destroy();
        snacktray_marker = scr_marker(460, 598, spr_noellehouse_platter);
        snacktray_marker.depth = 93530;
        overlay = instance_create(0, 0, obj_noellehouse_basement_overlay);
        with (overlay)
        {
            set_alpha(0.5);
            set_heart_target(568);
            heart_glow_show();
        }
        table_marker = scr_marker(470, 551, spr_noellehouse_table_tray);
        table_marker.depth = 80000;
        var angel_x_pos = (global.tempflag[92] == 1) ? 535 : 425;
        angel_marker = scr_marker(angel_x_pos, 610, spr_noellehouse_basement_angel);
        with (angel_marker)
        {
            depth = 80000;
            image_angle = -180;
        }
    }
    if (global.plot == 67)
    {
        with (snacktray_marker)
            instance_destroy();
        with (door_marker)
            instance_destroy();
        instance_create(0, 0, obj_ch4_PDC14C);
        with (obj_readable_room1)
        {
            if (y >= 580)
                instance_destroy();
        }
    }
}
