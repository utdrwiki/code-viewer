init = 0;
cutscene = 0;
con = (scr_flag_get(1503) == 0 && scr_flag_get(1523) == 0) ? 0 : -1;
customcon = 0;
gerson_npc = -4;
if (con == 0)
{
    global.interact = 1;
    global.facing = 1;
    scr_setparty(1, 1, 0);
    with (obj_mainchara)
    {
        x = 688;
        y = 464;
    }
    with (obj_caterpillarchara)
    {
        if (name == "susie")
        {
            fun = 1;
            sprite_index = spr_susie_shock_r;
            x = 634;
            y = 449;
        }
        else if (name == "ralsei")
        {
            fun = 1;
            sprite_index = spr_ralsei_surprised_right;
            x = 560;
            y = 453;
        }
    }
    scr_caterpillar_interpolate("all");
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 5100;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    play_noise = false;
    current_noise = 201;
    temp_noise = 201;
    if (scr_debug())
    {
        if (global.tempflag[90] == 1)
        {
            con = 41;
            global.interact = 1;
            global.facing = 1;
            gerson_npc = instance_create(1288, 392, obj_npc_gerson);
            with (gerson_npc)
            {
                current_state = 0;
                current_sprite_index = spr_gerson_sit_look;
                depth = 94742;
            }
            global.facing = 0;
            with (obj_caterpillarchara)
            {
                if (name == "susie")
                    fun = 0;
                else if (name == "ralsei")
                    fun = 0;
            }
            cutscene_master = scr_cutscene_make();
            scr_maincharacters_actors();
            c_mus2("initloop", "church_dark_study.ogg", 0);
            c_mus2("pitch", 0.95, 0);
            c_pannable(1);
            c_pan(950, 260, 1);
            c_sel(kr);
            c_autodepth(0);
            c_depth(94746);
            c_facing("d");
            c_setxy(1223, 398);
            c_sel(su);
            c_visible(0);
            c_sel(ra);
            c_autodepth(0);
            c_depth(93000);
            c_sprite(spr_tea_party_ralsei_sit);
            c_setxy(1134, 424);
            c_waitcustom();
        }
    }
}
var platform_marker = scr_dark_marker(1122, 400, spr_tea_party_platform);
platform_marker.depth = 1999990;
var rug_marker = scr_dark_marker(platform_marker.x + 58, platform_marker.y + 24, spr_tea_party_rug);
rug_marker.depth = platform_marker.depth - 10;
table_marker = scr_dark_marker(1184, 440, spr_tea_party_table_long);
with (table_marker)
    scr_depth();
chair_left_marker = scr_dark_marker(table_marker.x - 52, table_marker.y + 4, spr_tea_party_chair_left);
with (chair_left_marker)
    depth = 94750;
chair_right_marker = scr_dark_marker(table_marker.x + 216, table_marker.y + 4, spr_tea_party_chair_right);
with (chair_right_marker)
    depth = 97000;
chair_top_left_marker = scr_dark_marker(table_marker.x + 40, table_marker.y - 36, spr_tea_party_chair_down);
with (chair_top_left_marker)
    depth = 98000;
chair_top_right_marker = scr_dark_marker(table_marker.x + 124, table_marker.y - 36, spr_tea_party_chair_down);
with (chair_top_right_marker)
    depth = 98000;
cup_kris_marker = scr_dark_marker(table_marker.x + 48, table_marker.y - 4, spr_tea_party_cup);
cup_kris_marker.depth = table_marker.depth - 4;
cup_gerson_marker = scr_dark_marker(table_marker.x + 138, table_marker.y - 4, spr_tea_party_cup);
cup_gerson_marker.depth = table_marker.depth - 4;
cup_ralsei_marker = scr_dark_marker(table_marker.x + 10, table_marker.y + 6, spr_tea_party_cup);
cup_ralsei_marker.depth = table_marker.depth - 4;
cup_susie_marker = scr_dark_marker(table_marker.x + 172, table_marker.y + 10, spr_tea_party_cup);
cup_susie_marker.depth = table_marker.depth - 4;
pot_marker = scr_dark_marker(table_marker.x + 80, table_marker.y - 4, spr_tea_party_pot);
pot_marker.depth = table_marker.depth - 10;
sugar_marker = scr_dark_marker(table_marker.x + 108, table_marker.y + 14, spr_tea_party_sugar);
sugar_marker.depth = table_marker.depth - 6;
utensils_ralsei_marker = scr_dark_marker(table_marker.x + 20, table_marker.y + 28, spr_tea_party_utensils);
utensils_ralsei_marker.depth = table_marker.depth - 6;
with (utensils_ralsei_marker)
    scr_flip("x");
