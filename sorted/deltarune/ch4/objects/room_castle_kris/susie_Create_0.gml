var recruited_all = scr_recruited_all_previous();
audio_file = recruited_all ? "castle_funk_long.ogg" : "castletown.ogg";
if (!snd_is_playing(global.currentsong[1]))
{
    global.currentsong[0] = snd_init(audio_file);
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
}
scene_complete = scr_flag_get(1514) > 0;
con = !scene_complete ? 0 : -1;
customcon = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
blackall.image_alpha = (con == 0) ? 1 : 0;
chair_left_marker = scr_dark_marker(335, 243, spr_tea_party_chair_left);
with (chair_left_marker)
    depth = 97100;
chair_right_marker = scr_dark_marker(557, 243, spr_tea_party_chair_right);
with (chair_right_marker)
    depth = 97000;
chair_top_marker = scr_dark_marker(444, 200, spr_tea_party_chair_down);
with (chair_top_marker)
    depth = 98000;
table_marker = scr_dark_marker(390, 248, spr_tea_party_table);
with (table_marker)
    scr_depth();
cup_ralsei_marker = scr_dark_marker(400, 258, spr_tea_party_cup);
cup_ralsei_marker.depth = table_marker.depth - 4;
cup_kris_marker = scr_dark_marker(486, 250, spr_tea_party_cup);
cup_kris_marker.depth = table_marker.depth - 4;
cup_susie_marker = scr_dark_marker(510, 250, spr_tea_party_cup);
cup_susie_marker.depth = table_marker.depth - 4;
pot_marker = scr_dark_marker(418, 279, spr_tea_party_pot);
pot_marker.depth = table_marker.depth - 10;
cake_marker = scr_dark_marker(443, 244, spr_tea_party_cake);
cake_marker.depth = table_marker.depth - 8;
slice_marker = scr_dark_marker(496, 268, spr_tea_party_cake_slice);
slice_marker.depth = table_marker.depth - 10;
sugar_marker = scr_dark_marker(515, 260, spr_tea_party_sugar);
sugar_marker.depth = table_marker.depth - 6;
sugar_flick = false;
sugar_flick_timer = 0;
kris_sit = false;
var chair_block_left = instance_create(chair_left_marker.x + 2, chair_left_marker.y + 34, obj_solidblocksized);
with (chair_block_left)
    image_yscale = 0.8;
var table_block = instance_create(table_marker.x + 4, table_marker.y + 10, obj_solidblocksized);
with (table_block)
{
    image_xscale = 3.5;
    image_yscale = 1.5;
}
var chair_block_right = instance_create(chair_right_marker.x + 2, chair_right_marker.y + 34, obj_solidblocksized);
with (chair_block_right)
    image_yscale = 0.8;
var chair_block_top = instance_create(chair_top_marker.x, chair_top_marker.y + 30, obj_solidblocksized);

answer_choice = function(arg0, arg1)
{
    switch (arg0)
    {
        case 1410:
            scr_flag_set(1514, arg1 + 1);
            if (arg1 == 0)
                con = 10;
            else if (arg1 == 1)
                con = 20;
            else if (arg1 == 2)
                con = 30;
            break;
        case 1412:
            scr_flag_set(1515, arg1 + 1);
            if (arg1 == 0)
                con = 50;
            else if (arg1 == 1)
                con = 60;
            break;
    }
};

clean_up = function()
{
    slice_marker.x = 390;
    pot_marker.x = 400;
    pot_marker.y = 239;
    chair_top_marker.depth = table_marker.depth - 2;
    var bed_readable_susie = instance_create(146, 190, obj_readable_room1);
    with (bed_readable_susie)
    {
        extflag = "bed_susie";
        image_xscale = 4;
        image_yscale = 4;
    }
    var fridge_readable = instance_create(255, 160, obj_readable_room1);
    with (fridge_readable)
    {
        extflag = "fridge";
        image_xscale = 2;
        image_yscale = 2;
    }
    var shelf_susie_readable = instance_create(360, 150, obj_readable_room1);
    with (shelf_susie_readable)
    {
        extflag = "shelf";
        image_xscale = 2.5;
        image_yscale = 2;
    }
    var wardrobe_readable = instance_create(436, 150, obj_readable_room1);
    with (wardrobe_readable)
    {
        extflag = "wardrobe";
        image_xscale = 2;
        image_yscale = 2;
    }
    var shelf_kris_readable = instance_create(512, 150, obj_readable_room1);
    with (shelf_kris_readable)
    {
        extflag = "shelf";
        image_xscale = 2.5;
        image_yscale = 2;
    }
    var drawer_readable = instance_create(610, 150, obj_readable_room1);
    with (drawer_readable)
    {
        extflag = "drawer";
        image_xscale = 3;
        image_yscale = 2;
    }
    var bed_readable_kris = instance_create(700, 190, obj_readable_room1);
    with (bed_readable_kris)
    {
        extflag = "bed_kris";
        image_xscale = 4;
        image_yscale = 4;
    }
    var chair_readable_left = instance_create(350, 280, obj_readable_room1);
    with (chair_readable_left)
    {
        extflag = "chair";
        image_xscale = 1;
        image_yscale = 1;
    }
    var chair_readable_right = instance_create(560, 280, obj_readable_room1);
    with (chair_readable_right)
    {
        extflag = "chair";
        image_xscale = 1;
        image_yscale = 1;
    }
    var chair_readable_top = instance_create(455, 230, obj_readable_room1);
    with (chair_readable_top)
    {
        extflag = "chair";
        image_xscale = 1;
        image_yscale = 1;
    }
    var table_readable = instance_create(415, 290, obj_readable_room1);
    with (table_readable)
    {
        extflag = "table";
        image_xscale = 5;
        image_yscale = 1;
    }
    if (scene_complete)
        table_readable.extflag = "table_alt";
    instance_destroy();
};

if (scene_complete)
    clean_up();
