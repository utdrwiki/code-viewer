if (con == 1 && !d_ex() && global.interact == 0)
{
    con = 3;
    global.interact = 1;
    facing_temp = global.facing;
    actor_talker = instance_create(0, 0, obj_actor_talk);
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 3)
{
    con = 5;
    to = actor_count + 1;
    to_actor = instance_create(toriel_npc.x, toriel_npc.y, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = toriel_npc.sprite_index;
    ru = actor_count + 2;
    ru_actor = instance_create(rudy_npc.x, rudy_npc.y, obj_actor);
    scr_actor_setup(ru, ru_actor, "rudy");
    ru_actor.sprite_index = rudy_npc.sprite_index;
    no = actor_count + 3;
    no_actor = instance_create(noelle_npc.x, noelle_npc.y, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = noelle_npc.sprite_index;
    no_actor.image_speed = noelle_npc.image_speed;
    no_actor.image_index = noelle_npc.image_index;
    c_sel(no);
    c_autowalk(0);
    c_var_instance(actor_talker, "talking_actor", to_actor);
    c_var_instance(actor_talker, "paused", true);
    c_var_instance(id, "disable_npcs", true);
    c_wait(1);
    c_sel(ru);
    c_sprite(spr_rudy_juice_walk_left);
    c_var_instance(actor_talker, "paused", false);
    c_sel(to);
    c_autowalk(0);
    c_sprite(spr_toriel_juice_talk_right);
    c_speaker("toriel");
    c_msgsetloc(0, "\\E2* I am grateful for your wife's.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_58_0");
    c_facenext("rudy", 0);
    c_msgnextloc("\\E0* Carol's./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_60_0");
    c_facenext("toriel", 1);
    c_msgnextloc("\\E1* Your wife's..^1. financial support to him./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_62_0");
    c_msgnextloc("\\E6* I just wish she did not support his^1, er.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_63_0");
    c_msgnextloc("\\E7* His..^1. you know what./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_64_0");
    c_facenext("rudy", 7);
    c_msgnextloc("\\E7* His \"you know what?\"/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_66_0");
    c_facenext("toriel", 5);
    c_msgnextloc("\\E5* One more word and you're soaked^1, Mr. Holiday./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_68_0");
    c_facenext("rudy", 2);
    c_msgnextloc("\\E2* \"One more word!\"/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_70_0");
    c_talk();
    c_wait_box(2);
    c_wait_box(4);
    c_wait_box(5);
    c_sel(to);
    c_sprite(spr_toriel_juice_talk_right_unhappy);
    c_wait_box(8);
    c_sel(to);
    c_halt();
    c_wait_box(10);
    c_sel(to);
    c_sprite(spr_toriel_juice_talk_mad);
    c_wait_box(12);
    c_wait_talk();
    c_var_instance(actor_talker, "paused", true);
    c_sel(to);
    c_sprite(spr_toriel_juice_splash);
    c_halt();
    c_wait(4);
    c_imageindex(1);
    c_wait(4);
    c_snd_play(snd_wing);
    c_imageindex(2);
    c_wait(4);
    c_imageindex(3);
    c_sel(ru);
    c_autowalk(0);
    c_sprite(spr_rudy_juice_wreckt);
    c_imageindex(0);
    c_sel(no);
    c_sprite(spr_noelle_juice_shock);
    c_shakeobj();
    c_wait(4);
    c_sel(ru);
    c_imageindex(1);
    c_wait(4);
    c_imageindex(2);
    c_wait(30);
    c_sel(no);
    c_sprite(noelle_npc.sprite_index);
    c_imageindex(noelle_npc.image_index);
    c_sel(ru);
    c_sprite(spr_rudy_juice_laugh);
    c_imagespeed(0.2);
    c_wait(60);
    c_sel(ru);
    c_halt();
    c_speaker("rudy");
    c_msgsetloc(0, "\\E3* Fahaha^1, what was I supposed to say^1, sweetheart?/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_143_0");
    c_talk_wait();
    c_var_instance(actor_talker, "paused", true);
    c_sel(to);
    c_autowalk(0);
    c_sprite(spr_toriel_juice_talk_right);
    c_var_instance(id, "enable_npcs", true);
    c_wait(4);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 10 && !d_ex() && global.interact == 0)
{
    con = 12;
    global.interact = 1;
    facing_temp = global.facing;
    actor_talker = instance_create(0, 0, obj_actor_talk);
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 12)
{
    con = 5;
    to = actor_count + 1;
    to_actor = instance_create(toriel_npc.x, toriel_npc.y, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = toriel_npc.sprite_index;
    ru = actor_count + 2;
    ru_actor = instance_create(rudy_npc.x, rudy_npc.y, obj_actor);
    scr_actor_setup(ru, ru_actor, "rudy");
    ru_actor.sprite_index = rudy_npc.sprite_index;
    no = actor_count + 3;
    no_actor = instance_create(noelle_npc.x, noelle_npc.y, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = noelle_npc.sprite_index;
    no_actor.image_speed = noelle_npc.image_speed;
    no_actor.image_index = noelle_npc.image_index;
    c_sel(no);
    c_autowalk(0);
    c_var_instance(actor_talker, "talking_actor", to_actor);
    c_var_instance(actor_talker, "paused", true);
    c_var_instance(id, "disable_npcs", true);
    c_wait(1);
    c_sel(ru);
    c_sprite(spr_rudy_juice_walk_right);
    c_var_instance(actor_talker, "paused", false);
    c_sel(to);
    c_autowalk(0);
    var small_talk_a = stringsetloc("(Kris will sing swears.)", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_214_0");
    var small_talk_b = stringsetloc("(Kris will sing swears.)", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_215_0");
    var small_talk_c = stringsetloc("(Kris will sing swears.)", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_216_0");
    var loc1 = [71, 168];
    var loc2 = [221, 208];
    var loc3 = [371, 248];
    if (global.lang == "ja")
    {
        loc1 = [83, 166];
        loc2 = [177, 208];
        loc3 = [271, 250];
    }
    scr_smallface(0, "rudy", 4, loc1[0], loc1[1], small_talk_a);
    scr_smallface(1, "noelle", 17, loc2[0], loc2[1], small_talk_b);
    scr_smallface(2, "toriel", 5, loc3[0], loc3[1], small_talk_c);
    c_sel(no);
    c_sprite(spr_noelle_juice_shock);
    c_halt();
    c_speaker("toriel");
    c_msgsetloc(0, "\\E9* Noelle^1, your singing has gotten so lovely.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_223_0");
    c_msgnextloc("\\E4* You^1, Kris^1, and Asriel should perform sometime!/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_224_0");
    c_facenext("noelle", "3");
    c_msgnextloc("\\E3* Huh? Umm^1, it would be nice to go caroling together.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_226_0");
    c_facenext("no_name", 0);
    c_msgnextloc("\\f0^2\\f1^2\\f2/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_228_0");
    c_talk();
    c_wait_box(3);
    c_sel(to);
    c_halt();
    c_sel(no);
    c_sprite(spr_noelle_juice_drinking);
    c_wait_talk();
    c_sel(ru);
    c_sprite(spr_rudy_juice_walk_left);
    c_var_instance(id, "enable_npcs", true);
    c_wait(1);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 20 && !d_ex() && global.interact == 0)
{
    con = 22;
    global.interact = 1;
    facing_temp = global.facing;
    actor_talker = instance_create(0, 0, obj_actor_talk);
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 22)
{
    con = 5;
    to = actor_count + 1;
    to_actor = instance_create(toriel_npc.x, toriel_npc.y, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = toriel_npc.sprite_index;
    ru = actor_count + 2;
    ru_actor = instance_create(rudy_npc.x, rudy_npc.y, obj_actor);
    scr_actor_setup(ru, ru_actor, "rudy");
    ru_actor.sprite_index = rudy_npc.sprite_index;
    no = actor_count + 3;
    no_actor = instance_create(noelle_npc.x, noelle_npc.y, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = noelle_npc.sprite_index;
    no_actor.image_speed = noelle_npc.image_speed;
    no_actor.image_index = noelle_npc.image_index;
    c_sel(no);
    c_autowalk(0);
    c_var_instance(actor_talker, "talking_actor", to_actor);
    c_var_instance(actor_talker, "paused", false);
    c_var_instance(id, "disable_npcs", true);
    c_wait(1);
    c_sel(to);
    c_autowalk(0);
    c_sprite(spr_toriel_juice_talk_right_unhappy);
    c_speaker("rudy");
    c_msgsetloc(0, "\\E2* Key-lime-pie? Boy^1, do I have some memories of that./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_301_0");
    c_facenext("toriel", 3);
    c_msgnextloc("\\E3* Not here^1, Rudy. This is a holy place./%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_303_0");
    c_talk();
    c_wait_box(2);
    c_sel(to);
    c_wait_talk();
    c_sel(to);
    c_sel(ru);
    c_sprite(spr_rudy_juice_walk_left);
    c_var_instance(id, "enable_npcs", true);
    c_wait(1);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 30 && !d_ex())
{
    con = 32;
    noelle_sing_talk++;
    global.interact = 1;
    facing_temp = global.facing;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 32)
{
    con = 5;
    to = actor_count + 1;
    to_actor = instance_create(toriel_npc.x, toriel_npc.y, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = toriel_npc.sprite_index;
    ru = actor_count + 2;
    ru_actor = instance_create(rudy_npc.x, rudy_npc.y, obj_actor);
    scr_actor_setup(ru, ru_actor, "rudy");
    ru_actor.sprite_index = rudy_npc.sprite_index;
    no = actor_count + 3;
    no_actor = instance_create(noelle_npc.x, noelle_npc.y, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = noelle_npc.sprite_index;
    no_actor.image_speed = noelle_npc.image_speed;
    c_sel(no);
    c_autowalk(0);
    c_var_instance(id, "disable_npcs", true);
    c_wait(1);
    c_sel(no);
    c_autowalk(0);
    c_halt();
    if (noelle_sing_talk == 1)
    {
        c_speaker("noelle");
        c_msgsetloc(0, "\\E3* H..^1. huh? Thanks^1! Where'd that come from?/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_373_0");
        c_msgnextloc("\\E8* I don't think you've ever..^1. complimented me^1, before. Fahaha./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_374_0");
        c_msgnextloc("\\E3* You know^1, if you wanted to join the choir^1, you could.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_375_0");
        c_msgnextloc("\\E9* I always missed^1, um..^1. liked hearing you play the piano./%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_376_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("noelle");
        c_msgsetloc(0, "\\E9* ..^1. I mean^1, sometimes I miss.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_381_0");
        c_msgnextloc("\\E4* I mean^1, I always liked hearing you play the piano./%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_382_0");
        c_talk_wait();
    }
    c_var_instance(id, "enable_npcs", true);
    c_wait(1);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 40 && !d_ex())
{
    con = 42;
    global.interact = 1;
    facing_temp = global.facing;
    noelle_key_talk++;
    actor_talker = instance_create(0, 0, obj_actor_talk);
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 42)
{
    con = 5;
    to = actor_count + 1;
    to_actor = instance_create(toriel_npc.x, toriel_npc.y, obj_actor);
    scr_actor_setup(to, to_actor, "toriel");
    to_actor.sprite_index = toriel_npc.sprite_index;
    ru = actor_count + 2;
    ru_actor = instance_create(rudy_npc.x, rudy_npc.y, obj_actor);
    scr_actor_setup(ru, ru_actor, "rudy");
    ru_actor.sprite_index = rudy_npc.sprite_index;
    no = actor_count + 3;
    no_actor = instance_create(noelle_npc.x, noelle_npc.y, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = noelle_npc.sprite_index;
    no_actor.image_speed = noelle_npc.image_speed;
    c_sel(no);
    c_autowalk(0);
    c_var_instance(actor_talker, "talking_actor", to_actor);
    c_var_instance(id, "disable_npcs", true);
    c_wait(1);
    if (noelle_key_talk == 1)
    {
        c_sel(no);
        c_autowalk(0);
        c_halt();
        var small_talk_a = stringsetloc("D-dad!", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_447_0");
        var small_talk_b = stringsetloc("T... Toriel!", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_448_0_b");
        var loc_a = [400, 220];
        var loc_b = [400, 220];
        var __no = "noelle";
        if (global.lang == "ja")
        {
            __no = "noelle_cropped";
            loc_a = [470, 234];
            loc_b = [360, 234];
        }
        scr_smallface(0, __no, 14, loc_a[0], loc_a[1], small_talk_a);
        scr_smallface(1, __no, 14, loc_b[0], loc_b[1], small_talk_b);
        c_speaker("noelle");
        c_msgsetloc(0, "\\EB* Huh? K..^1. Key? You don't mean.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_448_0");
        c_msgnextloc("\\EH* You don't mean I was singing off-key?/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_449_0");
        c_facenext("toriel", 5);
        c_msgnextloc("\\E5* Kris^1, don't tease Noelle./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_451_0");
        c_facenext("rudy", "3");
        c_msgnextloc("\\E3* Yeah^1, or I'll kick your ass!\\f0/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_453_0");
        c_facenext("toriel", 5);
        c_msgnextloc("\\E5* Rudy!/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_455_0");
        c_msgnextloc("\\E4* ..^1. but he's right^1, Kris.\\f1/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_456_0");
        c_talk();
        c_wait_box(1);
        c_sel(ru);
        c_sprite(spr_rudy_juice_walk_right);
        c_sel(to);
        c_autowalk(0);
        c_sprite(spr_toriel_juice_talk_right_unhappy);
        c_wait_talk();
        c_sel(ru);
        c_sprite(spr_rudy_juice_walk_left);
    }
    else
    {
        c_speaker("noelle");
        c_msgsetloc(0, "\\E2* Kris^1, I'm getting better at singing^1, you know./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_490_0");
        c_msgnextloc("\\E3* The times of you covering your ears while I scream Jingle Bells.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_491_0");
        c_msgnextloc("\\E8* Those are..^1. over^1, y'know?/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_492_0");
        c_talk_wait();
    }
    c_var_instance(id, "enable_npcs", true);
    c_wait(1);
    c_actortokris();
    c_terminatekillactors();
}
if (con == 50 && !d_ex())
{
    con = 5;
    global.interact = 1;
    facing_temp = global.facing;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    no = actor_count + 1;
    no_actor = instance_create(noelle_npc.x, noelle_npc.y, obj_actor);
    scr_actor_setup(no, no_actor, "noelle");
    no_actor.sprite_index = noelle_npc.sprite_index;
    no_actor.image_speed = noelle_npc.image_speed;
    if (scr_flag_get(1620) == 0)
    {
        scr_flag_set(1620, 1);
        c_speaker("noelle");
        c_msgsetloc(0, "\\E3* Huh...? You mean^1, um..^1. how I..^1. got locked out of my house?/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_529_0");
        c_msgnextloc("\\E4* That's why I..^1. well^1, I used to end up at your place sometimes./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_530_0");
        c_msgnextloc("\\E8* Y'know^1, you'd help me..^1. faha^1, break into my own room./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_531_0");
        c_msgnextloc("\\E3* Even then^1, my mom..^1. never gave your family a spare key./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_532_0");
        c_msgnextloc("\\E4* She never even kept anything at City Hall^1, either./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_533_0");
        c_msgnextloc("\\E8* No keys^1, no documents^1, no..^1. handmade gifts^1, anything./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_534_0");
        c_msgnextloc("\\E3* Everything important..^1. she always.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_535_0");
        c_msgnextloc("\\E9* ..^1. keeps locked down at home./", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_536_0");
        if (scr_flag_get(1619) == 0)
        {
            scr_flag_set(1619, 1);
            with (obj_ch4_PDC04)
                found_clue();
            global.writersnd[0] = snd_item;
            c_facenext("no_name", 0);
            c_msgnextloc("\\S0* (Felt like useful information.)/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_547_0");
        }
        else if (scr_flag_get(1621) == 1)
        {
            if (scr_flag_get(1619) == 1)
            {
                scr_flag_set(1619, 2);
                susie_ready = true;
            }
            c_facenext("no_name", 0);
            c_msgnextloc("* (..^1. Felt like you gathered enough clues to tell Susie.)/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_558_0");
        }
    }
    else
    {
        scr_speaker("noelle");
        msgsetloc(0, "\\E4* Oh^1, I see^1! That^1, wasn't a question^1, at all!/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_563_0");
        msgnextloc("\\E8* You're just^1, repeating the same words^1, like a parrot!/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_564_0");
        msgnextloc("\\EH* (I shouldn't have answered so seriously.)/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_565_0");
    }
    c_talk_wait();
    c_actortokris();
    c_terminatekillactors();
}
if (con == 60 && !d_ex() && global.interact == 0)
{
    con = 61;
    global.interact = 1;
    facing_temp = global.facing;
    if (global.facing == 2)
        noelle_npc.sprite_index = spr_noelle_juice_walk_down;
    else if (global.facing == 3)
        noelle_npc.sprite_index = spr_noelle_juice_walk_right;
    else
        noelle_npc.sprite_index = spr_noelle_juice_walk_left;
    noelle_npc.image_index = 0;
    noelle_npc.image_speed = 0;
    var side_b = scr_sideb_active();
    if (scr_flag_get(1619) < 2)
    {
        if (!side_b)
        {
            con = 99;
            global.msc = 1327;
            scr_text(global.msc);
        }
        else if (noelle_talked == 0)
        {
            scr_speaker("noelle");
            msgsetloc(0, "\\E2* ..^1. Kris? You came over to..^1. check on me?/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_610_0");
            msgnextloc("\\E3* That's really nice of you^1, I.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_611_0");
            msgnextloc("\\E4* ..^1. Do you..^1. think I could talk you later?/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_612_0");
        }
        else
        {
            scr_speaker("noelle");
            msgsetloc(0, "\\E4* Key? Umm^1, yeah^1, I think I was singing a bit off-key.../", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_616_0");
            msgnextloc("\\E8* Fahaha^1, can you blame me for being distracted?/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_617_0");
        }
    }
    else
    {
        var sentenceEnd = side_b ? "/%" : "/";
        scr_speaker("no_name");
        msgsetsubloc(0, "* (Clues acquired.)&* (Now you can report the hint to Susie.)~1", sentenceEnd, "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_625_0");
        if (!side_b)
        {
            scr_anyface_next("noelle", 8);
            msgnextloc("\\E8* ..^1. hello? Earth to Kris? Personal space?/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_630_0");
        }
    }
    d_make();
    noelle_talked++;
}
if (con == 61 && !d_ex())
{
    con = 99;
    global.interact = 0;
    global.facing = facing_temp;
}
if (con == 5 && !i_ex(obj_cutscene_master))
{
    con = 99;
    if (susie_ready)
    {
        susie_ready = false;
        with (obj_ch4_PDC04)
            susie_ready();
    }
    global.interact = 0;
    global.facing = facing_temp;
    with (actor_talker)
        instance_destroy();
}
if (con == 80 && !d_ex())
{
    con = 85;
    global.interact = 1;
    facing_temp = global.facing;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    ru = actor_count + 1;
    ru_actor = instance_create(rudy_npc.x, rudy_npc.y, obj_actor);
    scr_actor_setup(ru, ru_actor, "rudy");
    ru_actor.sprite_index = rudy_npc.sprite_index;
    if (scr_flag_get(1657) == 0)
    {
        scr_flag_set(1657, 1);
        c_speaker("rudy");
        c_msgsetloc(0, "\\E2* Krismeister^1, hey^1! What's the deal^1, snowmobile?/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_693_0");
        c_msgnextloc("\\E1* ..^1. huh? \"Locked out...?\"/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_694_0");
        c_msgnextloc("\\E5* (Noelle..^1. wasn't stuck outside the gate again^1, was she^1, Kris...?)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_695_0");
        c_msgnextloc("\\E6* (..^1.  Carol..^1. damn^1, I keep telling her to keep a key at City Hall...)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_696_0");
        c_msgnextloc("\\E5* (But she insists on keeping everything important at home.)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_697_0");
        c_msgnextloc("\\E2* (Like^1, when Noelle was a kid...)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_698_0");
        c_msgnextloc("\\E0* (She made paper snowflakes^1, for Carol to hang up at work...)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_699_0");
        c_msgnextloc("\\E5* (But Carol just..^1. wouldn't take 'em there.)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_700_0");
        c_msgnextloc("\\E6* (Because she wanted to keep the damn things safe.)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_701_0");
        c_msgnextloc("\\E5* (She preserved 'em^1, and stuck 'em up on the wall at home...)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_702_0");
        c_msgnextloc("\\E4* (..^1. course^1, you know Noelle^1, she had to cry over that.)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_703_0");
        c_msgnextloc("\\E2* (Until she went and made snow angels with you guys...)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_704_0");
        c_msgnextloc("\\E4* (..^1.  After that^1, she forgot she was sad at all.)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_705_0");
        c_msgnextloc("\\E2* (..^1.  Anyway^1, what was I saying?)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_706_0");
        if (scr_flag_get(1619) == 0)
        {
            scr_flag_set(1619, 1);
            with (obj_ch4_PDC04)
                found_clue();
            global.writersnd[0] = snd_item;
            c_facenext("no_name", 0);
            c_msgnextloc("\\S0* (Felt like useful information.)/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_717_0");
        }
        else if (scr_flag_get(1621) == 1)
        {
            if (scr_flag_get(1619) == 1)
            {
                scr_flag_set(1619, 2);
                susie_ready = true;
            }
            c_facenext("no_name", 0);
            c_msgnextloc("* (..^1. Felt like you gathered enough clues to tell Susie.)/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_728_0");
        }
    }
    else
    {
        c_speaker("rudy");
        c_msgsetloc(0, "\\E5* (Y'know^1, this morning^1, Noelle was saying...)/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_733_0");
        c_msgnextloc("\\E2* (\"I wonder..^1. if Kris is going tomorrow^1, too.\")/", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_734_0");
        c_msgnextloc("\\E3* (Just..^1. make sure she has fun^1, all right?)/%", "obj_ch4_PDC03A_rudy_toriel_slash_Step_0_gml_735_0");
    }
    c_talk_wait();
    c_actortokris();
    c_terminatekillactors();
}
if (con == 85 && !i_ex(obj_cutscene_master))
{
    con = 99;
    if (susie_ready)
    {
        susie_ready = false;
        with (obj_ch4_PDC04)
            susie_ready();
    }
    global.interact = 0;
    global.facing = facing_temp;
    enable_npcs = true;
}
if (disable_npcs)
{
    disable_npcs = false;
    toriel_npc.visible = 0;
    with (rudy_npc)
    {
        visible = 0;
        x = -100;
        y = -100;
    }
    with (toriel_npc)
    {
        visible = 0;
        x = -100;
        y = -100;
    }
    with (noelle_npc)
    {
        visible = 0;
        x = -100;
        y = -100;
    }
}
if (enable_npcs)
{
    enable_npcs = false;
    toriel_npc.visible = 1;
    with (rudy_npc)
    {
        x = xstart;
        y = ystart;
        visible = 1;
    }
    with (toriel_npc)
    {
        x = xstart;
        y = ystart;
        visible = 1;
    }
    if (i_ex(no_actor))
        no_actor.visible = false;
    with (noelle_npc)
    {
        x = xstart;
        y = ystart;
        visible = 1;
    }
    rudy_npc.sprite_index = spr_rudy_juice_walk_left;
}
if (rudy_turn_con == 1 && !d_ex())
{
    rudy_turn_con = 0;
    rudy_npc.sprite_index = spr_rudy_juice_walk_left;
}
