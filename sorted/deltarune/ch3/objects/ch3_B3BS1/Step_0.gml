if (con == 0)
{
    con = 1;
    alarm[0] = 1;
    global.interact = 1;
    global.facing = 0;
}
if (con == 2)
{
    print_message("obj_ch3_B3BS1 Created & Active");
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = 157;
    scr_actor_setup(te, te_actor, "tenna");
    c_sel(kr);
    c_facing("r");
    c_autodepth(0);
    c_setxy(248, 400);
    c_sel(su);
    c_facing("r");
    c_autodepth(0);
    c_setxy(140, 392);
    c_sel(ra);
    c_facing("r");
    c_autodepth(0);
    c_setxy(342, 396);
    c_wait(5);
    c_sel(te);
    c_tenna_preset(3);
    c_wait(60);
}
