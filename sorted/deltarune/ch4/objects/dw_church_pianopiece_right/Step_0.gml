with (obj_caterpillarchara)
    visible = false;
if (!init)
    init = 1;
if (global.interact == 0)
{
    with (obj_floorTrigger)
    {
        if (place_meeting(x, y, obj_mainchara))
        {
            var checkflag = extflag;
            with (obj_solid_temp)
            {
                if (extflag == checkflag)
                    active = true;
                else
                    active = false;
            }
            if (extflag == "FLOOR1")
                other.flooractive = 1;
            else
                other.flooractive = 2;
        }
    }
}
var doupdate = true;
with (obj_dw_church_remote_piano)
{
    if (engaged)
        doupdate = false;
}
if (doupdate)
{
    if (flooractive != wasactive)
    {
        for (var i = 0; i < array_length(layersprite); i++)
        {
            with (layersprite[i])
            {
                scr_depth_alt(undefined, -40);
                if (other.flooractive == 2)
                    depth += 10000;
                if (sprite_index == spr_church_ladder)
                    depth -= 4;
            }
        }
        with (obj_dw_church_remote_piano)
        {
            scr_depth();
            if (other.flooractive == 1)
                depth -= 1000;
        }
    }
}
with (obj_bookshelf_moveable2x2)
{
    depth = 100000 - ((y * 10) + 1600);
    if (doupdate)
    {
        if (other.flooractive == 2)
            depth += 10000;
    }
}
var visit = 0;
if (global.flag[886])
    visit = 1;
