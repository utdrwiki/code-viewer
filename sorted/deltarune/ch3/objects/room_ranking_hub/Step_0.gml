if (con < 0)
    exit;
if (zapper_talk_active)
{
    var stop_anim = false;
    with (obj_writer)
    {
        if (halt > 0)
            stop_anim = true;
    }
    zapper_marker.image_speed = stop_anim ? 0 : 0.2;
    zapper_marker.image_index = stop_anim ? 0 : zapper_marker.image_index;
}
if (con == 0 && !d_ex())
{
    con = 2;
    zapper_talk_active = true;
    global.interact = 1;
    zapper_marker.image_speed = 0.2;
    scr_speaker("no_name");
    msgsetloc(0, "* Welcome to the ABC-Rank rewards room./", "obj_room_ranking_hub_slash_Step_0_gml_31_0");
    msgnextloc("* How may we assist you today?/%", "obj_room_ranking_hub_slash_Step_0_gml_32_0");
    var d = d_make();
    d.stay = 5;
}
if (con == 1 && !d_ex())
{
    con = 2;
    zapper_talk_active = true;
    global.interact = 1;
    zapper_marker.image_speed = 0.2;
    scr_speaker("no_name");
    msgsetloc(0, "* How may we assist you?/%", "obj_room_ranking_hub_slash_Step_0_gml_48_0");
    var d = d_make();
    d.stay = 5;
}
if (con == 2 && !d_ex())
{
    con = -1;
    zapper_talk_active = false;
    with (zapper_marker)
    {
        image_speed = 0;
        image_index = 0;
    }
    global.msc = 1333;
    scr_text(global.msc);
    d_make();
}
if (con == 5 && !d_ex())
{
    con = (global.choice == 0) ? 10 : 20;
    global.interact = 1;
    zapper_talk_active = true;
}
if (con == 10 && !d_ex())
{
    con = 11;
    zapper_talk_active = true;
    zapper_marker.image_speed = 0.2;
    var rank_index = scr_flag_get(board_flag);
    var rank_letter = scr_get_rank_letter(board_flag);
    if (counterfeit_active)
    {
        rank_index = 0;
        rank_letter = stringsetloc("S", "obj_room_ranking_hub_slash_Step_0_gml_91_0");
    }
    scr_speaker("no_name");
    msgsetsubloc(0, "* On the previous BOARD^1, you earned RANK ~1. You're a STAR!/", rank_letter, "obj_room_ranking_hub_slash_Step_0_gml_92_0");
    msgnextloc("* This means you can use door A^1, B^1, and C!/", "obj_room_ranking_hub_slash_Step_0_gml_93_0");
    msgnextloc("* We also recommend checking out our Star Changing Room./", "obj_room_ranking_hub_slash_Step_0_gml_94_0");
    msgnextloc("* Look in the \"S\" Door in the Green Room below. Enjoy!/%", "obj_room_ranking_hub_slash_Step_0_gml_95_0");
    if (rank_index == 3)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* On the previous Board^1, you earned RANK A. You're AMAZING!/", "obj_room_ranking_hub_slash_Step_0_gml_101_0");
        msgnextloc("* This means you can use door A^1, B^1, and C!/%", "obj_room_ranking_hub_slash_Step_0_gml_102_0");
    }
    else if (rank_index == 2)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* On the previous Board^1, you earned RANK B. How BRAVE!/", "obj_room_ranking_hub_slash_Step_0_gml_108_0");
        msgnextloc("* This means you can use door B^1, and C!/", "obj_room_ranking_hub_slash_Step_0_gml_109_0");
        msgnextloc("* I'm sure you can earn Rank A next time!/%", "obj_room_ranking_hub_slash_Step_0_gml_110_0");
    }
    else if (rank_index == 1)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* On the previous Board^1, you earned RANK C. You're CRINGE!/", "obj_room_ranking_hub_slash_Step_0_gml_116_0");
        msgnextloc("* You are only allowed to use door C!/", "obj_room_ranking_hub_slash_Step_0_gml_117_0");
        msgnextloc("* Let's try harder next time!/%", "obj_room_ranking_hub_slash_Step_0_gml_118_0");
    }
    d_make();
}
if (con == 20 && !d_ex())
{
    con = 11;
    zapper_talk_active = true;
    zapper_marker.image_speed = 0.2;
    scr_speaker("no_name");
    msgsetloc(0, "* A-Door is for ARCADE. You can replay a PHYSICAL CHALLENGE for fun./", "obj_room_ranking_hub_slash_Step_0_gml_133_0");
    msgnextloc("* B-Door is for BALL MACHINE. Spend points to earn random prizes!/", "obj_room_ranking_hub_slash_Step_0_gml_134_0");
    msgnextloc("* C-Door is for COOLER. Feel free to have a drink./%", "obj_room_ranking_hub_slash_Step_0_gml_135_0");
    d_make();
}
if (con == 11 && !d_ex())
{
    con = -1;
    global.interact = 0;
    zapper_talk_active = false;
    with (zapper_marker)
    {
        image_speed = 0;
        image_index = 0;
    }
}
if (con == 50 && !d_ex())
{
    con = 51;
    global.interact = 1;
    zapper_talk_active = true;
    zapper_marker.image_speed = 0.2;
    scr_speaker("no_name");
    msgsetloc(0, "* Welcome to the ABC-Rank rewards room./", "obj_room_ranking_hub_slash_Step_0_gml_163_0");
    msgnextloc("* .../", "obj_room_ranking_hub_slash_Step_0_gml_164_0");
    msgnextloc("* Unfortunately^1, you didn't earn rank A^1, B^1, or C./", "obj_room_ranking_hub_slash_Step_0_gml_165_0");
    msgnextloc("* You..^1. aren't allowed to use any of these doors./", "obj_room_ranking_hub_slash_Step_0_gml_166_0");
    msgnextloc("* .../", "obj_room_ranking_hub_slash_Step_0_gml_167_0");
    msgnextloc("* There is one room..^1. for people like you.../%", "obj_room_ranking_hub_slash_Step_0_gml_168_0");
    d_make();
}
if (con == 51 && !d_ex())
{
    con = 52;
    alarm[0] = 15;
    unlock_z_rank();
}
if (con == 53)
{
    con = -1;
    global.interact = 0;
    var z_rank_flag = (global.plot < 160) ? 1 : 2;
    scr_flag_set(1187, z_rank_flag);
    zapper_talk_active = false;
    with (zapper_marker)
    {
        image_speed = 0;
        image_index = 0;
    }
}
if (con == 60 && !d_ex())
{
    con = 61;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    la = actor_count + 1;
    la_actor = instance_create(lanino_npc.x, lanino_npc.y, obj_actor);
    scr_actor_setup(la, la_actor, "lanino");
    la_actor.sprite_index = lanino_npc.sprite_index;
    lanino = la_actor;
    talking_actor = la_actor;
    global.facing = 0;
    c_var_instance(lanino_npc, "visible", 0);
    c_sel(la);
    c_autowalk(0);
    c_msc(1381);
    c_talk_wait();
    c_waitcustom();
}
if (con == 70 && !d_ex() && customcon == 1)
{
    con = 71;
    customcon = 0;
    c_waitcustom_end();
    c_sel(kr);
    c_walkdirect(kr_actor.x, 264, 8);
    c_delaywalkdirect(9, 559, 264, 15);
    c_delayfacing(25, "u");
    c_sel(su);
    c_walkdirect(su_actor.x, 247, 8);
    c_delaywalkdirect(9, 501, 247, 15);
    c_delayfacing(25, "u");
    c_sel(ra);
    c_walkdirect(ra_actor.x, 252, 8);
    c_delaywalkdirect(9, 604, 252, 15);
    c_delayfacing(25, "u");
    c_wait(30);
    c_speaker("no_name");
    c_msgsetloc(0, "* Certainly. Tomorrow's forecast will be SUN^1, followed by a light.../", "obj_room_ranking_hub_slash_Step_0_gml_253_0");
    c_msgnextloc("* ..^1. a light drizzle.../%", "obj_room_ranking_hub_slash_Step_0_gml_254_0");
    c_talk_wait();
    c_wait(30);
    c_snd_play(snd_noise);
    c_var_instance(id, "talking_actor", -4);
    c_sel(la);
    c_autowalk(0);
    c_sprite(spr_npc_lanino_cry);
    c_imagespeed(0.2);
    c_shakeobj();
    c_speaker("no_name");
    c_msgsetloc(0, "* OH^1, ELNINA^1! My SWEETEST CLOUD^1! She would have LOVED a light drizzle!/%", "obj_room_ranking_hub_slash_Step_0_gml_270_0");
    c_talk_wait();
    c_halt();
    c_sprite(spr_npc_lanino_sneeze);
    c_imagespeed(0);
    c_imageindex(0);
    c_wait(16);
    c_snd_play_x(snd_sneeze, 1, 0.5);
    c_imageindex(1);
    c_shakeobj();
    c_wait(45);
    c_var_instance(id, "talking_actor", la_actor);
    c_sprite(spr_npc_lanino_talk_sad);
    c_wait(15);
    c_speaker("no_name");
    c_msgsetloc(0, "* Everything reminds me of her^1! EVERYTHING!/", "obj_room_ranking_hub_slash_Step_0_gml_290_0");
    c_msgnextloc("* The water cooler..^1. the water warmer..^1. I tried counting sheep for a nap.../%", "obj_room_ranking_hub_slash_Step_0_gml_291_0");
    c_talk_wait();
    c_snd_play(snd_noise);
    c_var_instance(id, "talking_actor", -4);
    c_sel(la);
    c_autowalk(0);
    c_sprite(spr_npc_lanino_cry);
    c_imagespeed(0.2);
    c_shakeobj();
    c_speaker("no_name");
    c_msgsetloc(0, "* And all I could imagine was her face!/%", "obj_room_ranking_hub_slash_Step_0_gml_304_0");
    c_talk_wait();
    c_msc(1383);
    c_talk_wait();
    c_waitcustom();
}
if (con == 75 && !d_ex() && customcon == 1)
{
    con = 80;
    customcon = 0;
    c_waitcustom_end();
    if (global.choice == 0)
    {
        scr_flag_set(1211, 1);
        c_sel(la);
        c_sprite(spr_lanino_shocked_left);
        c_speaker("no_name");
        c_msgsetloc(0, "* Th..^1. that's right^1! I don't need her^1! I don't need anyone!/%", "obj_room_ranking_hub_slash_Step_0_gml_329_0");
        c_talk_wait();
        c_sprite(spr_lanino_gloat_left);
        c_speaker("no_name");
        c_msgsetloc(0, "* We'll see how far she gets without ME coordinating her OUTFITS!/%", "obj_room_ranking_hub_slash_Step_0_gml_336_0");
        c_talk_wait();
        c_var_instance(id, "talking_actor", la_actor);
        c_sprite(spr_npc_lanino_talk);
        c_speaker("no_name");
        c_msgsetloc(0, "* Thanks^1, Kris^1! You shone a little light on my life!/%", "obj_room_ranking_hub_slash_Step_0_gml_343_0");
        c_talk_wait();
    }
    else
    {
        scr_flag_set(1211, 2);
        c_sel(la);
        c_sprite(spr_lanino_shocked_left);
        c_speaker("no_name");
        c_msgsetloc(0, "* Th..^1. that's right^1! I'm the most popular circle in the sky!/%", "obj_room_ranking_hub_slash_Step_0_gml_354_0");
        c_talk_wait();
        c_sprite(spr_lanino_gloat_left);
        c_speaker("no_name");
        c_msgsetloc(0, "* Everyone knows GUYS WITH PAULDRONS are HOT STUFF^1! I've got this!/%", "obj_room_ranking_hub_slash_Step_0_gml_361_0");
        c_talk_wait();
        c_var_instance(id, "talking_actor", la_actor);
        c_sprite(spr_npc_lanino_talk);
        c_speaker("no_name");
        c_msgsetloc(0, "* Thanks^1, Kris^1! You shone a little light on my life!/%", "obj_room_ranking_hub_slash_Step_0_gml_368_0");
        c_talk_wait();
    }
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(30);
    c_var_instance(lanino_npc, "visible", 1);
    c_sel(kr);
    c_facing("d");
    c_waitcustom();
}
if (con == 80 && !d_ex() && customcon == 1)
{
    con = 81;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(lanino_npc, "visible", 1);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 81 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    talking_actor = -4;
}
if (d_ex() && talking_actor != -4)
{
    if (i_ex(obj_writer))
    {
        if (obj_writer.halt >= 1)
        {
            with (talking_actor_current)
            {
                image_speed = 0;
                image_index = 0;
            }
        }
        else
        {
            if (talking_actor_current != talking_actor)
            {
                with (talking_actor_current)
                {
                    image_speed = 0;
                    image_index = 0;
                }
                talking_actor_current = talking_actor;
            }
            with (talking_actor_current)
                image_speed = 0.2;
        }
    }
    else
    {
        with (talking_actor_current)
        {
            image_speed = 0;
            image_index = 0;
        }
    }
}
