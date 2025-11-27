con = -1;
customcon = 0;
tenna_fly = false;
tenna_fly_timer = 0;
tenna_fly_time = 60;
tenna_fly_counter = 0;
tenna_fly_stop = false;
tenna_fly_prevchoice = -1;
icee_throw = false;
icee_throw_timer = 0;
icee_throw_time = 15;
icee_throw_index = 0;
gachapon_list = [];
base_depth = 1000000;
for (var i = 0; i < 4; i++)
{
    var gachapon = scr_dark_marker(640 + (i * 140), 180, spr_dw_tv_gachaball_transparent);
    gachapon.depth = base_depth - (40 + i);
    gachapon.image_angle = ((i % 3) == 1) ? (0 + (i * 10)) : (45 + (i * 20));
    gachapon_list[array_length_1d(gachapon_list)] = gachapon;
}
for (var i = 0; i < 3; i++)
{
    var gachapon = scr_dark_marker(720 + (i * 120), 170, spr_dw_tv_gachaball_transparent);
    gachapon.depth = base_depth - (30 + i);
    gachapon.image_angle = ((i % 2) == 1) ? (45 - (i * 10)) : (0 + (i * 20));
    gachapon_list[array_length_1d(gachapon_list)] = gachapon;
}
for (var i = 0; i < 5; i++)
{
    var gachapon = scr_dark_marker(680 + (i * 80), 150, spr_dw_tv_gachaball_transparent);
    gachapon.depth = base_depth - (20 + i);
    gachapon.image_angle = ((i % 2) == 1) ? (0 + (i * 10)) : (45 - (i * 20));
    gachapon_list[array_length_1d(gachapon_list)] = gachapon;
}
for (var i = 0; i < 3; i++)
{
    var gachapon = scr_dark_marker(750 + (i * 90), 140, spr_dw_tv_gachaball_transparent);
    gachapon.depth = base_depth - (10 + i);
    gachapon.image_angle = ((i % 3) == 1) ? (0 - (i * 20)) : (45 + (i * 10));
    gachapon_list[array_length_1d(gachapon_list)] = gachapon;
}
var solid_blocks = instance_create(620, 190, obj_solidblocksized);
with (solid_blocks)
    image_xscale = 12;
var left_block = instance_create(580, 190, obj_sur_dark);
var right_block = instance_create(1090, 190, obj_sul_dark);
var gacha_readable = instance_create(610, 190, obj_readable_room1);
with (gacha_readable)
{
    image_xscale = 24;
    image_yscale = 2;
    extflag = "gacha";
}
if (global.plot < 250)
{
    scr_setparty(1, 1, 0);
    con = 0;
}
else
{
    if (global.plot >= 280 && scr_flag_get(254) > 0)
    {
        var starwalker_npc = instance_create(143, 150, obj_npc_room);
        with (starwalker_npc)
        {
            extflag = "starwalker";
            sprite_index = spr_npc_originalstarwalker;
            scr_depth();
        }
    }
    instance_destroy();
}
