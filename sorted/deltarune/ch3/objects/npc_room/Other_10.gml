skip = false;
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
        msgsetloc(0, "* It's a birdcage. When the door's closed^1, there's no escape./%", "obj_npc_room_slash_Other_10_gml_27_0");
}
if (room == room_torhouse)
{
    global.msg[0] = stringsetloc("* (It's Chairiel^1, the beloved living room chair.)/%", "obj_npc_room_slash_Other_10_gml_32_0");
    if (global.plot >= 250)
    {
        global.msc = 455;
        scr_text(global.msc);
        global.typer = 7;
        global.fc = 4;
        global.fe = 0;
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
    if (global.chapter >= 2)
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
    }
    if (sprite_index == spr_npc_alvin_back)
    {
        global.msc = 1045;
        scr_text(global.msc);
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
            if (global.flag[261] != 1)
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
    global.msc = 1037;
    scr_text(global.msc);
}
if (room == room_cc_lancer)
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
if (room == room_dw_castle_dungeon)
{
    if (sprite_index == spr_npc_gouldensam && x > 60 && x < 100)
        msgsetloc(0, "* (I'm Goulden Sam.)/%", "obj_npc_room_slash_Other_10_gml_975_0");
    if (sprite_index == spr_npc_gouldensam && x > 100)
        msgsetloc(0, "* (This is a nice prison!)/%", "obj_npc_room_slash_Other_10_gml_1168_0");
    if (sprite_index == spr_npc_cage_king_castle)
    {
        msgsetloc(0, "* We're still behind bars for some reason^1, but it's OK!/", "obj_npc_room_slash_Other_10_gml_1173_0");
        msgnextloc("* We've grown to love this hellish place^1, where we dress as animals!/%", "obj_npc_room_slash_Other_10_gml_1174_0");
    }
    if (sprite_index == spr_npc_cage_animals_castle)
        msgsetloc(0, "* (We decided to dress as kings. It's cultural exchange.)/%", "obj_npc_room_slash_Other_10_gml_1179_0");
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
    if (sprite_index == spr_rurus_idle)
    {
        if (talked == 0)
        {
            scr_speaker("rouxls");
            msgsetloc(0, "* Ah^1! Thou hast Transplantedeth us to Thine Castle Towne.../", "obj_npc_room_slash_Other_10_gml_1481_0");
            msgnextloc("\\E2* And^1, Trulye^1, a maginificenth Towne of Castles^1, it art!/", "obj_npc_room_slash_Other_10_gml_1482_0");
            msgnextloc("\\E6* But ho^1! Hmmm..^1. Something art..^1. Lackingth^1, it Feeleth./", "obj_npc_room_slash_Other_10_gml_1483_0");
            msgnextloc("\\E1* Couldth thou guys..^1. Perhapsth.../", "obj_npc_room_slash_Other_10_gml_1484_0");
            msgnextloc("\\E6* Bringe in an Evil Rulere...^1. Or some Thinge...?/%", "obj_npc_room_slash_Other_10_gml_1485_0");
        }
        else
        {
            scr_speaker("rouxls");
            msgsetloc(0, "\\E0* Lancer hath benounced me \"Vice Fathere...\"/", "obj_npc_room_slash_Other_10_gml_1489_0");
            msgnextloc("\\E5* Forthhence^1, I do All the Cookinge and Cleaninge./", "obj_npc_room_slash_Other_10_gml_1490_0");
            msgnextloc("\\E6* Perhapsth^1, I shouldst seeketh a New Employere.../%", "obj_npc_room_slash_Other_10_gml_1491_0");
        }
    }
    if (sprite_index == spr_diamond_overworld)
    {
        if (x > 620 && x < 630 && y > 770 && y < 780)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Oho. Welcome home./", "obj_npc_room_slash_Other_10_gml_1509_0");
                msgnextsubloc("* Things have changed again here in&~1Town!/%", global.truename, "obj_npc_room_slash_Other_10_gml_1510_0");
                jpspecial = 1;
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This is a dream that grows with love and care./", "obj_npc_room_slash_Other_10_gml_1523_0");
                msgnextloc("* Don't be afraid to dream!/%", "obj_npc_room_slash_Other_10_gml_1524_0");
            }
        }
        if (x > 310 && x < 330 && y > 910 && y < 930)
        {
            if (global.flag[635] == 1)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Ha ha^1! That's right^1! They took so long on their turn.../", "obj_npc_room_slash_Other_10_gml_1541_0");
                msgnextloc("* What!? A horned girl? I never got to see her!/%", "obj_npc_room_slash_Other_10_gml_1542_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This guy always seems like he's enjoying life more than me./", "obj_npc_room_slash_Other_10_gml_1535_0");
                msgnextloc("* Maybe it's because he's a higher level...?/%", "obj_npc_room_slash_Other_10_gml_1536_0");
            }
        }
    }
    if (sprite_index == spr_heartenemy_overworld)
    {
        if (scr_get_total_recruits(2) < 4)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Seems like Hathy likes this place.)/", "obj_npc_room_slash_Other_10_gml_1560_0");
            msgnextloc("* (She hopes you'll like it too.)/%", "obj_npc_room_slash_Other_10_gml_1561_0");
            if (global.flag[248] == 1)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Seems like Hathy likes this place.)/", "obj_npc_room_slash_Other_10_gml_1594_0");
                msgnextloc("* (You feel an aura of forgiveness...)/%", "obj_npc_room_slash_Other_10_gml_1595_0_b");
            }
            if (global.flag[252] == 1)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Seems Hathy likes this place.)/", "obj_npc_room_slash_Other_10_gml_1554_0");
                msgnextloc("* (She hopes you'll find enough beds to inspect.)/", "obj_npc_room_slash_Other_10_gml_1555_0");
                msgnextloc("* (You'll lose your bed inspector title if you don't inspect enough beds.)/%", "obj_npc_room_slash_Other_10_gml_1556_0");
            }
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Hathy's happy to see so many new faces.)/", "obj_npc_room_slash_Other_10_gml_1566_0");
            msgnextloc("* (Happy's hathy.)/%", "obj_npc_room_slash_Other_10_gml_1567_0");
        }
    }
    if (sprite_index == spr_npc_rabbick_clean)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's a clean start for us here!/", "obj_npc_room_slash_Other_10_gml_1574_0");
        msgnextloc("* (Sukkiri...)/%", "obj_npc_room_slash_Other_10_gml_1575_0");
    }
    if (sprite_index == spr_npc_werewire)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Thanks for getting rid of Queen!/", "obj_npc_room_slash_Other_10_gml_1581_0");
        msgnextloc("* ..^1. yeah^1, this form is much cooler^1, so I'm keeping it.../%", "obj_npc_room_slash_Other_10_gml_1582_0");
    }
    if (sprite_index == spr_daimond_knight_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Thanks to you^1, commander^1, we've been liberated!/", "obj_npc_room_slash_Other_10_gml_1588_0");
        msgnextloc("* I hereby declare today National Ham Sandwich Day of Independence!/%", "obj_npc_room_slash_Other_10_gml_1589_0");
    }
    if (sprite_index == spr_npc_plugboy_static_outline)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Wh..^1. what a wonderful place..^1. thank you.../", "obj_npc_room_slash_Other_10_gml_1595_0");
        msgnextloc("* This town^1, not that restaurant. It looks weird. I'm not going in.../%", "obj_npc_room_slash_Other_10_gml_1596_0");
    }
    if (sprite_index == spr_blockler_b)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Bow bow./", "obj_npc_room_slash_Other_10_gml_1604_0");
            msgnextloc("* (I'm bjust a block.)/%", "obj_npc_room_slash_Other_10_gml_1605_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (I don't bget it.)/", "obj_npc_room_slash_Other_10_gml_1609_0");
            msgnextloc("* (Did bwe go somebwhere?)/%", "obj_npc_room_slash_Other_10_gml_1610_0");
        }
    }
    if (sprite_index == spr_lancer_rt)
    {
        if (talked == 0)
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\EK* I..^1. thought you were racing?/", "obj_npc_room_slash_Other_10_gml_1604_0_b");
            scr_anyface_next("lancer", 2);
            msgnextloc("\\E2* Yeah^1! I wanna be the egg!!/%", "obj_npc_room_slash_Other_10_gml_1606_0");
        }
        else
        {
            scr_speaker("lancer");
            msgsetloc(0, "\\E1* You won't get through your teen years without at least one Egg./%", "obj_npc_room_slash_Other_10_gml_1610_0_b");
        }
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
        if (sprite_index == spr_npc_swatchling_cafe)
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
        global.msc = 1099;
        scr_text(global.msc);
    }
}
if (room == room_dw_castle_west_cliff)
{
    if (sprite_index == spr_npc_mrsociety)
    {
        global.flag[314] = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Oh^1, it's quite a wonderful town^1, really. Thank you!/", "obj_npc_room_slash_Other_10_gml_1777_0");
        msgnextloc("* ..^1. so..^1. why am I alone here?/", "obj_npc_room_slash_Other_10_gml_1778_0");
        msgnextloc("* A bit of self-reflection^1, I suppose./", "obj_npc_room_slash_Other_10_gml_1779_0");
        msgnextloc("* I do realize I was quite a coward before.../", "obj_npc_room_slash_Other_10_gml_1780_0");
        msgnextloc("* So..^1. I wanted to say..^1. well.../", "obj_npc_room_slash_Other_10_gml_1781_0");
        msgnextloc("* I STILL AM!!!!/", "obj_npc_room_slash_Other_10_gml_1782_0");
        msgnextloc("* My cards^1, I cannot handle society!/", "obj_npc_room_slash_Other_10_gml_1783_0");
        msgnextloc("* For now^1, I'll be living at the top of this cliff!/", "obj_npc_room_slash_Other_10_gml_1784_0");
        msgnextloc("* When I'm ready to meet society again^1, I will be back!/", "obj_npc_room_slash_Other_10_gml_1785_0");
        msgnextloc("* Thank you^1, thank you for the wonderful home^1! I will NOT use it!/%", "obj_npc_room_slash_Other_10_gml_1786_0");
        with (obj_npc_castle_cliff)
            con = 1;
    }
    if (sprite_index == spr_npc_cursor_walk_right)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Thanks a lot for the lovely city./", "obj_npc_room_slash_Other_10_gml_1748_0");
            msgnextloc("* It's nearly as good as the one I made in Minecrap./%", "obj_npc_room_slash_Other_10_gml_1749_0_b");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I need to mine ten-hundred blocks of Bubsidian to make my dog 3 colors./%", "obj_npc_room_slash_Other_10_gml_1753_0");
        }
    }
}
if (room == room_dw_castle_east_door)
{
    if (sprite_index == spr_blockguy_pants3)
    {
        if (talked == 0 && scr_get_total_recruits(2) > 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* These animals are stray...?/", "obj_npc_room_slash_Other_10_gml_1808_0");
            msgnextloc("* No^1, they are practicing a special loneliness style./", "obj_npc_room_slash_Other_10_gml_1809_0");
            msgnextloc("* ..^1. Just like me./", "obj_npc_room_slash_Other_10_gml_1810_0");
            msgnextloc("* Lone wolves have to stick together./%", "obj_npc_room_slash_Other_10_gml_1811_0");
            if (i_ex(obj_npc_castle_door))
            {
                with (obj_npc_castle_door)
                    howl_con = 1;
            }
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Train at the party dojo? Ha.../", "obj_npc_room_slash_Other_10_gml_1817_0");
            msgnextloc("* We will make our own dojo..^1. for introverts./%", "obj_npc_room_slash_Other_10_gml_1818_0");
        }
    }
    if (sprite_index == spr_blockguy_pants4)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* ..^1. I've been training./", "obj_npc_room_slash_Other_10_gml_1828_0");
            msgnextloc("* ..^1. Don't ask what I've been training^1, though./%", "obj_npc_room_slash_Other_10_gml_1829_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* ..^1. are you impressed...?/%", "obj_npc_room_slash_Other_10_gml_1833_0");
        }
    }
}
if (room == room_dw_castle_dojo)
{
    if (sprite_index == spr_clubs_idle)
    {
        if (global.flag[640] != 1)
        {
            if (talked == 0)
            {
                scr_miniface_init_clover();
                msgsetloc(0, "\\m1*\t\tWow^1, our house is a dojo?!&\\m2\tMakes me wanna FIGHT...&\\m3\t(Can't we go to sleep?)/%", "obj_npc_room_slash_Other_10_gml_1848_0");
            }
            else
            {
                scr_miniface_init_clover();
                msgsetloc(0, "\\m1*\t\tIt's a PARTY every day!&\\m2\tAnd I'M the oldest!&\\m3\t(We're the same age...)/%", "obj_npc_room_slash_Other_10_gml_1852_0");
            }
        }
        else if (talked == 0)
        {
            scr_miniface_init_clover();
            msgsetloc(0, "\\m1*\t\tWho's that tall-dark-and...&\\m2\tKinda creepy person!?&\\m3\tYou mean the... Werewire?/%", "obj_npc_room_slash_Other_10_gml_1860_0");
        }
        else
        {
            scr_miniface_init_clover();
            msgsetloc(0, "\\m1*\t\tTheir neck just&\tlooks so...fluffy~&\\m2\tSo!? Like I care!?/", "obj_npc_room_slash_Other_10_gml_1864_0");
            msgnextloc("\\m3*\t\t(She wants to rub her face&\tin it...)/%", "obj_npc_room_slash_Other_10_gml_1865_0");
        }
    }
    if (sprite_index == spr_npc_pippins)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* He he he... Looks like fighting wasn't in the cards for us./", "obj_npc_room_slash_Other_10_gml_1875_0");
        msgnextloc("* Lucky for you... Just hope you don't meet my friends!/%", "obj_npc_room_slash_Other_10_gml_1876_0");
    }
    if (sprite_index == spr_werewerewire_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like it won't forgive you for sparing it...)/", "obj_npc_room_slash_Other_10_gml_1882_0");
        msgnextloc("* (Unless you can beat it in a fight.)/%", "obj_npc_room_slash_Other_10_gml_1883_0");
    }
    if (sprite_index == spr_blockguy_idleFriendly)
    {
        scr_speaker("d");
        msgsetloc(0, "* My power level is falling behind the others/", "obj_npc_room_slash_Other_10_gml_1938_0");
        msgnextloc("* All I can do now is gasp and comment on the battle/%", "obj_npc_room_slash_Other_10_gml_1939_0");
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
    }
}
if (room == room_dw_ch3_man)
{
    image_speed = 0;
    if (extflag == "sign1")
        msgsetloc(0, "IT'S A MAN'S WORLD!/%", "obj_npc_room_slash_Other_10_gml_1449_0_b");
    if (extflag == "sign2")
        msgsetloc(0, "WELCOME TO MANCOUNTRY./%", "obj_npc_room_slash_Other_10_gml_1452_0");
    if (extflag == "sign3")
    {
        msgsetloc(0, "WELCOME TO FORGOTTEN ISLAND!/", "obj_npc_room_slash_Other_10_gml_1456_0");
        msgnextloc("THIS ISLAND IS A WORLD HERITAGE SITE!/%", "obj_npc_room_slash_Other_10_gml_1457_0");
    }
    if (extflag == "sign4")
        msgsetloc(0, "NON-MEN ARE A-OK^1, TOO./%", "obj_npc_room_slash_Other_10_gml_1461_0");
    if (extflag == "rudinn1")
    {
        if (talked == 0)
        {
            msgsetloc(0, "OH^1, KRIS^1, WHAT ARE YOU DOING HERE./", "obj_npc_room_slash_Other_10_gml_1467_0");
            msgnextloc("DID YOU COME HERE TO PLAY WITH US?/%", "obj_npc_room_slash_Other_10_gml_1468_0");
        }
        else
        {
            msgsetloc(0, "KRIS NEVER WANTS TO PLAY..^1. BOO HOO./", "obj_npc_room_slash_Other_10_gml_1472_0");
            msgnextloc("WHY DON'T YOU PHOTOCOPY A KRIS TO PLAY WITH US?/%", "obj_npc_room_slash_Other_10_gml_1473_0");
        }
    }
    if (extflag == "rudinn2")
    {
        if (talked == 0)
        {
            msgsetloc(0, "KRIS^1, YOU LOOK RATHER BIG.../", "obj_npc_room_slash_Other_10_gml_1481_0_b");
            msgnextloc("HAVE YOU BEEN WORKING OUT?/%", "obj_npc_room_slash_Other_10_gml_1482_0_b");
        }
        else
        {
            msgsetloc(0, "I GUESS YOU GREW UP./", "obj_npc_room_slash_Other_10_gml_1486_0");
            msgnextloc("WELL^1, STOP THAT./%", "obj_npc_room_slash_Other_10_gml_1487_0");
        }
    }
    if (extflag == "rudinn5")
    {
        if (talked == 0)
        {
            msgsetloc(0, "KRIS? SOMEONE WAS LOOKING FOR YOU./", "obj_npc_room_slash_Other_10_gml_1495_0");
            msgnextloc("THOUGH^1, I DON'T REMEMBER WHO./%", "obj_npc_room_slash_Other_10_gml_1496_0");
        }
        else
        {
            msgsetloc(0, "DID YOU TRY BEHIND THE TREE?/%", "obj_npc_room_slash_Other_10_gml_1500_0");
        }
    }
    if (extflag == "rudinn4")
    {
        if (talked == 0)
        {
            msgsetloc(0, "I'M TRYING TO SEE AS FAR AS I CAN^1,/", "obj_npc_room_slash_Other_10_gml_1507_0");
            msgnextloc("BUT IT DOESN'T LOOK TOO GOOD./%", "obj_npc_room_slash_Other_10_gml_1508_0");
        }
        else
        {
            msgsetloc(0, "TALK ABOUT LOUSY REAL ESTATE.../", "obj_npc_room_slash_Other_10_gml_1513_0");
            msgnextloc("I SENSE NOTHING BUT EVIL FROM THAT PLACE!/%", "obj_npc_room_slash_Other_10_gml_1514_0");
        }
    }
    if (extflag == "rudinn6")
    {
        if (talked == 0)
        {
            msgsetloc(0, "WE ARE THE 7 FLYING ACES!/", "obj_npc_room_slash_Other_10_gml_1522_0");
            msgnextloc("TO CHEAT AT CARDS^1, YOU COPIED 7 ACES.../", "obj_npc_room_slash_Other_10_gml_1523_0_b");
            msgnextloc("IT DIDN'T WORK WELL./", "obj_npc_room_slash_Other_10_gml_1524_0_b");
            msgnextloc("WE GOT LOST IN THE COUCH^1, AND ENDED UP HERE./%", "obj_npc_room_slash_Other_10_gml_1525_0");
        }
        else
        {
            msgsetloc(0, "THERE AREN'T 7? WELL^1, YOU NAMED US./", "obj_npc_room_slash_Other_10_gml_1529_0");
            msgnextloc("IF YOU WERE GOOD AT COUNTING CARDS^1,/", "obj_npc_room_slash_Other_10_gml_1530_0");
            msgnextloc("YOU WOULDN'TVE NEEDED TO CHEAT./%", "obj_npc_room_slash_Other_10_gml_1531_0");
        }
    }
    if (extflag == "rudinn3")
    {
        if (talked == 0)
        {
            msgsetloc(0, "COPIES ARE MONOCHROME^1,/", "obj_npc_room_slash_Other_10_gml_1538_0");
            msgnextloc("BUT YOU COLORED EACH OF US IN WITH CARE./%", "obj_npc_room_slash_Other_10_gml_1539_0");
        }
        else
        {
            msgsetloc(0, "MAYBE THE PINK ACE WAS SUSPICIOUS./%", "obj_npc_room_slash_Other_10_gml_1543_0");
        }
    }
    if (extflag == "binos")
    {
        if (i_ex(obj_ch3_man_controller))
        {
            if (obj_ch3_man_controller.binocon == 0)
            {
                obj_ch3_man_controller.binocon = 1;
                snd_play_pitch(snd_item, 0.8);
                skip = true;
            }
            else if (obj_ch3_man_controller.binocon == 99)
            {
                skip = true;
                global.interact = 0;
            }
            else if (obj_ch3_man_controller.binocon == -1)
            {
                msgsetloc(0, "SOMEONE ELSE IS USING THESE./%", "obj_npc_room_slash_Other_10_gml_1565_0");
            }
        }
    }
}
if (room == room_dw_changing_room)
{
    if (sprite_index == spr_dw_green_room_vending)
    {
        global.msc = 1254;
        scr_text(global.msc);
    }
    if (sprite_index == spr_npc_pippins)
    {
        global.msc = 1256;
        scr_text(global.msc);
    }
    if (extflag == "rabbick_default")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (I hope I can get an autograph.)/%", "obj_npc_room_slash_Other_10_gml_1600_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (By the way^1, I accidentally came here stuck on your clothes.)/", "obj_npc_room_slash_Other_10_gml_1605_0_b");
            msgnextloc("* (I'm sure you'll take me back to Castle Town later.)/%", "obj_npc_room_slash_Other_10_gml_1606_0_b");
        }
        if (global.plot >= 160)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Dustin' makes me feel good...)/%", "obj_npc_room_slash_Other_10_gml_1605_0_c");
        }
    }
    if (extflag == "rabbick_mantle")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (K..^1. Kris!^1! I was so scared^1, I couldn't move!^1! Ramb was..^1. Ramb was...!)/%", "obj_npc_room_slash_Other_10_gml_1615_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (..^1. wait a second^1, that's funny. Kris..^1. didn't you already go past?)/%", "obj_npc_room_slash_Other_10_gml_1620_0");
        }
    }
    if (extflag == "rabbick_empty")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Everyone else left me in the dust...)/", "obj_npc_room_slash_Other_10_gml_1629_0");
            msgnextloc("* (Or^1, was the dust left in me?)/%", "obj_npc_room_slash_Other_10_gml_1630_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Maybe I'll try dusting some makeup...)/%", "obj_npc_room_slash_Other_10_gml_1635_0");
        }
    }
}
if (room == room_dw_green_room)
{
    if (sprite_index == spr_dw_green_room_vending)
    {
        global.msc = 1268;
        scr_text(global.msc);
    }
    if (extflag == "zapper")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Don't do anything funny./", "obj_npc_room_slash_Other_10_gml_1651_0");
        msgnextloc("* Mr. Tenna's orders./%", "obj_npc_room_slash_Other_10_gml_1652_0");
    }
    if (extflag == "zapper_board_2")
    {
        with (obj_room_green_room)
            con = 70;
        skip = 1;
    }
}
if (room == room_dw_b3bs_rouxls_lanina)
{
    if (extflag == "rouxls")
    {
        scr_speaker("rouxls");
        msgsetloc(0, "\\E3* A Key Kaard^1, thou sayeth? Maysooth there be one in yon next Room?/%", "obj_npc_room_slash_Other_10_gml_1667_0");
    }
}
if (room == room_dw_b3bs_rouxls_boss)
{
    if (extflag == "elnina")
    {
        if (talked == 0 && scr_flag_get(1060) == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Thank you in that battle there. You were an oasis.../", "obj_npc_room_slash_Other_10_gml_1678_0");
            msgnextloc("* Oh^1, the Key Card?/", "obj_npc_room_slash_Other_10_gml_1679_0");
            msgnextloc("* My memory's cloudy^1, but I think it's in a room to the south...?/", "obj_npc_room_slash_Other_10_gml_1680_0");
            msgnextloc("* Take my controller in the room to the left. You might need it!/%", "obj_npc_room_slash_Other_10_gml_1681_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Tonight's weather will be..^1. moon shining through the clouds. Just perfect./%", "obj_npc_room_slash_Other_10_gml_1686_0");
        }
    }
    if (extflag == "lanino")
    {
        if (talked == 0 && scr_flag_get(1060) == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Thank you in that battle there. You were a shining star.../", "obj_npc_room_slash_Other_10_gml_1695_0");
            msgnextloc("* Oh^1, Elnina has something for you./%", "obj_npc_room_slash_Other_10_gml_1696_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Today's weather? Only the world's most romantic rainbow.../%", "obj_npc_room_slash_Other_10_gml_1701_0");
        }
    }
}
if (room == room_dw_b3bs_intro)
{
    if (extflag == "lancer")
    {
        if (global.plot < 125)
        {
            with (obj_ch3_GSA07)
                con = 1;
            skip = 1;
        }
        else
        {
            if (talked == 0)
            {
                scr_speaker("lancer");
                msgsetloc(0, "\\E8* Go ahead and check the controller to be me!/", "obj_npc_room_slash_Other_10_gml_1737_0_b");
                msgnextloc("\\E3* Press \\cYsomething-something\\cW to move!/", "obj_npc_room_slash_Other_10_gml_1738_0");
                msgnextloc("\\E1* Press \\cYsomething-something\\cW to dig!/", "obj_npc_room_slash_Other_10_gml_1739_0");
                scr_anyface_next("ralsei", 20);
                msgnextloc("\\EK* Um^1, don't you know the controls?/", "obj_npc_room_slash_Other_10_gml_1741_0");
                scr_anyface_next("lancer", "2");
                msgnextloc("\\E2* Nope^1, I just press things randomly!/%", "obj_npc_room_slash_Other_10_gml_1743_0_b");
            }
            else
            {
                scr_speaker("lancer");
                msgsetloc(0, "\\E1* Go ahead and check the controller to be me!/%", "obj_npc_room_slash_Other_10_gml_1747_0");
            }
            if (global.plot >= 128)
            {
                if (talked == 0)
                {
                    var ate_spaghetti = scr_flag_get(356) > 0;
                    var sentence_end = ate_spaghetti ? "/" : "/%";
                    scr_speaker("susie");
                    msgsetloc(0, "\\EK* Hey^1, don't turn to stone while we're gone^1, OK?/", "obj_npc_room_slash_Other_10_gml_1758_0");
                    scr_anyface_next("lancer", 3);
                    msgnextloc("\\E3* No worries^1, Susie^1! Feel^1! I'm still warm and fluffy./", "obj_npc_room_slash_Other_10_gml_1760_0");
                    msgnextsubloc("\\E0* You'll know quickly if I become flaky and stale.~1", sentence_end, "obj_npc_room_slash_Other_10_gml_1761_0");
                    if (scr_flag_get(356) == 1)
                        msgnextloc("\\ED* Plus^1, I had a delicious pasta meal last time I became stone./%", "obj_npc_room_slash_Other_10_gml_1766_0");
                }
                else
                {
                    scr_speaker("lancer");
                    msgsetloc(0, "\\E1* Next round's starting^1! See you in the funny stages!/%", "obj_npc_room_slash_Other_10_gml_1771_0");
                }
            }
        }
    }
}
if (room == room_dw_inbetween)
{
    if (extflag == "zapper")
    {
        var rank = 0;
        var board_flag = 1173;
        var board_round = stringsetloc("1", "obj_npc_room_slash_Other_10_gml_1777_0_b");
        if (global.plot >= 160)
        {
            board_flag = 1174;
            board_round = stringsetloc("2", "obj_npc_room_slash_Other_10_gml_1782_0_b");
        }
        if (scr_flag_get(board_flag) > 0 && scr_flag_get(board_flag) < 4)
            rank = 1;
        if (scr_flag_get(board_flag) >= 4)
            rank = 2;
        if (scr_flag_get(board_flag) < 4)
        {
            if (scr_flag_get(1076) == 1 || scr_flag_get(1077) == 1)
                rank = 3;
        }
        var can_move = rank > 1;
        var rank_letter = scr_get_rank_letter(board_flag);
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Oh^1, it's you..^1. Let me check if you're on the guest list./", "obj_npc_room_slash_Other_10_gml_1791_0");
            msgnextloc("* .../", "obj_npc_room_slash_Other_10_gml_1792_0");
        }
        if (rank == 0)
        {
            var first_line = stringsetloc("* Oh no^1, it says here you're here on the ban list./", "obj_npc_room_slash_Other_10_gml_1797_0");
            if (talked > 0)
                msgset(0, first_line);
            else
                msgnext(first_line);
            msgnextloc("* Yep^1, right there^1, above..^1. well^1, try harder next time./%", "obj_npc_room_slash_Other_10_gml_1807_0");
        }
        else if (rank == 1)
        {
            var first_line = stringsetsubloc("* ..^1. Hmm. Says here you got only ~1-Rank on Board ~2. Try harder next time./%", rank_letter, board_round, "obj_npc_room_slash_Other_10_gml_1810_0_b");
            if (talked > 0)
                msgset(0, first_line);
            else
                msgnext(first_line);
        }
        else if (rank == 2)
        {
            msgnextsubloc("* ..^1. I see^1! ~1-rank on Board ~2. Please enjoy our luxury facilities./%", rank_letter, board_round, "obj_npc_room_slash_Other_10_gml_1822_0");
        }
        else if (rank == 3)
        {
            msgnextsubloc("* ..^1. Hmm. Says here you got only ~1-Rank on Board ~2. Try harder next time./", rank_letter, board_round, "obj_npc_room_slash_Other_10_gml_1827_0");
            msgnextloc("* ..^1. What? What's that? You have proof of an S-rank right there?/", "obj_npc_room_slash_Other_10_gml_1828_0_b");
            msgnextloc("* This..^1. Did the S always look this cool and angular?/", "obj_npc_room_slash_Other_10_gml_1829_0_b");
            msgnextloc("* ..^1. I guess it seems like something Tenna would do..^1. Alright^1, come on in./", "obj_npc_room_slash_Other_10_gml_1830_0");
            msgnextloc("* (The counterfeit S-rank was used up.)/%", "obj_npc_room_slash_Other_10_gml_1831_0");
        }
        with (obj_room_inbetween)
            zapper_move_start = can_move;
    }
    else if (extflag == "zapper_moved")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Please enjoy./%", "obj_npc_room_slash_Other_10_gml_1844_0");
    }
}
if (room == room_dw_b3bs_cheaterpippins)
{
    scr_speaker("pippins");
    if (extflag == "pippins3")
    {
        if (talked == 0)
        {
            msgsetloc(0, "* Key Card? Yep^1, that's just past here./", "obj_npc_room_slash_Other_10_gml_1856_0");
            msgnextloc("* ..^1. But you'd better forget about it./", "obj_npc_room_slash_Other_10_gml_1857_0");
            msgnextloc("* If you cheat^1, it'd draw attention to OUR cheating./%", "obj_npc_room_slash_Other_10_gml_1858_0");
        }
        else
        {
            msgsetloc(0, "* Our cheating is off-the-record^1, out-of-sight.../%", "obj_npc_room_slash_Other_10_gml_1862_0");
        }
    }
    if (extflag == "pippins1")
    {
        msgsetloc(0, "* Kris^1! Want to play a money-making game?/", "obj_npc_room_slash_Other_10_gml_1867_0");
        msgnextloc("* Just remember..^1. It's off the record. Hee hee hee./%", "obj_npc_room_slash_Other_10_gml_1868_0");
    }
    if (extflag == "pippins2")
        msgsetloc(0, "* It's not against the rules if there's no evidence^1, right?/%", "obj_npc_room_slash_Other_10_gml_1872_0");
}
if (room == room_dw_puzzlecloset_1)
{
    if (extflag == "ribbickhelpful")
    {
        scr_speaker("Ribbick");
        msgsetloc(0, "* (Hmm..^1. are you SURE that's the right order?)/%", "obj_npc_room_slash_Other_10_gml_1900_0");
    }
}
if (room == room_dw_puzzlecloset_2)
{
    if (extflag == "ribbick")
    {
        scr_speaker("Ribbick");
        msgsetloc(0, "* (Don't you remember the combination...?)/%", "obj_npc_room_slash_Other_10_gml_1895_0");
    }
    if (extflag == "ribbickhelpful")
    {
        scr_speaker("Ribbick");
        msgsetloc(0, "* (Are you sure that's the right date?)/%", "obj_npc_room_slash_Other_10_gml_1886_0");
    }
}
if (room == room_dw_b3bs_bibliox)
{
    if (extflag == "bibliox")
    {
        scr_speaker("Bibliox");
        msgsetloc(0, "* Mumble..^1. mumble..^1. fumble..^1. fumble.../", "obj_npc_room_slash_Other_10_gml_1909_0");
        msgnextloc("* (He hardly seems comprehensible.)/%", "obj_npc_room_slash_Other_10_gml_1910_0");
    }
    if (extflag == "bibliox_after")
    {
        scr_speaker("Bibliox");
        msgsetloc(0, "* Mumble^1, mumble.../", "obj_npc_room_slash_Other_10_gml_1915_0");
        msgnextloc("* You know^1, it's quite hard to understand you sometimes./", "obj_npc_room_slash_Other_10_gml_1916_0");
        msgnextloc("* Perhaps you should try speaking up!/%", "obj_npc_room_slash_Other_10_gml_1917_0");
    }
    if (global.flag[1055] >= 6)
    {
        var egg = false;
        if (global.flag[1092] == 6)
            egg = true;
        if (!egg)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Mumble..^1. no more characters..^1. all gone.../", "obj_npc_room_slash_Other_10_gml_1953_0");
            msgnextloc("* What? You want to find them?/", "obj_npc_room_slash_Other_10_gml_1954_0");
            msgnextloc("* No^1, no^1, they already went nowhere.../", "obj_npc_room_slash_Other_10_gml_1955_0");
            msgnextloc("* ..^1. the ticket..^1. it's under the ball machine.../%", "obj_npc_room_slash_Other_10_gml_1956_0");
            global.flag[1092] = 5;
            if (talked)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* ..^1. the ticket..^1. it's under the ball machine.../%", "obj_npc_room_slash_Other_10_gml_1962_0");
            }
        }
        else
        {
            scr_speaker("Bibliox");
            msgsetloc(0, "* Mumble^1, mumble.../", "obj_npc_room_slash_Other_10_gml_1948_0");
            msgnextloc("* My favorite game^1, what a shame.../%", "obj_npc_room_slash_Other_10_gml_1949_0");
        }
    }
}
if (room == room_dw_b3bs_zapper_b)
{
    if (extflag == "watercooler")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a Water Cooler. Liquid is imprisoned inside.)/%", "obj_npc_room_slash_Other_10_gml_1926_0");
    }
}
if (room == room_dw_b3bs_watercooler)
{
    if (extflag == "zapperleft")
    {
        scr_speaker("zapper");
        msgsetloc(0, "* Well^1, now we ain't got no water./%", "obj_npc_room_slash_Other_10_gml_1935_0");
    }
    if (extflag == "zapperright")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* The hell'd you recruit our cooler for.../%", "obj_npc_room_slash_Other_10_gml_1940_0");
        var violenceused = 0;
        if (global.flag[588] == 1)
            violenceused = 1;
        if (violenceused)
            msgsetloc(0, "* The hell'd you beat up our cooler for.../%", "obj_npc_room_slash_Other_10_gml_1945_0");
    }
}
if (room == room_dw_teevie_preview)
{
    if (extflag == "zapper")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Don't tell anyone..^1. but dis little guy is my closest pal./", "obj_npc_room_slash_Other_10_gml_1985_0");
            msgnextloc("* Since da Pippins are rulebreakers^1, we ain't s'poseda be friendly with 'em.../", "obj_npc_room_slash_Other_10_gml_1986_0");
            msgnextloc("* But dis guy^1, he's real nice!/%", "obj_npc_room_slash_Other_10_gml_1987_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Dis guy is the only one you can trust. Remember his face./%", "obj_npc_room_slash_Other_10_gml_1962_0_b");
        }
        if (global.plot >= 160)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Y'know^1, I'm a bit worried..^1. ain't Pippinses originally from Card Castle?/", "obj_npc_room_slash_Other_10_gml_1997_0");
            msgnextloc("* If dis guy turned ta stone^1, I ain't sure what I'd do.../%", "obj_npc_room_slash_Other_10_gml_1998_0");
        }
        if (scr_flag_get(1076) > 0 || scr_flag_get(1077) > 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I saw you buy it. Only a fool would be tricked by a counterfeit like that./%", "obj_npc_room_slash_Other_10_gml_1975_0");
        }
    }
    if (extflag == "zapper_stone")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Some kind of stone statue.)/%", "obj_npc_room_slash_Other_10_gml_2011_0_b");
    }
    if (extflag == "vending")
    {
        global.msc = 1298;
        scr_text(global.msc);
    }
    if (extflag == "curtain")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* The couch cliffs^1, how purple and majestic they were./", "obj_npc_room_slash_Other_10_gml_2025_0");
            msgnextloc("* The dusty^1, the empty^1, such are the worlds such as those./%", "obj_npc_room_slash_Other_10_gml_2026_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ooo la la. The purple worlds^1, you think they give the creeps./", "obj_npc_room_slash_Other_10_gml_2030_0");
            msgnextloc("* Tsk..^1. You have seen naught but that tempered by light./", "obj_npc_room_slash_Other_10_gml_2031_0");
            msgnextloc("* You should thank Tenna for brightening everything up./%", "obj_npc_room_slash_Other_10_gml_2032_0_b");
        }
    }
    if (extflag == "shutta")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* In the once upon a time^1, there was a land like purple cliffs./", "obj_npc_room_slash_Other_10_gml_2041_0");
            msgnextloc("* A frozen waste^1, watery basin^1, a metal desert./", "obj_npc_room_slash_Other_10_gml_2042_0");
            msgnextloc("* But^1, this theater was built upon that..^1. and^1, it grew./%", "obj_npc_room_slash_Other_10_gml_2043_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Not everyone liked the change. Some people left./", "obj_npc_room_slash_Other_10_gml_2047_0_b");
            msgnextloc("* Of course^1, that was in the days of the black-and-white./%", "obj_npc_room_slash_Other_10_gml_2048_0");
        }
    }
}
if (room == room_dw_b3bs_jail1)
{
    if (extflag == "sam")
    {
        scr_speaker("goulden sam");
        msgsetloc(0, "* (On my first day^1, I was taken and brought to this place.)/", "obj_npc_room_slash_Other_10_gml_1991_0");
        msgnextloc("* (I've never met another of my kind...)/%", "obj_npc_room_slash_Other_10_gml_1992_0");
        if (talked)
        {
            scr_speaker("goulden sam");
            msgsetloc(0, "* (Am I the only one? Am I original?)/%", "obj_npc_room_slash_Other_10_gml_1996_0");
        }
    }
    if (extflag == "jailpippins")
    {
        global.msc = 1407;
        scr_text(global.msc);
    }
    if (extflag == "starwalker")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* This Jail is still \\cYPissing\\cW me off/", "obj_npc_room_slash_Other_10_gml_2009_0");
        msgnextloc("* I am the original\n                    \\cYStarwalker\\cW/%", "obj_npc_room_slash_Other_10_gml_2010_0");
    }
    if (extflag == "shadowguy")
    {
        scr_animate(0, 4, 0.35);
        snd_stop(snd_shadowman_sax_1);
        snd_stop(snd_shadowman_sax_2);
        snd_stop(snd_shadowman_sax_3);
        snd_play(choose(snd_shadowman_sax_1, snd_shadowman_sax_2, snd_shadowman_sax_3));
        skip = 1;
        global.interact = 0;
    }
    if (extflag == "freepippins")
    {
        scr_speaker("pippins");
        msgsetloc(0, "* This is the dungeon. Press your luck against security.../", "obj_npc_room_slash_Other_10_gml_2027_0_b");
        msgnextloc("* ..^1. And you'll end up in one of these cages. Hee hee./%", "obj_npc_room_slash_Other_10_gml_2028_0_b");
        if (talked == 1)
        {
            scr_speaker("pippins");
            msgsetloc(0, "* This place is like a maze^1, so getting sent around is confusing./", "obj_npc_room_slash_Other_10_gml_2032_0");
            msgnextloc("* By the way^1, you should really clean up around here!/%", "obj_npc_room_slash_Other_10_gml_2033_0");
        }
    }
}
if (room == room_dw_b3bs_jail2)
{
    if (extflag == "SuilverSam")
    {
        scr_speaker("SuilverSam");
        msgsetloc(0, "* (I'm Suilver Sam.)/%", "obj_npc_room_slash_Other_10_gml_2043_0_b");
        if (talked)
        {
            scr_speaker("SuilverSam");
            msgsetloc(0, "* (Am I the only one? Yeah-hah..^1. Am I original? Yeah-hah...)/%", "obj_npc_room_slash_Other_10_gml_2047_0");
        }
    }
    if (extflag == "Pippins")
    {
        scr_speaker("Pippins");
        msgsetloc(0, "* This is Punishment Cage B./", "obj_npc_room_slash_Other_10_gml_2053_0");
        msgnextloc("* Having been in both^1, it's better than Cage A^1, but not by much./%", "obj_npc_room_slash_Other_10_gml_2054_0_b");
    }
    if (extflag == "Zapper")
    {
        if (global.flag[1093] == 0)
        {
            global.msc = 1315;
            scr_text(global.msc);
        }
        else
        {
            scr_speaker("Zapper");
            msgsetloc(0, "* I see dat ain't too effective. Okay..^1. alright.../%", "obj_npc_room_slash_Other_10_gml_2066_0");
        }
    }
}
if (room == room_dw_b3bs_cooltrashy)
{
    if (extflag == "trashy")
    {
        scr_speaker("Cool Trashy");
        if (talked == 0)
        {
            msgsetloc(0, "* Me? Dance? Why would I do that?/", "obj_npc_room_slash_Other_10_gml_2083_0");
            msgnextloc("* I'm the Serious Trashy./", "obj_npc_room_slash_Other_10_gml_2084_0");
            msgnextloc("* ..^1. Gee whiz^1, you don't know the personality of your own trashcan?/%", "obj_npc_room_slash_Other_10_gml_2085_0");
        }
        else
        {
            msgsetloc(0, "* Come to YOUR town? Can't you see I'm busy here?/%", "obj_npc_room_slash_Other_10_gml_2089_0");
        }
        if (scr_enemylostcheck("ribbick"))
        {
            msgsetloc(0, "* You \"trash\"..^1. You \"absolute garbage\".../", "obj_npc_room_slash_Other_10_gml_2166_0");
            msgnextloc("* Ha^1! You wish I could call you those great terms of respect./", "obj_npc_room_slash_Other_10_gml_2167_0");
            msgnextloc("* You treated the dusty with destruction. You're not even worth a trash can's time./%", "obj_npc_room_slash_Other_10_gml_2168_0");
            if (talked)
                msgsetloc(0, "* You're not even worth a trash can's time./%", "obj_npc_room_slash_Other_10_gml_2171_0");
        }
    }
    if (extflag == "ribbick")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's admiring his serious vibes.)/%", "obj_npc_room_slash_Other_10_gml_2095_0");
    }
}
if (room == room_dw_b3bs_zapper_d)
{
    if (extflag == "zapper")
    {
        global.msc = 1317;
        scr_text(global.msc);
    }
}
if (room == room_dw_b3bs_sadshadowguys)
{
    if (extflag == "poppins")
    {
        scr_speaker("pippins");
        msgsetloc(0, "* Poor guys^1! They signed on with Tenna so they could play jazz.../", "obj_npc_room_slash_Other_10_gml_2113_0");
        msgnextloc("* But they didn't read the fine print./", "obj_npc_room_slash_Other_10_gml_2114_0");
        msgnextloc("* Now they're up to their necks in contracts^1, doing whatever he says./%", "obj_npc_room_slash_Other_10_gml_2115_0");
        if (talked)
            msgsetloc(0, "* Me? I signed with a fake name. \"Poppins\". He'll never figure it out./%", "obj_npc_room_slash_Other_10_gml_2119_0");
    }
    if (extflag == "sadshad")
    {
        snd_stop(snd_shadowman_sax_1);
        snd_stop(snd_shadowman_sax_2);
        snd_stop(snd_shadowman_sax_3);
        snd_play_x(choose(snd_shadowman_sax_1, snd_shadowman_sax_2, snd_shadowman_sax_3), 1, random_range(0.9, 1));
        skip = 1;
        global.interact = 0;
    }
}
if (room == room_dw_teevie_shadow_guys)
{
    if (extflag == "sadshad")
    {
        snd_stop(snd_shadowman_sax_1);
        snd_stop(snd_shadowman_sax_2);
        snd_stop(snd_shadowman_sax_3);
        snd_play_x(choose(snd_shadowman_sax_1, snd_shadowman_sax_2, snd_shadowman_sax_3), 1, random_range(0.9, 1));
        skip = 1;
        global.interact = 0;
    }
    if (extflag == "pip")
    {
        scr_speaker("pippins");
        msgsetloc(0, "* Look at all those contracts^1, man.. Can't believe Tenna's got 'em doing anything he wants!/%", "obj_npc_room_slash_Other_10_gml_2213_0");
        if (scr_enemylostcheck("shadowguys"))
        {
            msgsetloc(0, "* The Shadowguys are supposed to be here doing Tenna's contract work.../", "obj_npc_room_slash_Other_10_gml_2235_0");
            msgnextloc("* But^1, they got scared you beat them up^1, so they split./%", "obj_npc_room_slash_Other_10_gml_2236_0");
            if (talked)
                msgsetloc(0, "* Hey^1, at least you SPAREd them from doing some work!/%", "obj_npc_room_slash_Other_10_gml_2239_0");
        }
        if (global.flag[1055] >= 6)
        {
            scr_speaker("pippins");
            msgsetloc(0, "* The Shadowguys are supposed to be doing Tenna's contract work.../", "obj_npc_room_slash_Other_10_gml_2245_0");
            msgnextloc("* But^1, seems like the whole system got shut down somehow./", "obj_npc_room_slash_Other_10_gml_2246_0");
            msgnextloc("* No one knows what they should do now.../%", "obj_npc_room_slash_Other_10_gml_2247_0");
        }
        if (global.flag[1147] == 1)
        {
            if (global.flag[1055] < 6)
            {
                scr_speaker("pippins");
                msgsetloc(0, "* Amazing^1, you shredded their contracts^1! ..^1. legally^1, I'm not sure that means anything../", "obj_npc_room_slash_Other_10_gml_2218_0");
                msgnextloc("* But hey^1, if they knew legal stuff^1, they wouldn't have signed in the first place!/%", "obj_npc_room_slash_Other_10_gml_2219_0");
            }
            else
            {
                scr_speaker("pippins");
                msgsetloc(0, "* Heh^1, looks like they decided that if the game doesn't work^1, why should they?/%", "obj_npc_room_slash_Other_10_gml_2261_0");
            }
        }
    }
}
if (room == room_dw_tv_curtain)
{
    if (extflag == "zapper")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Yah performance will be graded. \"S-Rank^1,\" \"A-rank\"^1, dat sorta thing.../", "obj_npc_room_slash_Other_10_gml_2131_0");
            msgnextloc("* There ain't no shame in having a low rank^1, so just have fun./%", "obj_npc_room_slash_Other_10_gml_2132_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Dere might be a special room for \"S-Rank\" winners.../%", "obj_npc_room_slash_Other_10_gml_2136_0");
        }
    }
    if (extflag == "rouxls")
    {
        scr_speaker("rouxls");
        msgsetloc(0, "\\E6* So^1, any Ideas on howth I can be TV Guy's second-in-command?/%", "obj_npc_room_slash_Other_10_gml_2143_0");
    }
    if (extflag == "starwalker")
    {
        scr_funnytext_init(0, 0, -10, scr_84_get_sprite("spr_funnytext_star"), 0, 0);
        scr_speaker("no_name");
        msgsetloc(0, "* I will be the \\O0\n                  walker.../%", "obj_npc_room_slash_Other_10_gml_2151_0");
    }
    if (extflag == "pedestal")
    {
        global.msc = 1412;
        scr_text(global.msc);
    }
}
if (room == room_dw_b3bs_shop || room == room_dw_b3bs_jail1)
{
    if (extflag == "vending")
        skip = 1;
}
if (room == room_dw_ranking_z)
{
    if (extflag == "phone")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a phone...)&* (It seems to be unplugged.)/%", "obj_npc_room_slash_Other_10_gml_2270_0");
    }
}
if (room == room_dw_ranking_hub)
{
    if (extflag == "lanino")
    {
        if (scr_flag_get(1211) == 0)
        {
            with (obj_room_ranking_hub)
                con = 60;
            skip = 1;
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Thanks^1, Kris^1! You shone a little light on my life!/%", "obj_npc_room_slash_Other_10_gml_2286_0");
        }
    }
    else if (extflag == "vending")
    {
        instance_create(camerax(), cameray(), obj_shop_vending_reverse);
        skip = 1;
    }
    else if (extflag == "vending_exchange")
    {
        instance_create(camerax(), cameray(), obj_shop_vending_ranking);
        skip = 1;
    }
}
if (room == room_dw_ranking_c)
{
    if (extflag == "zapper_left")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* I love da drink my favorite abundant resource!/%", "obj_npc_room_slash_Other_10_gml_2304_0");
    }
    else if (extflag == "zapper_right")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Drink quietly..^1. talk respectfully./%", "obj_npc_room_slash_Other_10_gml_2308_0");
    }
    else if (extflag == "zapper_left_crater")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Water..^1. is scarce. Wars..^1. will be fought./%", "obj_npc_room_slash_Other_10_gml_2312_0");
    }
    else if (extflag == "zapper_right_crater")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Ahh..^1. you're da kinda person that drinks from an oasis 8 times./%", "obj_npc_room_slash_Other_10_gml_2316_0");
    }
}
if (room == room_dw_snow_zone)
{
    if (extflag == "ralsei_down")
    {
        if (talked == 0)
        {
            scr_speaker("ralsei");
            global.fc = 0;
            msgsetloc(0, "* K..^1. Kris..^1. I.../", "obj_npc_room_slash_Other_10_gml_2327_0");
            msgnextloc("* .../", "obj_npc_room_slash_Other_10_gml_2328_0");
            msgnextloc("* I'll be..^1. fine./", "obj_npc_room_slash_Other_10_gml_2329_0");
            msgnextloc("* You do..^1. whatever you need to./%", "obj_npc_room_slash_Other_10_gml_2330_0");
        }
        else
        {
            scr_speaker("ralsei");
            global.fc = 0;
            msgsetloc(0, "* .../%", "obj_npc_room_slash_Other_10_gml_2334_0");
        }
    }
    else if (extflag == "ralsei_down_knight")
    {
        if (talked == 0)
        {
            scr_speaker("ralsei");
            global.fc = 0;
            msgsetloc(0, "* .../", "obj_npc_room_slash_Other_10_gml_2341_0");
            msgnextloc("* Somehow^1, I thought we..^1. had won..^1. for a moment.../", "obj_npc_room_slash_Other_10_gml_2342_0");
            msgnextloc("* That..^1. we would be able to end the battle..^1. here and now.../", "obj_npc_room_slash_Other_10_gml_2343_0");
            msgnextloc("* ..^1. you.../", "obj_npc_room_slash_Other_10_gml_2344_0");
            msgnextloc("* You were so brave..^1. and yet.../", "obj_npc_room_slash_Other_10_gml_2345_0");
            msgnextloc("* In the end..^1. our struggle.../", "obj_npc_room_slash_Other_10_gml_2346_0");
            msgnextloc("* It's only beginning^1, isn't it...?/", "obj_npc_room_slash_Other_10_gml_2347_0");
            msgnextloc("* ..^1. Isn't it^1, Kris...?/", "obj_npc_room_slash_Other_10_gml_2348_0");
            msgnextloc("* .../%", "obj_npc_room_slash_Other_10_gml_2349_0");
        }
        else
        {
            scr_speaker("ralsei");
            global.fc = 0;
            msgsetloc(0, "* Kris^1, I..^1. I'll be fine./", "obj_npc_room_slash_Other_10_gml_2353_0");
            msgnextloc("* But..^1. if I'm hurt this badly^1, then Susie must be.../", "obj_npc_room_slash_Other_10_gml_2354_0");
            msgnextloc("* Kris..^1. you'll..^1. make sure she's alright^1, won't you?/%", "obj_npc_room_slash_Other_10_gml_2355_0");
        }
    }
}
if (room == room_dw_teevie_dust_south)
{
    if (extflag == "shutta")
    {
        global.writersnd[0] = snd_camera_flash;
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* There once was the great wilderness here^1! Yes.../", "obj_npc_room_slash_Other_10_gml_2369_0");
            msgnextloc("* But^1, the world became the theater^1, and us^1, children of Tenna's contract./", "obj_npc_room_slash_Other_10_gml_2370_0");
            msgnextloc("* Those that did not sign the paper^1, set off for the far land and were forgotten./", "obj_npc_room_slash_Other_10_gml_2371_0");
            msgnextloc("* Now..^1. only the legend old hermit still knows the way to the place./", "obj_npc_room_slash_Other_10_gml_2372_0");
            msgnextloc("* ..^1. Kris? Do you do not know him so much?/%", "obj_npc_room_slash_Other_10_gml_2373_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Even the water spirits were put to the bottles and coo as coolers.../", "obj_npc_room_slash_Other_10_gml_2377_0");
            msgnextloc("* A liquid contract..^1. a waste of their natural figure. Ooh la la./%", "obj_npc_room_slash_Other_10_gml_2378_0");
        }
        if (scr_flag_get(1092) > 0)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Kris^1! What^1, you met such an old hermit./", "obj_npc_room_slash_Other_10_gml_2386_0");
                msgnextloc("* ..^1. Ooh la la. No. I don't believe anything^1, without the picture./%", "obj_npc_room_slash_Other_10_gml_2387_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Except for the astrology./", "obj_npc_room_slash_Other_10_gml_2391_0");
                msgnextloc("* Because of course..^1. I am the star.\\S0/%", "obj_npc_room_slash_Other_10_gml_2392_0");
            }
        }
        if (scr_flag_get(930) > 0)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Kris^1! You suddenly look much more adult./", "obj_npc_room_slash_Other_10_gml_2401_0");
                msgnextloc("* What is it? Did you make the journey?/", "obj_npc_room_slash_Other_10_gml_2402_0");
                msgnextloc("* Well^1, slow down^1! Let me get the picture of your youth!\\S0/%", "obj_npc_room_slash_Other_10_gml_2403_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Kris^1! Our Kris...\\S0/%", "obj_npc_room_slash_Other_10_gml_2407_0");
            }
        }
    }
}
if (room == room_dw_teevie_chef)
{
    skip = 1;
    if (extflag == "rouxls")
    {
        with (obj_room_teevie_chef)
            con = 40;
    }
    else if (extflag == "lanino")
    {
        with (obj_room_teevie_chef)
            con = 20;
    }
    else if (extflag == "elnina")
    {
        with (obj_room_teevie_chef)
            con = 30;
    }
}
if (room == room_dw_backstage)
{
    if (extflag == "starwalker")
    {
        if (scr_flag_get(1240) == 0)
            scr_flag_set(1240, 1);
        scr_speaker("no_name");
        msgsetloc(0, "* I was the \\cYstar\\cW/", "obj_npc_room_slash_Other_10_gml_2438_0");
        msgnextloc("* \n                  walker.../%", "obj_npc_room_slash_Other_10_gml_2439_0");
    }
}
if (skip == 0)
{
    var objInd = 396;
    if (global.chapter == 3 && room == room_dw_ch3_man)
        objInd = 184;
    remanimspeed = image_speed;
    myinteract = 3;
    mydialoguer = instance_create(0, 0, objInd);
    mydialoguer.jpspecial = jpspecial;
    talked += 1;
}
