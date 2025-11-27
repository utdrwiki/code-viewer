if (maus_npc != -4)
{
    if (maus_npc.x == maus_target)
    {
        maus_alt++;
        maus_target = ((maus_alt % 2) == 1) ? (maus_npc.xstart + 180) : maus_npc.xstart;
        with (maus_npc)
            scr_flip("x");
    }
    maus_npc.x = scr_movetowards(maus_npc.x, maus_target, 2);
    maus_readable.x = maus_npc.x - 20;
}
if (poppup_npc != -4)
{
    if (poppup_npc.x == poppup_target)
    {
        poppup_alt++;
        poppup_target = ((poppup_alt % 2) == 1) ? (poppup_npc.xstart + 124) : poppup_npc.xstart;
        with (poppup_npc)
            scr_flip("x");
    }
    poppup_npc.x = scr_movetowards(poppup_npc.x, poppup_target, 1);
    poppup_readable.x = poppup_npc.x - 40;
}
if (tasque_npc != -4)
{
    if (tasque_npc.x == tasque_target)
    {
        tasque_alt++;
        tasque_target = ((tasque_alt % 2) == 1) ? (tasque_npc.xstart + 130) : tasque_npc.xstart;
        with (tasque_npc)
            scr_flip("x");
    }
    tasque_npc.x = scr_movetowards(tasque_npc.x, tasque_target, 1);
    tasque_readable.x = tasque_npc.x - 40;
}
if (con == 10 && !d_ex())
{
    con = 11;
    alarm[0] = 30;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    la = actor_count + 1;
    la_actor = instance_create(lancer_npc.x, lancer_npc.y, obj_actor);
    scr_actor_setup(la, la_actor, "lancer");
    la_actor.sprite_index = lancer_npc.sprite_index;
    qu = actor_count + 2;
    qu_actor = instance_create(400, 138, obj_actor);
    scr_actor_setup(qu, qu_actor, "queen");
    qu_actor.sprite_index = spr_queen_walk_right;
    c_var_instance(lancer_npc, "visible", 0);
    c_sel(kr);
    c_walkdirect(801, 129, 10);
    c_sel(su);
    c_walkdirect(838, 113, 10);
    c_sel(ra);
    c_walkdirect_wait(755, 118, 10);
    c_sel(kr);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    var small_talk = stringsetloc("Good idea", "obj_room_castle_lancer_slash_Step_0_gml_81_0");
    scr_smallface(0, "susie", 25, 440, "bottom", small_talk);
    c_speaker("lancer");
    c_msgsetloc(0, "\\E2* Careful.com^1, pretty boy^1! This room site is a work zone!/", "obj_room_castle_lancer_slash_Step_0_gml_84_0");
    c_facenext("ralsei", "W");
    c_msgnextloc("\\EW* Wh..^1. WHAT happened to the wall?/", "obj_room_castle_lancer_slash_Step_0_gml_86_0");
    c_facenext("lancer", 1);
    c_msgnextloc("\\E1* I don't know^1, but we're not stopping 'til we hit buried treasure.\\f0/", "obj_room_castle_lancer_slash_Step_0_gml_88_0");
    c_facenext("ralsei", "U");
    c_msgnextloc("\\EU* H.. Wh..^1. What treasure!?/%", "obj_room_castle_lancer_slash_Step_0_gml_90_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_sprite(spr_ralsei_hurt);
    c_addxy(-18, 0);
    c_shakeobj();
    c_wait_box(4);
    c_sel(ra);
    c_facing("u");
    c_addxy(18, 0);
    c_wait_talk();
    c_sel(qu);
    c_walkdirect(570, 138, 10);
    c_sel(kr);
    c_facing("l");
    c_sel(su);
    c_facing("l");
    c_sel(ra);
    c_facing("l");
    c_speaker("queen");
    c_msgsetloc(0, "\\EN* Get A Load Of The Guy With No Meat Or Fruit In His Castle Walls/%", "obj_room_castle_lancer_slash_Step_0_gml_118_0");
    c_talk_wait();
    c_sndplay(snd_suslaugh);
    c_sndplay(snd_queen_laugh_1);
    c_sndplay(snd_lancerlaugh);
    c_sel(qu);
    c_sprite(spr_queen_ohoho_standing);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sel(su);
    c_sprite(spr_susie_laugh_dw);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sel(la);
    c_sprite(spr_npc_lancer_construction_laugh);
    c_autowalk(0);
    c_imagespeed(0.2);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_down_blush);
    c_wait(60);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* I..^1. I'm sorry^1! I..^1. I'm new at this!!^1! I'm new!!!/%", "obj_room_castle_lancer_slash_Step_0_gml_147_0");
    c_talk_wait();
    c_sel(la);
    c_sprite(spr_npc_lancer_construction);
    c_var_instance(lancer_npc, "visible", 1);
    c_sel(qu);
    c_autowalk(1);
    c_walkdirect_wait(400, 138, 10);
    c_pannable(1);
    c_panobj(kr_actor, 10);
    c_wait(11);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 12 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    con = 99;
}
