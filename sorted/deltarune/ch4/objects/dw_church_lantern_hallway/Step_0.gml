if (scr_debug())
{
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("V")))
    {
        safe_delete(walkgerson);
        con = 5.1;
        roomloop = 1;
        roomglowactive = true;
        var spot = scr_heromarker("kris", "loopleft");
        setxy(spot[0], spot[1], kris);
        setxy(spot[0], spot[1], ralsei);
        setxy(spot[0], spot[1], susie);
        scr_caterinterp("all");
    }
}
if (!init)
{
    with (obj_genmarker)
    {
        if (extflag == "prop1" || extflag == "prop2")
        {
            with (instance_create(x, y, obj_dw_church_prophecy))
            {
                extflag = "heroes1";
                bonus = 0;
                if (other.extflag == "prop1")
                    bonus = 1;
            }
        }
    }
    var startmark = scr_heromarker("kris", "loopleft");
    var endmark = scr_heromarker("kris", "loopright");
    leftx = startmark[0];
    rightx = endmark[0];
    heightdiffer = startmark[1] - endmark[1];
    scr_populatechars();
    init = 1;
}
if (con == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "proptrig1")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
    {
        loopwatch = 1;
        scr_lerpvar("roomglowactive", 0, 1, 30, 2, "out");
        con = 1;
        nogobackplz = instance_create(2320, 1460, obj_solidblock);
        with (nogobackplz)
        {
            image_blend = c_black;
            sprite_index = spr_pxwhite;
            scr_size(80, 400);
            visible = true;
            depth = 900000;
        }
    }
}
if (con == 1)
{
    global.flag[7] = 1;
    scr_speaker("susie");
    msgsetloc(0, "\\E7* Hey^1! It's us again!/", "obj_dw_church_lantern_hallway_slash_Step_0_gml_74_0");
    msgnextloc("\\EL* Guess there was a backup./", "obj_dw_church_lantern_hallway_slash_Step_0_gml_75_0");
    scr_anyface_next("ralsei", "A");
    msgnextloc("\\EA* ..^1. Even if it's broken^1, it always appears somewhere else./", "obj_dw_church_lantern_hallway_slash_Step_0_gml_77_0");
    msgnextloc("\\E4* The prophecy can't be changed^1, after all./%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_78_0");
    scr_walkntalk_start();
    con = 2;
}
if (con == 2 && !d_ex())
{
    scr_walkntalk_stop();
    con = 3;
    curcount = loopcount;
}
if (con == 3)
{
    if (abs(loopcount - curcount) >= 1)
        con = 5.1;
}
if (con == 5.1)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "destroyprop")
        {
            if (place_meeting(x, y, obj_mainchara))
            {
                trig = 1;
                k_d();
                auto_talk = 0;
                global.flag[7] = 0;
            }
        }
    }
    if (trig)
    {
        global.interact = 1;
        with (obj_dw_church_prophecy)
        {
            if (bonus)
                destroy = 1;
            else
                instance_destroy();
        }
        con = -1;
        var susiedelay = 25;
        scr_delay_var("con", 5.8, susiedelay + 5);
        with (susie)
        {
            fun = 1;
            var newsprite = 717;
            if (x < 1350)
                newsprite = 719;
            scr_delay_var("sprite_index", newsprite, susiedelay);
            scr_script_delayed(scr_shakeobj, susiedelay);
            snd_play_delay(snd_wing, susiedelay);
        }
        with (ralsei)
        {
            fun = 1;
            var newsprite = 4939;
            if (x < 1350)
                newsprite = 2674;
            scr_delay_var("sprite_index", newsprite, susiedelay);
            scr_script_delayed(scr_shakeobj, susiedelay);
        }
    }
}
if (con == 5.8)
{
    safe_delete(nogobackplz);
    scr_lerpvar("roomglowactive", 1, 0, 30, -1, "out");
    layer_set_visible("TILES_2", 1);
    layer_set_visible("HIDDEN_DOOR", 1);
    gerson = scr_makenpc("GERSON_LOCS", "dspr_gersonrascal", 0);
    scr_speaker("susie");
    msgsetloc(0, "\\E5* H..^1. hey^1! What gives!?/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_213_0");
    d_make(undefined, undefined, undefined, 1);
    global.plot++;
    layer_set_visible("TILES_2", 1);
    layer_set_visible("HIDDEN_DOOR", 1);
    safe_delete(fakeblock);
    con = 6;
}
if (con == 6 && !d_ex())
{
    with (obj_caterpillarchara)
        fun = 0;
    global.interact = 0;
    con = 7;
}
if (con == 7)
{
    var trig = 0;
    with (gerson)
    {
        if (myinteract == 3)
            trig = 1;
    }
    with (obj_trigger)
    {
        if (extflag == "proptrig2")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
    {
        roomloop = false;
        con = 8;
        global.interact = 1;
        gerson.myinteract = 0;
    }
}
if (con == 8)
{
    con = 9;
    cutscene_master = scr_cutscene_make();
    global.facing = 0;
    scr_maincharacters_actors();
    var walkspeed = 6;
    c_sel(su);
    var supos = scr_heromarker("su", "cut1");
    var suwalktime = round(point_distance(susie.x, susie.y, supos[0], supos[1]) / walkspeed);
    c_walkdirect(supos[0], supos[1], suwalktime);
    c_sel(kr);
    var krpos = scr_heromarker("kr", "cut1");
    var krwalktime = round(point_distance(kris.x, kris.y, krpos[0], krpos[1]) / walkspeed);
    c_walkdirect(krpos[0], krpos[1], krwalktime);
    c_sel(ra);
    var rapos = scr_heromarker("ra", "cut1");
    var rawalktime = round(point_distance(ralsei.x, ralsei.y, rapos[0], rapos[1]) / walkspeed);
    c_walkdirect(rapos[0], rapos[1], rawalktime);
    var wait = max(suwalktime, rawalktime, krwalktime);
    c_pannable(1);
    var camfind = scr_heromarker("gen", "cut1");
    c_pan(camfind[0], camfind[1], round(wait / 2));
    c_wait(wait);
    c_sel(kr);
    c_facing("u");
    c_sel(ra);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_wait(15);
    c_msgstay(10);
    c_speaker("gerson");
    c_msgsetloc(0, "* Oopsy daisy^1! Darn my clumsiness^1, geheh.../", "obj_dw_church_lantern_hallway_slash_Step_0_gml_312_0");
    c_facenext("susie", "5");
    c_msgnextloc("\\E5* Damn it^1! You broke it again^1, didn't you...?/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_314_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(gerson.marker, "sprite_index", spr_gerson_outfit_walk_up);
    c_wait_box(1);
    c_var_instance(gerson.marker, "sprite_index", spr_gerson_outfit_walk_cane_right);
    c_wait_talk();
    c_msgstay(0);
    c_speaker("gerson");
    c_msgsetloc(0, "* Well^1, we were following that Prophecy so closely.../", "obj_dw_church_lantern_hallway_slash_Step_0_gml_325_0");
    c_msgnextloc("* I couldn't see quite where I was going^1, geh-heh!!/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_326_0");
    c_talk();
    c_wait_box(0);
    c_var_instance(gerson.marker, "sprite_index", spr_gerson_look_diagonal);
    c_wait_box(1);
    c_var_instance(gerson.marker, "sprite_index", spr_gerson_outfit_laugh_right);
    c_var_instance(gerson.marker, "image_speed", 0.2);
    c_snd_play(snd_gerlaugh);
    c_wait(54);
    c_var_instance(gerson.marker, "image_speed", 0);
    c_wait_talk();
    c_var_instance(gerson.marker, "image_index", 0);
    c_var_instance(gerson.marker, "sprite_index", spr_gerson_outfit_walk_cane_right);
    c_sel(su);
    c_sprite(spr_susie_point);
    c_shakeobj();
    c_snd_play(snd_wing);
    c_wait(8);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* ..^1. hey^1, guys^1! There's another way here!!!/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_346_0");
    c_talk_wait();
    c_speaker("susie");
    c_msgsetloc(0, "\\EH* Out of the way^1, old man!/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_350_0");
    c_talk();
    c_wait_box_end(0);
    supos = scr_heromarker("su", "suexit");
    suwalktime = round(point_distance(susie.x, susie.y, supos[0], supos[1]) / 12);
    c_walkdirect(supos[0], supos[1], suwalktime);
    c_wait(6);
    var ger1 = scr_assetloc("GERSON_LOCS", "dspr_gersonrascal");
    var ger2 = scr_assetloc("GERSON_LOCS", "dspr_gerson_outoftheway");
    c_var_lerp_instance(gerson, "x", gerson.x, gerson.x - 24, 12, -1, "out");
    c_sound_play(snd_wing);
    c_wait(12);
    c_wait_talk();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EC* S-Susie^1! Don't run ahead so fast!/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_368_0");
    c_talk();
    rapos = scr_heromarker("ra", "raexit1");
    c_sel(ra);
    c_walkdirect(rapos[0], rapos[1], 6);
    c_wait(6);
    rapos = scr_heromarker("ra", "raexit2");
    c_walkdirect(rapos[0], rapos[1], 32);
    c_wait(32);
    c_wait_talk();
    c_sel(su);
    c_setxy(room_width, room_height);
    c_sel(ra);
    c_setxy(room_width, room_height);
    c_panobj(kr_actor, 15);
    c_wait(15);
    c_pannable(0);
    hidecater = true;
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 9 && !i_ex(cutscene_master))
{
    con = 10;
    global.facing = 0;
    global.interact = 0;
    gerson.myinteract = 0;
}
if (con == 10)
{
    with (gerson)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            global.msc = -99;
            global.choice = -1;
            global.choicemsg[0] = stringsetloc("#You broke it#on purpose", "obj_dw_church_lantern_hallway_slash_Step_0_gml_421_0");
            global.choicemsg[1] = stringsetloc("#You broke it#on accident", "obj_dw_church_lantern_hallway_slash_Step_0_gml_422_0");
            global.choicemsg[2] = stringset("");
            global.choicemsg[3] = stringset("");
            scr_speaker("gerson");
            msgsetloc(0, "* ..^1. hmm? Got somethin' to say to me?/", "obj_dw_church_lantern_hallway_slash_Step_0_gml_428_0");
            msgnext("\\C2 ");
            d_make();
            myinteract = 4;
            marker.sprite_index = spr_gerson_beard_thinking;
        }
        if (myinteract == 4 && global.choice != -1)
        {
            k_d(1);
            if (global.choice == 0)
            {
                global.choice = -1;
                global.choicemsg[0] = stringsetloc("#Don't like#prophecies", "obj_dw_church_lantern_hallway_slash_Step_0_gml_448_0");
                global.choicemsg[1] = stringsetloc("#Annoy Susie", "obj_dw_church_lantern_hallway_slash_Step_0_gml_449_0");
                scr_speaker("gerson");
                msgsetloc(0, "* Ah..^1. me? Why do you suppose I would do that?/", "obj_dw_church_lantern_hallway_slash_Step_0_gml_451_0");
                msgnext("\\C2 ");
                myinteract = 5;
            }
            if (global.choice == 1)
            {
                global.choice = 3;
                scr_speaker("gerson");
                msgsetloc(0, "* ..^1. ah^1, I'm flattered^1! Yes siree^1, I'm flattered./%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_459_0");
                myinteract = 99;
            }
            d_make();
        }
        if (myinteract == 5 && d_ex())
        {
            if (scr_getmsgno() == 0)
                marker.sprite_index = spr_gerson_look_diagonal;
        }
        if (myinteract == 5 && global.choice != -1)
        {
            k_d(1);
            if (global.choice == 0)
            {
                scr_speaker("gerson");
                msgsetloc(0, "* Well now^1, a fairytale is a pretty little thing./", "obj_dw_church_lantern_hallway_slash_Step_0_gml_480_0");
                msgnextloc("* Ain't it nice to believe a glimmer here and there...?/", "obj_dw_church_lantern_hallway_slash_Step_0_gml_481_0");
                msgnextloc("* I jus' think^1, those words shine a bit too bright./", "obj_dw_church_lantern_hallway_slash_Step_0_gml_482_0");
                msgnextloc("* A path so blue^1, it's all you can see./", "obj_dw_church_lantern_hallway_slash_Step_0_gml_483_0");
                msgnextloc("* So I say..^1. why don't we go between the lines?/", "obj_dw_church_lantern_hallway_slash_Step_0_gml_484_0");
                msgnextloc("* It's darker there..^1. Geheh..^1. geheheh!/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_485_0");
            }
            if (global.choice == 1)
            {
                scr_speaker("gerson");
                msgsetloc(0, "* Susie^1, eh? ..^1. is that what she thinks?/", "obj_dw_church_lantern_hallway_slash_Step_0_gml_490_0");
                msgnextloc("* Oh^1, I'm flattered^1! Yes siree^1, I'm flattered..^1. geh heh!/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_491_0");
            }
            d_make();
            myinteract = 99;
        }
        if (myinteract == 99 && d_ex())
        {
            if (global.choice == 0)
            {
                if (scr_getmsgno() == 0)
                    marker.sprite_index = spr_gerson_head_tilt_back;
                if (scr_getmsgno() == 1)
                    marker.sprite_index = spr_gerson_outfit_walk_cane;
                if (scr_getmsgno() == 2)
                {
                    marker.sprite_index = spr_gerson_beard_thinking_neutral;
                    marker.image_index += 0.125;
                }
                if (scr_getmsgno() == 3)
                {
                    marker.sprite_index = spr_gerson_head_tilt_back;
                    marker.image_index = 0;
                }
                if (scr_getmsgno() == 4)
                    marker.sprite_index = spr_gerson_outfit_walk_cane;
                if (scr_getmsgno() == 5)
                    marker.sprite_index = spr_gerson_head_tilt_forward;
            }
            if (global.choice == 1)
            {
                if (scr_getmsgno() == 0)
                    marker.sprite_index = spr_gerson_outfit_walk_cane;
                if (scr_getmsgno() == 1)
                {
                    snd_play(snd_gerlaugh);
                    marker.sprite_index = spr_gerson_outfit_laugh_left;
                    marker.image_speed = 0.2;
                    myinteract = -1;
                    with (marker)
                        scr_delay_var("image_speed", 0, 53);
                    scr_delay_var("myinteract", 100, 54);
                }
            }
            if (global.choice == 3)
            {
                if (scr_getmsgno() == 0)
                    marker.sprite_index = spr_gerson_look_diagonal;
            }
        }
        if (!d_ex() && (myinteract == 99 || myinteract == 100))
        {
            other.con = 20;
            myinteract = 999;
        }
    }
}
if (con == 20)
{
    con = 21;
    var xoff = gerson.x - gerson.marker.x;
    var yoff = gerson.y - gerson.marker.y;
    var gerxpos = gerson.x;
    var gerypos = gerson.y;
    var leavepos = scr_assetloc("GERSON_LOCS", "dspr_gleave2");
    cutscene_master = scr_cutscene_make();
    gerson.marker.sprite_index = spr_gerson_outfit_walk_cane_right;
    c_wait(15);
    c_var_instance(gerson.marker, "image_speed", 0.25);
    var horizontaltime = round(abs(gerxpos - (leavepos[0] + xoff)) / 4);
    c_lerp_var_instance(gerson, "x", gerxpos, leavepos[0] + xoff, horizontaltime);
    c_wait(horizontaltime);
    c_var_instance(gerson.marker, "sprite_index", spr_gerson_outfit_walk_up);
    var verttime = round(abs(gerypos - (leavepos[1] + yoff)) / 6);
    c_lerp_var_instance(gerson, "y", gerypos, leavepos[1] + yoff, verttime);
    c_wait(verttime);
    c_terminatekillactors();
}
if (con == 21 && !i_ex(cutscene_master))
{
    gerson.x = room_width * 4;
    global.facing = 0;
    global.interact = 0;
    con = 22;
}
if (hidecater == true)
{
    with (obj_caterpillarchara)
        visible = false;
}
scr_walkntalk_action();
if (loopwatch == 1)
{
    if (kris.x <= leftx)
    {
        showloopprophecies = true;
        safe_delete(walkgerson);
        roomloop = true;
        loopwatch = 0;
    }
}
if (i_ex(roomglow))
    roomglow.active = roomglowactive;
