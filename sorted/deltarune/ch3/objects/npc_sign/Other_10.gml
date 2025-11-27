global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
global.msg[0] = stringsetloc("* You can't read these symbols...&* Or maybe it's the handwriting./%", "obj_npc_sign_slash_Other_10_gml_10_0");
if (scr_debug())
    global.msg[0] = stringset("* [NO TEXT] (obj_npc_sign)/%");
if (room == room_cutscene_tester || room == room_torhouse || room == room_castle_tutorial)
{
    scr_funnytext_init(0, 0, 0, 923, 0, 0);
    scr_funnytext_init(1, 0, 0, 464, 1, 0);
    scr_script_boxwait(snd_play, 1, 205);
    scr_script_boxwait_end(snd_play, 1, 295);
    msgsetloc(0, "* Defeating you is so \\O0       ^1 /", "obj_npc_sign_slash_Other_10_gml_30_0");
    msgnextloc("* Show me your \\O1       ^3 ! /%", "obj_npc_sign_slash_Other_10_gml_31_0");
}
if (room == room_flowershop_2f)
    global.msg[0] = stringsetsubloc("* (It's ~1 flower^1, protected in a container...)/%", colortxt, "obj_npc_sign_slash_Other_10_gml_27_0");
if (room == room_town_north)
{
    if (x > 1440)
    {
        global.msg[0] = stringsetloc("* (It's your dad's truck.)/", "obj_npc_sign_slash_Other_10_gml_32_0");
        global.msg[1] = stringsetloc("* (The floor of the front seat is littered with old papers and country CDs...)/%", "obj_npc_sign_slash_Other_10_gml_33_0");
    }
    if (global.chapter >= 2)
    {
        if (x > 1200 && x < 1300)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Closed!)/%", "obj_npc_sign_slash_Other_10_gml_46_0");
        }
    }
}
if (room == room_beach)
{
    if (global.chapter == 1)
    {
        global.msc = 192;
        scr_text(global.msc);
    }
    if (global.chapter == 2)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a metal picnic table.)/", "obj_npc_sign_slash_Other_10_gml_62_0");
        scr_anyface_next("susie", "K");
        msgnextloc("\\EK* (Damnit^1, my fingers won't fit through the holes.)/%", "obj_npc_sign_slash_Other_10_gml_64_0");
    }
}
if (room == room_town_krisyard || room == room_town_krisyard_dark)
    global.msg[0] = stringsetloc("* (It's your mom's van.)/%", "obj_npc_sign_slash_Other_10_gml_55_0");
