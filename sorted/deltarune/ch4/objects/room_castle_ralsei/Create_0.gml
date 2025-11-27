con = -1;
var ralsei_window = scr_dark_marker(255, 48, bg_dw_ralsei_room_window);
ralsei_window.depth = 990000;
ralsei_window.image_speed = 0.07;
if (global.flag[307] == 1)
{
    var ralsei_plush = instance_create(140, 345, obj_npc_sign);
    ralsei_plush.sprite_index = spr_dw_ralsei_plush;
    with (ralsei_plush)
        scr_depth();
}
