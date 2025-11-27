con = (scr_flag_get(1152) == 0) ? 1 : -1;
ralsei_marker = -4;
ralsei_caterpillar = -4;
layer_depth("TILES_Curtains", 90000);
if (con == 1)
{
    scr_fadein(10);
    exit_collider = instance_create(-39, 200, obj_solidblocksized);
    with (exit_collider)
        image_yscale = 2;
}
scr_setparty(1, 1, 0);
var haystack_npc = instance_create(493, 186, obj_npc_sign);
with (haystack_npc)
{
    sprite_index = spr_dw_teevie_haystack;
    extflag = "haystack";
}
wardrobe_npc = instance_create(563, 126, obj_npc_sign);
with (wardrobe_npc)
{
    sprite_index = spr_dw_closet;
    extflag = "wardrobe";
}