if (room == room_town_south)
{
    if (global.chapter >= 2)
    {
        if (sprite_index == spr_alphysd)
        {
            if (scr_litemcheck(10))
            {
                global.msc = 1157;
                scr_text(global.msc);
            }
            else
            {
                global.msc = 1028;
                scr_text(global.msc);
            }
        }
        if (sprite_index == spr_npc_alphys_bike_broken)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a beaten bike.)/", "obj_npc_sign_slash_Other_10_gml_97_0");
            msgnextloc("* (The horn looks like it might give a honk of despair.)/%", "obj_npc_sign_slash_Other_10_gml_98_0");
        }
    }
}
if (room == room_lw_police)
{
    if (sprite_index == spr_npc_prisoner_dog_eye || sprite_index == spr_npc_prisoner_dog_lesser)
    {
        if (read == 0)
        {
            with (obj_npc_sign)
            {
                if (sprite_index == spr_npc_prisoner_dog_eye || sprite_index == spr_npc_prisoner_dog_lesser)
                    read = 1;
            }
            msgsetloc(0, "* We're the infamous dog-burgulars^1, The Wet-Nose Bandits./", "obj_npc_sign_slash_Other_10_gml_116_0");
            msgnextloc("* (We were getting ready to sneak into that big house over the holidays...)/", "obj_npc_sign_slash_Other_10_gml_117_0");
            msgnextloc("* When we were attacked from the shadows^1, by something MERCILESS!/", "obj_npc_sign_slash_Other_10_gml_118_0");
            msgnextloc("* (Fearing for our lives^1, we all ran right into Officer Undyne's warm^1, loving arms...)/", "obj_npc_sign_slash_Other_10_gml_119_0");
            msgnextloc("* And she suplexed us all into the snow with our tails hanging in the air./", "obj_npc_sign_slash_Other_10_gml_120_0");
            msgnextloc("* (Now we're in jail^1, but at least we're alive...)/", "obj_npc_sign_slash_Other_10_gml_121_0");
            msgnextloc("* Plus^1, that nice ghost keeps giving us incorporeally low-calorie treats./", "obj_npc_sign_slash_Other_10_gml_122_0");
            msgnextloc("* (Then we all howl holiday songs together. Ooo ooo ooo.)/%", "obj_npc_sign_slash_Other_10_gml_123_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Make Dog Marriage^1, not Dog Jail!)/%", "obj_npc_sign_slash_Other_10_gml_127_0");
        }
    }
    else if (obj_mainchara.y < 115)
    {
        scr_speaker("undyne");
        msgsetloc(0, "\\E1* HEY!!^1! TALK TO ME FROM THE FRONT!!!/", "obj_npc_sign_slash_Other_10_gml_136_0");
        msgnextloc("\\E2* NO SIDE-TALKING TO YOUR SUPERIORS!!/%", "obj_npc_sign_slash_Other_10_gml_137_0");
    }
    else
    {
        global.msc = 1024;
        scr_text(global.msc);
    }
}
if (room == room_dw_castle_rooms_kris)
{
    if (sprite_index == spr_dw_icee_cushion)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (This maybe isn't the best thing in your room.)/%", "obj_npc_sign_slash_Other_10_gml_182_0");
    }
}
if (room == room_dw_castle_rooms_susie)
{
    if (sprite_index == spr_dw_susie_statue)
    {
        if (scr_havechar(2))
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E9* Heheh^1, jealous of my cool statue^1, Kris?/", "obj_npc_sign_slash_Other_10_gml_191_0");
            msgnextloc("\\EK* Huh? What? No^1, it's not me^1, it's just cool!/%", "obj_npc_sign_slash_Other_10_gml_192_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a Susie-like statue.)/%", "obj_npc_sign_slash_Other_10_gml_196_0");
        }
    }
    if (sprite_index == spr_dw_susie_plush)
    {
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                var small_text = stringsetloc("NO TOUCHING MY DOLL WHEN I'M NOT HERE!!", "obj_npc_sign_slash_Other_10_gml_200_0");
                scr_smallface(0, "susie", 17, "middle", "bottom", small_text);
                scr_speaker("susie");
                msgsetloc(0, "* So^1, uh..^1. this was in the gift you gave me./", "obj_npc_sign_slash_Other_10_gml_211_0_b");
                msgnextloc("\\E1* ..^1. the hell did you have this^1, Kris?/", "obj_npc_sign_slash_Other_10_gml_212_0");
                scr_anyface_next("ralsei", 19);
                msgnextloc("\\EJ* Oooh^1, can I make it a little dress?\\f0/%", "obj_npc_sign_slash_Other_10_gml_214_0_b");
            }
            else
            {
                scr_speaker("ralsei");
                msgsetloc(0, "\\E2* Susie^1, if you don't want it^1, Kris would take it!/", "obj_npc_sign_slash_Other_10_gml_218_0");
                scr_anyface_next("susie", 5);
                msgnextloc("\\E5* When did I say I was gonna give it away!?/%", "obj_npc_sign_slash_Other_10_gml_220_0");
            }
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a doll. Visually^1, it resembles Susie.)/%", "obj_npc_sign_slash_Other_10_gml_225_0_b");
        }
    }
}
if (room == room_dw_castle_town)
{
    if (sprite_index == spr_castle_book_pillar)
    {
        global.msc = 1234;
        scr_text(global.msc);
    }
}
if (room == room_torhouse)
{
    if (global.chapter == 2)
    {
        if (sprite_index == spr_susie_walk_up_lw)
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EK* Hey^1, what are those metal people shapes in the cupboard./", "obj_npc_sign_slash_Other_10_gml_467_0");
                msgnextloc("\\EK* ..^1. like^1, uh^1, handcuffs for a little guy's whole body?/", "obj_npc_sign_slash_Other_10_gml_468_0");
                scr_anyface_next("toriel", 4);
                msgnextloc("\\E4* Hahaha^1! Those are for gingerbread^1, Susie./", "obj_npc_sign_slash_Other_10_gml_470_0");
                msgnextloc("\\E0* Gingerbread men..^1. and gingerbread monsters^1, of course./", "obj_npc_sign_slash_Other_10_gml_471_0");
                scr_anyface_next("susie", 10);
                msgnextloc("\\EA* ..^1. Gingerbread monsters^1, huh...? Cool./%", "obj_npc_sign_slash_Other_10_gml_473_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* Gingerbread..^1. sounds like something Noelle would like./", "obj_npc_sign_slash_Other_10_gml_477_0");
                scr_anyface_next("toriel", "0");
                msgnextloc("\\E0* Hm? ..^1. Noelle?/", "obj_npc_sign_slash_Other_10_gml_479_0");
                scr_anyface_next("susie", "K");
                msgnextloc("\\EK* Uh^1, nothing./%", "obj_npc_sign_slash_Other_10_gml_481_0");
            }
        }
        if (sprite_index == spr_toriel_ut)
        {
            if (read == 0)
            {
                scr_speaker("toriel");
                msgsetloc(0, "\\E0* Hm^1, hm.../", "obj_npc_sign_slash_Other_10_gml_490_0");
                scr_anyface_next("susie", "0");
                msgnextloc("\\E0* .../", "obj_npc_sign_slash_Other_10_gml_492_0");
                msgnextloc("\\EC* (She's sneaking sugar right out of the bag...)/", "obj_npc_sign_slash_Other_10_gml_493_0");
                scr_anyface_next("toriel", "1");
                msgnextloc("\\E1* Susie?/", "obj_npc_sign_slash_Other_10_gml_495_0");
                scr_anyface_next("susie", 16);
                msgnextloc("\\EG* Wh-what?/", "obj_npc_sign_slash_Other_10_gml_497_0");
                scr_anyface_next("toriel", "4");
                msgnextloc("\\E4* My pie^1, my rules./", "obj_npc_sign_slash_Other_10_gml_499_0");
                scr_anyface_next("susie", "3");
                msgnextloc("\\E3* G-got it./%", "obj_npc_sign_slash_Other_10_gml_501_0");
            }
            else
            {
                scr_speaker("toriel");
                msgsetloc(0, "\\E1* Kris^1, no sneaking ingredients until you wash your hands./", "obj_npc_sign_slash_Other_10_gml_505_0");
                scr_anyface_next("susie", 2);
                msgnextloc("\\E2* (Don't worry^1, Kris. I'll sneak stuff instead.)/%", "obj_npc_sign_slash_Other_10_gml_507_0");
            }
        }
    }
}
if (room == room_dw_ralsei_castle_2f)
{
    if (sprite_index == spr_lancer_dark_relax)
    {
        if (read == 0)
        {
            scr_smallface(0, "ralsei", 22, "right", "bottom", stringsetloc("You mean a mom?", "obj_npc_sign_slash_Other_10_gml_873_0"));
            scr_speaker("lancer");
            msgsetloc(0, "\\E1* Susie^1, Kris^1! Toothpaste boy!/", "obj_npc_sign_slash_Other_10_gml_876_0");
            msgnextloc("\\E2* Queen is teaching me all sorts of things about being a bad guy./", "obj_npc_sign_slash_Other_10_gml_877_0");
            msgnextloc("\\E1* She's like..^1. How do I put this.../", "obj_npc_sign_slash_Other_10_gml_878_0");
            msgnextloc("\\E2* A third father to me./", "obj_npc_sign_slash_Other_10_gml_879_0");
            msgnextloc("\\E3* A girldad^1, if you will...\\f0/%", "obj_npc_sign_slash_Other_10_gml_880_0");
        }
        else
        {
            scr_smallface(0, "queen", 12, 380, "bottom", stringsetloc("Peachboy Peachboy", "obj_npc_sign_slash_Other_10_gml_883_0"));
            scr_speaker("lancer");
            msgsetloc(0, "\\E1* Go outside and play^1, Peachboy!\\f0/%", "obj_npc_sign_slash_Other_10_gml_886_0");
        }
    }
    else
    {
        if (global.flag[388] == 1 || scr_get_total_recruits(2) == 0)
        {
            if (read == 0)
            {
                scr_speaker("queen");
                msgsetloc(0, "\\E1* Ralsei Will Soon Setup.EXE My Room For Me Upstairs/", "obj_npc_sign_slash_Other_10_gml_895_0");
                msgnextloc("\\ED* Do Not Worry/", "obj_npc_sign_slash_Other_10_gml_896_0");
                msgnextloc("\\EP* I Have A Long Spreadsheet Of Demands Ready Ha Ha/", "obj_npc_sign_slash_Other_10_gml_897_0");
                msgnextloc("\\E1* Though^1, Even If I Have An Awesome Room/", "obj_npc_sign_slash_Other_10_gml_898_0");
                msgnextloc("\\E5* Who Will Be There To Force To Enjoy It/", "obj_npc_sign_slash_Other_10_gml_899_0");
                msgnextloc("\\E5* .../", "obj_npc_sign_slash_Other_10_gml_900_0");
                msgnextloc("\\EA* ..^1. I Wonder How Noelle Is Doing Now/%", "obj_npc_sign_slash_Other_10_gml_901_0");
            }
            else
            {
                scr_speaker("queen");
                msgsetloc(0, "\\EA* ..^1. I Wonder How Noelle Is Doing Now/%", "obj_npc_sign_slash_Other_10_gml_905_0");
            }
        }
        if (scr_get_total_recruits(2) >= 9)
        {
            if (read == 0)
            {
                scr_smallface(0, "lancer", 1, 375, "bottom", stringsetloc("Peachboy! Peachboy!", "obj_npc_sign_slash_Other_10_gml_913_0"));
                scr_speaker("queen");
                msgsetloc(0, "\\E1* Welcome This Entire Castle Is Now My Room/", "obj_npc_sign_slash_Other_10_gml_916_0");
                scr_anyface_next("ralsei", 26);
                msgnextloc("\\EQ* U-umm^1, I was going to set up something upstairs./", "obj_npc_sign_slash_Other_10_gml_918_0");
                scr_anyface_next("queen", 1);
                msgnextloc("\\E1* Why I Already Have Everything I Could Ever Want/", "obj_npc_sign_slash_Other_10_gml_920_0");
                msgnextloc("\\E9* Friendship^1, Fans^1, And A Small Round Boy/", "obj_npc_sign_slash_Other_10_gml_921_0");
                msgnextloc("\\ED* Now Go And Play With Your Friends^1, Peachboy\\f0/%", "obj_npc_sign_slash_Other_10_gml_922_0");
            }
            else
            {
                scr_speaker("queen");
                msgsetloc(0, "\\E1* Kris^1, Do Give Noelle My Regards/", "obj_npc_sign_slash_Other_10_gml_926_0");
                msgnextloc("\\ED* Any Leftover Regards You Can Give To Berdly/%", "obj_npc_sign_slash_Other_10_gml_927_0");
            }
        }
    }
}
if (room == room_lw_computer_lab)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (He doesn't seem to be awake.)/%", "obj_npc_sign_slash_Other_10_gml_1046_0");
}
if (room == room_board_3)
{
    if (extflag == "tenna")
    {
        obj_b3stairs.con = 5;
        safe_delete(obj_tennatalkbubble);
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* The console is still on./%", "obj_npc_sign_slash_Other_10_gml_361_0_b");
    }
}
if (room == room_dw_teevie_cowboy_zone_02_after)
{
    if (extflag == "wardrobe")
    {
        if (read == 0)
        {
            skip = 1;
            with (obj_room_teevie_cowboy_after_02)
                con = 30;
        }
        else
        {
            skip = 0;
            global.msc = 1327;
            scr_text(global.msc);
        }
    }
    if (extflag == "haystack")
    {
        if (read == 0)
        {
            var sentence_end = (scr_flag_get(1153) == 0 && (scr_flag_get(106) == 0 || scr_flag_get(922) > 0)) ? "/" : "/%";
            scr_speaker("no_name");
            msgsetloc(0, "* (A pile of hay.)/", "obj_npc_sign_slash_Other_10_gml_394_0");
            scr_anyface_next("ralsei", 0);
            msgnextsubloc("\\ED* Ooh^1, looks yummy^1! W-wait^1, what am I saying...?~1", sentence_end, "obj_npc_sign_slash_Other_10_gml_396_0");
            if (scr_flag_get(1153) == 0)
            {
                if (scr_flag_get(922) > 0)
                {
                    scr_flag_set(1153, 2);
                    global.writersnd[0] = snd_power;
                    scr_anyface_next("susie", "K");
                    msgnextloc("\\EK* Heh^1, eating HAY? That costume got you weird^1, Ralsei./", "obj_npc_sign_slash_Other_10_gml_407_0");
                    msgnextloc("\\E7* WAIT^1! Kris^1! Look^1! Is that moss on the side!?/", "obj_npc_sign_slash_Other_10_gml_408_0");
                    msgnextloc("\\E0* ..^1. damn^1, false alarm. It's just spinach or something./", "obj_npc_sign_slash_Other_10_gml_409_0");
                    msgnextloc("\\E1* .../", "obj_npc_sign_slash_Other_10_gml_410_0");
                    scr_anyface_next("no_name", 0);
                    msgnextloc("\\S0* (You and Susie ate the spinach together.)/%", "obj_npc_sign_slash_Other_10_gml_412_0");
                }
                else if (scr_flag_get(106) == 0)
                {
                    scr_flag_set(1153, 1);
                    global.writersnd[0] = snd_item;
                    scr_anyface_next("susie", "2");
                    msgnextloc("\\E2* Heh^1, dude^1! Hay isn't for eating. It's for sleeping./", "obj_npc_sign_slash_Other_10_gml_420_0");
                    scr_anyface_next("ralsei", "K");
                    msgnextloc("\\EK* Umm^1, noted!/", "obj_npc_sign_slash_Other_10_gml_422_0");
                    scr_anyface_next("no_name", 0);
                    msgnextloc("\\S0* (It was noted.)/%", "obj_npc_sign_slash_Other_10_gml_427_0");
                }
            }
        }
        else
        {
            var _has_dealmaker = scr_armorcheck_equipped_any(21);
            if (_has_dealmaker)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* \"LIGHT nER^1! HAY-HA Y HAY!!!\"/", "obj_npc_sign_slash_Other_10_gml_436_0");
                msgnextloc("* (..^1. is what it felt like your glasses would say.)/%", "obj_npc_sign_slash_Other_10_gml_437_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Dried grass. No sass.)/%", "obj_npc_sign_slash_Other_10_gml_441_0");
            }
        }
    }
}
if (room == room_dw_ranking_b)
{
    if (extflag == "gacha_instructions")
    {
        global.msc = 1337;
        scr_text(global.msc);
    }
}
read += 1;
myinteract = 3;
if (skip == 0)
{
    mydialoguer = instance_create(0, 0, obj_dialoguer);
}
else
{
    global.interact = 0;
    myinteract = 0;
    with (obj_mainchara)
        onebuffer = 5;
}
