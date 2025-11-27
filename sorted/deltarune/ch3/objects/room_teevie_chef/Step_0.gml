if (con < 0)
    exit;
if (con == 0)
{
    if (obj_mainchara.x >= 630 && global.interact == 0)
    {
        con = 1;
        alarm[0] = 1;
        global.interact = 1;
    }
}
if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    el = actor_count + 1;
    el_actor = instance_create(935, -200, obj_actor);
    scr_actor_setup(el, el_actor, "elnina");
    el_actor.sprite_index = spr_npc_elnina_float_appear;
    la = actor_count + 2;
    la_actor = instance_create(1030, -200, obj_actor);
    scr_actor_setup(la, la_actor, "lanino");
    la_actor.sprite_index = spr_npc_lanino_float_appear;
    global.facing = 0;
    c_sel(el);
    c_visible(0);
    c_autowalk(0);
    c_autodepth(0);
    c_depth(95000);
    c_sel(la);
    c_visible(0);
    c_autowalk(0);
    c_autodepth(0);
    c_depth(95000);
    c_var_lerp_instance(blackall, "image_alpha", 0, 0.75, 30);
    c_mus2("volume", 0, 30);
    c_wait(45);
    if (party_time)
        c_var_instance(id, "party_stop", true);
    c_waitcustom();
}
if (con == 3 && customcon == 1)
{
    con = 4;
    global.typer = 42;
    scr_speaker("no_name");
    msgsetloc(0, "* Geh-ha-ha-ha.../%", "obj_room_teevie_chef_slash_Step_0_gml_68_0");
    instance_create(camerax() + 40, cameray() + 40, obj_writer);
    snd_free_all();
}
if (con == 4 && !i_ex(obj_writer) && customcon == 1)
{
    con = 5;
    customcon = 0;
    c_waitcustom_end();
    c_pannable(1);
    c_pan(560, cameray(), 30);
    c_sel(kr);
    c_walkdirect_speed(714, 297, 6);
    c_sel(su);
    c_walkdirect_speed(645, 280, 6);
    c_sel(ra);
    c_walkdirect_speed_wait(582, 284, 6);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    if (party_time)
        c_var_instance(id, "party_shock", true);
    c_waitcustom();
}
if (release_rouxls)
{
    rouxls_appear_timer++;
    if (rouxls_appear == -4)
    {
        snd_free_all();
        snd_play(snd_rurus_appear);
        rouxls_appear = instance_create(rouxls.x, rouxls.y, obj_rurus_appear);
        rouxls_appear.depth = rouxls.depth - 10;
    }
    if (con < 50)
    {
        if (rouxls_appear_timer == 20)
        {
            snd_play(snd_cape_2);
            with (el_actor)
            {
                y = 170;
                visible = 1;
                vspeed = -6;
                hspeed = -1;
                gravity = 1;
                scr_lerpvar("image_index", 0, 8, 15);
            }
            with (la_actor)
            {
                y = 160;
                visible = 1;
                vspeed = -6;
                hspeed = 1;
                gravity = 1;
                scr_lerpvar("image_index", 0, 8, 15);
            }
        }
        if (rouxls_appear_timer == 30)
        {
            with (el_actor)
            {
                sprite_index = spr_npc_elnina_float_frantic;
                image_speed = 0.2;
                vspeed = -12;
            }
            with (la_actor)
            {
                sprite_index = spr_npc_lanino_float_frantic;
                image_speed = 0.2;
                vspeed = -12;
            }
        }
        if (rouxls_appear_timer == 56)
        {
            with (el_actor)
            {
                sprite_index = spr_npc_elnina_float;
                image_speed = 0;
            }
            with (la_actor)
            {
                sprite_index = spr_npc_lanino_float;
                image_speed = 0;
            }
        }
        if (rouxls_appear_timer > 60)
        {
            with (el_actor)
            {
                if (y > 280)
                {
                    snd_play(snd_bump);
                    dust = instance_create(x + 30, y + 90, obj_slidedust);
                    dust.depth = depth - 10;
                    with (dust)
                    {
                        vspeed = -6;
                        hspeed = -2 + random(2);
                    }
                    sprite_index = spr_npc_elnina_float_land;
                    scr_delay_var("image_index", 1, 6);
                    vspeed = 0;
                    gravity = 0;
                    hspeed = 0;
                    y = 280;
                    scr_shakeobj();
                }
            }
            with (la_actor)
            {
                if (y > 280)
                {
                    dust = instance_create(x + 60, y + 70, obj_slidedust);
                    dust.depth = depth - 10;
                    with (dust)
                    {
                        vspeed = -6;
                        hspeed = 1 + random(2);
                    }
                    sprite_index = spr_npc_lanino_float_land;
                    scr_delay_var("image_index", 1, 6);
                    y = 280;
                    vspeed = 0;
                    gravity = 0;
                    hspeed = 0;
                    scr_shakeobj();
                }
            }
        }
    }
    if (rouxls_appear_timer >= 90)
    {
        release_rouxls = false;
        rouxls_appear_timer = 0;
        if (i_ex(rouxls_appear))
            instance_destroy(rouxls_appear);
        rouxls_appear = -4;
    }
}
if (con == 5 && customcon == 1)
{
    con = 10;
    customcon = 0;
    c_waitcustom_end();
    c_var_lerp_instance(blackall, "image_alpha", 0.75, 0, 10);
    c_wait(10);
    c_var_instance(id, "release_rouxls", true);
    c_wait(30);
    c_var_instance(rouxls, "visible", 1);
    c_wait_if(id, "release_rouxls", "=", false);
    c_sel(el);
    c_sprite(spr_npc_elnina_float_land_sit);
    c_sel(la);
    c_sprite(spr_npc_lanino_float_land_sit);
    c_wait(60);
    c_mus2("initloop", "ruruskaado.ogg", 0);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EL* R-Rouxls Kaard!/", "obj_room_teevie_chef_slash_Step_0_gml_269_0");
    c_facenext("rouxls", "3");
    c_msgnextloc("\\E3* AND^1, don't forget my Loverse^1, Sun Guy and Moon Girl./", "obj_room_teevie_chef_slash_Step_0_gml_271_0");
    c_facenext("ralsei", "X");
    c_msgnextloc("\\EX* Um.../", "obj_room_teevie_chef_slash_Step_0_gml_273_0");
    c_msgnextloc("\\EN* Kris^1, get ready for another fight!/", "obj_room_teevie_chef_slash_Step_0_gml_274_0");
    c_facenext("rouxls", "2");
    c_msgnextloc("\\E2* Ha^1! Quell your mouth^1, my dearest Bimbitoe!/%", "obj_room_teevie_chef_slash_Step_0_gml_276_0");
    c_talk();
    c_wait_box(2);
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_wait_box(4);
    c_sel(ra);
    c_facing("d");
    c_wait_box(5);
    c_sel(ra);
    c_facing("r");
    c_wait_talk();
    c_var_instance(rouxls, "sprite_index", spr_npc_rouxls_chef_up);
    c_var_lerp_to_instance(rouxls, "y", rouxls.y - 20, 10);
    c_wait(30);
    c_speaker("rouxls");
    c_msgsetloc(0, "\\E6* We're just hereth for the Snackse./", "obj_room_teevie_chef_slash_Step_0_gml_300_0");
    c_msgnextloc("\\E4* Goeth on. I hath no quarrel with thee./", "obj_room_teevie_chef_slash_Step_0_gml_301_0");
    c_facenext("ralsei", "L");
    c_msgnextloc("\\EL* Umm..^1. you don't?/", "obj_room_teevie_chef_slash_Step_0_gml_303_0");
    c_msgnextloc("\\EK* But..^1. if you capture us^1, won't you earn Tenna's admiration?/%", "obj_room_teevie_chef_slash_Step_0_gml_304_0");
    c_talk();
    c_wait_box(1);
    c_mus("free_all");
    c_wait_box(3);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_right_walk);
    c_wait_box(4);
    c_sel(ra);
    c_facing("r");
    c_wait_talk();
    c_var_instance(rouxls, "sprite_index", spr_rouxls_chef);
    c_wait(5);
    c_speaker("rouxls");
    c_msgsetloc(0, "\\E4* Haha^1! Oh^1, please^1! I am Beyonde such shallow Desires.../", "obj_room_teevie_chef_slash_Step_0_gml_323_0");
    c_msgnextloc("\\E5* For you See^1, I hath already Gotten them!/", "obj_room_teevie_chef_slash_Step_0_gml_324_0");
    c_msgnextloc("\\E4* My two Paramours art already TV Guy's Second-In-Commande.../", "obj_room_teevie_chef_slash_Step_0_gml_325_0");
    c_msgnextloc("\\E3* And by the Transitive Propertie^1, that also maketh ME...?/", "obj_room_teevie_chef_slash_Step_0_gml_326_0");
    c_msgnextloc("\\E2* This world's Personal Duke of Puzzles?/%", "obj_room_teevie_chef_slash_Step_0_gml_327_0");
    c_talk_wait();
    c_mus("pause");
    c_wait(60);
    c_var_lerp_to_instance(rouxls, "y", rouxls.y, 10);
    c_wait(20);
    c_mus("resume");
    c_sel(el);
    c_sprite(spr_npc_elnina_float_land);
    c_imageindex(1);
    c_sel(la);
    c_sprite(spr_npc_lanino_float_land);
    c_imageindex(1);
    c_speaker("rouxls");
    c_msgsetloc(0, "\\E3* Right^1, Honey 1 and Honey 2? That's howeth this Workse?/%", "obj_room_teevie_chef_slash_Step_0_gml_348_0");
    c_talk_wait();
    c_mus("pause");
    c_wait(30);
    c_sel(el);
    c_sprite(spr_npc_elnina_float_land_look);
    c_sel(la);
    c_sprite(spr_npc_lanino_float_land_look);
    c_speaker("no_name");
    c_msgsetloc(0, "* Umm...?/%", "obj_room_teevie_chef_slash_Step_0_gml_364_0");
    c_talk_wait();
    c_wait(30);
    c_mus("resume");
    c_sel(el);
    c_sprite(spr_npc_elnina_float_land_sit);
    c_sel(la);
    c_sprite(spr_npc_lanino_float_land_sit);
    c_speaker("rouxls");
    c_msgsetloc(0, "\\E3* See? It's totally how it Workse./", "obj_room_teevie_chef_slash_Step_0_gml_379_0");
    c_msgnextloc("\\E5* Now begone!/%", "obj_room_teevie_chef_slash_Step_0_gml_380_0");
    c_talk_wait();
    c_mus2("volume", 0, 15);
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
    if (party_time)
        c_var_instance(id, "party_start", true);
    c_var_instance(elnina_marker, "y", 280);
    c_var_instance(lanino_marker, "y", 280);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 10 && !i_ex(obj_cutscene_master))
{
    con = 50;
    global.facing = 0;
    global.interact = 0;
    snd_free_all();
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("tv_world.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
        mus_volume(global.currentsong[1], 0, 0);
        mus_volume(global.currentsong[1], 0.7, 30);
    }
    scr_flag_set(1148, 1);
    rouxls.depth = elnina_marker.depth;
    lanino_marker.depth = elnina_marker.depth;
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
}
if (con == 20 && !d_ex())
{
    con = 21;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_speaker("no_name");
    c_msgsetloc(0, "* It's like Rouxls.../", "obj_room_teevie_chef_slash_Step_0_gml_435_0");
    c_facenext("rouxls", "3");
    c_msgnextloc("\\E3* Rouxlsypoo/", "obj_room_teevie_chef_slash_Step_0_gml_437_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* It's like Rouxlsypoo says^1, a relationship^1, is about.../", "obj_room_teevie_chef_slash_Step_0_gml_439_0");
    c_msgnextloc("* Umm^1, not being alone. And with two partners^1, you are umm^1, less alone./%", "obj_room_teevie_chef_slash_Step_0_gml_440_0");
    c_talk_wait();
    c_msc(1397);
    c_talk_wait();
    c_waitcustom();
}
if (con == 21 && customcon == 1 && has_answer())
{
    con = 90;
    customcon = 0;
    c_waitcustom_end();
    if (answer == 0)
    {
        c_speaker("no_name");
        c_msgsetloc(0, "* And^1, the higher your collective^1, err..^1. stat total^1, umm..^1. becomes./", "obj_room_teevie_chef_slash_Step_0_gml_460_0");
        c_msgnextloc("* And the^1, umm^1, stronger your^1, combo attacks^1, become./", "obj_room_teevie_chef_slash_Step_0_gml_461_0");
        c_msgnextloc("* All I know is^1, each shining moment I spend with Rouxlsypoo.../", "obj_room_teevie_chef_slash_Step_0_gml_462_0");
        c_msgnextloc("* Makes each drop of Elnina's presence^1, that much more precious./%", "obj_room_teevie_chef_slash_Step_0_gml_463_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("no_name");
        c_msgsetloc(0, "* Certainly./%", "obj_room_teevie_chef_slash_Step_0_gml_468_0");
        c_talk_wait();
    }
    c_waitcustom();
    reset_answer();
}
if (con == 30 && !d_ex())
{
    con = 31;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_speaker("no_name");
    c_msgsetloc(0, "* Each moment with Rouxls^1, is.../", "obj_room_teevie_chef_slash_Step_0_gml_488_0");
    c_facenext("rouxls", "3");
    c_msgnextloc("\\E3* Rouxlsy/", "obj_room_teevie_chef_slash_Step_0_gml_490_0");
    c_facenext("no_name", 0);
    c_msgnextloc("* Each moment with Rouxlsy^1, is..^1. um^1, so informative./", "obj_room_teevie_chef_slash_Step_0_gml_492_0");
    c_msgnextloc("* See^1, he has us write everything on these cards.../", "obj_room_teevie_chef_slash_Step_0_gml_493_0");
    c_facenext("rouxls", "4");
    c_msgnextloc("\\E4* The Rouxls Kaard Relationshipe Systeme.../%", "obj_room_teevie_chef_slash_Step_0_gml_494_0");
    c_talk_wait();
    c_msc(1399);
    c_talk_wait();
    c_waitcustom();
}
if (con == 31 && customcon == 1 && has_answer())
{
    con = 90;
    customcon = 0;
    c_waitcustom_end();
    if (answer == 0)
    {
        c_speaker("rouxls");
        c_msgsetloc(0, "\\E0* Seest^1, thou writeth everything thou feelst on a Card./", "obj_room_teevie_chef_slash_Step_0_gml_514_0");
        c_msgnextloc("\\E2* Then^1, when it's timeth to communicathe./", "obj_room_teevie_chef_slash_Step_0_gml_515_0");
        c_msgnextloc("\\E4* Thou just..^1. throwest them all awain./", "obj_room_teevie_chef_slash_Step_0_gml_516_0");
        c_msgnextloc("\\E0* Becauseth everything we threeth needst./", "obj_room_teevie_chef_slash_Step_0_gml_517_0");
        c_msgnextloc("\\E3* Patteths my Chest^1,/", "obj_room_teevie_chef_slash_Step_0_gml_518_0");
        c_msgnextloc("\\E4* Is right..^1. Here./", "obj_room_teevie_chef_slash_Step_0_gml_519_0");
        c_facenext("no_name", 0);
        c_msgnextloc("* In..^1. our hearts?/", "obj_room_teevie_chef_slash_Step_0_gml_521_0");
        c_facenext("rouxls", "6");
        c_msgnextloc("\\E6* What? No. This is justeth where I keepeth MY Cards./", "obj_room_teevie_chef_slash_Step_0_gml_523_0");
        c_msgnextloc("\\E1* They're Strongre. They haveth like^1, Abilitiese and stuff./", "obj_room_teevie_chef_slash_Step_0_gml_524_0");
        c_msgnextloc("\\E3* It's really justeth about havingst the Best Decke./", "obj_room_teevie_chef_slash_Step_0_gml_525_0");
        c_facenext("no_name", 0);
        c_msgnextloc("* Umm^1, see? This system^1, really makes me see how bright Lanino is.../%", "obj_room_teevie_chef_slash_Step_0_gml_527_0");
        c_talk_wait();
    }
    c_waitcustom();
    reset_answer();
}
if (con == 40 && !d_ex())
{
    con = 41;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_speaker("rouxls");
    c_msgsetloc(0, "\\E4* Fear not. I haveth givenst up the path of Violense./", "obj_room_teevie_chef_slash_Step_0_gml_547_0");
    c_msgnextloc("\\E0* Never against shallst we Cross Swordes./", "obj_room_teevie_chef_slash_Step_0_gml_548_0");
    c_msgnextloc("\\E4* For I hath found..^1. Love. Loverse./%", "obj_room_teevie_chef_slash_Step_0_gml_549_0");
    c_talk_wait();
    c_msc(1401);
    c_talk_wait();
    c_waitcustom();
}
if (con == 41 && customcon == 1 && has_answer())
{
    con = 90;
    customcon = 0;
    c_waitcustom_end();
    if (answer == 0)
    {
        c_speaker("rouxls");
        c_msgsetloc(0, "\\E4* Thosest^1, who shouldst Adoreth me. And changeth my socks./", "obj_room_teevie_chef_slash_Step_0_gml_569_0");
        c_msgnextloc("\\E4* And changeth^1, my Worms. And changeth^1, my Cereale./", "obj_room_teevie_chef_slash_Step_0_gml_570_0");
        c_msgnextloc("\\E4* And watcheth^1, little Lancer. And moisten^1, his eyes./", "obj_room_teevie_chef_slash_Step_0_gml_571_0");
        c_msgnextloc("\\E4* And shineth light^1, in his Mouthe^1, to see if he's Sicke./", "obj_room_teevie_chef_slash_Step_0_gml_572_0");
        c_msgnextloc("\\E4* And shineth light^1, in his hands^1, to see if they're Sicke./", "obj_room_teevie_chef_slash_Step_0_gml_573_0");
        c_msgnextloc("\\E4* And shineth light^1, in his Mouthe^1, to see if he's Sicke 2./", "obj_room_teevie_chef_slash_Step_0_gml_574_0");
        c_msgnextloc("\\E4* My loverse^1, oh loverse./", "obj_room_teevie_chef_slash_Step_0_gml_575_0");
        c_msgnextloc("\\E6* It would be Coole^1, to have More./%", "obj_room_teevie_chef_slash_Step_0_gml_576_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("rouxls");
        c_msgsetloc(0, "\\E1* Okaye. Thou just jealous causeth thoun Throuple doth suck./", "obj_room_teevie_chef_slash_Step_0_gml_581_0");
        c_msgnextloc("\\E6* I didn'tst even See you on Throuple's Night at the Throuple's Ball./", "obj_room_teevie_chef_slash_Step_0_gml_582_0");
        c_msgnextloc("\\E1* It was just Us. Alone. Yon losers. Lo^1, Medieval L^1, on mine forehead./%", "obj_room_teevie_chef_slash_Step_0_gml_583_0");
        c_talk_wait();
    }
    c_waitcustom();
    reset_answer();
}
if (con == 90 && !d_ex() && customcon == 1)
{
    con = 91;
    customcon = 0;
    c_waitcustom_end();
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 91 && !i_ex(obj_cutscene_master))
{
    con = 50;
    global.facing = 0;
    global.interact = 0;
}
if (con == 50 && obj_mainchara.x >= 1480 && global.interact == 0)
{
    con = 51;
    alarm[0] = 1;
    global.interact = 1;
    with (rouxls)
    {
        visible = 0;
        x = 1730;
    }
}
if (con == 52)
{
    con = 53;
    scr_tempsave();
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    el = actor_count + 1;
    el_actor = instance_create(elnina_marker.x, elnina_marker.y, obj_actor);
    scr_actor_setup(el, el_actor, "elnina");
    el_actor.sprite_index = elnina_marker.sprite_index;
    la = actor_count + 2;
    la_actor = instance_create(lanino_marker.x, lanino_marker.y, obj_actor);
    scr_actor_setup(la, la_actor, "lanino");
    la_actor.sprite_index = lanino_marker.sprite_index;
    global.facing = 0;
    c_var_lerp_instance(blackall, "image_alpha", 0, 0.75, 30);
    c_mus2("volume", 0, 30);
    c_sel(el);
    c_autowalk(0);
    c_autodepth(0);
    c_sel(la);
    c_autowalk(0);
    c_autodepth(0);
    c_wait(45);
    if (party_time)
        c_var_instance(id, "party_stop", true);
    c_waitcustom();
}
if (con == 53 && customcon == 1)
{
    con = 54;
    customcon = 0;
    global.typer = 42;
    scr_speaker("no_name");
    msgsetloc(0, "* Guyse?/%", "obj_room_teevie_chef_slash_Step_0_gml_678_0");
    instance_create(camerax() + 80, cameray() + 40, obj_writer);
    snd_free_all();
}
if (con == 54 && !i_ex(obj_writer))
{
    con = 60;
    c_waitcustom_end();
    c_pannable(1);
    c_pan(1280, cameray(), 10);
    c_var_lerp_instance(blackall, "image_alpha", 0.75, 0, 10);
    c_wait(10);
    c_var_instance(id, "release_rouxls", true);
    c_sel(kr);
    c_walkdirect(1484, 297, 15);
    c_delayfacing(16, "r");
    c_sel(su);
    c_walkdirect(1406, 280, 15);
    c_delayfacing(16, "r");
    c_sel(ra);
    c_walkdirect(1333, 284, 15);
    c_delayfacing(16, "r");
    c_wait(30);
    c_var_instance(rouxls, "visible", 1);
    c_wait(60);
    c_mus2("initloop", "ruruskaado.ogg", 0);
    c_speaker("rouxls");
    c_msgsetloc(0, "\\E1* So it actually Doesn't Worke./", "obj_room_teevie_chef_slash_Step_0_gml_721_0");
    c_msgnextloc("\\E5* We had a talk^1, and it doesn't Worke./", "obj_room_teevie_chef_slash_Step_0_gml_722_0");
    c_msgnextloc("\\E6* Even IF I dateth them..^1. I'm NOT?? 2nd in Commande???/%", "obj_room_teevie_chef_slash_Step_0_gml_723_0");
    c_talk_wait();
    c_mus("pause");
    c_wait(60);
    c_mus("resume");
    c_speaker("rouxls");
    c_msgsetloc(0, "\\E4* So. Headsts together./", "obj_room_teevie_chef_slash_Step_0_gml_734_0");
    c_msgnextloc("\\E3* What art we going to Do about That./", "obj_room_teevie_chef_slash_Step_0_gml_735_0");
    c_facenext("susie", "4");
    c_msgnextloc("\\E4* If you fight us we'll kick your ass./", "obj_room_teevie_chef_slash_Step_0_gml_737_0");
    c_facenext("rouxls", 4);
    c_msgnextloc("\\E4* Yes^1, haha. I Knowst. We shalth not fight./", "obj_room_teevie_chef_slash_Step_0_gml_739_0");
    c_msgnextloc("\\E3* Unless we did..^1. Nonviolentlye?/%", "obj_room_teevie_chef_slash_Step_0_gml_740_0");
    c_talk();
    c_wait_box(3);
    c_mus("pause");
    c_sel(su);
    c_sprite(spr_susie_point_right);
    c_addxy(0, 55);
    c_wait_box(5);
    c_sel(su);
    c_facing("r");
    c_addxy(0, -55);
    c_wait_box(6);
    c_mus("resume");
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_right_walk);
    c_sel(su);
    c_sprite(spr_susie_surprised_right);
    c_wait_talk();
    c_mus("pause");
    c_wait(60);
    c_sel(ra);
    c_facing("ralseiunhappy");
    c_facing("r");
    c_sel(su);
    c_facing("susieunhappy");
    c_facing("r");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* Please don't start a battle./", "obj_room_teevie_chef_slash_Step_0_gml_781_0");
    c_facenext("rouxls", "0");
    c_msgnextloc("\\E0* Okaye^1,/%", "obj_room_teevie_chef_slash_Step_0_gml_783_0");
    c_talk_wait();
    c_wait(60);
    c_sel(ra);
    c_sprite(spr_ralsei_surprised_right_walk);
    c_sel(su);
    c_sprite(spr_susie_surprised_right);
    if (party_time)
        c_var_instance(id, "party_shock", true);
    c_speaker("rouxls");
    c_msgsetloc(0, "\\E5* But what if..^1. I Do/%", "obj_room_teevie_chef_slash_Step_0_gml_801_0");
    c_talk_wait();
    c_sel(su);
    c_facing("susiedarkeyes");
    c_facing("r");
    c_sel(ra);
    c_facing("ralseinohat");
    c_facing("r");
    c_waitcustom();
}
if (con == 60 && customcon == 1 && !d_ex())
{
    con = 61;
    alarm[0] = 30;
    snd_free_all();
    rouxls_marker = scr_dark_marker(rouxls.x, rouxls.y, spr_rouxls_chef);
    with (rouxls)
        visible = 0;
    encounterflag = 585;
    encounterno = 114;
    global.flag[54] = encounterflag;
    scr_battle(encounterno, 1, rouxls_marker, 0, 0);
    with (obj_actor)
        visible = 0;
}
if (con == 62 && i_ex(obj_battlecontroller))
{
    var battle_end = false;
    with (obj_battlecontroller)
    {
        if (intro == 2)
            battle_end = true;
    }
    if (battle_end)
    {
        var rx = 0;
        var ry = 0;
        if (i_ex(obj_elnina_enemy_rouxls))
        {
            rx = obj_elnina_enemy_rouxls.x;
            ry = obj_elnina_enemy_rouxls.y;
        }
        with (el_actor)
        {
            visible = 1;
            x = rx;
            y = ry;
            scr_move_to_point_over_time(1650, 244, 6);
            sprite_index = spr_npc_elnina_blush_right;
            depth = obj_herokris.depth;
        }
        rx = 0;
        ry = 0;
        if (i_ex(obj_elnina_enemy_rouxls))
        {
            rx = obj_lanino_enemy_rouxls.x;
            ry = obj_lanino_enemy_rouxls.y;
        }
        with (la_actor)
        {
            visible = 1;
            x = rx;
            y = ry;
            scr_move_to_point_over_time(1753, 248, 6);
            sprite_index = spr_npc_lanino_blush_talk;
            depth = obj_herokris.depth;
        }
        with (obj_elnina_enemy_rouxls)
            instance_destroy();
        with (obj_lanino_enemy_rouxls)
            instance_destroy();
        con = 69;
        alarm[0] = 30;
        snd_volume(global.batmusic[1], 0, 25);
        if (party_time)
            party_start = true;
    }
}
if (con == 70)
{
    con = 71;
    alarm[0] = 30;
    if (i_ex(obj_battleback))
    {
        with (obj_battleback)
            destroy = 1;
    }
    snd_free(global.batmusic[0]);
    snd_volume(global.currentsong[1], 0, 0);
    snd_resume(global.currentsong[1]);
    snd_volume(global.currentsong[1], 1, 20);
    with (obj_actor)
        visible = 1;
    if (i_ex(obj_monsterparent))
    {
        with (obj_monsterparent)
            instance_destroy();
    }
    if (i_ex(obj_bulletparent))
    {
        with (obj_bulletparent)
            instance_destroy();
    }
    if (i_ex(obj_heroparent))
    {
        with (obj_heroparent)
            instance_destroy();
    }
    if (i_ex(obj_battlecontroller))
        instance_destroy(obj_battlecontroller);
    scr_flag_set(1059, global.flag[50]);
}
if (con == 72 && !i_ex(obj_battlecontroller) && customcon == 1)
{
    con = 73;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(id, "talking_actor", la_actor);
    c_speaker("no_name");
    c_msgsetloc(0, "* Oh my sweet cloud..^1. I..^1. I..^1. after you!/", "obj_room_teevie_chef_slash_Step_0_gml_952_0");
    c_msgnextloc("* No^1, my sunny moon^1! I..^1. I..^1. You go first!/%", "obj_room_teevie_chef_slash_Step_0_gml_953_0");
    c_talk();
    c_wait_box(1);
    c_var_instance(id, "talking_actor", el_actor);
    c_wait_talk();
    c_wait(90);
    c_snd_play(snd_wing);
    c_sel(el);
    c_autowalk(0);
    c_sprite(spr_npc_elnina_cry);
    c_imagespeed(0.2);
    c_shakeobj();
    c_sel(la);
    c_autowalk(0);
    c_sprite(spr_npc_lanino_cry);
    c_imagespeed(0.2);
    c_shakeobj();
    c_speaker("no_name");
    c_msgsetloc(0, "* I really didn't like that guy that much!/%", "obj_room_teevie_chef_slash_Step_0_gml_982_0");
    c_talk_wait();
    c_sel(el);
    c_shakeobj();
    c_speaker("no_name");
    c_msgsetloc(0, "* He was hot but really weird!/%", "obj_room_teevie_chef_slash_Step_0_gml_990_0");
    c_talk_wait();
    c_sel(la);
    c_shakeobj();
    c_speaker("no_name");
    c_msgsetloc(0, "* He moved the laser pointer too fast!/%", "obj_room_teevie_chef_slash_Step_0_gml_998_0");
    c_talk_wait();
    c_sel(el);
    c_halt();
    c_sprite(spr_npc_elnina_sneeze);
    c_snd_play_x(snd_wing, 1, 1.5);
    c_imageindex(0);
    c_imagespeed(0);
    c_sel(la);
    c_halt();
    c_sprite(spr_npc_lanino_sneeze);
    c_imagespeed(0);
    c_imageindex(0);
    c_wait(15);
    c_sel(el);
    c_snd_play_x(snd_sneeze, 1, 1.5);
    c_imageindex(1);
    c_shakeobj();
    c_sel(la);
    c_snd_play_x(snd_sneeze, 1, 0.5);
    c_imageindex(1);
    c_shakeobj();
    c_wait(15);
    c_sel(el);
    c_sprite(spr_npc_elnina_blush_right);
    c_halt();
    c_sel(la);
    c_sprite(spr_npc_lanino_blush_talk);
    c_halt();
    c_wait(40);
    if (scr_flag_get(254) == 0)
    {
        c_var_instance(id, "talking_actor", el_actor);
        c_speaker("no_name");
        c_msgsetloc(0, "* From now on^1, the only third person for us.../", "obj_room_teevie_chef_slash_Step_0_gml_1044_0");
        c_msgnextloc("* Is..^1. each other./%", "obj_room_teevie_chef_slash_Step_0_gml_1045_0");
        c_talk();
        c_wait_box(1);
        c_var_instance(id, "talking_actor", la_actor);
        c_wait_talk();
        c_sel(el);
        c_sprite(spr_npc_elnina_talk);
        c_sel(la);
        c_sprite(spr_npc_lanino_talk);
        c_var_instance(id, "talking_actor", la_actor);
        c_speaker("no_name");
        c_msgsetloc(0, "* Kris^1! Thank you for reuniting us^1! We are..^1. in your debt!/", "obj_room_teevie_chef_slash_Step_0_gml_1063_0");
        c_msgnextloc("* We're on your side now..^1. weather you like it or not!/%", "obj_room_teevie_chef_slash_Step_0_gml_1064_0");
        c_talk();
        c_wait_box(1);
        c_var_instance(id, "talking_actor", el_actor);
        c_wait_talk();
        c_sel(el);
        c_sprite(spr_npc_elnina_sunglasses_remove);
        c_imageindex(4);
        c_var_lerp_to("image_index", 0, 24);
        c_sel(la);
        c_sprite(spr_npc_lanino_sunglasses_remove);
        c_imageindex(4);
        c_var_lerp_to("image_index", 0, 24);
        c_wait(45);
    }
    else
    {
        con = 75;
        c_sel(el);
        c_autodepth(1);
        c_sel(la);
        c_autodepth(1);
        c_var_instance(id, "talking_actor", el_actor);
        c_speaker("no_name");
        c_msgsetloc(0, "* From now on^1, the only lover I need.../", "obj_room_teevie_chef_slash_Step_0_gml_1097_0");
        c_msgnextloc("* Is..^1. someone I can share the sky with./%", "obj_room_teevie_chef_slash_Step_0_gml_1098_0");
        c_talk();
        c_wait_box(1);
        c_var_instance(id, "talking_actor", la_actor);
        c_wait_talk();
        c_var_instance(starwalker_marker, "x", la_actor.x + 200);
        c_var_instance(starwalker_marker, "y", 319);
        c_var_instance(starwalker_marker, "image_speed", 0.2);
        c_var_lerp_to_instance(starwalker_marker, "x", 1714, 90);
        c_wait(91);
        c_var_instance(starwalker_marker, "image_speed", 0);
        c_var_instance(starwalker_marker, "image_index", 0);
        c_wait(30);
        c_var_instance(id, "talking_actor", -4);
        c_speaker("no_name");
        c_msgsetloc(0, "* \\cYStar      walker\\cW/%", "obj_room_teevie_chef_slash_Step_0_gml_1121_0");
        c_talk_wait();
        c_wait(30);
        c_var_lerp_to_instance(starwalker_marker, "x", 2114, 30);
        c_var_lerp_to_instance(el_actor, "x", el_actor.x + 400, 30);
        c_var_lerp_to_instance(la_actor, "x", la_actor.x + 400, 30);
        c_wait(60);
    }
    c_waitcustom();
}
if (con == 73 && customcon == 1)
{
    con = 74;
    alarm[0] = 30;
    snd_play(snd_sparkle_gem);
    with (el_actor)
    {
        spareanim = instance_create(x, y, obj_spareanim);
        spareanim.sprite_index = sprite_index;
        spareanim.image_index = 0;
        spareanim.image_xscale = image_xscale;
        spareanim.image_yscale = image_yscale;
        instance_create((camerax() + 640) - 50, y, obj_recruitanim);
        visible = 0;
    }
    with (la_actor)
    {
        spareanim = instance_create(x, y, obj_spareanim);
        spareanim.sprite_index = sprite_index;
        spareanim.image_index = 0;
        spareanim.image_xscale = image_xscale;
        spareanim.image_yscale = image_yscale;
        instance_create((camerax() + 640) - 50, y + 40, obj_recruitanim);
        visible = 0;
    }
}
if (con == 75 && customcon == 1)
{
    con = 80;
    obj_mainchara.x = kr_actor.x;
    obj_mainchara.y = kr_actor.y;
    c_waitcustom_end();
    c_pannable(1);
    c_panobj(kr_actor, 20);
    c_wait(45);
    c_pannable(0);
    c_var_instance(rouxls, "x", 1454);
    c_var_instance(rouxls, "y", 280);
    c_var_instance(rouxls, "depth", 97000);
    c_var_instance(rouxls, "visible", 1);
    c_var_lerp_to_instance(rouxls, "y", 185, 20);
    c_sel(kr);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_wait(30);
    c_speaker("rouxls");
    c_msgsetloc(0, "\\E6* Looke. I saidst what I cameth for./%", "obj_room_teevie_chef_slash_Step_0_gml_1203_0");
    c_talk_wait();
    c_snd_play(snd_grab);
    c_var_instance(snack_marker_right, "visible", 0);
    c_var_lerp_to_instance(rouxls, "y", 280, 15, 3, "out");
    c_wait(30);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 80 && !i_ex(obj_cutscene_master))
{
    global.interact = 0;
    global.facing = 0;
    global.flag[660] = 1;
    global.flag[661] = 1;
    clean_up();
    scr_flag_set(1148, 2);
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("tv_world.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    }
    con = -1;
    scr_tempsave();
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
            talking_actor = -4;
            talking_actor_current = -4;
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
}
if (d_ex() && talking_both)
{
    if (i_ex(obj_writer))
    {
        if (obj_writer.halt >= 1)
        {
            with (el_actor)
            {
                image_speed = 0;
                image_index = 0;
            }
            with (la_actor)
            {
                image_speed = 0;
                image_index = 0;
            }
            talking_both = false;
        }
        else
        {
            with (el_actor)
                image_speed = 0.2;
            with (la_actor)
                image_speed = 0.2;
        }
    }
}
if (party_start)
{
    party_start = false;
    with (party_controller)
        start_party();
}
if (party_stop)
{
    party_stop = false;
    with (party_controller)
        stop_party();
}
if (party_shock)
{
    party_shock = false;
    with (party_controller)
        shock_party();
}