with (sunpc)
{
    if (myinteract == 3)
    {
        var sawralseiroom = 0;
        if (global.flag[710] >= 2)
            sawralseiroom = 1;
        if (sawralseiroom && !global.flag[866])
            myinteract = 10;
        else
            myinteract = 50;
        global.interact = 1;
        timer = 0;
    }
    if (myinteract == 10)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Take it", "obj_dw_church_pianopiece_right_slash_Step_0_gml_90_0");
        global.choicemsg[1] = stringsetloc("#Don't take it", "obj_dw_church_pianopiece_right_slash_Step_0_gml_91_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        if (!sitting)
        {
            var face = direction_to_object_bbox(undefined, 1049, 1);
            switch (face)
            {
                case 3:
                    marker.sprite_index = spr_susie_walk_left_dw;
                    break;
                case 1:
                    marker.sprite_index = spr_susie_walk_right_dw;
                    break;
                case 0:
                    marker.sprite_index = spr_susie_walk_down_dw;
                    break;
            }
        }
        scr_speaker("susie");
        msgsetloc(0, "\\E7* Hey^1, don't you think this would be sweet for Ralsei's room?/", "obj_dw_church_pianopiece_right_slash_Step_0_gml_109_0");
        msgnextloc("\\EN* He won't have to like..^1. Sleep on the floor./", "obj_dw_church_pianopiece_right_slash_Step_0_gml_110_0");
        msgnext("\\C2 ");
        if (!global.flag[865])
        {
            myinteract = 11;
            d_make();
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E3* Maybe we can just give him our pillows too./", "obj_dw_church_pianopiece_right_slash_Step_0_gml_121_0");
            msgnextloc("\\EL* Not like we really sleep there that much.../", "obj_dw_church_pianopiece_right_slash_Step_0_gml_122_0");
            msgnextloc("\\E7* Maybe he can have some of my bed spikes too?/%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_123_0");
            d_make();
            myinteract = 999;
        }
    }
    if (myinteract == 11)
    {
        if (global.choice != -1)
        {
            k_d(1);
            if (global.choice == 0)
                myinteract = 12;
            if (global.choice == 1)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EK* You want him to sleep on the floor?/", "obj_dw_church_pianopiece_right_slash_Step_0_gml_141_0");
                msgnextloc("\\E6* ..^1. actually^1, does he even sleep...?/%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_142_0");
                d_make();
                myinteract = 999;
            }
        }
    }
    if (myinteract == 12)
    {
        myinteract = 13;
        cutscene_master = scr_cutscene_make();
        actor_count = 0;
        kr = 0;
        kr_actor = instance_create(obj_mainchara.x, obj_mainchara.y, obj_actor);
        scr_actor_setup(kr, kr_actor, "kris");
        kr_actor.sprite_index = obj_mainchara.sprite_index;
        kr_actor.depth = obj_mainchara.depth;
        with (obj_mainchara)
            visible = 0;
        global.facing = 0;
        c_speaker("susie");
        c_msgsetloc(0, "\\E9* Hell yeah^1! Gimme a hand!/%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_164_0");
        c_talk_wait();
        c_sel(kr);
        var pos = scr_heromarker("kris", "krishelps");
        var dist = clamp(round(point_distance(obj_mainchara.x, obj_mainchara.y, pos[0], pos[1]) / 8), 1, 30);
        c_walkdirect(pos[0], pos[1], dist);
        c_wait(dist + 1);
        c_facing("u");
        c_var_instance(marker, "sprite_index", spr_susie_walk_up_dw);
        c_wait(30);
        c_var_instance(marker, "sprite_index", spr_susie_walk_right_dw);
        c_sel(kr);
        c_facing("l");
        c_wait(15);
        c_speaker("susie");
        c_msgsetloc(0, "\\EB* .../", "obj_dw_church_pianopiece_right_slash_Step_0_gml_179_0");
        c_msgnextloc("\\EK* Okay damn it's heavy. Let's just take like.../%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_180_0");
        c_talk_wait();
        c_var_instance(marker, "sprite_index", spr_susie_walk_up_dw);
        c_wait(5);
        c_var_instance(other.couchmarker, "image_index", 1);
        c_sndplay(snd_item);
        c_wait(5);
        c_var_instance(marker, "sprite_index", spr_susie_walk_right_dw);
        c_speaker("susie");
        c_msgsetloc(0, "\\E2* Yeah^1, that's good enough. He can make a pillow fort./", "obj_dw_church_pianopiece_right_slash_Step_0_gml_189_0");
        c_msgnextloc("\\EL* That's better than a bed anyway. More defense./%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_190_0");
        c_talk_wait();
        c_sel(kr);
        c_pannable(1);
        c_pan(120, 506, 4);
        c_walk("d", 4, 4);
        c_wait(5);
        c_facing("d");
        c_pannable(0);
        c_sel(kr);
        c_actortokris();
        c_terminatekillactors();
    }
    if (myinteract == 13 && !i_ex(obj_cutscene_master))
    {
        global.flag[865] = 1;
        myinteract = 0;
        global.interact = 0;
    }
    if (myinteract == 50)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E2* Yeah^1, you know I'm not messing with that puzzle./", "obj_dw_church_pianopiece_right_slash_Step_0_gml_224_0");
        msgnextloc("\\EN* ..^1. I..^1. probably wouldn't be able to help anyway./", "obj_dw_church_pianopiece_right_slash_Step_0_gml_225_0");
        msgnextloc("\\ED* Don't have a great track record with pianos./%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_226_0");
        if (global.flag[886])
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E2* What? Wanted the couch^1, shoulda called shotgun first./%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_231_0");
        }
        if (global.plot > 240)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E0* Kris^1, if there's another puzzle like this.../", "obj_dw_church_pianopiece_right_slash_Step_0_gml_238_0");
            msgnextloc("\\EL* We should^1, like..^1. do it halfsies next time./", "obj_dw_church_pianopiece_right_slash_Step_0_gml_239_0");
            msgnextloc("\\E2* OR I could crawl down and mess with the pedal./%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_240_0");
            if (talked)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* Wonder how Noelle's sofa is doing./", "obj_dw_church_pianopiece_right_slash_Step_0_gml_245_0");
                msgnextloc("\\EA* ..^1. and Noelle./%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_246_0");
            }
        }
        if (!sitting)
        {
            var face = direction_to_object_bbox(undefined, 1049, 1);
            switch (face)
            {
                case 3:
                    marker.sprite_index = spr_susie_walk_left_dw;
                    break;
                case 1:
                    marker.sprite_index = spr_susie_walk_right_dw;
                    break;
                case 0:
                    marker.sprite_index = spr_susie_walk_down_dw;
                    break;
            }
        }
        d_make();
        talked++;
        myinteract = 999;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (ranpc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        if (global.flag[866])
        {
            if (other.sunpc.sitting == false)
                other.sunpc.marker.sprite_index = spr_susie_walk_right_dw;
            scr_speaker("ralsei");
            msgsetloc(0, "\\EK* I..^1. I think I'm parked./", "obj_dw_church_pianopiece_right_slash_Step_0_gml_287_0");
            scr_anyface_next("susie", "2");
            msgnextloc("\\E2* Parallel parked?/", "obj_dw_church_pianopiece_right_slash_Step_0_gml_289_0");
            scr_anyface_next("ralsei", "X");
            msgnextloc("\\EX* As far as I know^1, I'm within the lines./%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_291_0");
            d_make();
            myinteract = 999;
        }
        else
        {
            switch (direction_to_object_bbox(undefined, 1049, 1))
            {
                case 2:
                    marker.sprite_index = spr_ralsei_walk_up;
                    break;
                case 3:
                    marker.sprite_index = spr_ralsei_walk_left;
                    break;
                case 1:
                    marker.sprite_index = spr_ralsei_walk_right;
                    break;
                case 0:
                    marker.sprite_index = spr_ralsei_walk_down;
                    break;
            }
            global.msc = -99;
            global.choice = -1;
            if (global.plot < 242)
            {
                global.choicemsg[0] = stringsetloc("#Yes Please", "obj_dw_church_pianopiece_right_slash_Step_0_gml_313_0");
                global.choicemsg[1] = stringsetloc("#No Please", "obj_dw_church_pianopiece_right_slash_Step_0_gml_314_0");
                global.choicemsg[2] = stringsetloc("Park your butt, mister", "obj_dw_church_pianopiece_right_slash_Step_0_gml_315_0");
                global.choicemsg[3] = stringset("");
                scr_speaker("ralsei");
                msgsetloc(0, "\\E0* Oh^1, Kris^1! This seems like a complicated puzzle.../", "obj_dw_church_pianopiece_right_slash_Step_0_gml_319_0");
                msgnextloc("\\EQ* Would you like any advice to^1, um^1, speed up solving it?/", "obj_dw_church_pianopiece_right_slash_Step_0_gml_320_0");
                msgnext("\\C3 ");
                d_make();
                myinteract = 10;
            }
            else if (!talked)
            {
                global.choicemsg[0] = stringsetloc("#Hear it", "obj_dw_church_pianopiece_right_slash_Step_0_gml_330_0");
                global.choicemsg[1] = stringsetloc("#Not now", "obj_dw_church_pianopiece_right_slash_Step_0_gml_331_0");
                global.choicemsg[2] = "";
                global.choicemsg[3] = "";
                scr_speaker("ralsei");
                msgsetloc(0, "\\E2* Haha^1, Kris^1, Susie taught me something nice!/", "obj_dw_church_pianopiece_right_slash_Step_0_gml_335_0");
                msgnext("\\C2 ");
                d_make();
                myinteract = 74;
            }
            else
            {
                var sutext = stringsetloc("AND ME???", "obj_dw_church_pianopiece_right_slash_Step_0_gml_343_0");
                scr_smallface(1, "susie", 17, "right", "bottom", sutext);
                scr_speaker("ralsei");
                msgsetloc(0, "\\EK* Sorry for calling you a noob^1, Kris!\\f1/%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_347_0");
                d_make();
                myinteract = 999;
            }
        }
    }
    if (myinteract == 74 && global.choice != -1)
    {
        if (global.choice == 0)
        {
            k_d(1);
            var sutext = stringsetloc("HEY!!!", "obj_dw_church_pianopiece_right_slash_Step_0_gml_361_0");
            scr_smallface(1, "susie", 17, "right", "bottom", sutext);
            scr_speaker("ralsei");
            msgsetloc(0, "\\E1* She said I should call you^1, um..^1. a \"noob.\"/", "obj_dw_church_pianopiece_right_slash_Step_0_gml_365_0");
            msgnextloc("\\E2* Apparently^1, it means..^1. your favorite person!/", "obj_dw_church_pianopiece_right_slash_Step_0_gml_366_0");
            msgnextloc("\\EJ* That means both you and Susie are noobs!/", "obj_dw_church_pianopiece_right_slash_Step_0_gml_367_0");
            scr_anyface_next("susie", "5");
            msgnextloc("\\E5* Hey^1, NO^1, only you and Kris are noobs./", "obj_dw_church_pianopiece_right_slash_Step_0_gml_369_0");
            scr_anyface_next("ralsei", "D");
            msgnextloc("\\ED* S-Susie...? You mean we're your.../", "obj_dw_church_pianopiece_right_slash_Step_0_gml_371_0");
            scr_anyface_next("susie", "M");
            msgnextloc("\\EM* Huh!? No^1, I mean^1, uh.../", "obj_dw_church_pianopiece_right_slash_Step_0_gml_373_0");
            msgnextloc("\\E5* Look^1, it actually means you're bad at games!/", "obj_dw_church_pianopiece_right_slash_Step_0_gml_374_0");
            scr_anyface_next("ralsei", "d");
            msgnextloc("\\Ed* Oh./", "obj_dw_church_pianopiece_right_slash_Step_0_gml_376_0");
            msgnextloc("\\EH* ..^1. So^1, only Susie is a noob?\\f1/%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_377_0");
            talked = 1;
            d_make(1);
            myinteract = 999;
        }
        if (global.choice == 1)
        {
            k_d();
            myinteract = 999;
        }
    }
    if (myinteract == 10 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\E2* As you know^1, you can play the piano.../", "obj_dw_church_pianopiece_right_slash_Step_0_gml_395_0");
            var linever = 0;
            if (global.lang == "ja")
            {
                if (global.is_console && (os_type == os_ps4 || os_type == os_ps5))
                    linever = 1;
            }
            if (linever == 0)
                msgnextsubloc("\\EJ* By holding directions and pressing ~1!/", scr_get_input_name(4), "obj_dw_church_pianopiece_right_slash_Step_0_gml_396_0");
            if (linever == 1)
                msgnextsub("\\EJ＊ 方向キーと~1で\n　 ピアノを弾けるよ！/", scr_get_input_name(4));
            msgnextloc("\\E2* However^1, on this piano^1, you also can swap colors.../", "obj_dw_church_pianopiece_right_slash_Step_0_gml_397_0");
            msgnextsubloc("\\EJ* By pressing ~1^1! I hope this helps you!/", scr_get_input_name(6), "obj_dw_church_pianopiece_right_slash_Step_0_gml_398_0");
            msgnextloc("\\EQ* It would be..^1. Great if we could hurry^1, to the fountain./%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_399_0");
            d_make();
            myinteract = 999;
        }
        if (global.choice == 1)
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\E2* Haha^1, no thank you^1! I mean^1, um^1, you're welcome?/", "obj_dw_church_pianopiece_right_slash_Step_0_gml_406_0");
            msgnextloc("\\ED* I mean^1, no welcome? ..^1. um? Anyway^1, good luck!/%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_407_0");
            d_make();
            myinteract = 999;
        }
        if (global.choice == 2)
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\EK* Umm..^1. okay!/%", "obj_dw_church_pianopiece_right_slash_Step_0_gml_414_0");
            d_make();
            myinteract = 15;
        }
    }
    if (myinteract == 15 && !d_ex())
    {
        var pos = scr_heromarker("ralsei", "hoptocouch");
        var dist = round(point_distance(marker.x, marker.y, pos[0], pos[1]) / 6);
        with (marker)
        {
            scr_lerpvar("x", x, pos[0], dist);
            scr_lerpvar("y", y, pos[1], dist);
            sprite_index = spr_ralsei_walk_left;
            image_speed = 0.25;
        }
        myinteract = 16;
        scr_delay_var("myinteract", 17, dist);
        timer = 0;
    }
    if (myinteract == 16)
    {
        scr_depth(marker);
        if (marker.x < obj_mainchara.x)
            global.facing = 3;
    }
    if (myinteract == 17)
    {
        var happyval = 658;
        var sadval = 666;
        var targval = happyval;
        var happy = true;
        if (global.flag[865])
        {
            happy = false;
            targval = sadval;
        }
        timer++;
        if (timer == 1)
        {
            if (other.sunpc.sitting == false)
                other.sunpc.marker.sprite_index = spr_susie_walk_right_dw;
            marker.sprite_index = spr_ralsei_walk_down;
            marker.image_index = 0;
            marker.image_speed = 0;
        }
        if (timer == 15)
        {
            marker.vspeed = -10;
            marker.gravity = 1.25;
        }
        if (timer > 24 && marker.y >= targval)
        {
            marker.vspeed = 0;
            marker.gravity = 0;
            if (happy)
            {
                marker.sprite_index = spr_ralsei_darkchurch_sit_happy;
                marker.y = happyval;
                snd_play(snd_wing);
            }
            else
            {
                snd_play(snd_noise);
                marker.sprite_index = spr_ralsei_darkchurch_sit_sad;
                marker.y = sadval;
            }
            timer = 0;
            setxy(368, 738);
            myinteract = 999;
            global.facing = 0;
            global.flag[866] = 1;
        }
    }
    if (myinteract == 999 && !d_ex())
    {
        global.interact = 0;
        myinteract = 0;
    }
}
