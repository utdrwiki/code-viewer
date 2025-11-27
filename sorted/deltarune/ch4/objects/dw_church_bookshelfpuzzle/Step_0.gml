if (!init)
{
    init = 1;
    var ramark = scr_heromarker("ralsei", "ladder");
    ranpc = instance_create(ramark[0], ramark[1], obj_trigger_interact);
    ranpc.talked = 0;
    ranpc.strict = true;
    ranpc.marker = scr_marker_ext(ramark[0], ramark[1], spr_ralsei_walk_up, 2, 2, 0, undefined, undefined, undefined, 1);
    scr_depth(ranpc.marker, -10);
    scr_sizeexact(ramark[2].bbox_right - ramark[2].bbox_left, ramark[2].bbox_bottom - ramark[2].bbox_top, ranpc);
    setxy(ramark[2].bbox_left, ramark[2].bbox_top, ranpc);
    var sumark = scr_heromarker("susie", "ladder");
    sunpc = instance_create(sumark[0], sumark[1], obj_trigger_interact);
    sunpc.talked = 0;
    sunpc.strict = true;
    sunpc.susprite = 436;
    if (global.flag[710] >= 2)
        sunpc.susprite = 433;
    sunpc.marker = scr_marker_ext(sumark[0], sumark[1], sunpc.susprite, 2, 2, 0, undefined, undefined, undefined, 1);
    scr_sizeexact(sumark[2].bbox_right - sumark[2].bbox_left, sumark[2].bbox_bottom - sumark[2].bbox_top, sunpc);
    setxy(sumark[2].bbox_left, sumark[2].bbox_top, sunpc);
}
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
        with (ranpc.marker)
        {
            scr_depth(undefined, -10);
            if (other.flooractive == 2)
                depth += 10000;
        }
        with (obj_dw_church_remote_piano)
        {
            scr_depth();
            if (other.flooractive == 1)
                depth -= 2000;
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
if (treasuremarker.myinteract == 3)
{
    if (flooractive == 2)
        treasuremarker.myinteract = 4;
    else
        treasuremarker.myinteract = 0;
}
if (treasuremarker.myinteract == 4)
{
    with (obj_treasure_room)
    {
        event_user(0);
        with (other.treasuremarker)
        {
            myinteract = 5;
            scr_delay_var("myinteract", 6, 1);
        }
    }
}
if (treasuremarker.myinteract == 6 && !d_ex())
    treasuremarker.myinteract = 0;
with (treasuremarker)
{
    visible = true;
    sprite_index = obj_treasure_room.sprite_index;
    image_index = obj_treasure_room.image_index;
    scr_darksize();
    depth = 100000 - ((y * 10) + 1600);
    if (doupdate)
    {
        if (other.flooractive == 2)
            depth += 10000;
    }
}
with (ranpc)
{
    if (other.flooractive == 2)
        myinteract = 0;
    if (myinteract == 3)
    {
        if (global.plot < 242)
        {
            global.interact = 1;
            if (talked == 0)
            {
                scr_speaker("ralsei");
                msgsetloc(0, "\\E8* ..^1. I wonder..^1. if it's in here^1, too...?/", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_140_0");
                msgnextloc("\\EQ* Huh? Sorry^1, Kris. Just^1, um.../", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_141_0");
                msgnextloc("\\EK* Looking for something we could use as a scrapbook!/%", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_142_0");
                d_make();
                myinteract = 5;
                talked = 1;
            }
            else
            {
                scr_speaker("ralsei");
                msgsetloc(0, "\\E8* .../%", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_150_0");
                d_make();
                myinteract = 99;
            }
        }
        else
        {
            global.interact = 1;
            global.msc = -99;
            global.choice = -1;
            global.choicemsg[0] = stringsetloc("#Read to#Ralsei", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_161_0");
            global.choicemsg[1] = stringsetloc("#Ralsei reads#to you", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_162_0");
            global.choicemsg[2] = stringset("");
            global.choicemsg[3] = stringset("");
            scr_speaker("ralsei");
            msgsetloc(0, "\\E1* (Umm..^1. I wonder which book Kris would like...?)/", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_166_0");
            msgnext("\\C2 ");
            myinteract = 10;
            if (talked)
            {
                scr_speaker("ralsei");
                msgsetloc(0, "\\EK* There sure are^1, books here!/%", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_173_0");
                myinteract = 99;
            }
            d_make();
            talked = 1;
        }
    }
    if (myinteract == 5)
    {
        if (d_ex())
        {
            if (scr_getmsgno() == 1)
            {
                var raface = direction_to_object_bbox(undefined, 1049, 1);
                switch (raface)
                {
                    case 3:
                        marker.sprite_index = spr_ralsei_walk_left_unhappy;
                        break;
                    case 1:
                        marker.sprite_index = spr_ralsei_walk_right_unhappy;
                        break;
                    case 0:
                        marker.sprite_index = spr_ralsei_walk_down_unhappy;
                        break;
                }
                myinteract = 99;
            }
        }
        if (!d_ex())
            myinteract = 99;
    }
    if (myinteract == 10 && global.choice != -1)
    {
        var raface = direction_to_object_bbox(undefined, 1049, 1);
        switch (raface)
        {
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
        k_d(1);
        if (global.choice == 0)
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\E1* Oh^1, Kris^1! You want to..^1. read to me...?/", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_219_0");
            msgnextloc("\\E2* Why^1, of course^1! I'll give you my rapt attention!/", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_220_0");
            msgnextloc("\\EJ* Just^1, um^1, let me know when I should applaud.../", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_221_0");
            msgnextloc("\\EL* .../", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_222_0");
            msgnextloc("\\EK* Um^1, Kris? Doesn't that book only have pictures...?/%", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_223_0");
        }
        if (global.choice == 1)
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\ED* Kris...? You want me to read this book to you?/", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_228_0");
            msgnextloc("\\E2* Umm^1, gladly^1! Just give me a second.../", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_229_0");
            msgnextloc("\\E1* Ahem!/", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_230_0");
            msgnextloc("\\E1* .../", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_231_0");
            msgnextloc("\\E2* This book^1, seems to^1, haha^1, only have pictures./", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_232_0");
            msgnextloc("\\EL* .../", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_233_0");
            msgnextloc("\\EK* ..^1. and^1, um..^1. swears./", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_234_0");
            scr_anyface_next("susie", "H");
            msgnextloc("\\EH* The hell are you guys doing with my book?/%", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_236_0");
        }
        d_make();
        myinteract = 99;
    }
    if (myinteract == 99 && !d_ex())
    {
        marker.sprite_index = spr_ralsei_walk_up;
        global.interact = 0;
        myinteract = 0;
    }
}
with (sunpc)
{
    if (other.flooractive == 2)
        myinteract = 0;
    if (myinteract == 3)
    {
        playsound = false;
        var sawralseiroom = 0;
        if (global.flag[710] >= 2)
            sawralseiroom = 1;
        if (sawralseiroom)
            myinteract = 10;
        else
            myinteract = 40;
    }
    if (myinteract == 40)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\EC* Dude..^1. these books are really weird./", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_271_0");
        msgnextloc("\\E1* All the pages are just eyes.../", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_272_0");
        msgnextloc("\\E0* ..^1. and I think one of them just talked to me./", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_273_0");
        var endstring = stringsetloc("\\E7* Damn^1, I'd read at school if it was like this./%", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_274_0");
        msgnext(endstring);
        myinteract = 45;
        if (talked)
        {
            msgset(0, endstring);
            myinteract = 999;
        }
        talked++;
        global.interact = 1;
        d_make();
    }
    if (myinteract == 45)
    {
        if (d_ex())
        {
            if (scr_getmsgno() == 0)
            {
                var suface = direction_to_object_bbox(undefined, 1049, 1);
                switch (suface)
                {
                    case 3:
                        marker.sprite_index = spr_susie_left_dw;
                        break;
                    case 1:
                        marker.sprite_index = spr_susie_right_dw;
                        break;
                    case 0:
                        marker.sprite_index = spr_susie_down_dw;
                        break;
                }
                myinteract = 999;
            }
        }
        if (!d_ex())
            myinteract = 999;
    }
    if (myinteract == 10)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_319_0");
        global.choicemsg[1] = stringsetloc("#No", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_320_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("susie");
        msgsetloc(0, "\\E7* ..^1. Dude^1, this ladder could be cool for Ralsei's room./", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_326_0");
        msgnextloc("\\E2* Then we can put furniture on his ceiling. Climb to it./", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_327_0");
        msgnextloc("\\EA* More room for partying on the floor./", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_328_0");
        msgnext("\\C2 ");
        if (!global.flag[864])
        {
            myinteract = 11;
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E2* Now THIS is gonna tie the goddamn room together./%", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_339_0");
            myinteract = 999;
        }
        d_make();
    }
    if (myinteract == 11 && global.choice == -1)
    {
        if (d_ex())
        {
            if (scr_getmsgno() == 0)
            {
                var suface = direction_to_object_bbox(undefined, 1049, 1);
                switch (suface)
                {
                    case 3:
                        marker.sprite_index = spr_susie_left_dw;
                        break;
                    case 1:
                        marker.sprite_index = spr_susie_right_dw;
                        break;
                    case 0:
                        marker.sprite_index = spr_susie_down_dw;
                        break;
                }
            }
        }
    }
    if (myinteract == 11 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EL* Sweet^1, marked. I'll swipe it when he isn't looking./%", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_369_0");
            global.flag[864] = 1;
            playsound = true;
        }
        if (global.choice == 1)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EK* Okay^1, enjoy crawling up his wall instead?/", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_376_0");
            msgnextloc("\\EL* Your dumb ass is gonna look like a spider./%", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_377_0");
        }
        d_make();
        myinteract = 999;
    }
    if (myinteract == 999 && !d_ex())
    {
        if (playsound)
        {
            snd_play(snd_item);
            playsound = 0;
        }
        global.interact = 0;
        marker.sprite_index = susprite;
        myinteract = 0;
    }
}
with (telescope)
{
    if (other.flooractive != 2)
        myinteract = 0;
    if (global.facing != 0)
        myinteract = 0;
    if (myinteract == 3)
    {
        myinteract = 99;
        if (other.telecon == 0)
        {
            other.telecon = 1;
            other.teletimer = 0;
        }
        else
        {
            myinteract = 99;
        }
    }
}
if (telecon == 1)
{
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#Observe Susie", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_426_0");
    global.choicemsg[1] = stringsetloc("#Observe Ralsei", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_427_0");
    global.choicemsg[2] = stringsetloc("Observe Kris", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_428_0");
    global.choicemsg[3] = stringsetloc("Do Not", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_429_0");
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a telescope.)/", "obj_dw_church_bookshelfpuzzle_slash_Step_0_gml_431_0");
    msgnext("\\C4 ");
    d_make();
    telecon = 2;
}
if (telecon == 2 && global.choice != -1)
{
    k_d();
    teletimer = 0;
    if (global.choice == 0 || global.choice == 1 || global.choice == 2)
    {
        snd_play(snd_item);
        drawspotlight = true;
        obj_mainchara.cutscene = true;
        var pos = scr_genmarker("telera");
        if (global.choice == 0)
            pos = scr_genmarker("telesu");
        s_remsprite = sunpc.marker.sprite_index;
        r_remsprite = ranpc.marker.sprite_index;
        if (global.choice == 0)
        {
            sunpc.marker.image_index = 0;
            sunpc.marker.image_speed = 0;
            sunpc.marker.sprite_index = spr_susie_dark_practice_heal_telescope;
            if (tele_ssaw == false)
            {
                tele_ssaw = true;
                tele_stimer = 0;
                tele_scon = 1;
            }
            else
            {
                tele_scon = 99;
                sunpc.marker.image_index = 33;
            }
        }
        if (global.choice == 1)
        {
            ranpc.marker.image_speed = 0;
            ranpc.marker.image_index = 0;
            ranpc.marker.sprite_index = spr_ralsei_book_look;
            if (tele_rsaw == false)
            {
                tele_rcon = 1;
                tele_rtimer = 0;
                tele_rsaw = true;
            }
            else
            {
                ranpc.marker.image_index = 5;
                tele_rcon = 2;
            }
        }
        if (global.choice != 2)
            camera_setxy(pos.x, pos.y);
        telecon = 3;
    }
    if (global.choice == 3)
    {
        telecon = 0;
        telescope.myinteract = 0;
        global.interact = 0;
    }
}
if (telecon == 3)
{
    teletimer++;
    if (tele_rcon == 1)
    {
        tele_rtimer++;
        if (tele_rtimer == 1)
            ranpc.marker.image_speed = 0;
        if (tele_rtimer == 30)
            ranpc.marker.image_speed = 0.25;
        if (ranpc.marker.image_index == 2)
            ranpc.marker.image_speed = 0.020833333333333332;
        if (ranpc.marker.image_index == 3)
            ranpc.marker.image_speed = 0.25;
        if (ranpc.marker.image_index == 5)
        {
            tele_rcon = 2;
            ranpc.marker.image_speed = 0;
        }
    }
    if (tele_rcon == 2)
    {
        with (ranpc.marker)
        {
            image_speed = 0;
            image_index += 0.25;
            if (image_index == 9)
                image_index = 5;
        }
    }
    if (tele_scon == 1)
    {
        tele_stimer++;
        if (tele_stimer == 2)
        {
            with (sunpc.marker)
                image_speed = 0.020833333333333332;
        }
        if (sunpc.marker.image_index == 3)
        {
            with (sunpc.marker)
                image_speed = 0.25;
        }
        if (sunpc.marker.image_index == 6)
        {
            with (sunpc.marker)
                image_speed = 0.020833333333333332;
        }
        if (sunpc.marker.image_index == 7)
        {
            with (sunpc.marker)
                image_speed = 0.25;
            snd_play(snd_ghostappear, 0.7, 1.4);
            var snd = snd_play(snd_stardrop, 0, 1.2);
            snd_volume(snd, 1, 15);
        }
        if (sunpc.marker.image_index == 33)
        {
            snd_play(snd_board_lift, 0.7, 1.3);
            sunpc.marker.image_speed = 0;
            sunpc.marker.image_index = 33;
            tele_scon = 2;
        }
    }
    if (teletimer > 5)
    {
        if (button2_p() || button1_p() || button3_p())
        {
            sunpc.marker.sprite_index = s_remsprite;
            sunpc.marker.image_speed = 0;
            sunpc.marker.image_index = 0;
            ranpc.marker.sprite_index = r_remsprite;
            ranpc.marker.image_speed = 0;
            ranpc.marker.image_index = 0;
            teletimer = 0;
            drawspotlight = false;
            obj_mainchara.cutscene = false;
            snd_play(snd_item, undefined, 0.8);
            telecon = 20;
            telescope.myinteract = 0;
        }
    }
}
if (telecon == 20)
{
    teletimer++;
    if (teletimer == 2)
        global.interact = 0;
    if (teletimer >= 5)
    {
        if (!button1_h())
        {
            telecon = 0;
            teletimer = 0;
            telescope.myinteract = 0;
        }
    }
}
