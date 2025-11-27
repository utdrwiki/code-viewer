var vending_npc = instance_create(451, 136, obj_npc_room);
with (vending_npc)
{
    sprite_index = spr_b3bs_vendingmachine;
    extflag = "vending";
    scr_depth();
}