utensils_susie_marker = scr_dark_marker(table_marker.x + 160, table_marker.y + 24, spr_tea_party_utensils);
utensils_susie_marker.depth = table_marker.depth - 6;
utensils_kris_marker = scr_dark_marker(table_marker.x + 40, table_marker.y + 32, spr_tea_party_utensils);
utensils_kris_marker.depth = table_marker.depth - 6;
with (utensils_kris_marker)
    image_angle = 90;
utensils_gerson_marker = scr_dark_marker(table_marker.x + 130, table_marker.y + 32, spr_tea_party_utensils);
utensils_gerson_marker.depth = table_marker.depth - 6;
with (utensils_gerson_marker)
    image_angle = 90;
apple_marker = scr_dark_marker(table_marker.x + 70, table_marker.y + 14, spr_tea_party_apple_core);
apple_marker.depth = table_marker.depth - 6;
apple_marker.visible = 0;
var chair_block_left = instance_create(chair_left_marker.x + 2, chair_left_marker.y + 34, obj_solidblocksized);
with (chair_block_left)
    image_yscale = 0.8;
var table_block = instance_create(table_marker.x + 4, table_marker.y + 10, obj_solidblocksized);
with (table_block)
{
    image_xscale = 4.7;
    image_yscale = 1.5;
}
var chair_block_right = instance_create(chair_right_marker.x + 2, chair_right_marker.y + 34, obj_solidblocksized);
with (chair_block_right)
    image_yscale = 0.8;
var chair_block_top_left = instance_create(chair_top_left_marker.x, chair_top_left_marker.y + 30, obj_solidblocksized);
var chair_block_top_right = instance_create(chair_top_right_marker.x, chair_top_right_marker.y + 30, obj_solidblocksized);

answer_choice = function(arg0, arg1)
{
    switch (arg0)
    {
        case 1414:
            scr_flag_set(1519, arg1 + 1);
            if (arg1 == 0)
                con = 10;
            else if (arg1 == 1)
                con = 20;
            else if (arg1 == 2)
                con = 30;
            break;
        case 1416:
            scr_flag_set(1521, arg1 + 1);
            if (arg1 == 0)
                con = 50;
            else if (arg1 == 1)
                con = 60;
            break;
        case 1418:
            scr_flag_set(1523, arg1 + 1);
            if (arg1 == 0)
                con = 25;
            else if (arg1 == 1)
                con = 28;
            break;
    }
};

clean_up = function()
{
    pot_marker.x = table_marker.x + 80;
    pot_marker.y = table_marker.y - 4;
    chair_top_left_marker.depth = table_marker.depth + 2;
    chair_top_right_marker.depth = table_marker.depth + 2;
    chair_left_marker.depth = table_marker.depth - 2;
    chair_right_marker.depth = table_marker.depth - 2;
    if (scr_flag_get(1503) == 1)
    {
        utensils_susie_marker.sprite_index = spr_tea_party_utensils_messy;
        utensils_gerson_marker.sprite_index = spr_tea_party_utensils_messy;
        utensils_gerson_marker.y += 16;
        cup_ralsei_marker.x -= 6;
        cup_ralsei_marker.y += 10;
    }
    if (scr_flag_get(1521) == 2 && scr_sideb_active() == false)
        apple_marker.visible = 1;
    with (gerson_npc)
        instance_destroy();
    instance_destroy();
};

if (con == -1)
    clean_up();