if (i_ex(obj_dw_church_prophecy))
{
    with (obj_dw_church_prophecy)
    {
        active = other.roomglowactive;
        if (!bonus)
        {
            if (other.showloopprophecies == 0)
                visible = false;
            else
                visible = true;
        }
    }
}
if (noleave == 1)
{
    with (obj_doorAny)
    {
        if (x >= 2240)
            instance_destroy();
    }
    if (obj_mainchara.y > 1674)
    {
        global.interact = 1;
        obj_mainchara.y = 1674;
        noleave = 2;
        if (global.plot == 145)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EH* Kris^1, don't make me babysit this guy by myself./%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_666_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Some red cups are blocking the path.)/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_671_0");
        }
        d_make(undefined, undefined, undefined, 1);
    }
}
if (noleave == 2 && !d_ex())
{
    global.interact = 0;
    global.facing = 2;
    noleave = 1;
}
with (wafernpc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Ah^1, the terrible witches. They rang curses with bladed familiars.../", "obj_dw_church_lantern_hallway_slash_Step_0_gml_694_0");
        msgnextloc("* They were sealed away^1, for being too fun. I mean^1, evil./%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_695_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Good thing they are statues for all eternity./%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_700_0");
        }
        if (global.plot >= 242)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Oh^1, she awakened..^1. how unfortunate./", "obj_dw_church_lantern_hallway_slash_Step_0_gml_706_0");
            msgnextloc("* Seems fun..^1. I mean^1, unfortunate./%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_707_0");
            if (talked)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I don't really mind her song./", "obj_dw_church_lantern_hallway_slash_Step_0_gml_712_0");
                msgnextloc("* It's a bit pleasant^1, actually./%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_713_0");
            }
        }
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract > 3 && d_ex())
    {
        var trig = 0;
        if (!i_ex(obj_writer))
            trig = 1;
        with (obj_writer)
        {
            if (halt)
                trig = 1;
        }
        if (!trig)
            marker.image_index += 0.25;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
with (bellstatue)
{
    var bellvol = 0.7;
    if (myinteract == 3)
    {
        timer = 0;
        global.interact = 1;
        if (global.plot <= 242)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's some sort of statue.)/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_751_0");
            d_make();
            myinteract = 999;
            talked++;
        }
        else if (!talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Trembell^1, crumbell^1! I have awakened!/", "obj_dw_church_lantern_hallway_slash_Step_0_gml_761_0");
            msgnextloc("* Nobellperson^1! You shall be the first victim of my song!/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_762_0");
            d_make();
            myinteract = 40;
            talked = 1;
        }
        else
        {
            myinteract = 43;
            global.interact = 0;
            talked = 2;
        }
    }
    if (myinteract == 40 && !d_ex())
    {
        timer++;
        if (timer == 1)
        {
            snd_stop(snd_musicbox);
            snd_play(snd_musicbox, bellvol, 0.7 + random(0.6));
        }
        if (timer == 9)
        {
            snd_stop(snd_musicbox);
            snd_play(snd_musicbox, bellvol, 0.7 + random(0.6));
        }
        if (timer == 17)
        {
            snd_stop(snd_musicbox);
            snd_play(snd_musicbox, bellvol, 0.7 + random(0.6));
        }
        if (timer == 25)
        {
            timer = 0;
            myinteract = 42;
        }
    }
    if (myinteract == 42)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Ring^1, bell of disaster^1! Ring^1! Ha ha^1, any moment now you shall crumbell!/%", "obj_dw_church_lantern_hallway_slash_Step_0_gml_806_0");
        d_make();
        myinteract = 43;
    }
    if (myinteract == 43 && !d_ex())
    {
        timer++;
        if (timer == 1)
        {
            snd_stop(snd_musicbox);
            snd_play(snd_musicbox, bellvol, 0.7 + random(0.6));
        }
        if (timer == 9)
        {
            snd_stop(snd_musicbox);
            snd_play(snd_musicbox, bellvol, 0.7 + random(0.6));
        }
        if (timer == 17)
        {
            snd_stop(snd_musicbox);
            snd_play(snd_musicbox, bellvol, 0.7 + random(0.6));
        }
        if (timer == 25)
        {
            timer = 0;
            myinteract = 999;
        }
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
if (global.plot >= 242)
{
    with (bellmarker)
    {
        siner++;
        y = (ystart + (cos(siner / 12) * 8)) - 8;
        x = xstart + (sin(siner / 24) * 4);
    }
}
