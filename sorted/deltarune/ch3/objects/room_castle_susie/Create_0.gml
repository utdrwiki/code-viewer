con = -1;
if (global.flag[393] == 1)
{
    var susie_statue = instance_create(416, 224, obj_npc_sign);
    susie_statue.sprite_index = spr_dw_susie_statue;
    susie_statue.setdepth = 0;
    susie_statue.depth = 97000;
}
if (global.flag[307] == 2)
{
    var susie_plush = instance_create(317, 143, obj_npc_sign);
    susie_plush.sprite_index = spr_dw_susie_plush;
    with (susie_plush)
        scr_depth();
}
