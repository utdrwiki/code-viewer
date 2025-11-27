con = -1;
customcon = 0;
if (global.plot >= 120 && global.plot < 130)
{
    lancer_npc = instance_create(292, 260, obj_npc_room);
    with (lancer_npc)
    {
        extflag = "lancer";
        sprite_index = spr_lancer_ut;
        scr_depth();
    }
    if (global.plot < 125)
        con = 0;
    else
        lancer_npc.x = 352;
    if (global.plot > 125)
        lancer_npc.sprite_index = spr_lancer_dt;
}
if (global.plot >= 205)
{
    if (scr_flag_get(1085) == 0)
        scr_flag_set(1085, 1);
}
