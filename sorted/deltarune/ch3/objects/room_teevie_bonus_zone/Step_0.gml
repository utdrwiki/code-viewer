if (con < 0)
    exit;
if (con == 0)
{
    if (obj_mainchara.x >= 1430 && global.interact == 0)
    {
        con = 1;
        global.interact = 1;
    }
}
if (con == 1)
{
    con = 2;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() - 200, cameray() + 260, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.preset = 0;
    te_actor.sprite_index = spr_tenna_grasp;
    c_var_instance(id, "noskip", true);
    c_speaker("tenna");
    c_msgsetloc(0, "* HEY!!!/%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_33_0");
    c_talk_wait();
    c_var_instance(id, "noskip", false);
    c_snd_play(snd_b);
    c_sel(kr);
    c_emote("!", 30);
    c_facing("l");
    c_sel(su);
    c_emote("!", 30);
    c_facing("l");
    c_sel(ra);
    c_emote("!", 30);
    c_facing("l");
    c_var_instance(id, "pippins_runaway", true);
    c_wait(30);
    c_sel(kr);
    c_walkdirect(1574, kr_actor.y, 10);
    c_delaywalkdirect(11, 1574, 128, 10);
    c_delaywalkdirect(22, 1674, 128, 10);
    c_sel(su);
    c_walkdirect(1574, su_actor.y, 16);
    c_delaywalkdirect(17, 1574, 120, 10);
    c_delaywalkdirect(28, 1714, 120, 16);
    c_sel(ra);
    c_walkdirect(1574, ra_actor.y, 22);
    c_delaywalkdirect(23, 1574, 120, 10);
    c_delaywalkdirect(34, 1774, 120, 16);
    c_wait_if(kr_actor, "x", ">=", 1610);
    c_snd_play(snd_escaped);
    c_wait_if(id, "pippins_runaway", "=", false);
    c_wait(20);
    c_snd_play(snd_wing);
    c_var_lerp_to_instance(te_actor, "x", camerax() + 120, 15, -1, "out");
    c_wait(30);
    c_sel(te);
    c_shakeobj();
    c_speaker("tenna");
    c_msgsetloc(0, "* WHAT THE!? MY..^1. MY SECRET BONUS ZONE!!!/%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_89_0");
    c_talk_wait();
    c_var_instance(id, "car_steal", true);
    c_wait(15);
    c_wait_if(id, "car_steal", "=", false);
    c_sel(te);
    c_tenna_sprite(spr_tenna_hurt);
    c_flip("x");
    c_addxy(-20, 0);
    c_shakeobj();
    c_wait(15);
    c_speaker("tenna");
    c_msgsetloc(0, "* HEY!!!/%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_108_0");
    c_talk_wait();
    c_speaker("tenna");
    c_msgsetloc(0, "* Wh-what's wrong with ME having the car!? THEY weren't gonna win it!!/%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_115_0");
    c_talk_wait();
    c_sel(te);
    c_sprite(spr_tenna_hooray);
    c_addxy(-10, -10);
    c_imagespeed(0.2);
    c_speaker("tenna");
    c_msgsetloc(0, "* I was..^1. just giving it a daily TEST DRIVE^1! Checking on that \"sweet breeze\"!/%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_127_0");
    c_talk_wait();
    c_var_instance(id, "steal_sequence", true);
    c_wait(15);
    c_imagespeed(0);
    c_wait(15);
    c_tenna_sprite(spr_tenna_evil);
    c_speaker("tenna");
    c_msgsetloc(0, "* Alright^1! ALRIGHT you little ripoff artists!!^1! You think you can take MY cookies!?/%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_143_0");
    c_talk_wait();
    c_sel(te);
    c_tenna_sprite(spr_tenna_pose_podium_evil);
    c_imageindex(2);
    c_imagespeed(0);
    c_addxy(-10, 10);
    c_tenna_preset(8);
    c_speaker("tenna");
    c_msgsetloc(0, "* Might I remind you^1, you signed a little^1, ahem^1, TELEVISION CONTRACT???/%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_155_0");
    c_talk_wait();
    c_imageindex(3);
    c_tenna_preset(0);
    c_speaker("tenna");
    c_msgsetloc(0, "* .../%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_163_0");
    c_talk_wait();
    c_tenna_preset(15);
    c_speaker("tenna");
    c_msgsetloc(0, "* This isn't their contract./%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_170_0");
    c_talk_wait();
    c_sprite(spr_tenna_grasp_anim);
    c_imagespeed(0.5);
    c_speaker("tenna");
    c_msgsetloc(0, "* Where the HECK are their CONTRACTS!?/%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_179_0");
    c_talk_wait();
    c_wait(15);
    c_tenna_preset(0);
    c_imagespeed(0);
    c_speaker("tenna");
    c_msgsetloc(0, "* .../%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_189_0");
    c_talk_wait();
    c_wait(15);
    c_tenna_sprite(spr_tenna_tie_adjust_c);
    c_speaker("tenna");
    c_msgsetloc(0, "* Fine^1! You think I care!? Haha^1! Of course not^1! Not at all../%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_198_0");
    c_talk_wait();
    c_tenna_sprite(spr_tenna_laugh);
    c_imagespeed(0.4);
    c_addxy(0, -10);
    c_autodepth(0);
    c_depth(treasure_large.depth - 10);
    c_var_instance(id, "steal_sequence", false);
    c_wait(5);
    c_speaker("tenna");
    c_msgsetloc(0, "* Because I'VE got something you guys will NEVER have^1! Something BIG^1! Something VERY SECRET!/%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_213_0");
    c_talk_wait();
    c_var_lerp_to("x", camerax() + view_wport[0] + 100, 30, 3, "in");
    c_speaker("tenna");
    c_msgsetloc(0, "* HA!!!/%", "obj_room_teevie_bonus_zone_slash_Step_0_gml_220_0");
    c_talk_wait();
    c_waitcustom();
}
if (con == 2 && customcon == 1)
{
    con = 3;
    clean_up();
}
if (con == 3)
{
    con = 99;
    customcon = 0;
    c_waitcustom_end();
    c_wait(60);
    c_sel(kr);
    c_walkdirect(1574, 128, 20);
    c_delaywalkdirect(21, 1574, 170, 20);
    c_delaywalkdirect(42, 1350, 170, 30);
    c_sel(su);
    c_walkdirect(1574, 120, 26);
    c_delaywalkdirect(27, 1574, 154, 26);
    c_delaywalkdirect(54, 1400, 154, 24);
    c_sel(ra);
    c_walkdirect_wait(1574, 120, 32);
    c_walkdirect_wait(1574, 158, 32);
    c_walkdirect_wait(1460, 158, 18);
    c_wait(15);
    c_sel(kr);
    c_facing("d");
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 99 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.facing = 0;
    global.interact = 0;
    scr_flag_set(1161, 1);
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
    steal_sequence = false;
    with (treasure_large)
        depth = 98000;
}
if (pippins_runaway)
{
    pippins_runaway_timer++;
    if (pippins_runaway_timer == 1)
    {
        for (var i = 0; i < array_length_1d(pippins_list); i++)
        {
            with (pippins_list[i])
                pause();
        }
    }
    if (pippins_runaway_timer == 31)
    {
        for (var i = 0; i < array_length_1d(pippins_list); i++)
        {
            with (pippins_list[i])
                look_out();
        }
    }
    if (pippins_runaway_timer == 45)
        snd_play(snd_jump);
    if (pippins_runaway_timer == 110)
    {
        pippins_runaway = false;
        pippins_runaway_timer = 0;
    }
}
if (car_steal)
{
    car_steal_timer++;
    if (car_steal_timer == 1)
    {
        with (prize_car)
            start_stealing();
    }
    if (car_steal_timer == 60)
    {
        car_steal = false;
        car_steal_timer = 0;
    }
}
if (steal_sequence)
{
    steal_sequence_timer++;
    if (steal_con == 0)
    {
        if (steal_sequence_timer == 1)
        {
            current_prize = special_prize_list[steal_index];
            with (current_prize)
                start_stealing();
        }
        if (steal_sequence_timer == 60)
        {
            steal_index--;
            steal_sequence_timer = 0;
            current_prize = -4;
            if (steal_index < 0)
            {
                steal_index = array_length_1d(prize_list) - 1;
                steal_con = 1;
            }
        }
    }
    else if (steal_con == 1)
    {
        if (steal_sequence_timer == 1)
        {
            current_prize = prize_list[steal_index];
            with (current_prize)
                start_stealing();
        }
        if (steal_sequence_timer == 60)
        {
            steal_index--;
            steal_sequence_timer = 0;
            current_prize = -4;
            if (steal_index < 0)
            {
                steal_con = -1;
                steal_sequence = false;
            }
        }
    }
}
if (noskip)
{
    with (obj_writer)
        skippable = 0;
}
