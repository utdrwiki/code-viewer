if (juice_success && !d_ex() && !susie_check)
{
    susie_check = true;
    susie_con = 1;
    global.interact = 1;
    facing_temp = global.facing;
    scr_flag_set(719, 1);
    scr_speaker("susie");
    msgsetloc(0, "\\E7* Woah^1, nice juice combo. Looks cool./%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_15_0");
    d_make();
}
if (susie_con == 1 && !d_ex())
{
    susie_con = 2;
    global.interact = 0;
}
if (con == 1 && !d_ex())
{
    con = 3;
    facing_temp = global.facing;
    if (talked == 0)
    {
        talked++;
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        al = actor_count + 1;
        al_actor = instance_create(x, y, obj_actor);
        scr_actor_setup(al, al_actor, "alphys");
        al_actor.sprite_index = alphys_npc.sprite_index;
        if (global.facing == 0)
        {
            al_actor.sprite_index = spr_alphysu;
            alphys_npc.sprite_index = spr_alphysu;
        }
        else
        {
            al_actor.sprite_index = spr_alphys_no_juice;
            alphys_npc.sprite_index = spr_alphys_no_juice;
        }
        c_var_instance(alphys_npc, "visible", 0);
        c_msgside("top");
        c_speaker("alphys");
        c_msgsetloc(0, "\\E0* Kris^1! A nice surprise seeing you here^1! I.../%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_63_0");
        c_talk_wait();
        c_wait(15);
        c_sel(al);
        c_shakeobj();
        var cough_delay = 0;
        repeat (3)
        {
            c_delaycmd(cough_delay, "soundplay", snd_txtal);
            cough_delay += 3;
        }
        c_sprite(spr_alphys_cough);
        c_animate(0, -1, 0.5);
        c_wait(15);
        c_sprite(spr_alphysl_unhappy);
        c_wait(45);
        c_speaker("alphys");
        c_msgsetloc(0, "\\E4* (Darn^1, I need a drink^1, but..^1. Susie's over there^1, and...)/", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_85_0");
        c_msgnextloc("\\E9* (If I go make my \\cR25`% red\\cW and \\cY75`% yellow\\cW juice combo...)/", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_86_0");
        c_msgnextloc("\\E8* (I know she'll..^1. make fun of me for it somehow.)/%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_87_0");
        c_talk_wait();
        if (global.facing == 0)
        {
            c_sel(al);
            c_sprite(spr_alphysu);
        }
        c_var_instance(alphys_npc, "visible", 1);
        c_actortokris();
        c_terminatekillactors();
    }
    else if (scr_flag_get(720) == 0)
    {
        if (global.facing == 0)
            alphys_npc.sprite_index = spr_alphysu;
        else
            alphys_npc.sprite_index = spr_alphys_no_juice;
        if (!juice_success)
        {
            scr_speaker("alphys");
            msgsetloc(0, "\\E9* (I really want a \\cR25`% red\\cW \\cY75`% yellow\\cW drink but...)/%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_116_0");
            d = d_make();
            d.side = 0;
        }
        else
        {
            con = 20;
            global.msc = 1315;
            scr_text(global.msc);
            d = d_make();
            d.side = 0;
        }
    }
    else
    {
        con = 30;
    }
}
if (con == 3 && !d_ex() && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.interact = 0;
    global.facing = facing_temp;
    with (alphys_npc)
    {
        myinteract = 0;
        with (obj_mainchara)
            onebuffer = 5;
    }
}
if (con == 30 && !d_ex())
{
    con = 32;
    global.interact = 1;
    facing_temp = global.facing;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    juice_cup = scr_marker(670, 547, spr_church_cup);
    juice_cup.depth = kr_actor.depth - 10;
    juice_cup.visible = 0;
    al = actor_count + 1;
    al_actor = instance_create(x, y, obj_actor);
    scr_actor_setup(al, al_actor, "alphys");
    al_actor.sprite_index = alphys_npc.sprite_index;
    if (global.facing == 0)
    {
        al_actor.sprite_index = spr_alphysu;
        alphys_npc.sprite_index = spr_alphysu;
    }
    else
    {
        al_actor.sprite_index = spr_alphys_no_juice;
        alphys_npc.sprite_index = spr_alphys_no_juice;
    }
    c_var_instance(alphys_npc, "visible", 0);
    if (global.facing == 0)
    {
        c_sel(al);
        c_sprite(spr_alphysu);
    }
    else
    {
        c_sel(al);
        c_sprite(spr_alphys_no_juice);
    }
    c_msgside("top");
    if (scr_flag_get(720) == 0)
    {
        giving_juice = true;
        c_sel(kr);
        c_walkdirect_wait(652, 516, 15);
        c_sprite(spr_kris_walk_right_church);
        if (global.choice == 0)
        {
            scr_flag_set(720, 1);
            c_sel(kr);
            c_sprite(spr_kris_church_cup_give);
            c_sel(al);
            c_sprite(spr_alphys_no_juice);
            c_wait(15);
            c_speaker("alphys");
            c_msgsetloc(0, "\\E0* Ahh^1, Kris^1! Phew^1! What a relief!/%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_213_0");
            c_talk_wait();
            c_sel(kr);
            c_sprite(spr_kris_walk_right_church);
            c_sel(al);
            c_sprite(spr_alphys_juice_hold);
            c_wait(5);
            c_soundplay(snd_swallow);
            c_sel(al);
            c_sprite(spr_alphys_juice_drink);
            c_animate(0, 1, 15);
            c_wait(45);
            c_sprite(spr_alphys_no_juice);
        }
        if (global.choice == 1)
        {
            scr_flag_set(720, 2);
            c_sel(al);
            c_sprite(spr_alphys_no_juice);
            c_sel(kr);
            c_sprite(spr_kris_church_cup_right);
            c_wait(15);
            c_soundplay(snd_swallow);
            c_autowalk(0);
            c_imagespeed(0);
            c_sprite(spr_kris_church_juice_drink);
            c_imageindex(1);
            c_wait(30);
            c_sel(al);
            c_sprite(spr_alphysl_unhappy);
            c_sel(kr);
            c_sprite(spr_kris_church_cup_drop);
            c_imageindex(0);
            c_wait(30);
            c_imageindex(1);
            c_wait(5);
            c_imageindex(2);
            c_soundplay(snd_bump);
            c_var_instance(juice_cup, "visible", 1);
            c_var_lerp_instance(juice_cup, "x", 670, 673, 5);
            c_wait(30);
            c_sel(kr);
            c_sprite(spr_kris_walk_right_church);
            c_speaker("alphys");
            c_msgsetloc(0, "\\E5* .../%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_277_0");
            c_talk_wait();
            var cough_delay = 0;
            repeat (3)
            {
                c_delaycmd(cough_delay, "soundplay", snd_txtal);
                cough_delay += 3;
            }
            c_sel(al);
            c_shakeobj();
            c_sprite(spr_alphys_cough);
            c_animate(0, 1, 15);
            c_wait(15);
            c_sprite(spr_alphys_no_juice);
        }
        c_wait(90);
    }
    c_msc(1317);
    c_talk_wait();
    c_waitcustom();
}
if (con == 50 && !d_ex() && customcon == 1)
{
    con = 999;
    customcon = 0;
    c_waitcustom_end();
    if (global.choice == 0)
    {
        if (scr_flag_get(722) == 0)
        {
            con = 51;
            c_msc(1319);
            c_talk_wait();
        }
        else
        {
            con = 61;
            c_speaker("alphys");
            c_msgsetloc(0, "\\E0* Umm^1, Kris^1, if you want to know more about the shelter.../", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_328_0");
            c_msgnextloc("\\E5* Ask the Mayor and Officer Undyne./", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_329_0");
            if (scr_flag_get(722) == 1)
                c_msgnextloc("\\E7* ..^1. I can^1, um^1, help you with the architecture though!/%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_335_0");
            if (scr_flag_get(722) == 2)
                c_msgnextloc("\\E4* ..^1. and^1, I recommend forgetting about the hay./%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_342_0");
            c_talk_wait();
        }
    }
    if (global.choice == 1)
    {
        con = 61;
        c_speaker("alphys");
        c_msgsetloc(0, "\\E5* ..^1. Thanks for the enthusiasm^1, Kris./%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_354_0");
        c_talk_wait();
    }
    if (global.choice == 2)
    {
        scr_flag_set(723, 1);
        c_speaker("alphys");
        c_msgsetloc(0, "\\E0* Yesterday evening^1, Officer Undyne actually invited me here!/", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_363_0");
        c_msgnextloc("\\E7* She said you know^1, I've been in town a while.../", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_364_0");
        c_msgnextloc("\\E5* I should..^1. m-make some more friends^1, you know?/", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_365_0");
        c_msgnextloc("\\E4* ..^1. Which is^1, why it's kind of awkward^1, s-she's not even here.../", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_366_0");
        c_msgnextloc("\\E5* I..^1. I actually can't even..^1. reach her at all^1, eheh.../", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_367_0");
        c_msgnextloc("\\E9* .../%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_368_0");
        c_talk_wait();
        if (scr_flag_get(342) == 3)
        {
            con = 60;
            c_msc(1321);
            c_talk_wait();
        }
        else
        {
            con = 61;
        }
    }
    c_waitcustom();
}
if (con == 60 && !d_ex() && customcon == 1)
{
    con = 61;
    c_waitcustom_end();
    with (alphys_npc)
    {
        visible = 1;
        myinteract = 0;
        with (obj_mainchara)
            onebuffer = 5;
    }
    c_actortokris();
    c_terminatekillactors();
}
if (con == 61 && !d_ex() && customcon == 1)
{
    con = 62;
    customcon = 0;
    c_waitcustom_end();
    if (scr_flag_get(722) > 0)
    {
        if (scr_flag_get(1621) == 0)
        {
            scr_flag_set(1621, 1);
            c_wait(15);
            if (scr_flag_get(1619) == 0)
            {
                scr_flag_set(1619, 1);
                with (obj_ch4_PDC04)
                    found_clue();
                global.writersnd[0] = snd_item;
                c_speaker("no_name");
                c_msgsetloc(0, "\\S0* (Felt like useful information.)/%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_435_0");
            }
            else if (scr_flag_get(1620) == 1 || scr_flag_get(1657) == 1)
            {
                if (scr_flag_get(1619) == 1)
                {
                    scr_flag_set(1619, 2);
                    with (obj_ch4_PDC04)
                        susie_ready();
                }
                c_speaker("no_name");
                c_msgsetloc(0, "* (..^1. Felt like you gathered enough clues to tell Susie.)/%", "obj_ch4_PDC03A_alphys_juice_slash_Step_0_gml_446_0");
            }
            c_talk_wait();
        }
    }
    if (giving_juice)
    {
        giving_juice = false;
        c_pannable(1);
        c_panobj(kr_actor, 10);
        c_wait(11);
        c_pannable(0);
    }
    c_var_instance(alphys_npc, "sprite_index", al_actor.sprite_index);
    c_var_instance(alphys_npc, "visible", 1);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 62 && !i_ex(obj_cutscene_master))
{
    con = 99;
    global.interact = 0;
    global.facing = facing_temp;
}
