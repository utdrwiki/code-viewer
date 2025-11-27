var lineup = scr_flag_get(792);
addison_sell_sprite = 1174;
addison_buy_sprite = 1178;
ad_a_sprite = 4898;
ad_b_sprite = 1512;
ad_c_sprite = 3348;
if (lineup == 1)
{
    addison_sell_sprite = 1170;
    addison_buy_sprite = 1174;
    ad_a_sprite = 5086;
    ad_b_sprite = 1512;
    ad_c_sprite = 3348;
}
if (lineup == 2)
{
    addison_sell_sprite = 1172;
    addison_buy_sprite = 1170;
    ad_a_sprite = 3507;
    ad_b_sprite = 5086;
    ad_c_sprite = 4898;
}
if (lineup == 3)
{
    addison_sell_sprite = 1178;
    addison_buy_sprite = 1172;
    ad_a_sprite = 1512;
    ad_b_sprite = 4898;
    ad_c_sprite = 3348;
}
ad[0] = scr_dark_marker(700, 60, ad_a_sprite);
ad[1] = scr_dark_marker(878, 20, ad_b_sprite);
ad[2] = scr_dark_marker(905, 77, ad_c_sprite);
for (var i = 0; i < array_length_1d(ad); i++)
{
    with (ad[i])
    {
        scr_depth();
        image_speed = 0.1;
    }
}
var addison_sell_npc = instance_create(810, 90, obj_npc_room);
addison_sell_npc.sprite_index = addison_sell_sprite;
with (addison_sell_npc)
    scr_depth();
var booth = scr_dark_marker(810, 65, spr_npc_addison_stand);
booth.depth = addison_sell_npc.depth - 10;
var booth_collider = instance_create(booth.x - 40, booth.y + 90, obj_solidblockDark);
with (booth_collider)
    image_xscale = 3;
var booth_sign = scr_dark_marker(booth.x + 14, booth.y - 4, spr_dw_ads_small_ad);
booth_sign.depth = booth.depth - 10;
booth_sign.image_speed = 0.1;
var addison_buy_npc = instance_create(710, 99, obj_npc_room);
addison_buy_npc.sprite_index = addison_buy_sprite;
with (addison_buy_npc)
{
    scr_flip("x");
    scr_depth();
}
lineup++;
if (lineup > 3)
    lineup = 0;
scr_flag_set(792, lineup);
balloon_move = true;
balloon_siner = 0;
balloon_flip_timer = 0;
balloon[0] = scr_dark_marker(booth.x - 40, booth.y - 20, spr_dw_city_balloon);
with (balloon[0])
    scr_depth();
balloon[1] = scr_dark_marker(booth.x + 150, booth.y - 40, spr_dw_city_balloon);
balloon[1].depth = addison_buy_npc.depth + 10;
with (balloon[1])
    scr_flip("x");
