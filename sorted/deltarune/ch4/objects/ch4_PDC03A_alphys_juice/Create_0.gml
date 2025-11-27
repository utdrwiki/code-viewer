con = 0;
customcon = 0;
talked = 0;
juice_red = 0;
juice_yellow = 0;
juice_success = false;
susie_check = false;
susie_con = 0;
facing_temp = 0;
giving_juice = false;
scr_depth();
alphys_npc = instance_create(675, 520, obj_npc_room);
with (alphys_npc)
{
    extflag = "alphys";
    sprite_index = spr_alphys_no_juice;
    scr_depth();
}
