global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
image_speed = 0.2;
if (global.darkzone == 1)
    image_speed = 0.2;
global.msg[0] = stringsetloc("* The gash weaves down as if you cry./%", "obj_npc_room_slash_Other_10_gml_13_0");
if (scr_debug())
    global.msg[0] = stringset("* [NO TEXT] (obj_npc_room)/%");
if (room == room_krisroom)
{
    if (global.chapter == 1)
    {
        global.msg[0] = stringsetloc("* It's a red wagon with a rusty birdcage in it./", "obj_npc_room_slash_Other_10_gml_20_0");
        global.msg[1] = stringsetloc("* Looks like it's seen quite a few crashes./%", "obj_npc_room_slash_Other_10_gml_21_0");
    }
    if (global.chapter >= 2)
    {
        msgsetloc(0, "* It's a birdcage. When the door's closed^1, there's no escape./%", "obj_npc_room_slash_Other_10_gml_27_0");
        if (global.chapter == 4)
        {
            if (scr_havechar(2))
            {
                if (talked == 0)
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EK* Hey^1, didn't know you owned a bird. Or^1, uh..^1. something./%", "obj_npc_room_slash_Other_10_gml_39_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EC* ..^1. don't really like how you nodded at \"or something.\"/%", "obj_npc_room_slash_Other_10_gml_43_0");
                }
            }
        }
    }
}
if (room == room_torhouse)
{
    global.msg[0] = stringsetloc("* (It's Chairiel^1, the beloved living room chair.)/%", "obj_npc_room_slash_Other_10_gml_32_0");
    if (global.chapter < 4)
    {
        if (global.plot >= 250)
        {
            global.msc = 455;
            scr_text(global.msc);
            global.typer = 7;
            global.fc = 4;
            global.fe = 0;
        }
    }
    if (global.chapter == 4)
    {
        if (scr_havechar(2) && global.plot >= 15)
        {
            if (scr_flag_get(1654) == 0)
            {
                scr_flag_set(1654, 1);
                scr_speaker("susie");
                msgsetloc(0, "\\E6* What? ..^1. What did you just call this thing? Chariel?/%", "obj_npc_room_slash_Other_10_gml_73_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E9* No^1, come on^1, say that again^1! Hahahaha!/%", "obj_npc_room_slash_Other_10_gml_77_0");
            }
            with (obj_event_manager)
                trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_25);
        }
        else
        {
            with (obj_event_manager)
                trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_25);
        }
        if (global.plot >= 40 && global.plot < 300)
        {
            if (scr_havechar(2))
            {
                if (talked == 0 && scr_flag_get(831) == 0)
                {
                    global.msc = 1365;
                    scr_text(global.msc);
                }
                else
                {
                    scr_speaker("toriel");
                    msgsetloc(0, "\\E5* (Kris^1, do not be a bad influence on Susie...)/%", "obj_npc_room_slash_Other_10_gml_92_0");
                }
            }
        }
    }
}
if (room == room_alphysclass)
{
    global.msc = 100;
    scr_text(global.msc);
    global.fc = 4;
}
if (room == room_castle_tutorial)
{
    global.msg[0] = stringsetloc("* (It's just a dummy.)/%", "obj_npc_room_slash_Other_10_gml_52_0");
    if (global.chapter == 2)
    {
        if (sprite_index == spr_dummynpc)
        {
            if (talked == 0)
            {
                global.msc = 1093;
                scr_text(global.msc);
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's a mannequin dressed in poor taste.)/%", "obj_npc_room_slash_Other_10_gml_79_0");
            }
        }
        if (sprite_index == spr_npc_coody)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I'm a worm. I don't understand taxes and values./%", "obj_npc_room_slash_Other_10_gml_93_0");
        }
        if (sprite_index == spr_npc_mrelegance)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* We're'n building up the area to be a bit'n more board-like./", "obj_npc_room_slash_Other_10_gml_134_0");
            msgnextloc("* The ponmen'll be happy^1, too./%", "obj_npc_room_slash_Other_10_gml_135_0");
        }
        if (sprite_index == spr_mannequin_ralsei)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Looks like it costs money just to have a free sample.)/%", "obj_npc_room_slash_Other_10_gml_142_0");
        }
        if (sprite_index == spr_mannequin_ralsei_nugu)
        {
            if (talked == 0)
            {
                scr_smallface(0, "ralsei", 23, 150, "middle", stringsetloc("Don't yell that from across town!!", "obj_npc_room_slash_Other_10_gml_149_0"));
                scr_smallface(1, "susie", 7, "middle", "bottom", stringsetloc("Hey Lancer!!", "obj_npc_room_slash_Other_10_gml_150_0"));
                scr_smallface(2, "lancer", 1, "right", "bottom", stringsetloc("Hi Susie!!", "obj_npc_room_slash_Other_10_gml_151_0"));
                scr_speaker("ralsei");
                msgsetloc(0, "\\EL* Wh..^1. who did this to my mannequin!?/", "obj_npc_room_slash_Other_10_gml_154_0");
                msgnextloc("\\EN* A-as your prince^1, I..^1. I demand someone fix this!!/", "obj_npc_room_slash_Other_10_gml_155_0");
                msgnextloc("\\EM* .../", "obj_npc_room_slash_Other_10_gml_156_0");
                msgnextloc("\\EK* Umm^1, is..^1. is anybody listening...?/", "obj_npc_room_slash_Other_10_gml_157_0");
                scr_anyface_next("lancer", "8");
                msgnextloc("\\E8* I was listening~!\\f0\\f1\\f2/%", "obj_npc_room_slash_Other_10_gml_159_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* (If Noelle was here...)/", "obj_npc_room_slash_Other_10_gml_163_0");
                msgnextloc("\\EA* (She'd probably dress it up like a Christmas tree.)/", "obj_npc_room_slash_Other_10_gml_164_0");
                msgnextloc("\\EK* (..^1. Huh? Why am I thinking that^1, anyway?)/%", "obj_npc_room_slash_Other_10_gml_165_0");
            }
        }
        if (sprite_index == spr_npc_addison_blue)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* This place is a great deal!^1! All kinds of new customers!!/", "obj_npc_room_slash_Other_10_gml_172_0");
            msgnextloc("* Want a free sample? Just $4.99 to try a bite of these clothes!!/%", "obj_npc_room_slash_Other_10_gml_173_0");
        }
    }
    if (global.chapter == 4)
    {
        if (sprite_index == spr_npc_addison_pink)
        {
            var small_text = stringsetloc("We don't talk about those here.", "obj_npc_room_slash_Other_10_gml_181_0");
            scr_smallface(0, "empty", 0, 300, "bottom", small_text);
            scr_speaker("no_name");
            msgsetloc(0, "* Now that we sell to ourselves^1, our sales numbers are higher than ever!/", "obj_npc_room_slash_Other_10_gml_184_0");
            msgnextloc("* Haha^1, profits?\\f0/%", "obj_npc_room_slash_Other_10_gml_185_0");
            if (image_xscale == -2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This is a GREAT town^1! ALL my friends are here^1, and ready to BLOW BIG BUCKS!!!/", "obj_npc_room_slash_Other_10_gml_190_0");
                msgnextloc("* ..^1. still^1, I can't help but feel like I haven't seen..^1. What? Nothing^1! BUY!^1! BUY!!/%", "obj_npc_room_slash_Other_10_gml_191_0");
            }
        }
        if (sprite_index == spr_npc_addison_blue)
        {
            var small_text_a = stringsetloc("Sorry Ralsei", "obj_npc_room_slash_Other_10_gml_199_0");
            var small_text_b = stringsetloc("That's okay!", "obj_npc_room_slash_Other_10_gml_200_0");
            var small_text_c = stringsetloc("Free poison! Drink here!", "obj_npc_room_slash_Other_10_gml_201_0");
            var loc1 = [250, "bottom"];
            var loc2 = [420, "bottom"];
            if (global.lang == "ja")
            {
                loc1[0] = 150;
                loc2[0] = 360;
            }
            var loc3 = [300, "bottom"];
            scr_smallface(0, "susie", 4, loc1[0], loc1[1], small_text_a);
            scr_smallface(1, "ralsei", 30, loc2[0], loc2[1], small_text_b);
            scr_smallface(2, "empty", 0, loc3[0], loc3[1], small_text_c);
            scr_speaker("no_name");
            msgsetloc(0, "* ADDISON'S^1! RELIABLE sales^1! NO unwanted mail or SHORT FREAKS!\\f0^2\\f1/", "obj_npc_room_slash_Other_10_gml_203_0");
            msgnextloc("* We may be ADs^1, but WE have INTEGRITY!\\f2/%", "obj_npc_room_slash_Other_10_gml_204_0");
            if (image_xscale == -2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Wow!!^1! This product is so..^1. BUYABLE!^1! Deals SO good you'll..^1. um^1, HUG yourself!!/", "obj_npc_room_slash_Other_10_gml_209_0");
                scr_anyface_next("ralsei", "1");
                msgnextloc("\\E1* Myself? It would be better if someone else did it.../%", "obj_npc_room_slash_Other_10_gml_211_0");
            }
        }
        if (sprite_index == spr_npc_addison_orange)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Looking for ORIGINALITY!? INNOVATION!? Then CLICK no further than ADDISON's.../", "obj_npc_room_slash_Other_10_gml_219_0");
            msgnextloc("* Our new \"Fungadero\" will have your whole FAMILY \"Funning\" around Town!/%", "obj_npc_room_slash_Other_10_gml_220_0");
            if (image_xscale == -2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* WOW!!^1! I can't believe this ORANGE-inal flavor!!/", "obj_npc_room_slash_Other_10_gml_225_0");
                msgnextloc("* WHAT!? You say it contains 10`% REAL \"liquids!?\" Talk about ALL NATURAL!!/%", "obj_npc_room_slash_Other_10_gml_226_0");
            }
        }
        if (sprite_index == spr_npc_addison_yellow)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Our next ad is a commercial for TENNA!^1! We're gonna be BIG SHOTS!!/", "obj_npc_room_slash_Other_10_gml_234_0_b");
            msgnextloc("* Finally^1! Can't see THIS one going wrong!/%", "obj_npc_room_slash_Other_10_gml_235_0");
            if (image_xscale == -2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* WOW!!^1! I can't believe I'm drinking ADDISON TEA!!/", "obj_npc_room_slash_Other_10_gml_240_0");
                msgnextloc("* Tastes JUST as advertised!^1! I mean^1, literally^1! It tastes like an AD!/%", "obj_npc_room_slash_Other_10_gml_241_0");
            }
        }
        if (sprite_index == spr_npc_mannequin_gaudy)
        {
            var small_text = stringsetloc("I DIDN'T HAVE ANYTHING\nTO DO WITH THIS!!!", "obj_npc_room_slash_Other_10_gml_251_0");
            var loc1 = [350, "bottom"];
            if (global.lang == "ja")
                loc1[0] = 280;
            scr_smallface(0, "ralsei", 32, loc1[0], loc1[1], small_text);
            scr_speaker("susie");
            msgsetloc(0, "\\E7* Damn^1, nice outfit^1, Ralsei?\\f0/%", "obj_npc_room_slash_Other_10_gml_250_0");
        }
    }
}
if (room == room_cc_clover)
{
    global.msg[0] = stringsetloc("* Oh^1! Let us take your coat^1!&* And put it in the TOILET^1! HA^1!&* ... which^1, we don't even have./", "obj_npc_room_slash_Other_10_gml_232_0");
    global.msg[1] = stringsetloc("* Please try the baseballs~^1!&* Yeah^1! Eat so many you CHOKE^1!&* ... do they eat sports?/", "obj_npc_room_slash_Other_10_gml_233_0");
    global.msg[2] = stringsetloc("* Then we can all play Twister~^1!&* Just stay OUT OF OUR WAY^1!&* ... we lose even by ourselves./%", "obj_npc_room_slash_Other_10_gml_234_0");
    if (global.flag[522] == 1)
    {
        global.msg[0] = stringsetloc("* Were you invited^1?&* YOU WEREN'T!!^1!&* You DID hurt us.../", "obj_npc_room_slash_Other_10_gml_237_0");
        global.msg[1] = stringsetloc("* Awkward..^1.&* You wanna REMATCH!^1?&* You'd better leave.../%", "obj_npc_room_slash_Other_10_gml_238_0");
    }
    if (x < 160)
        global.msg[0] = stringsetloc("* I'm the first party member^1.&* I'm in charge of the DPS^1.&* (Dancin' Party Soundtrack.)/%", "obj_npc_room_slash_Other_10_gml_243_0");
    if (x > 400)
    {
        global.msg[0] = stringsetloc("* (Hathy is the second party member^1. It's the healer.)/", "obj_npc_room_slash_Other_10_gml_247_0");
        global.msg[1] = stringsetloc("* (She was in charge of catering the party.)/", "obj_npc_room_slash_Other_10_gml_248_0");
        global.msg[2] = stringsetloc("* (Unfortunately the cake she commissioned was destroyed in a field somewhere.)/%", "obj_npc_room_slash_Other_10_gml_249_0");
        if (talked >= 1)
            global.msg[0] = stringsetloc("* (That's a risk that one always runs when ordering a cake.)/%", "obj_npc_room_slash_Other_10_gml_252_0");
    }
}
if (room == room_hospital_rudy)
{
    if (global.chapter == 1)
    {
        global.typer = 55;
        global.fc = 15;
        global.fe = 2;
        if (global.flag[255] < 2)
            global.msc = 180;
        else
            global.msc = 181;
        scr_text(global.msc);
    }
    if (global.chapter >= 2)
    {
        global.msc = 1047;
        scr_text(global.msc);
    }
}
if (room == room_library)
{
    global.msg[0] = stringsetloc("* I love reading books^1.&* Especially the books upstairs^1.&* You should really./", "obj_npc_room_slash_Other_10_gml_281_0");
    global.msg[1] = stringsetloc("* Read them!/%", "obj_npc_room_slash_Other_10_gml_282_0");
    if (talked >= 1)
    {
        global.msg[0] = stringsetloc("* I love reading books^1.&* Especially.../", "obj_npc_room_slash_Other_10_gml_286_0");
        global.msg[1] = stringsetloc("* The books./%", "obj_npc_room_slash_Other_10_gml_287_0");
    }
}
if (room == room_graveyard)
{
    if (sprite_index == spr_npc_bench)
    {
        global.msc = 190;
        scr_text(global.msc);
        if (global.chapter == 4 && global.plot >= 300)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The bench is wet.)/%", "obj_npc_room_slash_Other_10_gml_326_0");
        }
    }
    if (sprite_index == spr_npc_alvin_back)
    {
        global.msc = 1045;
        scr_text(global.msc);
    }
    if (sprite_index == spr_snowy_ut)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Kris? ..^1. not right now^1, pal./%", "obj_npc_room_slash_Other_10_gml_341_0_b");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Leave me alone!/%", "obj_npc_room_slash_Other_10_gml_345_0");
        }
    }
    if (sprite_index == spr_npc_snowy_dad_behind)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* ..^1. Not right now^1, kids./%", "obj_npc_room_slash_Other_10_gml_352_0_b");
    }
}
if (room == room_townhall)
{
    if (global.chapter == 1)
    {
        global.msg[0] = stringsetloc("* Hey^1 short-stuff^1.&* Why would YOU possibly need to talk to the mayor?/", "obj_npc_room_slash_Other_10_gml_310_0");
        global.msg[1] = stringsetloc("* Your allowance too low^1?&* Ate too much candies^1?&* Lost your frisbee in the wash?/", "obj_npc_room_slash_Other_10_gml_311_0");
        global.msg[2] = stringsetloc("* Hey^1, short-stuff.../", "obj_npc_room_slash_Other_10_gml_312_0");
        global.msg[3] = stringsetloc("* That's what the cops are for./%", "obj_npc_room_slash_Other_10_gml_313_0");
        if (talked >= 1)
        {
            global.msg[0] = stringsetloc("* What^1? Don't talk to you like you're a \"kid^1?\" Fine.../", "obj_npc_room_slash_Other_10_gml_317_0");
            global.msg[1] = stringsetloc("* If you need someone to change your diaper^1, go ask the Cop's./%", "obj_npc_room_slash_Other_10_gml_318_0");
        }
        if (x > 100)
        {
            global.msg[0] = stringsetloc("* I'm sorry^1, I'm sorry^1.&* The mayor is busy right now./", "obj_npc_room_slash_Other_10_gml_323_0");
            global.msg[1] = stringsetloc("* If you need to see her^1, please try causing some terrible crisis./%", "obj_npc_room_slash_Other_10_gml_324_0");
            if (talked >= 1)
            {
                global.msg[0] = stringsetloc("* I'm sorry^1, I'm sorry^1.&* Are you here to complain about your teacher?/", "obj_npc_room_slash_Other_10_gml_328_0");
                global.msg[1] = stringsetloc("* If you don't like her^1, please blame your mother for getting her hired.../%", "obj_npc_room_slash_Other_10_gml_329_0");
            }
        }
        if (x > 200)
        {
            global.msg[0] = stringsetloc("* The mayor's charisma is about zero^1.&* No^1, it's negative./", "obj_npc_room_slash_Other_10_gml_335_0");
            global.msg[1] = stringsetloc("* But she works hard and has a good track record^1, so she runs unopposed./", "obj_npc_room_slash_Other_10_gml_336_0");
            global.msg[2] = stringsetloc("* Thaaaaaat's politics^1.&* Rarely./%", "obj_npc_room_slash_Other_10_gml_337_0");
            if (talked >= 1)
            {
                global.msg[0] = stringsetloc("* Not only does she act icy^1, she always keeps her office's AC on full blast./", "obj_npc_room_slash_Other_10_gml_341_0");
                global.msg[1] = stringsetloc("* That chill I feel..^1. is..^1.&* Is this what politics feels like?/%", "obj_npc_room_slash_Other_10_gml_342_0");
            }
        }
    }
    if (global.chapter >= 2)
    {
        if (sprite_index == spr_npc_receptionist)
        {
            msgsetloc(0, "* Oh^1, I'm sorry. You're looking for the mayor./", "obj_npc_room_slash_Other_10_gml_352_0");
            msgnextloc("* She's very^1, very busy preparing for the festival./%", "obj_npc_room_slash_Other_10_gml_353_0");
            if (global.chapter == 4)
            {
                if (talked == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* What? Are you looking here for something important?/", "obj_npc_room_slash_Other_10_gml_409_0_b");
                    msgnextloc("* The mayor keeps everything important at her own house for extra security./%", "obj_npc_room_slash_Other_10_gml_410_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* ..^1. Sorry^1, I wasn't supposed to say that./%", "obj_npc_room_slash_Other_10_gml_413_0");
                }
            }
        }
        if (sprite_index == spr_npc_businessguy)
        {
            if (talked == 0)
            {
                msgsetloc(0, "* Well well. If it isn't the teens. Our beloved \"rats of the city.\"/", "obj_npc_room_slash_Other_10_gml_360_0");
                msgnextloc("* You wanna get into Politics? Heh./", "obj_npc_room_slash_Other_10_gml_361_0");
                msgnextloc("* You better graduate from Diaper School first./", "obj_npc_room_slash_Other_10_gml_362_0");
                msgnextloc("* That's what I did. And look at me now./", "obj_npc_room_slash_Other_10_gml_363_0");
                msgnextloc("* I don't even work here./%", "obj_npc_room_slash_Other_10_gml_364_0");
            }
            else
            {
                msgsetloc(0, "* This Briefscase^1, is full of Diapers. Or^1, to the Pro's^1, \"Diaps.\"/", "obj_npc_room_slash_Other_10_gml_366_0");
                msgnextloc("* You're gonna have to level up to understand a Man's World./%", "obj_npc_room_slash_Other_10_gml_367_0");
            }
        }
        if (sprite_index == spr_npc_politicsbear)
        {
            msgsetloc(0, "* That bald guy keeps trying to show me something from his briefcase./", "obj_npc_room_slash_Other_10_gml_373_0");
            msgnextloc("* Is it a bribe...? I'm really deep into politics now.../%", "obj_npc_room_slash_Other_10_gml_374_0");
            if (global.chapter == 4)
            {
                if (talked == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* So far^1, politically^1, all I've really done is stand here and look important./", "obj_npc_room_slash_Other_10_gml_443_0_b");
                    msgnextloc("* I'm starting to get disillusioned with the political system./%", "obj_npc_room_slash_Other_10_gml_444_0_b");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* If only the mayor let me do something else around here.../%", "obj_npc_room_slash_Other_10_gml_447_0");
                }
            }
        }
        if (sprite_index == spr_npc_businessguy_briefless)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* The mayor killed my briefscase with a giant katana./", "obj_npc_room_slash_Other_10_gml_457_0");
                msgnextloc("* I can't complain. I voted for this./%", "obj_npc_room_slash_Other_10_gml_458_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I don't need opinions from a little pigsqueak like you./", "obj_npc_room_slash_Other_10_gml_461_0");
                msgnextloc("* Go look at some milk and grow your eye bones!/%", "obj_npc_room_slash_Other_10_gml_462_0");
            }
        }
    }
}
if (room == room_diner)
{
    if (global.chapter == 1)
    {
        if (sprite_index == spr_npc_cattiwaitress)
        {
            global.fc = 13;
            global.fe = 0;
            global.msg[0] = stringsetloc("* .../", "obj_npc_room_slash_Other_10_gml_388_0");
            global.msg[1] = stringsetloc("\\E1* You're alive./", "obj_npc_room_slash_Other_10_gml_389_0");
            global.msg[2] = stringsetloc("\\E0* .../", "obj_npc_room_slash_Other_10_gml_390_0");
            global.msg[3] = stringsetloc("\\E2* Nice./", "obj_npc_room_slash_Other_10_gml_391_0");
            global.msg[4] = stringsetloc("\\E1* .../", "obj_npc_room_slash_Other_10_gml_393_0");
            global.msg[5] = stringsetloc("\\E0* .../", "obj_npc_room_slash_Other_10_gml_394_0_b");
            global.msg[6] = stringsetloc("\\E1* I'm working./%", "obj_npc_room_slash_Other_10_gml_394_0");
            if (talked >= 1)
            {
                global.msg[0] = stringsetloc("* .../", "obj_npc_room_slash_Other_10_gml_398_0");
                global.msg[1] = stringsetloc("\\E1* This uniform's.../", "obj_npc_room_slash_Other_10_gml_399_0");
                global.msg[2] = stringsetloc("\\E0* Mandatory./%", "obj_npc_room_slash_Other_10_gml_400_0");
            }
        }
        if (sprite_index == spr_npc_dragonfamily)
        {
            global.msg[0] = stringsetloc("* Uh^1, we'll take the special^1, and do you have any edible glitter...?/", "obj_npc_room_slash_Other_10_gml_406_0");
            global.msg[1] = stringsetloc("* The youngest one won't eat anything if it doesn't look like treasure.../%", "obj_npc_room_slash_Other_10_gml_407_0");
            if (talked >= 1)
                global.msg[0] = stringsetloc("* In a pinch^1, sprinkles will work^1, too.../%", "obj_npc_room_slash_Other_10_gml_409_0");
        }
        if (x >= 120 && x <= 140)
        {
            global.msg[0] = stringsetloc("* Don't be a stranger now^1, alright^1, hun?/%", "obj_npc_room_slash_Other_10_gml_415_0");
            if (global.flag[261] == 0)
            {
                global.msg[0] = stringsetloc("* Hey there^1!&* Haven't seen you in a while^1, hun./", "obj_npc_room_slash_Other_10_gml_421_0");
                global.msg[1] = stringsetloc("* I remember^1, back on Sundays^1, after service.../", "obj_npc_room_slash_Other_10_gml_423_0");
                global.msg[2] = stringsetloc("* You and your family would come in and order the special./", "obj_npc_room_slash_Other_10_gml_424_0");
                global.msg[3] = stringsetloc("* 'Course^1, things happened^1, and then.../", "obj_npc_room_slash_Other_10_gml_425_0");
                global.msg[4] = stringsetloc("* Y'all..^1.&* Stopped comin' together./", "obj_npc_room_slash_Other_10_gml_426_0");
                global.msg[5] = stringsetloc("* But every Sunday^1, you and your brother'd still come in./", "obj_npc_room_slash_Other_10_gml_427_0");
                global.msg[6] = stringsetloc("* He'd order you a hot chocolate.../", "obj_npc_room_slash_Other_10_gml_428_0");
                global.msg[7] = stringsetloc("* And you two'd sit down at that table in the corner.../", "obj_npc_room_slash_Other_10_gml_429_0");
                global.msg[8] = stringsetloc("* ... drawin' shapes in the window with your breath./", "obj_npc_room_slash_Other_10_gml_430_0");
                global.msg[9] = stringsetloc("* .../", "obj_npc_room_slash_Other_10_gml_431_0");
                global.msg[10] = stringsetloc("* You must really miss him^1, huh?/", "obj_npc_room_slash_Other_10_gml_432_0");
                global.msg[11] = stringsetloc("* ... Here^1, how about this?/", "obj_npc_room_slash_Other_10_gml_433_0");
                global.msg[12] = stringsetloc("* (Kris got the Hot Chocolate.)/", "obj_npc_room_slash_Other_10_gml_434_0");
                global.msg[13] = stringsetloc("* On the house, hun./%", "obj_npc_room_slash_Other_10_gml_435_0");
                global.flag[261] = 1;
                noroom = 0;
                scr_litemget(1);
                if (noroom == 1)
                {
                    global.flag[261] = 2;
                    global.msg[11] = stringsetloc("* ... You know^1, I'd give you a hot chocolate on the house.../", "obj_npc_room_slash_Other_10_gml_442_0");
                    global.msg[12] = stringsetloc("* ... But it looks like you've got enough things already./", "obj_npc_room_slash_Other_10_gml_443_0");
                    global.msg[13] = stringsetloc("* Take it easy^1, okay^1, hun?/%", "obj_npc_room_slash_Other_10_gml_444_0");
                }
            }
        }
        if (x > 240)
        {
        }
        if (y > 140)
        {
            if (x > 180)
            {
                global.msg[0] = stringsetloc("* So^1, for you two girls^1, that'll be the crepes^1, a cinnamon latte.../", "obj_npc_room_slash_Other_10_gml_468_0");
                global.msg[1] = stringsetloc("* Two bunny parfaits, and... a piece of firewood...?/%", "obj_npc_room_slash_Other_10_gml_469_0");
                if (talked >= 1)
                    global.msg[0] = stringsetloc("* And^1, how would you like that firewood done?/%", "obj_npc_room_slash_Other_10_gml_472_0");
            }
            if (x > 260)
            {
                global.msg[0] = stringsetloc("* Dude^1, remember when we used to skip the first hour of class to come here?/", "obj_npc_room_slash_Other_10_gml_482_0");
                global.msg[1] = stringsetloc("* YOU were fine^1, but I almost had to repeat the year 'cause of it.../", "obj_npc_room_slash_Other_10_gml_483_0");
                global.msg[2] = stringsetloc("* Those crepes were MAD worth^1, though^1! Delinquency is the best condiment!/%", "obj_npc_room_slash_Other_10_gml_484_0");
                if (talked >= 1)
                    global.msg[0] = stringsetloc("* Dude^1, if we didn't bring Gerson our leftovers^1, I bet I would have failed HARD.../%", "obj_npc_room_slash_Other_10_gml_487_0");
            }
        }
        if (sprite_index == spr_npc_most_improved_1997)
        {
            global.msg[0] = stringsetloc("* Looking at my rugged body^1, you must wonder what kind of secrets I hold.../", "obj_npc_room_slash_Other_10_gml_496_0");
            global.msg[1] = stringsetloc("* My secret is^1, I put all my leftover pancakes in this giant hat./%", "obj_npc_room_slash_Other_10_gml_497_0");
            if (talked >= 1)
                global.msg[0] = stringsetloc("* Whew^1!&* I sure love PANCAKE!/%", "obj_npc_room_slash_Other_10_gml_501_0");
        }
        if (sprite_index == spr_npc_icewolf)
        {
            global.msg[0] = stringsetloc("* Ice Wolf does not like ice in drink./", "obj_npc_room_slash_Other_10_gml_507_0");
            global.msg[1] = stringsetloc("* Ice Wolf likes ice.../", "obj_npc_room_slash_Other_10_gml_508_0");
            global.msg[2] = stringsetloc("* ... to BE drink!/%", "obj_npc_room_slash_Other_10_gml_509_0");
            if (talked >= 1)
                global.msg[0] = stringsetloc("* Ice Wolf also like ice-themed mascots./%", "obj_npc_room_slash_Other_10_gml_513_0");
        }
    }
    if (global.chapter >= 2)
    {
        if (sprite_index == spr_npc_cattiwaitress)
        {
            if (talked == 0)
            {
                global.msc = 1041;
                scr_text(global.msc);
            }
            else
            {
                global.msc = 1043;
                scr_text(global.msc);
            }
        }
        if (sprite_index == spr_npc_qc)
        {
            if (global.chapter == 4 && global.plot >= 35 && global.plot < 100)
            {
                if (scr_flag_get(701) == 0)
                {
                    global.msc = 1252;
                    scr_text(global.msc);
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* How was that? You want seconds? Well^1, the customer is always right.../", "obj_npc_room_slash_Other_10_gml_633_0");
                    msgnextloc("* But I'm sure your mother'd be mad if you ate so much without her./%", "obj_npc_room_slash_Other_10_gml_634_0");
                }
            }
            else if (global.flag[261] != 1)
            {
                if (talked == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Catti's family is always asking when her next shift is.../", "obj_npc_room_slash_Other_10_gml_542_0");
                    msgnextloc("* So they can come in and cheer her on./", "obj_npc_room_slash_Other_10_gml_543_0");
                    msgnextloc("* Never seen anything like it^1, but it's kind of nice^1, isn't it?/%", "obj_npc_room_slash_Other_10_gml_544_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* How you doin'^1, hon?/", "obj_npc_room_slash_Other_10_gml_548_0");
                    msgnextloc("* ..^1. what? Sorry^1, couldn't hear you over the noise./%", "obj_npc_room_slash_Other_10_gml_549_0");
                }
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Hey hon^1, how did you like the hot chocolate?/", "obj_npc_room_slash_Other_10_gml_563_0");
                msgnextloc("* ..^1. well^1, I'm gonna take it that means you enjoyed it./", "obj_npc_room_slash_Other_10_gml_564_0");
                msgnextloc("* Take it easy^1, okay? I'm sure your brother will be back in no time./%", "obj_npc_room_slash_Other_10_gml_565_0");
            }
        }
        if (sprite_index == spr_jockington_lt)
        {
            if (talked == 0)
            {
                scr_speaker("jockington");
                msgsetloc(0, "* Catti's^1, My friend. And./", "obj_npc_room_slash_Other_10_gml_575_0");
                msgnextloc("* I support my friends^1, through thick^1, and thin./", "obj_npc_room_slash_Other_10_gml_576_0");
                msgnextloc("* Long^1, and short. Cold^1, and hot./", "obj_npc_room_slash_Other_10_gml_577_0");
                msgnextloc("* Whatever shape^1, the world takes^1, I'll be there./%", "obj_npc_room_slash_Other_10_gml_578_0");
            }
            else
            {
                scr_speaker("jockington");
                msgsetloc(0, "* Life is a big^1, ballgame^1,/", "obj_npc_room_slash_Other_10_gml_582_0");
                msgnextloc("* And when the man is on the field./", "obj_npc_room_slash_Other_10_gml_583_0");
                msgnextloc("* He does a big dunk./", "obj_npc_room_slash_Other_10_gml_584_0");
                msgnextloc("* Try^1, to be that dunk./%", "obj_npc_room_slash_Other_10_gml_585_0");
            }
        }
        if (sprite_index == spr_npc_catti_dad_diner)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Our little Catti^1, she's doin' us proud./", "obj_npc_room_slash_Other_10_gml_595_0");
                msgnextloc("* Workin' hard. Supportin' us./", "obj_npc_room_slash_Other_10_gml_596_0");
                msgnextloc("* Servin' us pickles^1, terrifyin' us with their shape^1,/", "obj_npc_room_slash_Other_10_gml_597_0");
                msgnextloc("* Tryin' to get us to leave./", "obj_npc_room_slash_Other_10_gml_598_0");
                msgnextloc("* Proud of her./%", "obj_npc_room_slash_Other_10_gml_599_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* My favorite meal? Gotta be the catfood pancakes!/", "obj_npc_room_slash_Other_10_gml_602_0");
                msgnextloc("* And the fish with bones that looks like it's from a cartoon./%", "obj_npc_room_slash_Other_10_gml_603_0");
            }
        }
        if (sprite_index == spr_npc_ficus)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* To tell you the truth^1, I thought this was the post office.../", "obj_npc_room_slash_Other_10_gml_611_0");
            msgnextloc("* But by the time I realized..^1. I'd already sat down.../", "obj_npc_room_slash_Other_10_gml_612_0");
            msgnextloc("* I'm not hungry^1, so I've just been telling the waitress I'm still deciding for.../", "obj_npc_room_slash_Other_10_gml_613_0");
            msgnextloc("* ..^1. a few hours now. How am I supposed to get out of this one!?/%", "obj_npc_room_slash_Other_10_gml_614_0");
        }
        if (sprite_index == spr_npc_most_improved_1997_ch2)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I don't know if you noticed^1, but I've been getting stronger./", "obj_npc_room_slash_Other_10_gml_630_0");
                msgnextloc("* You could say I'm bulking up for the winter./%", "obj_npc_room_slash_Other_10_gml_631_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Oh boy^1! I love BULKING./%", "obj_npc_room_slash_Other_10_gml_635_0");
            }
        }
        if (sprite_index == spr_npc_most_improved_1997_ch4)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Notice anything different about me...? Heh./%", "obj_npc_room_slash_Other_10_gml_730_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Now that I think about it^1, I never noticed anything about you^1, either./%", "obj_npc_room_slash_Other_10_gml_734_0_b");
            }
        }
        if (sprite_index == spr_npc_aaron)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This guy next to me^1, he's really bulked up. I admire that./%", "obj_npc_room_slash_Other_10_gml_649_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I don't know if you do that^1, bulking up for the winter.../%", "obj_npc_room_slash_Other_10_gml_645_0");
            }
        }
        if (sprite_index == spr_npc_dresslion_alt)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Working here all day just makes me hungry for diner food.../", "obj_npc_room_slash_Other_10_gml_759_0");
                msgnextloc("* Good thing the new guy's letting me take a break!/%", "obj_npc_room_slash_Other_10_gml_760_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* ..^1. Come to think of it^1, did we..^1. hire? A new guy?/%", "obj_npc_room_slash_Other_10_gml_764_0");
            }
        }
        if (sprite_index == spr_npc_shamblingmass)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Garcon^1! Some mineral water^1, please^1! ..^1. and hold the water./%", "obj_npc_room_slash_Other_10_gml_773_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Garcon^1! Garcon^1! Gerson^1! Garcon!/%", "obj_npc_room_slash_Other_10_gml_777_0");
            }
        }
        if (sprite_index == spr_npc_froggit_sit_up)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Ribbit. (There's a fly in my soup.)/%", "obj_npc_room_slash_Other_10_gml_786_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Ribbit. (That guy took a fistful of butterflies from his..^1. pouch?)/", "obj_npc_room_slash_Other_10_gml_790_0");
                msgnextloc("* (And put them in my bowl. It was nice of him^1, but I didn't ask...)/%", "obj_npc_room_slash_Other_10_gml_791_0");
            }
        }
    }
}
if (room == room_town_south)
{
    if (global.chapter == 1)
    {
        if (sprite_index == spr_npc_donutcar)
        {
            global.msg[0] = stringsetloc("* H-How am I supposed to get past this blue lady...!^1?&* I'm stuck!!/", "obj_npc_room_slash_Other_10_gml_620_0");
            global.msg[1] = stringsetloc("* I-I guess I should just run away.../%", "obj_npc_room_slash_Other_10_gml_621_0");
        }
        if (sprite_index == spr_npc_snailcar)
        {
            global.msg[0] = stringsetloc("* Police Chief Undyne is supposed to be directing traffic.../", "obj_npc_room_slash_Other_10_gml_625_0");
            global.msg[1] = stringsetloc("* But all she's doing is standing in the middle of the street yelling \"GET OUT OF MY WAY!!!\"/", "obj_npc_room_slash_Other_10_gml_626_0");
            global.msg[2] = stringsetloc("* She's the best^1, huh!^1?&* I feel really directed!!!/%", "obj_npc_room_slash_Other_10_gml_627_0");
        }
    }
    if (global.chapter == 4)
    {
        if (sprite_index == spr_npc_catti_ladder)
        {
            if (scr_flag_get(767) == 0)
            {
                global.msc = 1347;
                scr_text(global.msc);
            }
            else
            {
                scr_speaker("catti");
                msgsetloc(0, "\\E3* The twin beasts approach. Leave now./", "obj_npc_room_slash_Other_10_gml_826_0_b");
                msgnextloc("\\E4* And I will curse you. Only lightly./", "obj_npc_room_slash_Other_10_gml_827_0_b");
                msgnextloc("\\E6* But bring harm to Noelle.../", "obj_npc_room_slash_Other_10_gml_828_0");
                msgnextloc("\\E3* And you will taste. The underworld's. Sickest hex./%", "obj_npc_room_slash_Other_10_gml_829_0");
            }
        }
        if (sprite_index == spr_npc_napstablook_police_ground)
        {
            global.msc = 1427;
            scr_text(global.msc);
        }
        if (sprite_index == spr_jockington_rt)
        {
            if (scr_flag_get(767) == 0)
            {
                if (talked == 0)
                {
                    scr_speaker("jockington");
                    msgsetloc(0, "* Kris^1, I see you Always^1, with Susie./", "obj_npc_room_slash_Other_10_gml_847_0");
                    msgnextloc("* Maybe Susie^1, is like a Catti^1, too you to./", "obj_npc_room_slash_Other_10_gml_848_0_b");
                    msgnextloc("* You to^1, share one lizards'^1, brain.../", "obj_npc_room_slash_Other_10_gml_849_0_b");
                    msgnextloc("* I like^1, I like!/%", "obj_npc_room_slash_Other_10_gml_850_0_b");
                }
                else
                {
                    scr_speaker("jockington");
                    msgsetloc(0, "* Which one of^1, you^1, can un^1, hinge your jaw?/%", "obj_npc_room_slash_Other_10_gml_854_0_b");
                }
            }
            else if (talked == 0)
            {
                scr_speaker("jockington");
                msgsetloc(0, "* Kris^1, we were never Close^1, but now^1, we are Far./", "obj_npc_room_slash_Other_10_gml_861_0");
                msgnextloc("* To be Susies' friend^1, is to be^1, the World's Enemy./", "obj_npc_room_slash_Other_10_gml_862_0_b");
                msgnextloc("* Which^1, is sick. I respect^1, your Game^1, Kris./", "obj_npc_room_slash_Other_10_gml_863_0_b");
                msgnextloc("* But if you hurt^1, Catti^1, or^1, Catti's feelings^1,/", "obj_npc_room_slash_Other_10_gml_864_0");
                msgnextloc("* You will be up a Ball without a Court./%", "obj_npc_room_slash_Other_10_gml_865_0");
            }
            else
            {
                scr_speaker("jockington");
                msgsetloc(0, "* Don't tell Catti^1, but I will neutralize^1, her hex^1,/", "obj_npc_room_slash_Other_10_gml_869_0");
                msgnextloc("* With my Sports's Blessing. As a mercy./", "obj_npc_room_slash_Other_10_gml_870_0");
                msgnextloc("* Run^1, Kris^1! While you still have^1, legs!/%", "obj_npc_room_slash_Other_10_gml_871_0_b");
            }
        }
        if (sprite_index == spr_npc_wrapmouse)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Kris? Remember me...? Sorry if I was too strict when I babysat you and Noelle./", "obj_npc_room_slash_Other_10_gml_881_0");
                msgnextloc("* Since then^1, Noelle's always seemed so nervous around me.../", "obj_npc_room_slash_Other_10_gml_882_0");
                msgnextloc("* ..^1. until today. She even complimented my outfit^1! I wonder what changed...?/%", "obj_npc_room_slash_Other_10_gml_883_0");
            }
            else
            {
                var side_b = scr_sideb_active();
                if (!side_b)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* And..^1. she was muttering something like..^1. \"Mice are cute\"...?/%", "obj_npc_room_slash_Other_10_gml_891_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* And..^1. she was muttering something like..^1. \"You don't scare me\"...?/%", "obj_npc_room_slash_Other_10_gml_895_0_b");
                }
            }
        }
    }
}
if (room == room_town_mid)
{
    if (sprite_index == spr_npc_burgerpants)
    {
        global.msc = 340;
        scr_text(global.msc);
    }
    if (sprite_index == spr_mkid_dt)
    {
        global.msg[0] = stringsetloc("* Yo^1, Kris^1!&* You survived Susie^1, haha!/", "obj_npc_room_slash_Other_10_gml_691_0");
        global.msg[1] = stringsetloc("* I mean^1, I never saw her beat anyone up^1, but^1, uh^1, I'd be careful./", "obj_npc_room_slash_Other_10_gml_692_0");
        global.msg[2] = stringsetloc("* Like^1, one time me^1, Snowy^1, and Jockington were playing handball,/", "obj_npc_room_slash_Other_10_gml_693_0");
        global.msg[3] = stringsetloc("* And she just kept creepily watching us from the corner./", "obj_npc_room_slash_Other_10_gml_694_0");
        global.msg[4] = stringsetloc("* Then^1, when the ball rolled over to her she just^1, uh^1, froze solid.../", "obj_npc_room_slash_Other_10_gml_695_0");
        global.msg[5] = stringsetloc("* ... and kicked the ball as hard as she could^1, right into Officer Undyne's car!/", "obj_npc_room_slash_Other_10_gml_696_0");
        global.msg[6] = stringsetloc("* Then^1, Undyne came out^1, smiling^1, cracked her knuckles^1, and totally wiped us at handball.../", "obj_npc_room_slash_Other_10_gml_697_0");
        global.msg[7] = stringsetloc("* Anyway^1, Susie sucks^1, Kris^1, haha. /%", "obj_npc_room_slash_Other_10_gml_698_0");
        if (talked >= 1)
        {
            global.msg[0] = stringsetloc("* Yo^1, Kris^1, you look kind of annoyed^1.&* Everything OK?/", "obj_npc_room_slash_Other_10_gml_702_0");
            global.msg[1] = stringsetloc("* You can calm down now^1, dude^1! Susie's not here^1, haha!/", "obj_npc_room_slash_Other_10_gml_703_0");
            global.msg[2] = stringsetloc("* ... Huh^1?&* You look even more annoyed.../%", "obj_npc_room_slash_Other_10_gml_704_0");
        }
    }
    if (sprite_index == spr_snowy_dt)
    {
        global.msg[0] = stringsetloc("* HOOH!^1!&* You're lucky^1, Kris!! /", "obj_npc_room_slash_Other_10_gml_710_0");
        global.msg[1] = stringsetloc("* You got to miss class with Alphys^1! It's not fair^1! Ha ha ha^1!/", "obj_npc_room_slash_Other_10_gml_711_0");
        global.msg[2] = stringsetloc("* If I skipped class^1, my dad'd never let me hear the end of it!!^1! Ha ha ha!!!/", "obj_npc_room_slash_Other_10_gml_712_0");
        global.msg[3] = stringsetloc("* ... That's actually not even remotely funny./%", "obj_npc_room_slash_Other_10_gml_713_0");
    }
    if (global.chapter >= 2)
    {
        if (sprite_index == spr_npc_snailcar)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This is a great parking place!/", "obj_npc_room_slash_Other_10_gml_765_0");
                msgnextloc("* I can see myself settling down here.../%", "obj_npc_room_slash_Other_10_gml_766_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Home is where the car is!/%", "obj_npc_room_slash_Other_10_gml_770_0");
            }
        }
        if (sprite_index == spr_npc_donutcar)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I just wanna go home^1, but I'm still stuck in a traffic jam.../", "obj_npc_room_slash_Other_10_gml_779_0");
                msgnextloc("* ..^1. even though it's only one other person.../%", "obj_npc_room_slash_Other_10_gml_780_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* That's the trouble with cars./", "obj_npc_room_slash_Other_10_gml_784_0");
                msgnextloc("* If you wanna do donuts^1, you have to be prepared for jam!/%", "obj_npc_room_slash_Other_10_gml_785_0");
            }
        }
        if (sprite_index == spr_npc_scarflady)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* You kids came out of the library^1, didn't you? Studying..^1. How wonderful./", "obj_npc_room_slash_Other_10_gml_794_0");
                msgnextloc("* Personally^1, I hate libraries^1, but.../%", "obj_npc_room_slash_Other_10_gml_795_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Libraries are outdated. We have things like newspapers now./%", "obj_npc_room_slash_Other_10_gml_799_0");
            }
        }
        if (global.chapter == 4)
        {
            if (sprite_index == spr_npc_burgerpants_stand)
            {
                global.msc = 1353;
                scr_text(global.msc);
            }
            if (sprite_index == spr_npc_burgerpants_stand_rain)
            {
                global.msc = 1355;
                scr_text(global.msc);
            }
            if (sprite_index == spr_npc_ficus)
            {
                if (talked == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Yesterday^1, I ended up dining and dashing out of embarrassment./", "obj_npc_room_slash_Other_10_gml_1002_0");
                    msgnextloc("* So I'm here to pay the waitress^1, but she's not working^1! She's..^1. over there!/%", "obj_npc_room_slash_Other_10_gml_1003_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Now I have to stay perfectly still..^1. In case she notices me if I move./%", "obj_npc_room_slash_Other_10_gml_1007_0");
                }
            }
            if (sprite_index == spr_npc_nicecream_phone)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* .../%", "obj_npc_room_slash_Other_10_gml_1014_0");
                if (scr_flag_get(777) < 2)
                {
                    scr_flag_set(777, 2);
                    with (obj_town_burgerpants)
                        nice_con = 0;
                    exit;
                }
            }
        }
    }
}
if (room == room_town_north)
{
    if (sprite_index == spr_npc_catty)
    {
        global.fc = 16;
        global.typer = 5;
        global.msc = 215;
        scr_text(global.msc);
    }
    if (sprite_index == spr_npc_cattydad)
    {
        if (talked == 0)
        {
            global.msg[0] = stringsetloc("* Hey neighbor-beighbor^1! When's yah brother Doug gonna come by^1? Huh huh huh!/", "obj_npc_room_slash_Other_10_gml_731_0");
            global.msg[1] = stringsetloc("* My girls'd love to see him^1! He's a sweet little man!/", "obj_npc_room_slash_Other_10_gml_732_0");
            global.msg[2] = stringsetloc("* He's just got one problem..^1.&* He doesn't like my wife's cookin'!/", "obj_npc_room_slash_Other_10_gml_733_0");
            global.msg[3] = stringsetloc("* What's wrong^1, Douglas^1?&* You don't like frozen cat food^1? Huh huh huh!/%", "obj_npc_room_slash_Other_10_gml_734_0");
        }
        else
        {
            global.msg[0] = stringsetloc("* Can't blame yah brother for leavin' town./", "obj_npc_room_slash_Other_10_gml_738_0");
            global.msg[1] = stringsetloc("* He's out there^1, gettin' a big brain in the big school./", "obj_npc_room_slash_Other_10_gml_739_0");
            global.msg[2] = stringsetloc("* Hope when he becomes a big shot^1, he remembers us little guys down the street./", "obj_npc_room_slash_Other_10_gml_740_0");
            global.msg[3] = stringsetloc("* Eatin' oranges and gettin' our stomachs pumped./%", "obj_npc_room_slash_Other_10_gml_741_0");
        }
    }
    if (sprite_index == spr_npc_bratty)
    {
        global.fc = 17;
        global.typer = 5;
        global.msc = 220;
        scr_text(global.msc);
    }
    if (global.chapter >= 2)
    {
        if (sprite_index == spr_smallfrog)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Ribbit^1, ribbit./", "obj_npc_room_slash_Other_10_gml_848_0");
                msgnextloc("* (I sometimes hear beautiful singing from that house over there.)/", "obj_npc_room_slash_Other_10_gml_849_0");
                msgnextloc("* (How eerie..^1. could it be a ghost?)/%", "obj_npc_room_slash_Other_10_gml_850_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Ribbit./", "obj_npc_room_slash_Other_10_gml_854_0");
                msgnextloc("* (That would make sense. A ghost lives there.)/%", "obj_npc_room_slash_Other_10_gml_855_0");
            }
        }
        if (sprite_index == spr_npc_bunbun)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* My brother's too old to take for a walk anymore..^1. hm.../", "obj_npc_room_slash_Other_10_gml_862_0");
            msgnextloc("* I'm aimless..^1. wish I had someone to whip me into shape./%", "obj_npc_room_slash_Other_10_gml_863_0");
        }
        if (sprite_index == spr_npc_mikewazowski)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I wanted to buy flowers^1, but the store's closed./", "obj_npc_room_slash_Other_10_gml_871_0");
                msgnextloc("* The door around back's unlocked^1, but I don't think I should go in.../%", "obj_npc_room_slash_Other_10_gml_872_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I saw a bed through the back window..^1. Wonder what the deal is./%", "obj_npc_room_slash_Other_10_gml_876_0");
            }
        }
        if (sprite_index == spr_npc_manticore)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* That Asgore guy..^1. It's a shame he lost everything after he..^1. You know./", "obj_npc_room_slash_Other_10_gml_1107_0");
                msgnextloc("* Now he has to sell flowers to make ends meet^1, but..^1. What? He's your father? Sorry./%", "obj_npc_room_slash_Other_10_gml_1108_0_b");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Well^1, I hope for your sake he quits being so..^1. obsessed with that stuff./%", "obj_npc_room_slash_Other_10_gml_1112_0_b");
            }
        }
    }
}
if (room == room_town_church)
{
    if (global.chapter == 1)
    {
        global.msc = 345;
        scr_text(global.msc);
    }
    if (global.chapter >= 2)
    {
        if (sprite_index == spr_npc_terry)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I'm not Jerry. I'm Terry./", "obj_npc_room_slash_Other_10_gml_895_0");
            msgnextloc("* I'm super cool./", "obj_npc_room_slash_Other_10_gml_896_0");
            msgnextloc("* I totally DON'T have to go to the bathroom./%", "obj_npc_room_slash_Other_10_gml_897_0");
        }
        if (sprite_index == spr_npc_icecap_r || sprite_index == spr_npc_icecap_g || sprite_index == spr_npc_icecap_b)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Oh!!^1! Terry!^1! Say it again!!/", "obj_npc_room_slash_Other_10_gml_903_0");
            msgnextloc("* Say you don't have to go to the bathroom again!!/%", "obj_npc_room_slash_Other_10_gml_904_0");
        }
        if (sprite_index == spr_npc_rgbun)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Nothing like admiring the great paint job^1, me and my bro did on our church./%", "obj_npc_room_slash_Other_10_gml_910_0");
        }
        if (sprite_index == spr_npc_rgdragon)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* ...^1. missed a spot./%", "obj_npc_room_slash_Other_10_gml_916_0");
        }
        if (sprite_index == spr_npc_rabbitkid)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* We tried to play baseball^1, but that kid kept dancing in the middle of the lot./", "obj_npc_room_slash_Other_10_gml_924_0");
                msgnextloc("* I..^1. don't feel like there's any way to stop him.../%", "obj_npc_room_slash_Other_10_gml_925_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* If I can't stop him..^1. Should I join him? No..^1. no./%", "obj_npc_room_slash_Other_10_gml_929_0");
            }
        }
        if (global.chapter == 4)
        {
            if (sprite_index == spr_npc_milklooker)
            {
                if (talked == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Ummmmmmmmmmmmmmm^3 that was awkward/%", "obj_npc_room_slash_Other_10_gml_1176_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Freak freak freak family&* Freak family (your family)/%", "obj_npc_room_slash_Other_10_gml_1180_0");
                }
            }
        }
    }
}
if (room == room_hospital_lobby)
{
    if (global.chapter == 1)
    {
        global.msg[0] = stringsetloc("* Oh^1, it's you^1.&* Are you here to play the piano again?/", "obj_npc_room_slash_Other_10_gml_796_0");
        global.msg[1] = stringsetloc("* The patients can't hear it well from here^1, but I personally enjoy it./%", "obj_npc_room_slash_Other_10_gml_797_0");
        if (talked >= 1)
        {
            global.msg[0] = stringsetloc("* Sometimes the police chief comes in to play the piano./", "obj_npc_room_slash_Other_10_gml_801_0");
            global.msg[1] = stringsetloc("* Her playing is nice^1, but when she starts singing.../", "obj_npc_room_slash_Other_10_gml_802_0");
            global.msg[2] = stringsetloc("* We have to ask her to leave./%", "obj_npc_room_slash_Other_10_gml_803_0");
        }
        if (tempvar >= 1)
        {
            global.msg[0] = stringsetloc("* Hmmm..^1. you usually play the piano a bit more..^1. beautifully./", "obj_npc_room_slash_Other_10_gml_809_0");
            global.msg[1] = stringsetloc("* Is everything OK^1?&* You DO seem a little sick.../%", "obj_npc_room_slash_Other_10_gml_810_0");
        }
    }
    if (global.chapter >= 2)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Here to make an appointment...?/", "obj_npc_room_slash_Other_10_gml_962_0");
            scr_anyface_next("susie", "0");
            msgnextloc("\\E0* Nah^1, just here to hang out./", "obj_npc_room_slash_Other_10_gml_964_0");
            scr_anyface_next("no_name", 0);
            msgnextloc("* ..^1. I see./%", "obj_npc_room_slash_Other_10_gml_966_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Should I pencil you in for hanging out?/%", "obj_npc_room_slash_Other_10_gml_970_0");
        }
        if (global.chapter == 4)
        {
            if (scr_flag_get(457) == 0)
            {
                if (scr_flag_get(349) > 0)
                {
                    if (talked == 0)
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* Ah^1, your friend? He's still.../", "obj_npc_room_slash_Other_10_gml_1247_0");
                        msgnextloc("* In any case^1, thank you for bringing him in yesterday./%", "obj_npc_room_slash_Other_10_gml_1248_0");
                    }
                    else
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* .../%", "obj_npc_room_slash_Other_10_gml_1252_0");
                    }
                }
                else if (talked == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Ah^1, your friend is in here. Something^1, something^1, his arm./%", "obj_npc_room_slash_Other_10_gml_1259_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* He can't even pick up books!/%", "obj_npc_room_slash_Other_10_gml_1263_0");
                }
            }
            else if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Hum^1, back again? You come here a lot for someone who isn't sick./%", "obj_npc_room_slash_Other_10_gml_1271_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* That being said^1, your mother was concerned for your health.../%", "obj_npc_room_slash_Other_10_gml_1275_0");
            }
        }
    }
}
if (room == room_beach)
{
    if (global.chapter == 1)
    {
        if (sprite_index == spr_npc_rgbun)
        {
            global.msg[0] = stringsetloc("* Nothin' better than hangin' at the lake with my best bro.../", "obj_npc_room_slash_Other_10_gml_821_0");
            global.msg[1] = stringsetloc("* Watchin' the waves go by.../%", "obj_npc_room_slash_Other_10_gml_822_0");
        }
        if (sprite_index == spr_npc_rgdragon)
        {
            global.msg[0] = stringsetloc("* .../", "obj_npc_room_slash_Other_10_gml_826_0");
            global.msg[1] = stringsetloc("* ... true./%", "obj_npc_room_slash_Other_10_gml_827_0");
        }
    }
    if (global.chapter == 4)
    {
        if (sprite_index == spr_normalnpc)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Don't wait^1, don't wait./", "obj_npc_room_slash_Other_10_gml_1305_0");
                msgnextloc("* Especially^1, the don't./%", "obj_npc_room_slash_Other_10_gml_1306_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Wait^1, don't. Wait..^1. don't!!!/%", "obj_npc_room_slash_Other_10_gml_1310_0");
            }
        }
    }
}
if (room == room_lw_icee_pizza)
{
    if (sprite_index == spr_burgerpants_sit_phone)
    {
        global.msc = 1020;
        scr_text(global.msc);
    }
    if (sprite_index == spr_npc_nicecream_mop)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Wow^1, my co-worker seems so energetic lately!!/", "obj_npc_room_slash_Other_10_gml_1031_0");
        msgnextloc("* I don't know what's happened^1, but..../", "obj_npc_room_slash_Other_10_gml_1032_0");
        msgnextloc("* Seeing him happy makes me happy too!!/", "obj_npc_room_slash_Other_10_gml_1033_0");
        msgnextloc("* Oh!!^1! A customer!^1! Would you like a blue soft-serve!?/%", "obj_npc_room_slash_Other_10_gml_1034_0");
    }
    if (sprite_index == spr_npc_icewolf)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Double-Ice pizza..^1. great!/", "obj_npc_room_slash_Other_10_gml_1042_0");
            msgnextloc("* Ice Wolf^1, big customer!/", "obj_npc_room_slash_Other_10_gml_1043_0");
            msgnextloc("* ..^1. Ice Wolf^1, maybe only customer./%", "obj_npc_room_slash_Other_10_gml_1044_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ice Wolf^1, thinks ICE-E is cute./", "obj_npc_room_slash_Other_10_gml_1048_0");
            msgnextloc("* Ice Wolf^1, big fan.../%", "obj_npc_room_slash_Other_10_gml_1049_0");
        }
    }
}
if (room == room_lw_police)
{
    if (sprite_index == spr_npc_napstablook_police_down)
    {
        var dogchase = global.flag[317] != 0;
        if (dogchase)
        {
            if (global.flag[317] != 2)
            {
                with (obj_npc_napstablook_cop)
                    con = 0;
                scr_speaker("napstablook");
                msgsetloc(0, "* oh....^1. jailbreak..../", "obj_npc_room_slash_Other_10_gml_1067_0");
                msgnextloc("* i'll sound the alarm..../%", "obj_npc_room_slash_Other_10_gml_1068_0");
            }
            else
            {
                scr_speaker("napstablook");
                msgsetloc(0, "* i made the jailbreak alarm my mixtape.../", "obj_npc_room_slash_Other_10_gml_1071_0");
                msgnextloc("* it's a nice beat to study or relax to while you escape from prison/%", "obj_npc_room_slash_Other_10_gml_1072_0");
            }
        }
        else if (talked == 0)
        {
            scr_speaker("napstablook");
            msgsetloc(0, "* (oh no...^1. i accidentally ended up as a police officer...)/", "obj_npc_room_slash_Other_10_gml_1078_0");
            msgnextloc("* (oh no...^1. i can't quit because my cousins are relying on me...)/", "obj_npc_room_slash_Other_10_gml_1079_0");
            msgnextloc("* oh..^1. hey.../", "obj_npc_room_slash_Other_10_gml_1080_0");
            msgnextloc("* don't do anything illegal..^1. please.../%", "obj_npc_room_slash_Other_10_gml_1081_0");
        }
        else
        {
            scr_speaker("napstablook");
            msgsetloc(0, "* oh..^1. sorry..^1. did i intimidate you too much.../", "obj_npc_room_slash_Other_10_gml_1085_0");
            msgnextloc("* oh..../", "obj_npc_room_slash_Other_10_gml_1086_0");
            msgnextloc("* it's ok to do a little crime sometimes./", "obj_npc_room_slash_Other_10_gml_1087_0");
            msgnextloc("* like if you eat candy off the floor.../", "obj_npc_room_slash_Other_10_gml_1088_0");
            msgnextloc("* even after 5 seconds.../", "obj_npc_room_slash_Other_10_gml_1089_0");
            msgnextloc("* i won't arrest you./%", "obj_npc_room_slash_Other_10_gml_1090_0");
        }
    }
}
if (room == room_lw_conbini)
{
    if (x > 150)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Yea i'm tha sicko that looks at all the milks to find the best expiration date/", "obj_npc_room_slash_Other_10_gml_1103_0");
            msgnextloc("* You got something about it?/%", "obj_npc_room_slash_Other_10_gml_1104_0");
        }
        else if (global.flag[308] == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Don't talk to me unless you want to look at milk/%", "obj_npc_room_slash_Other_10_gml_1110_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Can your family not come in here when I'm looking at milk/%", "obj_npc_room_slash_Other_10_gml_1114_0");
        }
    }
    if (sprite_index == spr_npc_diamond_tallboy)
    {
        msgsetloc(0, "* Sometimes the hoofed girl comes here^1,/", "obj_npc_room_slash_Other_10_gml_1121_0");
        msgnextloc("* Opens the freezer door.../", "obj_npc_room_slash_Other_10_gml_1122_0");
        msgnextloc("* Then stands in front of it^1, lost in thought./", "obj_npc_room_slash_Other_10_gml_1123_0");
        msgnextloc("* Guess she really likes the cold. Or waffles./%", "obj_npc_room_slash_Other_10_gml_1124_0");
    }
}
if (room == room_alphysalley)
{
    if (global.chapter < 4)
    {
        global.msc = 1037;
        scr_text(global.msc);
    }
    else
    {
        if (sprite_index == spr_npc_milklooker)
        {
            if (global.plot < 100)
            {
                if (talked == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Don't drag me into this I'm just looking (at milk)/%", "obj_npc_room_slash_Other_10_gml_1439_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* You're dragging me into it stop/%", "obj_npc_room_slash_Other_10_gml_1443_0");
                }
            }
            else if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* The milk is getting diluted/%", "obj_npc_room_slash_Other_10_gml_1450_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Don't just stand there do something/%", "obj_npc_room_slash_Other_10_gml_1454_0");
            }
        }
        if (sprite_index == spr_alley_milk)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Milk.)&* (You can see it going from 2`% to 1`%.)/%", "obj_npc_room_slash_Other_10_gml_1462_0_b");
        }
    }
}
if (room == room_cc_lancer)
{
    if (global.chapter == 2)
    {
        if (talked == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E9* Lancer!^1! Hey^1, Lancer!^1! How you feeling!?/", "obj_npc_room_slash_Other_10_gml_1106_0");
            scr_anyface_next("lancer", 3);
            msgnextloc("\\E3* (huff^1, puff...) One-hundred percent^1, my purplish pal!/", "obj_npc_room_slash_Other_10_gml_1108_0");
            scr_anyface_next("susie", 20);
            msgnextloc("\\EK* Uhh^1, you sure? You're breathing kinda heavy./", "obj_npc_room_slash_Other_10_gml_1110_0_b");
            scr_anyface_next("lancer", 2);
            msgnextloc("\\E2* Haha^1! Just a little winded from jumping from Kris's POCKET!/", "obj_npc_room_slash_Other_10_gml_1112_0");
            msgnextloc("\\E3* Feel free to clown around town. I'll be in your ITEMs!/", "obj_npc_room_slash_Other_10_gml_1113_0");
            scr_anyface_next("susie", 10);
            msgnextloc("\\EA* No idea what you mean^1, but^1, sure./%", "obj_npc_room_slash_Other_10_gml_1115_0");
        }
        else
        {
            scr_speaker("lancer");
            if (scr_sideb_get_phase() > 0)
                msgsetloc(0, "\\E3* Susie^1, Susie^1! Can you carry me on your back?/", "obj_npc_room_slash_Other_10_gml_1121_0_c");
            else
                msgsetloc(0, "\\E3* Susie^1, Susie^1! Can you carry me on your back again?/", "obj_npc_room_slash_Other_10_gml_1119_0");
            scr_anyface_next("susie", 34);
            msgnextloc("\\EY* Heh^1, sure^1! If you can stay on when I'm at full speed!/", "obj_npc_room_slash_Other_10_gml_1121_0_b");
            scr_anyface_next("lancer", 1);
            msgnextloc("\\E1* Wow!^1! The Susie-train!^1! Castle Town's most exciting attraction!!!/", "obj_npc_room_slash_Other_10_gml_1123_0_b");
            scr_anyface_next("ralsei", 19);
            msgnextloc("\\EJ* .../", "obj_npc_room_slash_Other_10_gml_1125_0");
            scr_anyface_next("susie", 17);
            msgnextloc("\\EH* YOU AND KRIS STOP FORMING A LINE!!/%", "obj_npc_room_slash_Other_10_gml_1127_0");
        }
    }
    if (global.chapter == 4)
    {
        if (sprite_index == spr_npc_lancer_construction)
        {
            if (scr_flag_get(788) == 0 && scr_get_total_recruits(2) > 0)
            {
                scr_flag_set(788, 1);
                with (obj_room_castle_lancer)
                    con = 10;
                exit;
            }
            else
            {
                scr_speaker("lancer");
                msgsetloc(0, "\\E0* Susie? Can you enrich my enclosure?/", "obj_npc_room_slash_Other_10_gml_1519_0");
                scr_anyface_next("susie", 20);
                msgnextloc("\\EK* Uhh^1, I can punch a hole in drywall and hide toys inside./", "obj_npc_room_slash_Other_10_gml_1521_0");
                scr_anyface_next("lancer", 3);
                msgnextloc("\\E3* Thank you. Someday^1, I will do the same for you.../%", "obj_npc_room_slash_Other_10_gml_1523_0_c");
            }
        }
        if (sprite_index == spr_npc_mr_elegance_construction)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Me'n the prince-king are buildin' enrichment enclosures for'n the townsfolks./", "obj_npc_room_slash_Other_10_gml_1532_0");
                scr_anyface_next("ralsei", 30);
                msgnextloc("\\EU* Wow^1, what a great normal nice thing to do!/%", "obj_npc_room_slash_Other_10_gml_1534_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Maybe if'n I built a gosh-old isolation'in chamber^1, Mr. Society'n come back..^1. N'heh./%", "obj_npc_room_slash_Other_10_gml_1538_0_b");
            }
        }
        if (sprite_index == spr_dogdozer)
        {
            if (!snd_is_playing(snd_carhonk))
                snd_play(snd_carhonk);
            scr_speaker("no_name");
            msgsetloc(0, "* (The bulldozer is receiving enrichment from its surroundings.)/%", "obj_npc_room_slash_Other_10_gml_1550_0");
        }
    }
}
if (room == room_dw_castle_dungeon)
{
    if (sprite_index == spr_npc_gouldensam && x > 60 && x < 100)
    {
        msgsetloc(0, "* (I'm Goulden Sam.)/%", "obj_npc_room_slash_Other_10_gml_975_0");
        if (global.chapter == 4)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I'm Goulden Sam./", "obj_npc_room_slash_Other_10_gml_1564_0");
            msgnextloc("* I'm going to leave soon^1, too./%", "obj_npc_room_slash_Other_10_gml_1565_0_b");
        }
    }
    if (sprite_index == spr_npc_gouldensam && x > 100)
    {
        msgsetloc(0, "* (This is a nice prison!)/%", "obj_npc_room_slash_Other_10_gml_1168_0");
        if (global.chapter == 4)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* The kings and animals left to seek their fortune./", "obj_npc_room_slash_Other_10_gml_1576_0");
            msgnextloc("* What a drag^1, what a drag./%", "obj_npc_room_slash_Other_10_gml_1577_0");
        }
    }
    if (sprite_index == spr_npc_cage_king_castle)
    {
        msgsetloc(0, "* We're still behind bars for some reason^1, but it's OK!/", "obj_npc_room_slash_Other_10_gml_1173_0");
        msgnextloc("* We've grown to love this hellish place^1, where we dress as animals!/%", "obj_npc_room_slash_Other_10_gml_1174_0");
    }
    if (sprite_index == spr_npc_cage_animals_castle)
        msgsetloc(0, "* (We decided to dress as kings. It's cultural exchange.)/%", "obj_npc_room_slash_Other_10_gml_1179_0");
    if (sprite_index == spr_npc_cage_king_alone)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Hark^1! The other kings realized you can just..^1. go out the back of this thing!/", "obj_npc_room_slash_Other_10_gml_1597_0");
            msgnextloc("* Pish and posh^1! Was I really the only one serious about being imprisoned!?/", "obj_npc_room_slash_Other_10_gml_1598_0");
            msgnextloc("* That's fine^1! Goulden Sam (the cage whose head you can talk to) and I are FINE!/%", "obj_npc_room_slash_Other_10_gml_1599_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I was the only one serious about dressing up as an animal^1, too!/%", "obj_npc_room_slash_Other_10_gml_1603_0");
        }
    }
    if (sprite_index == spr_dw_castle_crown)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Only a single crown remains...)/%", "obj_npc_room_slash_Other_10_gml_1613_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's not even one of the better crowns.)/%", "obj_npc_room_slash_Other_10_gml_1617_0");
        }
    }
}
if (room == room_dw_ralsei_castle_front)
{
    if (sprite_index == spr_ballperson)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a bit scary moving to a new place. But^1, as a ball...)/", "obj_npc_room_slash_Other_10_gml_1427_0");
        msgnextloc("* (There's nothing to sphere except sphere itself.)/%", "obj_npc_room_slash_Other_10_gml_1428_0");
    }
    if (sprite_index == spr_npc_ballperson_wig)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (With this windfall^1, I've ceased to be spherical.)/", "obj_npc_room_slash_Other_10_gml_1434_0");
        msgnextloc("* (Nubert..^1. you're one-of-a-kind.)/%", "obj_npc_room_slash_Other_10_gml_1435_0");
    }
    if (sprite_index == spr_npc_jackperson_hat)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Ho ho!^1! Who is this guy!^1! He's scary!!/%", "obj_npc_room_slash_Other_10_gml_1455_0");
    }
    if (sprite_index == spr_npc_nubert)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Nubert's had a wild ride. Time to settle down./", "obj_npc_room_slash_Other_10_gml_1462_0");
        msgnextloc("* Give my riches to the weak.../%", "obj_npc_room_slash_Other_10_gml_1463_0");
    }
}
if (room == room_dw_castle_town)
{
    if (extflag == "rudinn")
    {
        if (scr_flag_get(1532) == 0)
        {
            scr_flag_set(1532, 1);
            jpspecial = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* Oho. Welcome home./", "obj_npc_room_slash_Other_10_gml_1661_0");
            msgnextsubloc("* Things have changed again here in ~1Town!/", global.truename, "obj_npc_room_slash_Other_10_gml_1662_0_b");
            if (scr_recruited_all_previous())
            {
                msgnextloc("* Your Town's love is \\cYStrong\\cW./", "obj_npc_room_slash_Other_10_gml_1666_0");
                msgnextloc("* Beauty grows in your heart. Let's see to a merciful life!/%", "obj_npc_room_slash_Other_10_gml_1667_0_b");
            }
            else if (scr_flag_get(914) == 0)
            {
                msgnextloc("* Your Town's love is \\cYPlain\\cW./", "obj_npc_room_slash_Other_10_gml_1670_0");
                msgnextloc("* This is a familiar place^1, yet you look like you only just got here./", "obj_npc_room_slash_Other_10_gml_1671_0");
                msgnextloc("* From here^1, let your love grow. All right./%", "obj_npc_room_slash_Other_10_gml_1672_0");
            }
            else
            {
                msgnextloc("* Your Town's love is \\cOCracked\\cW./", "obj_npc_room_slash_Other_10_gml_1675_0");
                msgnextloc("* Perhaps you don't treasure this place so much./", "obj_npc_room_slash_Other_10_gml_1676_0");
                msgnextloc("* But it treasures you. Whatever you do./%", "obj_npc_room_slash_Other_10_gml_1677_0");
            }
        }
        else
        {
            scr_speaker("your");
            msgsetloc(0, "* Ah^1, do I look different? Sorry^1, I'm just me./", "obj_npc_room_slash_Other_10_gml_1682_0");
            msgnextloc("* My color must've faded. Pay it no mind!/%", "obj_npc_room_slash_Other_10_gml_1683_0");
        }
    }
    else if (extflag == "watercooler_rudinn")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* This guy really annoys me. Just because he's a higher level.../", "obj_npc_room_slash_Other_10_gml_1688_0");
        msgnextloc("* ..^1. he thinks he can chat up the watercooler..^1. get real./%", "obj_npc_room_slash_Other_10_gml_1689_0");
    }
    else if (extflag == "watercooler_rudinn_ranger")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Oh^1, Commander^1! Ahem^1, what lovely amenities you have provided!/", "obj_npc_room_slash_Other_10_gml_1695_0_b");
            msgnextloc("* Would you like a sip of water? It's delicious^1, as expected./%", "obj_npc_room_slash_Other_10_gml_1696_0_b");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I guarantee it^1! I just drank directly out of the tap!/%", "obj_npc_room_slash_Other_10_gml_1700_0");
        }
    }
    else if (extflag == "watercooler")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It seems visibly agitated.)/%", "obj_npc_room_slash_Other_10_gml_1705_0");
    }
}
if (room == room_dw_castle_cafe)
{
    if (sprite_index == spr_topchef)
    {
        global.msc = 1099;
        scr_text(global.msc);
    }
    if (sprite_index == spr_diamond_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Hey^1, boss^1! I'll have a Dark Candy Starfait!/%", "obj_npc_room_slash_Other_10_gml_1626_0");
    }
    if (sprite_index == spr_heartenemy_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Hathy is going to order a heart-foam latte.)/%", "obj_npc_room_slash_Other_10_gml_1632_0");
    }
    if (sprite_index == spr_jigsawry_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Lemonade? ..^1. Please./%", "obj_npc_room_slash_Other_10_gml_1638_0");
    }
    if (sprite_index == spr_ponman_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like it wants to osmose some flavorful cubes.)/%", "obj_npc_room_slash_Other_10_gml_1644_0");
    }
    if (sprite_index == spr_npc_rabbick_clean)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like it wants to be dabbed with rubbing alcohol.)/%", "obj_npc_room_slash_Other_10_gml_1650_0");
    }
    if (sprite_index == spr_blockguy_spared)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Everything tastes better with a normally-shaped body!/%", "obj_npc_room_slash_Other_10_gml_1656_0");
    }
    if (sprite_index == spr_diamond_knight_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Boss...? You're treating me...? Oh^1, you shouldn't have^1! (smile)/%", "obj_npc_room_slash_Other_10_gml_1662_0");
    }
    if (sprite_index == spr_hathyx_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Head Hathy drinks an ice tea in silence...)/%", "obj_npc_room_slash_Other_10_gml_1668_0");
    }
    if (global.chapter >= 2)
    {
        if (sprite_index == spr_npc_swatchling_cafe || sprite_index == spr_npc_swatchling_cafe_neko)
        {
            global.msc = 1135;
            scr_text(global.msc);
        }
        if (sprite_index == spr_npc_swatchling_down)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Good evening^1, boss^1. Today's meal is Crisped `#E23D28./", "obj_npc_room_slash_Other_10_gml_1722_0");
            msgnextloc("* It's been deep-fried with the finest JPEG artifacting.../", "obj_npc_room_slash_Other_10_gml_1723_0");
            msgnextloc("* I hope it suits your palette..^1. er^1, palate./%", "obj_npc_room_slash_Other_10_gml_1724_0");
        }
        if (sprite_index == spr_npc_tasquemanager)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Boss^1, this Cafe is so unrefined. So plain./", "obj_npc_room_slash_Other_10_gml_1729_0");
            msgnextloc("* Why don't we make it into an animal cafe?/", "obj_npc_room_slash_Other_10_gml_1730_0");
            msgnextloc("* ..^1. you can be one of the animals^1, too^1, boss./%", "obj_npc_room_slash_Other_10_gml_1731_0");
            if (i_ex(obj_npc_castle_cafe))
            {
                with (obj_npc_castle_cafe)
                    tm_con = 1;
            }
        }
        if (sprite_index == spr_maus_idle)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Seems well behaved.)/%", "obj_npc_room_slash_Other_10_gml_1737_0");
        }
        if (sprite_index == spr_tasque_idle)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Seems well behaved.)/%", "obj_npc_room_slash_Other_10_gml_1743_0");
            if (i_ex(obj_npc_castle_cafe))
            {
                with (obj_npc_castle_cafe)
                    t_con = 1;
            }
        }
        if (sprite_index == spr_poppup_idle)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* RIKO RIKO!/%", "obj_npc_room_slash_Other_10_gml_1749_0");
        }
    }
}
if (room == room_dw_castle_restaurant)
{
    if (sprite_index == spr_lancer_lt_mustache)
    {
        global.msc = 1103;
        scr_text(global.msc);
    }
    if (sprite_index == spr_topchef)
    {
        skip = false;
        var spintype = 0;
        if (global.flag[253] == 1)
        {
            if (!scr_itemcheck(7) && !scr_itemcheck_pocket(7))
            {
                spintype = 1;
                skip = true;
                with (instance_create(0, 0, obj_marker_fancy))
                {
                    dad = other;
                    con = 0;
                    gotitem = false;
                    
                    draw_func = function()
                    {
                    };
                    
                    step_func = function()
                    {
                        if (con == 0)
                        {
                            global.msc = -99;
                            global.choice = -1;
                            option1 = "#" + stringsetloc("SpinCake", "scr_itemnamelist_slash_scr_itemnamelist_gml_26_0");
                            option2 = "#" + stringsetloc("Nothing", "scr_text_slash_scr_text_gml_10579_0");
                            global.choicemsg = [option1, option2];
                            global.interact = 1;
                            scr_speaker("no_name");
                            msgsetloc(0, "* Lightners only want one thing and it's disgusting. I mean delicious./", "obj_npc_room_slash_Other_10_gml_1874_0_b");
                            msgnext("\\C2");
                            d_make();
                            con = 1;
                        }
                        if (con == 1)
                        {
                            if (dad.image_index <= 10)
                                dad.image_index += 0.25;
                            if (instance_exists(obj_choicer_neo))
                                dad.image_index = 0;
                        }
                        if (con == 1 && global.choice != -1)
                        {
                            dad.image_index = 0;
                            if (global.choice == 0)
                            {
                                k_d(2);
                                var haveroom = scr_pocketspace() + scr_inventoryspace();
                                show_debug_message_concat(haveroom);
                                if (!haveroom)
                                {
                                    scr_speaker("no_name");
                                    msgsetloc(0, "* Oh^1, miba^1, oh mama^1! No rooms in your pockets!? What's in there!?/", "obj_npc_room_slash_Other_10_gml_1895_0");
                                    msgnextloc("* Boys and salesmen!? Oh^1, miba^1, oh mama.../%", "obj_npc_room_slash_Other_10_gml_1896_0");
                                    d_make();
                                }
                                else
                                {
                                    snd_play(snd_item);
                                    msgset(0, scr_itemget_anytype_text(7, "item"));
                                    d_make();
                                    gotitem = true;
                                }
                                con = 2;
                            }
                            if (global.choice == 1)
                            {
                                k_d();
                                global.interact = 0;
                                instance_destroy();
                            }
                        }
                        if (con == 2)
                        {
                            if (!gotitem)
                            {
                                if (dad.image_index <= 10)
                                    dad.image_index += 0.25;
                            }
                        }
                        if (con == 2 && !d_ex())
                        {
                            dad.image_index = 0;
                            global.interact = 0;
                            instance_destroy();
                        }
                    };
                }
            }
        }
        if (spintype == 0)
        {
            global.msc = 1099;
            scr_text(global.msc);
        }
    }
}
if (room == room_dw_castle_west_cliff)
{
    if (extflag == "hacker")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I'm the Hacker. I'm a progamer^1, too. Keep it on the download./", "obj_npc_room_slash_Other_10_gml_1840_0");
            msgnextloc("* Shhh. I got the mods on deck. I'm about to win it big./", "obj_npc_room_slash_Other_10_gml_1841_0");
            msgnextloc("* (He's using a notched controller to play what looks like a child's game)/%", "obj_npc_room_slash_Other_10_gml_1842_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* A progamer is someone that progams videogames^1, right?/%", "obj_npc_room_slash_Other_10_gml_1846_0");
        }
    }
    else if (extflag == "pippins")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I'm trying to scam this guy using a children's game.../", "obj_npc_room_slash_Other_10_gml_1853_0");
            msgnextloc("* ..^1. but his controller keeps \"malfunctioning.\"/", "obj_npc_room_slash_Other_10_gml_1854_0");
            msgnextloc("* ..^1. Is this guy a genius? Is he onto me...?/%", "obj_npc_room_slash_Other_10_gml_1855_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (There's way too much heat here.)/", "obj_npc_room_slash_Other_10_gml_1859_0");
            msgnextloc("* (I'll go back to cheating Rouxls at Snakes and Ladders...)/%", "obj_npc_room_slash_Other_10_gml_1860_0_b");
        }
    }
}
if (room == room_dw_castle_east_door)
{
    if (extflag == "bloxer_head")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* ..^1. I went too far with my training./", "obj_npc_room_slash_Other_10_gml_1872_0_b");
            msgnextloc("* ..^1. My legs have achieved a kind of ultra-instinct.../", "obj_npc_room_slash_Other_10_gml_1873_0");
            msgnextloc("* ..^1. Where they can lead their own independent life without me./%", "obj_npc_room_slash_Other_10_gml_1874_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* ..^1. I would not mind./", "obj_npc_room_slash_Other_10_gml_1878_0");
            msgnextloc("* ..^1. If only my legs were also introverted./%", "obj_npc_room_slash_Other_10_gml_1879_0");
        }
    }
    else if (extflag == "bloxer_legs")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It reacts to your presence.)/%", "obj_npc_room_slash_Other_10_gml_1884_0");
    }
    else if (extflag == "ballperson")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Though I'm just a small ball...)/", "obj_npc_room_slash_Other_10_gml_1888_0");
        msgnextloc("* (..^1. with friends^1, I have become more well-rounded than ever before.)/%", "obj_npc_room_slash_Other_10_gml_1889_0");
    }
}
if (room == room_dw_castle_dojo)
{
    if (extflag == "puzzlemaster")
    {
        global.msc = 1453;
        scr_text(global.msc);
    }
    if (sprite_index == spr_clubs_idle)
    {
        if (talked == 0)
        {
            scr_miniface_init_clover();
            msgsetloc(0, "\\m1*\t\tThis song is so sweet^1, Cap'n!&\\m2\tSO sweet. You made it for US!?&\\m3\tIt's awful. ..^1. uh^1, nothing./%", "obj_npc_room_slash_Other_10_gml_1907_0");
        }
        else
        {
            scr_miniface_init_clover();
            msgsetloc(0, "\\m1*\t\tI just love boys!!!&\\m2\tBoys are great!!&\\m3\t..^1. uh.../%", "obj_npc_room_slash_Other_10_gml_1911_0");
        }
    }
    if (sprite_index == spr_npc_pippins)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Hey^1, apparently you met my friends. The other Pippinses./", "obj_npc_room_slash_Other_10_gml_1919_0");
        msgnextloc("* .../", "obj_npc_room_slash_Other_10_gml_1920_0");
        if (global.flag[659] == 1)
        {
            msgnextloc("* Yeah^1, they're actually losers. Guess I hyped them up a bit./%", "obj_npc_room_slash_Other_10_gml_1925_0");
        }
        else
        {
            msgnextloc("* I heard you beat the hell out of them.../", "obj_npc_room_slash_Other_10_gml_1928_0");
            msgnextloc("* ..^1. Yeah^1, I don't think I'm going to be fighting you in the Dojo./%", "obj_npc_room_slash_Other_10_gml_1929_0");
        }
    }
    if (extflag == "bloxer")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* This new romantic style of dojo is difficult to me/%", "obj_npc_room_slash_Other_10_gml_1939_0_b");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* It may take years to master the lovely formation/%", "obj_npc_room_slash_Other_10_gml_1943_0");
        }
    }
}
if (room == room_lw_library_upstairs)
{
    if (sprite_index == spr_normalnpc)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I love reading books./", "obj_npc_room_slash_Other_10_gml_2011_0");
            msgnextloc("* Especially the books upstairs./%", "obj_npc_room_slash_Other_10_gml_2012_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I love reading./", "obj_npc_room_slash_Other_10_gml_2016_0");
            msgnextloc("* Especially books./%", "obj_npc_room_slash_Other_10_gml_2017_0");
        }
        if (global.chapter == 4)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I love reading. Especially..^1. wait./", "obj_npc_room_slash_Other_10_gml_1969_0");
                msgnextloc("* Wait. The books upstairs. The books upstairs. Wait. The books are.../%", "obj_npc_room_slash_Other_10_gml_1970_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* ..^1. Wait. Wait^1, love./%", "obj_npc_room_slash_Other_10_gml_1974_0");
            }
        }
    }
}
if (room == room_dw_castle_rooms_ralsei)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (By process of elimination this is the best thing in Ralsei's room.)/%", "obj_npc_room_slash_Other_10_gml_2006_0");
}
if (room == room_lw_noellehouse_main)
{
    if (sprite_index == spr_phone_prop)
    {
        if (talked == 0 && scr_flag_get(714) == 0)
        {
            scr_flag_set(714, 1);
            global.msc = 1305;
            scr_text(global.msc);
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's Noelle's phone.)/%", "obj_npc_room_slash_Other_10_gml_2022_0");
        }
    }
    if (extflag == "phone_look_noelle")
    {
        if (scr_flag_get(1563) == 0)
        {
            scr_flag_set(1563, 1);
            scr_speaker("noelle");
            msgsetloc(0, "\\E3* Oh^1, um^1, Kris? It might take a while to^1, um^1, find my phone./", "obj_npc_room_slash_Other_10_gml_2033_0_b");
            msgnextloc("\\E4* ..^1. so^1, um..^1. you don't have to wait around here!/", "obj_npc_room_slash_Other_10_gml_2034_0");
            msgnextloc("\\E3* You know^1, you could^1, um..^1. go in a different room?/%", "obj_npc_room_slash_Other_10_gml_2035_0");
        }
        else
        {
            scr_speaker("noelle");
            msgsetloc(0, "\\EI* (..^1. Kris^1, are you getting the hint^1, or not?)/%", "obj_npc_room_slash_Other_10_gml_2039_0");
        }
    }
    else if (extflag == "phone_look_noelle_weird")
    {
        scr_speaker("noelle");
        msgsetloc(0, "\\E9* Kris^1, if you can't find any pencils or anything.../", "obj_npc_room_slash_Other_10_gml_2044_0");
        msgnextloc("\\E4* ..^1. I can come help you find them^1, later!/%", "obj_npc_room_slash_Other_10_gml_2045_0");
    }
    else if (extflag == "phone_look_susie")
    {
        if (scr_flag_get(1564) == 0)
        {
            scr_flag_set(1564, 1);
            scr_speaker("susie");
            msgsetloc(0, "\\E2* (Don't worry^1, Noelle's not \"finding her phone\" for a while.)/", "obj_npc_room_slash_Other_10_gml_2053_0_b");
            msgnextloc("\\E5* (You make like a dog and find some clues^1! Go!)/%", "obj_npc_room_slash_Other_10_gml_2054_0");
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EP* (..^1. what? Don't make me explain which dogs find clues!)/", "obj_npc_room_slash_Other_10_gml_2058_0");
            msgnextloc("\\EH* (Just go^1, dumbass!)/%", "obj_npc_room_slash_Other_10_gml_2059_0");
        }
    }
    else if (extflag == "phone_look_susie_weird")
    {
        scr_speaker("susie");
        msgsetloc(0, "\\EA* (Damn^1, can't believe that worked.)/", "obj_npc_room_slash_Other_10_gml_2064_0");
        msgnextloc("\\E2* (Go look for clues before Noelle get suspicious!)/%", "obj_npc_room_slash_Other_10_gml_2065_0");
    }
}
if (room == room_lw_church_main)
{
    if (sprite_index == spr_npc_alvin)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ah^1, Kris. It is most wonderful to see you worshipping here today.../", "obj_npc_room_slash_Other_10_gml_2076_0");
            msgnextloc("* And with a friend^1, too. Did you seek something from me?/", "obj_npc_room_slash_Other_10_gml_2077_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Kris^1, did you seek something from me?/", "obj_npc_room_slash_Other_10_gml_2081_0");
        }
        global.msc = 1309;
        scr_text(global.msc);
    }
    if (extflag == "shyren")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (She's shyly running a cup of juice through her gills.)/%", "obj_npc_room_slash_Other_10_gml_2091_0");
    }
    if (extflag == "mkid")
    {
        if (talked == 0 && scr_flag_get(718) == 0)
        {
            global.msc = 1311;
            scr_text(global.msc);
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Umm..^1. Kris^1, if you wanna know something.../", "obj_npc_room_slash_Other_10_gml_2103_0");
            msgnextloc("* \\cYOur teacher\\cW is right over there^1, y'know!/%", "obj_npc_room_slash_Other_10_gml_2104_0");
        }
    }
    if (extflag == "snowy")
    {
        global.msc = 1313;
        scr_text(global.msc);
    }
    if (extflag == "snowydad")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Hey^1, be nice to ya muddah. You're all she talks about at qwhyah./", "obj_npc_room_slash_Other_10_gml_2119_0_b");
            msgnextloc("* You're her little snowball..^1. Her little slushy. Make ya muddah proud^1, Kris./%", "obj_npc_room_slash_Other_10_gml_2120_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Kris^1, be nice to ya muddah^1, ya faddah^1, ya bruddah^1, and all uddahs./%", "obj_npc_room_slash_Other_10_gml_2124_0");
        }
    }
    if (extflag == "rgbun")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I'm not too religious^1, man^1, but I just^1, like^1, love coming here./", "obj_npc_room_slash_Other_10_gml_2133_0");
            msgnextloc("* The atmosphere^1, the structure^1, the community..^1. it's just so groovular./%", "obj_npc_room_slash_Other_10_gml_2134_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* And yeah^1, the juice. My boyfriend loves the juice./%", "obj_npc_room_slash_Other_10_gml_2138_0");
        }
    }
    if (extflag == "rgdragon")
    {
        var sentence_end = (scr_flag_get(720) == 0) ? "/" : "/%";
        scr_speaker("no_name");
        msgsetsubloc(0, "* ..^1. juice.~1", sentence_end, "obj_npc_room_slash_Other_10_gml_2146_0");
        if (scr_flag_get(720) == 0)
            msgnextloc("* ..^1. \\cYyour teacher\\cW looks thirsty./%", "obj_npc_room_slash_Other_10_gml_2149_0");
    }
    if (sprite_index == spr_npc_catty)
    {
        if (talked == 0)
        {
            scr_speaker("catty");
            msgsetloc(0, "\\E2* KRISSY!!^1! OMG you came to see me!? SO CUTE!!!/", "obj_npc_room_slash_Other_10_gml_2158_0");
            msgnextloc("\\E5* Huh? Code? Locked...? Huh? Sorry^1, don't get it!/", "obj_npc_room_slash_Other_10_gml_2159_0");
            msgnextloc("\\E6* But^1, \\cYNoelley\\cW knows a lot about being \\cYlocked\\cW out!!/", "obj_npc_room_slash_Other_10_gml_2160_0");
            msgnextloc("\\E2* And^1, like^1, um^1, codes...? Are for \\cYNERDS\\cW!!^1! LOL!!!/%", "obj_npc_room_slash_Other_10_gml_2161_0");
        }
        else
        {
            scr_speaker("catty");
            msgsetloc(0, "\\E6* \\cYNoelley\\cW knows a lot about being \\cYlocked\\cW out!!/", "obj_npc_room_slash_Other_10_gml_2165_0");
            msgnextloc("\\E2* And^1, like^1, um^1, codes...? Are for \\cYNERDS\\cW!!^1! LOL!!!/%", "obj_npc_room_slash_Other_10_gml_2166_0_b");
        }
    }
    if (sprite_index == spr_catty_dad_church)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* My little girl kicked butt today. My big girl^1, too./", "obj_npc_room_slash_Other_10_gml_2175_0");
            msgnextloc("* Huh? Code? Locked door? I'm a simple man^1, Kris^1, but my \\cYgenius daughter\\cW will know!/%", "obj_npc_room_slash_Other_10_gml_2176_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Today is a cartoon fish bone grill for all the girls of the house!!/", "obj_npc_room_slash_Other_10_gml_2180_0");
            msgnextloc("* We are crunching bones!^1! We are feminests!!/%", "obj_npc_room_slash_Other_10_gml_2181_0");
        }
    }
    if (extflag == "rudy")
    {
        sprite_index = spr_rudy_juice_walk_down;
        if (global.facing == 3)
            sprite_index = spr_rudy_juice_walk_right;
        if (scr_sideb_active())
        {
            with (obj_ch4_PDC03A_rudy_toriel)
                con = 80;
            skip = 1;
        }
        else
        {
            global.msc = 1325;
            scr_text(global.msc);
        }
    }
    if (extflag == "alphys")
    {
        with (obj_ch4_PDC03A_alphys_juice)
            con = 1;
        exit;
    }
}
if (room == room_lw_noellehouse_dess)
{
    global.msc = 1329;
    scr_text(global.msc);
}
if (room == room_dw_castle_rooms_queen)
{
    if (sprite_index == spr_queen_walk_up)
    {
        if (talked == 0)
        {
            scr_speaker("queen");
            msgsetloc(0, "\\E0* Oh^1, Kris How Are Your Adventures Going/", "obj_npc_room_slash_Other_10_gml_2215_0");
            msgnextloc("\\EL* You Didn't Happen To Recruit Any Cyber Guys Did You/", "obj_npc_room_slash_Other_10_gml_2216_0");
            msgnextloc("\\EB* Maybe Even A Smart Coffee Machine Ha Ha/", "obj_npc_room_slash_Other_10_gml_2217_0");
            msgnextloc("\\E5* No? Well? At Least Say Hi To \"No Well\" For Me Ha Ha/%", "obj_npc_room_slash_Other_10_gml_2218_0_b");
        }
        else
        {
            scr_speaker("queen");
            msgsetloc(0, "\\ED* Kris Do You Have Any Games On Your Phone/", "obj_npc_room_slash_Other_10_gml_2222_0");
            msgnextloc("\\E1* I Mean To Turn Into Darkners Ha Ha/", "obj_npc_room_slash_Other_10_gml_2223_0");
            msgnextloc("\\E5* Kris I Will Give You 40 Netcoins To Let Me Befriend Flapping Bird/%", "obj_npc_room_slash_Other_10_gml_2224_0");
        }
    }
    if (sprite_index == spr_npc_rouxls_lamp)
    {
        if (talked == 0)
        {
            scr_speaker("rouxls");
            msgsetloc(0, "\\E3* (Queen shalth Notice my Brillianthce any day Nowe...)/", "obj_npc_room_slash_Other_10_gml_2233_0");
            scr_anyface_next("queen", 13);
            msgnextloc("\\ED* Something About That Lamp's Brightness Level/", "obj_npc_room_slash_Other_10_gml_2235_0_b");
            msgnextloc("\\E1* It Seems Low/%", "obj_npc_room_slash_Other_10_gml_2236_0_b");
        }
        else
        {
            scr_speaker("rouxls");
            msgsetloc(0, "\\E6* (Hath she NOT noticed her lamp's Bouncinest Bootye...?)/%", "obj_npc_room_slash_Other_10_gml_2240_0");
        }
    }
}
if (room == room_dw_castle_rooms_tenna)
{
    if (sprite_index == spr_dw_gameshow_podium)
    {
        scr_speaker("tenna");
        msgsetloc(0, "* Hotcha HOTCHA^1! Don't touch that podium^1, folks^1, or TV TIME Season 2 will begin!/", "obj_npc_room_slash_Other_10_gml_2250_0");
        msgnextloc("* You don't want episodic content that deteriorates in quality over time^1, do ya!? DO YA!?/%", "obj_npc_room_slash_Other_10_gml_2251_0");
    }
    if (extflag == "lanino")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* My sweet frozen sundae^1, our relationship has never been more solid./", "obj_npc_room_slash_Other_10_gml_2259_0");
            msgnextloc("* Except^1, I think the lamp put its hand on mine./", "obj_npc_room_slash_Other_10_gml_2260_0");
            msgnextloc("* And it made me feel funny. But we will ignore that. For love./%", "obj_npc_room_slash_Other_10_gml_2261_0_b");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* My love for you shines brighter than any lamp./", "obj_npc_room_slash_Other_10_gml_2265_0");
            msgnextloc("* And it only touches your hand^1, with permission. Ha ha./%", "obj_npc_room_slash_Other_10_gml_2266_0");
        }
    }
    if (extflag == "elnina")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* My hot burning meteoric hunk^1, I feel so on fire with you./", "obj_npc_room_slash_Other_10_gml_2275_0");
            msgnextloc("* Almost as hot as the lampshade^1, when it caressed my hair./", "obj_npc_room_slash_Other_10_gml_2276_0");
            msgnextloc("* I don't know how I felt about that. I want to forget it. I think./%", "obj_npc_room_slash_Other_10_gml_2277_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Lampshade or not^1, something about that lamp is really shady./", "obj_npc_room_slash_Other_10_gml_2281_0");
            msgnextloc("* I think I saw it walking between rooms..^1. repeatedly./%", "obj_npc_room_slash_Other_10_gml_2282_0");
        }
    }
    if (extflag == "hatguy")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Oh^1, Prince Ralsei^1! Look how many hats I've racked up!/", "obj_npc_room_slash_Other_10_gml_2291_0");
            msgnextloc("* ..^1. Ah? Your original hat? Oops..^1. I seem to have lost it forever./%", "obj_npc_room_slash_Other_10_gml_2292_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* My dear Prince^1! You need not your hat to hide your face anymore./", "obj_npc_room_slash_Other_10_gml_2296_0");
            msgnextloc("* I'm sure your friends will accept if you just get plastic surgery./%", "obj_npc_room_slash_Other_10_gml_2297_0");
        }
    }
}
if (room == room_dw_church_arena)
{
    if (scr_flag_get(852) == 0)
    {
        global.msc = 1389;
        scr_text(global.msc);
    }
    else
    {
        scr_speaker("gerson");
        msgsetloc(0, "* .../%", "obj_npc_room_slash_Other_10_gml_2311_0");
    }
}
if (room == room_dw_church_bookcase)
{
    if (extflag == "gerson")
    {
        scr_speaker("gerson");
        msgsetloc(0, "* Hmm..^1. I've a mighty hankerin' to read a \\cGbook\\cW. But I just can't reach.../%", "obj_npc_room_slash_Other_10_gml_2320_0");
        if (i_ex(obj_ch4_DCA05))
        {
            if (obj_ch4_DCA05.con < 1)
            {
                with (obj_ch4_DCA05)
                    con = 1;
                exit;
            }
        }
    }
    if (extflag == "stool")
    {
        skip = false;
        scr_speaker("no_name");
        msgsetloc(0, "* (It's an actual stool.)/%", "obj_npc_room_slash_Other_10_gml_2337_0");
        if (global.plot >= 150)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a stool.)/", "obj_npc_room_slash_Other_10_gml_2342_0_b");
            msgnextloc("* (It's not much use as long as Ralsei is around.)/%", "obj_npc_room_slash_Other_10_gml_2343_0_b");
        }
        if (obj_ch4_DCA05.con == 3)
        {
            skip = true;
            obj_ch4_DCA05.con = 10;
        }
    }
}
if (room == room_dw_church_gersonstudy)
{
    if (extflag == "gerson")
    {
        if (global.plot >= 190)
        {
            scr_speaker("gerson");
            msgsetloc(0, "* Got it all memorized?/", "obj_npc_room_slash_Other_10_gml_2361_0");
            scr_anyface_next("susie", "D");
            msgnextloc("\\ED* Uhh^1, maybe not word for word^1, but I got the point./", "obj_npc_room_slash_Other_10_gml_2363_0");
            msgnextloc("\\E1* ..^1. Why bother putting it in writing^1, anyway?/", "obj_npc_room_slash_Other_10_gml_2364_0");
            scr_anyface_next("gerson", 0);
            msgnextloc("* Sometimes that's the only way to say it. Geheheh!/%", "obj_npc_room_slash_Other_10_gml_2366_0");
        }
        else if (scr_flag_get(852) == 1 && scr_flag_get(1652) == 0)
        {
            scr_flag_set(1652, 1);
            scr_speaker("gerson");
            msgsetloc(0, "* That crystal's got some kinda strange power./", "obj_npc_room_slash_Other_10_gml_2372_0_b");
            msgnextloc("* Gave me the skeevies^1, so I didn't use it^1! Wahaha!/%", "obj_npc_room_slash_Other_10_gml_2373_0_b");
        }
        else
        {
            global.msc = 1371;
            scr_text(global.msc);
        }
    }
}
if (room == room_dw_castle_tv_rhythm)
{
    if (extflag == "plugboy")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Look..^1. I know this guy can't talk./", "obj_npc_room_slash_Other_10_gml_2388_0");
        msgnextloc("* But he seems to really really like his job./", "obj_npc_room_slash_Other_10_gml_2389_0");
        msgnextloc("* So..^1. let's just let him do it./%", "obj_npc_room_slash_Other_10_gml_2390_0");
    }
    if (extflag == "shadowguy")
    {
        global.msc = 1437;
        scr_text(global.msc);
    }
}
if (room == room_dw_castle_tv_zone_2)
{
    skip = 1;
    if (i_ex(obj_room_castle_tv_zone_2))
        obj_room_castle_tv_zone_2.show_convo(extflag);
}
if (!skip)
{
    remanimspeed = image_speed;
    myinteract = 3;
    mydialoguer = instance_create(0, 0, obj_dialoguer);
    mydialoguer.jpspecial = jpspecial;
    talked += 1;
}

enum UnknownEnum
{
    Value_0,
    Value_25 = 25
}
