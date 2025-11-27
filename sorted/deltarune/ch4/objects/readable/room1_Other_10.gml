var meminteract = global.interact;
myinteract = 3;
global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fe = 0;
global.fc = 0;
global.interact = 1;
with (obj_darkcontroller)
    charcon = 0;
global.msg[0] = stringsetloc("* Suddenly^1, your body seizes up^1.&* What are you looking at?/%", "obj_readable_room1_slash_Other_10_gml_13_0");
if (scr_debug())
    global.msg[0] = stringset("* [NO TEXT] (obj_readable_room1)/%");
if (room == room_krisroom)
{
    if (y < 150)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* There are CDs under the bed^1.&* Classical^1, jazz^1, religious ska.../", "obj_readable_room1_slash_Other_10_gml_21_0");
            global.msg[1] = stringsetloc("* There's also a game console^1.&* It has one normal controller^1, and one knock-off one./%", "obj_readable_room1_slash_Other_10_gml_22_0");
        }
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* Underneath the bed is an old cartridge of \"Cat Petters RPG\"./", "obj_readable_room1_slash_Other_10_gml_28_0");
            msgnextloc("* \"catti `& catty\" can be seen faintly written on it in worn gel pen./%", "obj_readable_room1_slash_Other_10_gml_29_0");
            if (global.chapter == 4)
            {
                if (scr_havechar(2))
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\E0* Can we like..^1. toss? Some of your brother's CDs?/", "obj_readable_room1_slash_Other_10_gml_38_0");
                    msgnextloc("\\E2* No^1, I mean like a frisbee. For fun. C'mon./%", "obj_readable_room1_slash_Other_10_gml_39_0");
                }
            }
        }
    }
    else
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* It's a computer desk^1.&* There are many boxes under it filled with old books./%", "obj_readable_room1_slash_Other_10_gml_36_0");
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* On the computer's desktop is a folder called \"EPIC games Stuff!!!!\"/", "obj_readable_room1_slash_Other_10_gml_42_0");
            msgnextloc("* It's a poorly-drawn design for a game.../", "obj_readable_room1_slash_Other_10_gml_43_0");
            msgnextloc("* Seems the last boss is a creature with giant rainbow wings./", "obj_readable_room1_slash_Other_10_gml_44_0");
            msgnextloc("* Doesn't seem like this game ever saw the light of day.../%", "obj_readable_room1_slash_Other_10_gml_45_0");
            if (global.chapter == 4)
            {
                if (scr_havechar(2))
                {
                    if (read == 0)
                    {
                        scr_speaker("susie");
                        msgsetloc(0, "\\E9* HAHAHA!!^1! WHAT IS THIS COMPUTER WALLPAPER???/", "obj_readable_room1_slash_Other_10_gml_66_0");
                        msgnextloc("\\E7* What AGE did you and your brother draw this at!?/", "obj_readable_room1_slash_Other_10_gml_67_0");
                        msgnextloc("\\E9* Glad we didn't go to THIS Cyber World^1! Haha^1, what the hell?/%", "obj_readable_room1_slash_Other_10_gml_68_0");
                    }
                    else
                    {
                        scr_speaker("susie");
                        msgsetloc(0, "\\E7* Hey^1, and in the corner^1, that's that cat thing from Castle Town!/", "obj_readable_room1_slash_Other_10_gml_72_0");
                        msgnextloc("\\EK* You know^1, the shop thing^1! The..^1. cat..^1. the stitch thing^1! Whatever./%", "obj_readable_room1_slash_Other_10_gml_73_0");
                    }
                }
            }
        }
    }
    if (x > 100)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* The drawer is mostly empty^1, except for.../", "obj_readable_room1_slash_Other_10_gml_54_0");
            global.msg[1] = stringsetloc("* A school cross country shirt with a tear in it./%", "obj_readable_room1_slash_Other_10_gml_55_0");
            if (global.filechoice == 1)
                global.msg[1] = stringsetloc("* A very old school ID with an embarrassing haircut./%", "obj_readable_room1_slash_Other_10_gml_56_0");
            if (global.filechoice == 2)
            {
                global.msg[1] = stringsetloc("* A coupon book^1.&* Every coupon is for half-off a large pizza./", "obj_readable_room1_slash_Other_10_gml_59_0");
                global.msg[2] = stringsetloc("* All the coupons expired before the book's print date./%", "obj_readable_room1_slash_Other_10_gml_60_0");
            }
            if (read > 0)
                global.msg[0] = stringsetloc("* There's nothing useful in the drawer./%", "obj_readable_room1_slash_Other_10_gml_64_0");
        }
        if (global.chapter >= 2)
        {
            scr_speaker("no_name");
            global.msc = 1049;
            scr_text(global.msc);
        }
    }
    if (x > 136)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* It's a beautiful day outside./%", "obj_readable_room1_slash_Other_10_gml_80_0");
        if (global.chapter >= 2)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Even after a long night^1, the sunrise is the same as always./%", "obj_readable_room1_slash_Other_10_gml_86_0");
        }
    }
    if (x > 192)
    {
        scr_speaker("no_name");
        global.msg[0] = stringsetloc("* Clothes drawer./%", "obj_readable_room1_slash_Other_10_gml_91_0");
    }
    if (x > 220)
    {
        scr_speaker("no_name");
        global.msg[0] = stringsetloc("* Your bed./%", "obj_readable_room1_slash_Other_10_gml_96_0");
        if (global.chapter == 1)
        {
            if (global.tempflag[10] == 1 && global.plot < 10)
            {
                global.msc = 402;
                scr_text(global.msc);
            }
            if (global.plot >= 250)
            {
                global.msc = 400;
                scr_text(global.msc);
            }
        }
        if (global.chapter == 2)
        {
            if (global.tempflag[39] == 1 && global.plot < 10)
            {
                global.msc = 402;
                scr_text(global.msc);
            }
        }
        if (global.chapter == 4)
        {
            if (scr_havechar(2))
            {
                if (scr_flag_get(747) == 0)
                {
                    with (obj_ch4_PDC01D)
                    {
                        susie_con = 1;
                        con = 0;
                    }
                    skip = 1;
                }
            }
        }
    }
    if (x > 250)
    {
        global.msg[0] = stringsetloc("* It's stained./%", "obj_readable_room1_slash_Other_10_gml_112_0");
        if (global.chapter == 4)
        {
            if (scr_havechar(2))
            {
                if (scr_flag_get(748) == 0)
                {
                    with (obj_ch4_PDC01D)
                    {
                        susie_con = 2;
                        con = 0;
                    }
                    skip = 1;
                }
            }
            if (scr_flag_get(748) > 0)
                skip = 1;
        }
    }
}
if (room == room_debug_loc)
{
    global.msg[0] = stringsetloc("* The door is locked./%", "obj_readable_room1_slash_Other_10_gml_120_0");
    if (x > 120)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* It's only you./%", "obj_readable_room1_slash_Other_10_gml_127_0");
        if (global.chapter >= 2)
            msgsetloc(0, "* (It's what they call \"you.\")/%", "obj_readable_room1_slash_Other_10_gml_133_0");
    }
    if (x > 160)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* There are crayons in the drawer^1. Their labels have long faded^1, and there's no green./%", "obj_readable_room1_slash_Other_10_gml_141_0");
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (..^1. How to Draw Dragons is at the bottom of the drawer.)/", "obj_readable_room1_slash_Other_10_gml_147_0");
            msgnextloc("* (The purple character on the cover is dressed..^1. immodestly.)/", "obj_readable_room1_slash_Other_10_gml_148_0_b");
            msgnextloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_148_0");
            msgnextloc("* (Your brother will never return this book.)/%", "obj_readable_room1_slash_Other_10_gml_150_0");
        }
    }
    if (x > 220)
        global.msg[0] = stringsetloc("* A cactus^1.&* There's not much to say about it./%", "obj_readable_room1_slash_Other_10_gml_169_0");
    if (x > 320)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* There are many books./", "obj_readable_room1_slash_Other_10_gml_177_0");
            global.msg[1] = stringsetloc("* Tales of Snails - A Story Book./", "obj_readable_room1_slash_Other_10_gml_178_0");
            global.msg[2] = stringsetloc("* Snails Do Not Have Tails -&A Scientific Refutation./", "obj_readable_room1_slash_Other_10_gml_179_0");
            global.msg[3] = stringsetloc("* Can Snails Help Your Garden? Um, Not Really./", "obj_readable_room1_slash_Other_10_gml_180_0");
            global.msg[4] = stringsetloc("* And a signed copy of The History of Humans and Monsters, by Gerson Boom./%", "obj_readable_room1_slash_Other_10_gml_181_0");
            if (read > 0)
                global.msg[0] = stringsetloc("* There's no time to read anything right now./%", "obj_readable_room1_slash_Other_10_gml_184_0");
        }
        if (global.chapter >= 2)
            msgsetloc(0, "* (There's no time to read books. Just generally.)/%", "obj_readable_room1_slash_Other_10_gml_175_0");
    }
}
if (room == room_krishallway)
{
    global.msg[0] = stringsetloc("* The door is locked./%", "obj_readable_room1_slash_Other_10_gml_120_0");
    if (x > 120)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* It's only you./%", "obj_readable_room1_slash_Other_10_gml_127_0");
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (It's what they call \"you.\")/%", "obj_readable_room1_slash_Other_10_gml_196_0");
            if (global.chapter == 4)
            {
                if (scr_havechar(2))
                {
                    if (read == 0)
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* (It's hard to put into words^1, but for some reason^1, seeing Susie next to you...)/", "obj_readable_room1_slash_Other_10_gml_291_0");
                        msgnextloc("* (..^1. You felt like^1, whatever you were^1, for just right now^1, it might be okay.)/%", "obj_readable_room1_slash_Other_10_gml_292_0");
                    }
                    else
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* (Susie is staring into the mirror with the two of you in it.)/", "obj_readable_room1_slash_Other_10_gml_296_0");
                        scr_anyface_next("susie", "N");
                        msgnextloc("\\EN* Huh? What was I thinking? ..^1. nothing./%", "obj_readable_room1_slash_Other_10_gml_298_0");
                    }
                }
            }
            if (x < 160)
            {
                with (obj_event_manager)
                    trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_28);
            }
        }
    }
    if (x > 160 && x < 190)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* There are crayons in the drawer^1. Their labels have long faded^1, and there's no green./%", "obj_readable_room1_slash_Other_10_gml_141_0");
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (..^1. How to Draw Dragons is at the bottom of the drawer.)/", "obj_readable_room1_slash_Other_10_gml_210_0");
            msgnextloc("* (The purple character on the cover is dressed..^1. immodestly.)/", "obj_readable_room1_slash_Other_10_gml_211_0_b");
            msgnextloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_148_0");
            msgnextloc("* (Your brother will never return this book.)/%", "obj_readable_room1_slash_Other_10_gml_213_0");
            if (global.chapter == 4)
            {
                if (scr_havechar(2))
                {
                    if (scr_flag_get(746) == 0)
                    {
                        scr_flag_set(746, 1);
                        scr_speaker("no_name");
                        msgsetloc(0, "* (You open the drawer that contains How To Draw Dragons.)/", "obj_readable_room1_slash_Other_10_gml_329_0");
                        scr_anyface_next("susie", 14);
                        msgnextloc("\\EE* Woah^1, what the heck is -/", "obj_readable_room1_slash_Other_10_gml_331_0");
                        scr_anyface_next("no_name");
                        msgnextloc("* (You shut the drawer as fast as humanly possible.)/%", "obj_readable_room1_slash_Other_10_gml_333_0");
                    }
                    else
                    {
                        scr_speaker("susie");
                        msgsetloc(0, "\\E7* Kris? Hey? Kris^1, hey^1, can we see that again? Kris?/%", "obj_readable_room1_slash_Other_10_gml_337_0_b");
                    }
                }
            }
        }
    }
    if (x > 220)
    {
        global.msg[0] = stringsetloc("* A cactus^1.&* There's not much to say about it./%", "obj_readable_room1_slash_Other_10_gml_169_0");
        if (global.chapter == 4)
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's a cactus. It loves you^1, but mainly shows a sharp side.)/", "obj_readable_room1_slash_Other_10_gml_353_0");
                msgnextloc("* (If only there was a word for that kind of personality.)/%", "obj_readable_room1_slash_Other_10_gml_354_0_b");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (A word you liked.)/%", "obj_readable_room1_slash_Other_10_gml_358_0");
            }
        }
    }
    if (x > 320)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* There are many books./", "obj_readable_room1_slash_Other_10_gml_177_0");
            global.msg[1] = stringsetloc("* Tales of Snails - A Story Book./", "obj_readable_room1_slash_Other_10_gml_178_0");
            global.msg[2] = stringsetloc("* Snails Do Not Have Tails -&A Scientific Refutation./", "obj_readable_room1_slash_Other_10_gml_179_0");
            global.msg[3] = stringsetloc("* Can Snails Help Your Garden? Um, Not Really./", "obj_readable_room1_slash_Other_10_gml_180_0");
            global.msg[4] = stringsetloc("* And a signed copy of The History of Humans and Monsters, by Gerson Boom./%", "obj_readable_room1_slash_Other_10_gml_181_0");
            if (read > 0)
                global.msg[0] = stringsetloc("* There's no time to read anything right now./%", "obj_readable_room1_slash_Other_10_gml_184_0");
        }
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (There's no time to read books. Just generally.)/%", "obj_readable_room1_slash_Other_10_gml_253_0");
            if (global.chapter == 4)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (There's no time to read random^1, unimportant text.)/%", "obj_readable_room1_slash_Other_10_gml_387_0");
            }
        }
    }
}
if (room == room_torhouse)
{
    if (global.chapter == 4 && global.plot >= 310)
    {
        if (x >= 80)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (..^1. You should probably just go to bed.)/%", "obj_readable_room1_slash_Other_10_gml_403_0");
        }
    }
    if (x > 190)
    {
        global.msg[0] = stringsetloc("* There's a photo on the fridge^1. It's of you^1, your mother, and your brother./%", "obj_readable_room1_slash_Other_10_gml_200_0");
        if (global.chapter == 4)
        {
            if (scr_havechar(2))
            {
                global.msc = 1335;
                scr_text(global.msc);
            }
            if (global.plot >= 310)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (The fridge. A bottle of ketchup stands defiantly inside.)/%", "obj_readable_room1_slash_Other_10_gml_422_0");
            }
        }
    }
    if (x > 220)
    {
        global.msg[0] = stringsetloc("* There is some white fur stuck in the drain./%", "obj_readable_room1_slash_Other_10_gml_211_0");
        if (global.chapter == 4)
        {
            if (scr_havechar(2))
            {
                var small_text = stringsetloc("Gross, is anyone\ngoing to clean that up?", "obj_readable_room1_slash_Other_10_gml_435_0");
                var lx = 370;
                var ly = 240;
                scr_smallface(0, "susie", 11, lx, ly, small_text);
                scr_speaker("no_name");
                msgsetloc(0, "* (Somehow there's already white fur stuck in the drain.)\\f0/%", "obj_readable_room1_slash_Other_10_gml_438_0");
            }
            if (global.plot >= 310)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (The sink. Someone has cleared the white fur out of the drain.)/%", "obj_readable_room1_slash_Other_10_gml_444_0");
            }
        }
    }
    if (x > 260)
        global.msg[0] = stringsetloc("* There's some cinnamony batter caked on the stovetop./%", "obj_readable_room1_slash_Other_10_gml_217_0");
    if (x > 300)
    {
        global.msg[0] = stringsetloc("* (Cookie cutters for gingerbread monsters and gingerbread humans.)/%", "obj_readable_room1_slash_Other_10_gml_226_0");
        if (global.plot >= 310)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The cupboard. It seems to be missing..^1. things.)/%", "obj_readable_room1_slash_Other_10_gml_465_0");
        }
    }
    if (x > 340)
    {
        global.msg[0] = stringsetloc("* It's a trashcan^1.&* Somehow^1, it's emitting a pleasant floral scent./%", "obj_readable_room1_slash_Other_10_gml_231_0");
        if (global.flag[262] >= 4)
            global.msg[0] = stringsetloc("* It's a trashcan^1.&* Somehow^1, its floral scent has increased./%", "obj_readable_room1_slash_Other_10_gml_234_0");
        if (global.chapter == 4)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The trashcan. Well-watered flowers are blooming inside.)/%", "obj_readable_room1_slash_Other_10_gml_480_0_b");
        }
    }
    if (x > 369)
        global.msg[0] = stringsetloc("* It's a landline phone^1.&* But you already have a cell phone./%", "obj_readable_room1_slash_Other_10_gml_240_0");
    if (x > 440)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* It's the TV^1.&* Doesn't seem to even be plugged in anymore./%", "obj_readable_room1_slash_Other_10_gml_245_0");
        }
        else
        {
            msgsetloc(0, "* (It's the TV^1.)&* (Looks like it's plugged in, but it's dusty.)/%", "obj_readable_room1_slash_Other_10_gml_320_0");
            if (global.chapter == 4)
            {
                if (scr_tenna_alt_plot())
                {
                    if (scr_flag_get(1574) == 0)
                    {
                        scr_flag_set(1574, 1);
                        scr_speaker("susie");
                        msgsetloc(0, "\\ED* (After the Knight showed up...)/", "obj_readable_room1_slash_Other_10_gml_510_0_b");
                        msgnextloc("\\ED* (..^1. We couldn't..^1. find Tenna in the Dark World anywhere.)/", "obj_readable_room1_slash_Other_10_gml_511_0_b");
                        msgnextloc("\\ED* (I asked around if anyone had seen him^1, but...)/", "obj_readable_room1_slash_Other_10_gml_512_0_b");
                        msgnextloc("\\ER* (No one really wanted to help us find him.)/", "obj_readable_room1_slash_Other_10_gml_513_0_b");
                        msgnextloc("\\EV* (..^1. Were we like^1, too mean to everyone...?)/", "obj_readable_room1_slash_Other_10_gml_514_0_b");
                        msgnextloc("\\EV* (...)/", "obj_readable_room1_slash_Other_10_gml_515_0");
                        msgnextloc("\\ES* (Maybe..^1. we can still fix him somehow?)/", "obj_readable_room1_slash_Other_10_gml_516_0");
                        msgnextloc("\\ER* (Your mom..^1. just wants to throw him out though.)/%", "obj_readable_room1_slash_Other_10_gml_517_0");
                    }
                    else
                    {
                        scr_speaker("susie");
                        msgsetloc(0, "\\ED* (Tenna..^1. he's..^1. still really broken.)/", "obj_readable_room1_slash_Other_10_gml_521_0_b");
                        msgnextloc("\\ED* (Don't think we can even bring him to the Dark World.)/", "obj_readable_room1_slash_Other_10_gml_522_0_b");
                        msgnextloc("\\ER* (..^1. not like this.)/%", "obj_readable_room1_slash_Other_10_gml_523_0");
                    }
                }
                else
                {
                    var sus_talk = scr_flag_get(1576) == 0 && scr_havechar(2);
                    var sentence_end = sus_talk ? "/" : "/%";
                    scr_speaker("no_name");
                    msgsetsubloc(0, "* (It's a TV. Its antenna was broken^1, but it's been taped up.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_530_0_b");
                    if (sus_talk)
                    {
                        scr_flag_set(1576, 1);
                        scr_anyface_next("susie", 1);
                        msgnextloc("\\E1* (Right..^1. before you sealed the Fountain...)/", "obj_readable_room1_slash_Other_10_gml_537_0_b");
                        msgnextloc("\\E0* (We managed to find Tenna in the Dark World.)/", "obj_readable_room1_slash_Other_10_gml_538_0");
                        msgnextloc("\\ED* (He was barely alive^1, but...)/", "obj_readable_room1_slash_Other_10_gml_539_0");
                        msgnextloc("\\E0* (The Pippins and Shadowguys told me how to fix him.)/", "obj_readable_room1_slash_Other_10_gml_540_0");
                        msgnextloc("\\E1* (So I tried patching him up..^1. hope it worked out.)/", "obj_readable_room1_slash_Other_10_gml_541_0");
                        msgnextloc("\\ED* (..^1. Your mom kinda wants to throw him out^1, though.)/", "obj_readable_room1_slash_Other_10_gml_542_0");
                        msgnextloc("\\EL* (Let's find a new home for him fast^1, OK^1, Kris?)/%", "obj_readable_room1_slash_Other_10_gml_543_0_b");
                    }
                    if (scr_flag_get(779) >= 2 || scr_flag_get(780) == 1 || global.plot >= 100)
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* (You can feel a pressure gradient from the absence of entertainment.)/%", "obj_readable_room1_slash_Other_10_gml_550_0");
                    }
                }
            }
        }
    }
    if (global.chapter == 4 && global.plot >= 310)
    {
        if (x >= 450)
        {
            if (i_ex(obj_ch4_LWF03))
            {
                if (obj_ch4_LWF03.music_faster)
                {
                    var talked_amount = obj_ch4_LWF03.npc_talked_faster;
                    obj_ch4_LWF03.npc_talked_faster++;
                    if (talked_amount == 0)
                    {
                        scr_speaker("toriel");
                        msgsetloc(0, "\\E4* Ahahaha^1, this music!/", "obj_readable_room1_slash_Other_10_gml_571_0_b");
                        msgnextloc("\\E4* Kris^1, you know what happens when I go \"hyper mode\".../%", "obj_readable_room1_slash_Other_10_gml_572_0");
                    }
                    else
                    {
                        scr_speaker("sans");
                        msgsetloc(0, "\\E2* kris^1, thanks for showing us hyper mode./%", "obj_readable_room1_slash_Other_10_gml_576_0");
                    }
                }
                else
                {
                    var talked_amount = obj_ch4_LWF03.npc_talked;
                    obj_ch4_LWF03.npc_talked++;
                    if (talked_amount == 0)
                    {
                        scr_speaker("toriel");
                        msgsetloc(0, "\\E8* Sorry I wasn't here^1, honey^1, it started pouring so suddenly.../", "obj_readable_room1_slash_Other_10_gml_586_0_b");
                        msgnextloc("\\E0* So I just had to duck into the convenience store^1, and.../", "obj_readable_room1_slash_Other_10_gml_587_0_b");
                        msgnextloc("\\E8* Well^1, Mr. Sans was just so much fun^1, that.../", "obj_readable_room1_slash_Other_10_gml_588_0");
                        msgnextloc("\\E4* Who..^1. who gives a damn about choir practice^1! Haha!/", "obj_readable_room1_slash_Other_10_gml_589_0");
                        msgnextloc("\\E4* Kris^1, let's siiiiiing right now^1! Sans^1, can you beatbox?/", "obj_readable_room1_slash_Other_10_gml_590_0");
                        scr_anyface_next("sans", 5);
                        msgnextloc("\\E5* been doing it the whole time.../%", "obj_readable_room1_slash_Other_10_gml_592_0");
                    }
                    else
                    {
                        scr_speaker("sans");
                        msgsetloc(0, "\\E1* rum a tum tum. rum a\ntum tum./", "obj_readable_room1_slash_Other_10_gml_596_0");
                        scr_anyface_next("toriel", 0);
                        msgnextloc("\\E0* Kris^1, feel free to harmonize with Sans on the rum-a-tum-tums./", "obj_readable_room1_slash_Other_10_gml_598_0");
                        msgnextloc("\\E1* What? You want to go to bed? Oh^1, pooh.../%", "obj_readable_room1_slash_Other_10_gml_599_0");
                    }
                }
            }
        }
    }
    if (extflag == "record_player")
    {
        global.msc = 1357;
        scr_text(global.msc);
    }
    if (x > 560)
        global.msg[0] = stringsetloc("* It's a book of hymns./%", "obj_readable_room1_slash_Other_10_gml_251_0");
    if (global.chapter == 4)
    {
        if (global.plot < 15 && x > 590)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The door is sealed by the power of breakfast.)/%", "obj_readable_room1_slash_Other_10_gml_623_0");
        }
        if (x < 115 && y > 130)
        {
            if (global.plot < 20)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* Hell no. Wash your hands at church^1, Kris./%", "obj_readable_room1_slash_Other_10_gml_631_0_b");
            }
        }
        if (global.plot >= 310 && x > 590)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (..^1. You should probably just go to bed.)/%", "obj_readable_room1_slash_Other_10_gml_638_0_b");
        }
        if (extflag == "pancakes_kris")
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E0* No amount of church'll save you from wasting pancakes./", "obj_readable_room1_slash_Other_10_gml_644_0_b");
            msgnextloc("\\E2* I got you though. Just bring me your leftovers./%", "obj_readable_room1_slash_Other_10_gml_645_0_b");
        }
        if (extflag == "pancakes_susie")
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EL* (Wait for me^1, pancakes. I'll be back for you...)/%", "obj_readable_room1_slash_Other_10_gml_651_0");
        }
        if (extflag == "skip_intro")
        {
            global.msc = 1455;
            scr_text(global.msc);
        }
    }
}
if (room == room_torbathroom)
{
    if (global.chapter == 1)
    {
        if (x >= 100)
        {
            global.msg[0] = stringsetloc("* On the shower ledge^1, there's a small container of apple-scented shampoo./", "obj_readable_room1_slash_Other_10_gml_263_0");
            global.msg[1] = stringsetloc("* ... and a gallon-sized container of pet shampoo./%", "obj_readable_room1_slash_Other_10_gml_264_0");
        }
        if (x >= 160 && x <= 190)
        {
            global.msc = 355;
            scr_text(global.msc);
        }
        if (x >= 190)
        {
            global.msg[0] = stringsetloc("* You looked inside the sink cupboard^1.&* There's.../", "obj_readable_room1_slash_Other_10_gml_273_0");
            global.msg[1] = stringsetloc("* A can of Ice-E's Cool Boys Body Spray \"Spray For The Boys,\" Flamin' Hot Pizza Flavor./", "obj_readable_room1_slash_Other_10_gml_274_0");
            global.msg[2] = stringsetloc("* It seems to be almost entirely full./%", "obj_readable_room1_slash_Other_10_gml_275_0");
        }
    }
    if (global.chapter >= 2)
    {
        if (x >= 100)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The apple-scented shampoo feels lighter than usual.)/%", "obj_readable_room1_slash_Other_10_gml_354_0");
        }
        if (x >= 160 && x <= 190)
        {
            global.msc = 355;
            scr_text(global.msc);
        }
        if (x >= 190)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Your hands are clean.)/%", "obj_readable_room1_slash_Other_10_gml_392_0");
        }
        if (global.chapter == 4)
        {
            if (x >= 100)
            {
                if (read == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (The apple-scented shampoo seems to be lighter than normal.)/", "obj_readable_room1_slash_Other_10_gml_712_0");
                    scr_anyface_next("susie", 25);
                    msgnextloc("\\EP* Hey^1, still no hard evidence I drank that./%", "obj_readable_room1_slash_Other_10_gml_714_0_b");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (Apple shampoo.)&* (There are bite marks around the screw cap.)/", "obj_readable_room1_slash_Other_10_gml_718_0");
                    scr_anyface_next("susie", "H");
                    msgnextloc("\\EH* Look^1, I THOUGHT it was like a soda cap!/%", "obj_readable_room1_slash_Other_10_gml_720_0");
                }
            }
            if (x >= 160 && x <= 190)
            {
                if (read == 0)
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\E9* Heh^1, reminds me of when I flushed down a bath bomb and.../", "obj_readable_room1_slash_Other_10_gml_729_0");
                    msgnextloc("\\E8* Huh? ..^1. K-Kris? You did that..^1. too?/", "obj_readable_room1_slash_Other_10_gml_730_0");
                    msgnextloc("\\EH* What? You did it at HOME!? Dumbass^1! Do that at SCHOOL!!/%", "obj_readable_room1_slash_Other_10_gml_731_0");
                    with (obj_event_manager)
                        trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_25);
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EB* Stop thinking about good memories in front of the toilet./%", "obj_readable_room1_slash_Other_10_gml_735_0");
                }
            }
            if (x >= 190)
            {
                if (read == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (It's a cupboard holding pizza-themed deodorant.)/", "obj_readable_room1_slash_Other_10_gml_744_0");
                    scr_anyface_next("susie", 9);
                    msgnextloc("\\E9* Haha^1, the apple smelling kid and their pizza stank brother!/%", "obj_readable_room1_slash_Other_10_gml_746_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\E9* Haha^1, the apple smelling kid and their pizza stank brother!/", "obj_readable_room1_slash_Other_10_gml_750_0");
                    msgnextloc("\\EA* ..^1. ugh^1, don't nod when I'm making fun of you./%", "obj_readable_room1_slash_Other_10_gml_751_0");
                }
            }
        }
    }
}
if (room == room_schoollobby)
{
    if (x >= 140 && x < 240)
    {
        if (tempvar == 0)
            global.msg[0] = stringsetloc("* The locker is locked./%", "obj_readable_room1_slash_Other_10_gml_335_0");
        if (tempvar == 1)
            global.msg[0] = stringsetloc("* The locker's lock is locked./%", "obj_readable_room1_slash_Other_10_gml_336_0");
        if (tempvar == 2)
            global.msg[0] = stringsetloc("* The lock's locker is locked./%", "obj_readable_room1_slash_Other_10_gml_337_0");
        if (tempvar == 3)
            global.msg[0] = stringsetloc("* The locker's lock's locker is locked./%", "obj_readable_room1_slash_Other_10_gml_338_0");
        if (tempvar >= 4)
            global.msg[0] = stringsetloc("* The locker is locked./%", "obj_readable_room1_slash_Other_10_gml_339_0");
        with (obj_readable_room1)
            tempvar += 1;
    }
    if (x == 240)
        global.msg[0] = stringsetloc("* (The locker is covered in Jockington memorabilia.)/%", "obj_readable_room1_slash_Other_10_gml_344_0");
    if (x >= 280)
    {
        global.msg[0] = stringsetloc("* (Are you ready for the Sadie Hawkman's dance?)/", "obj_readable_room1_slash_Other_10_gml_349_0");
        global.msg[1] = stringsetloc("* (At this dance^1, all the chaperones wear giant hawk heads...)/", "obj_readable_room1_slash_Other_10_gml_350_0");
        global.msg[2] = stringsetloc("* (... and screech at any students that make contact while dancing.)/%", "obj_readable_room1_slash_Other_10_gml_351_0");
    }
    if (x < 140)
    {
        global.msg[0] = stringsetloc("* (You look through the frosted window.)/", "obj_readable_room1_slash_Other_10_gml_356_0");
        global.msg[1] = stringsetloc("* (A blurry yellow object is teaching a bunch of blurry bored-looking objects.)/%", "obj_readable_room1_slash_Other_10_gml_357_0");
    }
    if (x >= 520)
    {
        global.msg[0] = stringsetloc("* (You ran the water fountain.^1)&* (It's lukewarm.)/%", "obj_readable_room1_slash_Other_10_gml_362_0");
        if (read == 1)
            global.msg[0] = stringsetloc("* (You ran the water fountain.^1)&* (It's tepid.)/%", "obj_readable_room1_slash_Other_10_gml_363_0");
        if (read >= 2)
            global.msg[0] = stringsetloc("* (You ran the water fountain.^1)&* (It's refreshingly cool.)/%", "obj_readable_room1_slash_Other_10_gml_364_0");
        if (global.plot < 8)
        {
            global.msg[0] = stringsetloc("* (You drank from the water fountain.)/", "obj_readable_room1_slash_Other_10_gml_368_0");
            scr_susface(1, 1);
            global.msg[2] = stringsetloc("* Heheh^1, people put their mouth on that^1, ya know./%", "obj_readable_room1_slash_Other_10_gml_370_0");
            if (read >= 1)
            {
                scr_susface(0, 9);
                global.msg[1] = stringsetloc("* That wasn't ENCOURAGEMENT^1, dumbass!/%", "obj_readable_room1_slash_Other_10_gml_375_0");
            }
        }
    }
    if (x >= 560)
    {
        global.msg[0] = stringsetloc("* Do you like^1, breathing^1? Moving fast^1, with or without^1, legs?/", "obj_readable_room1_slash_Other_10_gml_382_0");
        global.msg[1] = stringsetloc("* But usually^1, with legs?/", "obj_readable_room1_slash_Other_10_gml_383_0");
        global.msg[2] = stringsetloc("* Join the Cross Country Team with Jockington^1, and Noelle!/%", "obj_readable_room1_slash_Other_10_gml_384_0");
    }
    if (x >= 690)
        global.msg[0] = stringsetloc("* (Locker^1. It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_390_0");
    if (x == 760)
        global.msg[0] = stringsetloc("* (This used to be your brother's locker.)/%", "obj_readable_room1_slash_Other_10_gml_396_0");
    if (x == 780)
        global.msg[0] = stringsetloc("* (It's your locker.^1)&* (It's empty.)/%", "obj_readable_room1_slash_Other_10_gml_400_0");
}
if (room == room_alphysclass)
{
    global.msg[0] = stringsetloc("* (You checked the time.)/", "obj_readable_room1_slash_Other_10_gml_409_0");
    global.msg[1] = stringsetloc("* (... It seems to be time for class.)/%", "obj_readable_room1_slash_Other_10_gml_410_0");
    if (global.plot >= 0)
    {
        global.msg[0] = stringsetloc("* (You checked the time.)/", "obj_readable_room1_slash_Other_10_gml_414_0");
        global.msg[1] = stringsetloc("* (... It seems to not be time for class.)/%", "obj_readable_room1_slash_Other_10_gml_415_0");
    }
    if (x > 240)
    {
        global.fe = 1;
        global.fc = 11;
        global.typer = 20;
        global.msg[0] = stringsetloc("* Um^1, Kris^1, the hope is that you.../", "obj_readable_room1_slash_Other_10_gml_423_0");
        global.msg[1] = stringsetloc("\\E0* ... choose someone in the class?/%", "obj_readable_room1_slash_Other_10_gml_424_0");
    }
    if (x < 200)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (The computer's wallpaper is a rotating slideshow of nature images.)/", "obj_readable_room1_slash_Other_10_gml_431_0");
            global.msg[1] = stringsetloc("* (... and^1, rarely, an image of two buff superheroes embracing^1, blushing.)/%", "obj_readable_room1_slash_Other_10_gml_432_0");
            if (global.plot >= 250)
            {
                global.msg[0] = stringsetloc("* (The computer is turned off.)/", "obj_readable_room1_slash_Other_10_gml_436_0");
                global.msg[1] = stringsetloc("* (Everything felt peaceful for a moment.)/%", "obj_readable_room1_slash_Other_10_gml_437_0");
            }
        }
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (The computer wallpaper is updated.)/", "obj_readable_room1_slash_Other_10_gml_511_0");
            msgnextloc("* (The buff embracing heroes are now edited to be 4 inches apart.)/", "obj_readable_room1_slash_Other_10_gml_512_0");
            msgnextloc("* (There's dialogue about proper distancing at the school dance.)/", "obj_readable_room1_slash_Other_10_gml_513_0");
            msgnextloc("* (You wonder if your mother had some influence on this change.)/%", "obj_readable_room1_slash_Other_10_gml_514_0");
            if (global.chapter == 4)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (The computer is off.)/%", "obj_readable_room1_slash_Other_10_gml_879_0");
            }
        }
    }
    if (x < 150)
        global.msg[0] = stringsetloc("* (It's a bunch of roses.)/%", "obj_readable_room1_slash_Other_10_gml_453_0");
    if (x < 80)
    {
        global.msg[0] = stringsetloc("* (Looks like motivational quotes from various literature.)/", "obj_readable_room1_slash_Other_10_gml_459_0");
        global.msg[1] = stringsetloc("* \"Try your best^1, Astral Wolf^1!\"&* \"Even in your darkest hour...!\"/", "obj_readable_room1_slash_Other_10_gml_460_0");
        global.msg[2] = stringsetloc("* (... that one seems to be from a video game.)/%", "obj_readable_room1_slash_Other_10_gml_461_0");
        if (global.chapter == 4)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E0* These posters suck. Why can't we have^1, like.../", "obj_readable_room1_slash_Other_10_gml_900_0");
            msgnextloc("\\EL* An orange cat wearing a top hat or whatever./%", "obj_readable_room1_slash_Other_10_gml_901_0");
        }
    }
    if (global.chapter == 4)
    {
        if (x > 140 && x < 150 && y >= 112)
        {
            var gotten_eggs = 0;
            if (scr_flag_get(911) > 0)
                gotten_eggs++;
            if (scr_flag_get(918) > 0)
                gotten_eggs++;
            if (scr_flag_get(930) > 0)
                gotten_eggs++;
            scr_speaker("no_name");
            msgsetloc(0, "* (It's Berdly's desk. There is an egg here.)/%", "obj_readable_room1_slash_Other_10_gml_926_0");
            if (gotten_eggs > 0)
            {
                scr_speaker("no_name");
                msgsetsubloc(0, "* (It's Berdly's desk. The leader egg is joined by the ~1 eggs you found.)/%", gotten_eggs, "obj_readable_room1_slash_Other_10_gml_931_0_b");
            }
            if (scr_flag_get(775) == 0)
            {
                scr_flag_set(775, 1);
                scr_speaker("susie");
                msgsetloc(0, "\\E0* Hey^1, what's with the egg at Berdly's desk...?/", "obj_readable_room1_slash_Other_10_gml_938_0");
                msgnextloc("\\EK* ..^1. nevermind. I don't wanna think about it./%", "obj_readable_room1_slash_Other_10_gml_939_0");
            }
        }
    }
}
if (room == room_torielclass)
{
    if (y <= (room_height / 2))
    {
        if (x >= 100)
        {
            global.msg[0] = stringsetloc("* (\"Ms. Toriel\" is written in cursive on the dry-erase board.)/", "obj_readable_room1_slash_Other_10_gml_473_0");
            global.msg[1] = stringsetloc("* (Seems like it hasn't been erased in a very long time.)/%", "obj_readable_room1_slash_Other_10_gml_474_0");
        }
        if (x >= 130)
        {
            if (global.chapter == 1)
            {
                global.msg[0] = stringsetloc("* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_480_0");
                global.msg[1] = stringsetloc("* (Its desktop wallpaper is you and your brother dressed up for Halloween 8 years ago.)/%", "obj_readable_room1_slash_Other_10_gml_481_0");
            }
            if (global.chapter >= 2)
            {
                msgsetloc(0, "* (The computer wallpaper is updated.)/", "obj_readable_room1_slash_Other_10_gml_554_0");
                msgnextloc("* (It's a picture of your brother and you playing video games.)/", "obj_readable_room1_slash_Other_10_gml_555_0");
                msgnextloc("* (Your brother is using the knockoff controller.)/%", "obj_readable_room1_slash_Other_10_gml_556_0");
                if (global.chapter == 4)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (The wallpaper is updated.)&* (It's you and your brother catching snowflakes.)/", "obj_readable_room1_slash_Other_10_gml_973_0");
                    msgnextloc("* (The snowmen you made each have two branches stuck diagonally in their heads.)/%", "obj_readable_room1_slash_Other_10_gml_974_0");
                }
            }
        }
        if (x >= 170)
        {
            if (global.chapter == 1)
            {
                global.msc = 350;
                scr_text(global.msc);
            }
            if (global.chapter >= 2)
            {
                msgsetloc(0, "* (You uncapped the scented green marker.)/", "obj_readable_room1_slash_Other_10_gml_570_0");
                msgnextloc("* (It's almost dry^1, but that gives it a refined^1, aged apple bouquet.)/%", "obj_readable_room1_slash_Other_10_gml_571_0");
                if (global.chapter == 4)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (You uncapped the cherry flavored marker.)/", "obj_readable_room1_slash_Other_10_gml_995_0");
                    msgnextloc("* (A cough drop potpourri..^1. the candy of the proletariat.)/%", "obj_readable_room1_slash_Other_10_gml_996_0");
                }
            }
        }
        if (x >= 198)
        {
            if (global.chapter == 1)
                global.msg[0] = stringsetloc("* (Some kind of teacher food.)/%", "obj_readable_room1_slash_Other_10_gml_510_0");
            if (global.chapter >= 2)
            {
                msgsetloc(0, "* (It's an orange. It's unknown if it's safe for teachers to eat this.)/%", "obj_readable_room1_slash_Other_10_gml_583_0");
                if (global.chapter == 4)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (Insultingly^1, a pear. This is substitute teacher food.)/%", "obj_readable_room1_slash_Other_10_gml_1014_0");
                }
            }
        }
        if (x >= 204)
        {
            global.msg[0] = stringsetloc("* (It's a poster of several basic shapes.^1)&* (Circle, Oval, Square...)/", "obj_readable_room1_slash_Other_10_gml_521_0");
            global.msg[1] = stringsetloc("* (Hyperdodecahedron...)/%", "obj_readable_room1_slash_Other_10_gml_522_0");
        }
        if (x >= 230)
            global.msg[0] = stringsetloc("* (Kids' books.^1)&* (Some of them used to be yours.)/%", "obj_readable_room1_slash_Other_10_gml_526_0");
        if (x >= 256)
            global.msg[0] = stringsetloc("* (It's a primitive drawing of your mom.)/%", "obj_readable_room1_slash_Other_10_gml_530_0");
    }
    else if (x <= (room_width / 2))
    {
        global.msg[0] = stringsetloc("* (Some kind of primitive sculpture.)&* (Who knows what it represents?)/%", "obj_readable_room1_slash_Other_10_gml_537_0");
    }
    else
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* (The Throne of the Gods.)/%", "obj_readable_room1_slash_Other_10_gml_543_0");
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (The Throne of the Gods grows higher.)&* (Is this hubris...?)/%", "obj_readable_room1_slash_Other_10_gml_616_0");
            if (global.chapter == 4)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EK* Why doesn't our class get a chair tower? Damn school system./%", "obj_readable_room1_slash_Other_10_gml_1053_0");
            }
        }
    }
}
if (room == room_schooldoor)
    global.msg[0] = stringsetloc("* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_626_0");
if (room == room_school_unusedroom)
{
    if (x < 80)
        global.msg[0] = stringsetloc("* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_631_0");
    if (x > 100)
        global.msg[0] = stringsetloc("* (It's a worn-down stuffed animal.)/%", "obj_readable_room1_slash_Other_10_gml_632_0");
    if (x > 160 && y < 100)
        global.msg[0] = stringsetloc("* (It's a lightswitch.)/%", "obj_readable_room1_slash_Other_10_gml_633_0");
    if (x > 160 && y > 100)
        global.msg[0] = stringsetloc("* (It's a checkerboard.^1)&* (There are pawns strewn on it.)/%", "obj_readable_room1_slash_Other_10_gml_634_0");
    if (x > 220)
        global.msg[0] = stringsetloc("* (Playing cards spill out of a deck in the closet.)/%", "obj_readable_room1_slash_Other_10_gml_635_0");
    if (x > 250)
    {
        global.msg[0] = stringsetloc("* (It's a yellowed, poorly-drawn picture of a green turtle.)/", "obj_readable_room1_slash_Other_10_gml_638_0");
        global.msg[1] = stringsetloc("* (It's signed 'Alvin.')/%", "obj_readable_room1_slash_Other_10_gml_639_0");
    }
    if (global.chapter >= 2)
    {
        if (x > 160 && y > 100)
            msgsetloc(0, "* (You stared at the checkerboard from the doorway.)/%", "obj_readable_room1_slash_Other_10_gml_644_0");
        if (x > 220)
            msgsetloc(0, "* (Managed to cram everything into the closet^1. Even the rug.)/%", "obj_readable_room1_slash_Other_10_gml_645_0");
    }
}
if (room == room_hospital_lobby)
{
    if (x <= 160)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (It's one of those sliding bead toys that naturally spawns inside doctors' offices.)/", "obj_readable_room1_slash_Other_10_gml_586_0");
            global.msg[1] = stringsetloc("* (The beads march grimly along their set path.)/%", "obj_readable_room1_slash_Other_10_gml_587_0");
        }
        if (global.chapter >= 2)
        {
            if (scr_sideb_get_phase() > 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's a toy with beads on a track.)/", "obj_readable_room1_slash_Other_10_gml_667_0_b");
                msgnextloc("* (One of the blue beads is broken and torn off.)/%", "obj_readable_room1_slash_Other_10_gml_668_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (The beads of the toy march on.)/%", "obj_readable_room1_slash_Other_10_gml_672_0");
            }
        }
    }
    if (x >= 160)
    {
        if (global.chapter == 1)
        {
            global.msc = 360;
            scr_text(global.msc);
        }
        if (global.chapter >= 2)
        {
            global.msc = 1155;
            scr_text(global.msc);
        }
    }
}
if (room == room_dw_castle_west_cliff)
{
    if (global.chapter >= 2)
    {
        scr_speaker("none");
        msgsetloc(0, "* (The rubble on the ground seems to have been dusted and polished.)/", "obj_readable_room1_slash_Other_10_gml_716_0");
        msgnextloc("* (Someone around here really cares about the details.)/%", "obj_readable_room1_slash_Other_10_gml_717_0");
    }
    if (extflag == "cliff_items")
    {
        if (scr_flag_get(1644) == 0)
        {
            global.msc = 1240;
            scr_text(global.msc);
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (There's a hole in the wall...)/", "obj_readable_room1_slash_Other_10_gml_740_0");
            msgnextloc("* (There's nothing inside.)/%", "obj_readable_room1_slash_Other_10_gml_741_0");
        }
    }
}
if (room == room_dw_castle_east_door)
{
    if (global.chapter >= 2)
    {
        scr_speaker("none");
        msgsetloc(0, "* (It seems to be locked.^1)&* (It may never open again.)/%", "obj_readable_room1_slash_Other_10_gml_727_0");
    }
}
if (room == room_cc_clover)
{
    if (x < 90)
    {
        if (global.flag[412] == 0)
            global.flag[412] = 1;
    }
    global.msg[0] = stringsetloc("* (It's a bed for three people^1, or one three-headed person.)/%", "obj_readable_room1_slash_Other_10_gml_662_0");
    if (x > (room_width / 2))
    {
        if (y < (room_height / 2))
        {
            global.msg[0] = stringsetloc("* (It's a giant baseball.^1)&* (For parties.)/%", "obj_readable_room1_slash_Other_10_gml_667_0");
            if (read >= 1)
            {
                global.msg[0] = stringsetloc("* (Actually^1, seems the giant baseball is a soccer ball that's been painted over.)/", "obj_readable_room1_slash_Other_10_gml_670_0");
                global.msg[1] = stringsetloc("* (It would be easier to draw that way.)/%", "obj_readable_room1_slash_Other_10_gml_671_0");
            }
        }
        else
        {
            global.msg[0] = stringsetloc("* (It's a tree.^1)&* (For parties.)/%", "obj_readable_room1_slash_Other_10_gml_676_0");
        }
    }
}
if (room == room_cc_lancer)
{
    if (y <= 220)
    {
        if (x < 200)
        {
            if (global.flag[411] == 0)
                global.flag[411] = 1;
            if (i_ex(obj_npc_room))
            {
                scr_speaker("lancer");
                msgsetloc(0, "\\E1* Wow!^1! It's better than I remember!!!!!/", "obj_readable_room1_slash_Other_10_gml_789_0");
                msgnextloc("\\E2* I even have my own bed now!!!/", "obj_readable_room1_slash_Other_10_gml_790_0");
                msgnextloc("\\E3* Now I don't have to sleep in a hole anymore!!!/", "obj_readable_room1_slash_Other_10_gml_791_0_b");
                scr_anyface_next("ralsei", "K");
                msgnextloc("\\EK* I thought you..^1. already had a bed./", "obj_readable_room1_slash_Other_10_gml_793_0_b");
                scr_anyface_next("lancer", "3");
                msgnextloc("\\E3* No^1, that was for the bike./%", "obj_readable_room1_slash_Other_10_gml_795_0");
            }
            else
            {
                scr_speaker("no one");
                msgsetloc(0, "* (It's a bikeless bed.)/%", "obj_readable_room1_slash_Other_10_gml_812_0");
            }
            if (global.chapter == 4)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (A bouncy bed for a bouncy boy.)/%", "obj_readable_room1_slash_Other_10_gml_1212_0");
            }
        }
        if (x > 350 && x < 400)
        {
            if (global.chapter < 4)
            {
                global.msc = 430;
                scr_text(global.msc);
            }
            else
            {
                snd_play(snd_queen_laugh_0);
                scr_speaker("no_name");
                msgsetloc(0, "* (Seems like an evil laugh Greatest Hits compilation.)/%", "obj_readable_room1_slash_Other_10_gml_1226_0");
            }
        }
        if (x >= 400)
            global.msg[0] = stringsetloc("* (It's some kind of digging implement.)/%", "obj_readable_room1_slash_Other_10_gml_707_0");
    }
    else if (x < 200)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The holes have been organized in the corner to save space.)/%", "obj_readable_room1_slash_Other_10_gml_1240_0");
    }
    if (global.chapter == 4)
    {
        if (x >= 500)
        {
            var sound_id = 333;
            if (y >= 200)
                sound_id = 462;
            if (y >= 300)
                sound_id = 248;
            snd_play(sound_id);
            skip = 1;
        }
    }
}
if (room == room_hospital_rudy)
{
    if (x <= 75 && y < 160)
    {
        if (global.chapter >= 2)
        {
            if (global.chapter == 4)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's the angel doll Noelle and Dess made at church.)/%", "obj_readable_room1_slash_Other_10_gml_1277_0_b");
            }
        }
    }
    if (x <= 75 && y > 160)
    {
        if (global.chapter >= 2)
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* ..^1. hey^1, Kris^1, why are you checking the sink?/", "obj_readable_room1_slash_Other_10_gml_903_0");
                scr_anyface_next("rudy", "7");
                msgnextloc("\\E7* That's what I'M asking^1, sweetheart!/%", "obj_readable_room1_slash_Other_10_gml_905_0_b");
            }
            else
            {
                scr_speaker("rudy");
                msgsetloc(0, "\\E0* Practicing for tonight's.../", "obj_readable_room1_slash_Other_10_gml_909_0");
                msgnextloc("\\E2* Handwashing marathon^1, Kris?/%", "obj_readable_room1_slash_Other_10_gml_910_0");
            }
            if (global.chapter == 4)
            {
                var sinkcheck = global.flag[278] == 1 && global.flag[461] == 1;
                if (sinkcheck)
                {
                    if (scr_flag_get(754) == 0)
                        scr_flag_set(754, 1);
                    scr_speaker("rudy");
                    msgsetloc(0, "\\E0* Haha...^1. hahaha.../", "obj_readable_room1_slash_Other_10_gml_1311_0");
                    msgnextloc("\\E4* KRIS^1! What the heck is with you..^1. and that damn sink!?/", "obj_readable_room1_slash_Other_10_gml_1312_0");
                    msgnextloc("\\E3* What are you..^1. expecting to come outta there!? Soda?/%", "obj_readable_room1_slash_Other_10_gml_1313_0");
                }
            }
        }
    }
    if (x >= 95 && x <= 105)
    {
        if (global.chapter == 4)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Patient Name:)&* (Rudolph \"Rudy\" Holiday)/%", "obj_readable_room1_slash_Other_10_gml_1324_0");
        }
    }
    if (x == 205)
    {
        if (global.chapter >= 2)
        {
            if (global.chapter == 4)
            {
                if (scr_flag_get(1665) == 0)
                    scr_flag_set(1665, 1);
                scr_speaker("rudy");
                msgsetloc(0, "\\E4* Your dad brought another bouquet. Again./", "obj_readable_room1_slash_Other_10_gml_1335_0");
                msgnextloc("\\E5* Come on man..^1. you know you can't afford that..^1. heh.../%", "obj_readable_room1_slash_Other_10_gml_1336_0");
            }
        }
    }
    if (x > 230)
        global.msg[0] = stringsetloc("* (It's a chair.)/%", "obj_readable_room1_slash_Other_10_gml_813_0");
}
if (room == room_hospital_hallway)
    global.msg[0] = stringsetloc("* (It's a diagram showing a bunch of lines and a circle.)/%", "obj_readable_room1_slash_Other_10_gml_819_0");
if (room == room_hospital_room2)
{
    if (y >= 160)
    {
        global.msg[0] = stringsetloc("* (It's a regular sink.)/%", "obj_readable_room1_slash_Other_10_gml_826_0");
        if (tempvar >= 1)
        {
            global.msg[0] = stringsetloc("* (It's a clone of the other sink.)/", "obj_readable_room1_slash_Other_10_gml_829_0");
            global.msg[1] = stringsetloc("* (Perhaps there was originally one tall sink that was cut in half to create both of them.)/%", "obj_readable_room1_slash_Other_10_gml_830_0");
        }
        with (obj_readable_room1)
        {
            if (y >= 160)
                tempvar += 1;
        }
        if (global.chapter >= 4)
        {
            if (scr_flag_get(349) > 0)
                skip = 1;
        }
    }
    else
    {
        if (x <= 140)
        {
            global.msg[0] = stringsetloc("* (You looked inside the cupboard.)/", "obj_readable_room1_slash_Other_10_gml_843_0");
            global.msg[1] = stringsetloc("* (... a very small obligatory piano is hiding inside.)/%", "obj_readable_room1_slash_Other_10_gml_844_0");
            if (scr_flag_get(457) == 0 && scr_flag_get(349) == 0)
            {
                if (read == 0)
                {
                    scr_speaker("berdly");
                    msgsetloc(0, "\\EI* That flower? Noelle \"SAID\" it was a \"get well soon\" gift for me./", "obj_readable_room1_slash_Other_10_gml_1389_0");
                    msgnextloc("\\E7* But good grief^1, is she laying it on thick. ZETTAmeters thick!/", "obj_readable_room1_slash_Other_10_gml_1390_0");
                    msgnextloc("\\E6* FLOWERS? As a HOSPITAL gift? Like that's EVER platonic!/%", "obj_readable_room1_slash_Other_10_gml_1391_0");
                }
                else
                {
                    scr_speaker("berdly");
                    msgsetloc(0, "\\EF* Flowers..^1. The chunky peanut butter of amore./%", "obj_readable_room1_slash_Other_10_gml_1395_0_b");
                    if (scr_flag_get(316) > 0 || scr_flag_get(1665) > 0)
                    {
                        scr_speaker("susie");
                        msgsetloc(0, "\\EK* Uhhh..^1. Kris's dad gives Noelle's dad hospital flowers.../", "obj_readable_room1_slash_Other_10_gml_1400_0");
                        scr_anyface_next("berdly", "5");
                        msgnextloc("\\E5* Oh^1, Susan. You sweet ignorant fool./", "obj_readable_room1_slash_Other_10_gml_1402_0");
                        msgnextloc("\\EJ* That's a bro thing. It's different!/%", "obj_readable_room1_slash_Other_10_gml_1403_0");
                    }
                }
            }
            if (scr_flag_get(349) > 0)
                skip = 1;
        }
        if (x >= 150)
        {
            global.msg[0] = stringsetloc("* (It's a classic 1-to-10 pain scale^1, using ICE-E as a model.)/", "obj_readable_room1_slash_Other_10_gml_848_0");
            global.msg[1] = stringsetloc("* (At 0 pain^1, he's happy.^1)&* (At 10 pain^1, he's happy and sweating.)/%", "obj_readable_room1_slash_Other_10_gml_849_0");
            if (scr_flag_get(349) > 0)
            {
                if (y >= 100 && x < 190)
                {
                    if (scr_flag_get(757) == 0)
                    {
                        scr_flag_set(757, 1);
                        scr_speaker("no_name");
                        msgsetloc(0, "* (You turned on the space heater to a higher setting.)/%", "obj_readable_room1_slash_Other_10_gml_1427_0");
                    }
                    else
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* (The space heater is running.)/%", "obj_readable_room1_slash_Other_10_gml_1431_0");
                    }
                }
                else
                {
                    skip = 1;
                }
            }
            else if (x < 200)
            {
                with (obj_event_manager)
                    trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_8, UnknownEnum.Value_938);
            }
        }
        if (x >= 200)
        {
            if (global.chapter == 1)
            {
                global.msg[0] = stringsetloc("* This castle's WHITE WIZARDs relegated me to this HEALING CHAMBER.../", "obj_readable_room1_slash_Other_10_gml_855_0");
                global.msg[1] = stringsetloc("* But my BLOOD is BOILING FOR BATTLE!!!/%", "obj_readable_room1_slash_Other_10_gml_856_0");
            }
            if (global.chapter >= 2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Looks like she's resting her voice.)/%", "obj_readable_room1_slash_Other_10_gml_1036_0");
                if (global.chapter == 4)
                {
                    if (scr_flag_get(457) == 0)
                    {
                        skip = 0;
                        if (scr_flag_get(349) > 0)
                        {
                            if (scr_flag_get(756) == 0)
                            {
                                global.msc = 1341;
                                scr_text(global.msc);
                            }
                            else
                            {
                                scr_speaker("no_name");
                                msgsetloc(0, "* (He's breathing slowly.)&* (Might be your imagination^1, but he seems more relaxed...)/%", "obj_readable_room1_slash_Other_10_gml_1467_0_b");
                            }
                        }
                        else if (scr_flag_get(755) == 0)
                        {
                            scr_flag_set(755, 1);
                            scr_speaker("susie");
                            msgsetloc(0, "\\E2* Heh^1, why're YOU here? Withdrawal from getting a B+?/", "obj_readable_room1_slash_Other_10_gml_1477_0");
                            scr_anyface_next("berdly", 10);
                            msgnextloc("\\EA* Just a little CHECKUP^1, Susan. I slept on my arm./", "obj_readable_room1_slash_Other_10_gml_1479_0");
                            msgnextloc("\\E8* ..^1. And now^1, it won't..^1. wake^1, up./", "obj_readable_room1_slash_Other_10_gml_1480_0");
                            scr_anyface_next("susie", 0);
                            msgnextloc("\\E0* .../", "obj_readable_room1_slash_Other_10_gml_1482_0");
                            scr_anyface_next("berdly", 7);
                            msgnextloc("\\E7* But no trouble^1! I'll still be at the festival tomorrow!/", "obj_readable_room1_slash_Other_10_gml_1484_0_b");
                            scr_anyface_next("susie", "D");
                            msgnextloc("\\ED* ..^1. huh. Well^1, uh..^1. hope you^1, uh^1, feel better./", "obj_readable_room1_slash_Other_10_gml_1486_0");
                            scr_anyface_next("berdly", 18);
                            msgnextloc("\\EI* Susie? Were those..^1. words..^1. of kindness?/", "obj_readable_room1_slash_Other_10_gml_1488_0");
                            scr_anyface_next("susie", 17);
                            msgnextloc("\\EH* No!? Just pissed off I can't HIT YOU while you're in a sick bed!/%", "obj_readable_room1_slash_Other_10_gml_1490_0");
                        }
                        else
                        {
                            scr_speaker("berdly");
                            msgsetloc(0, "\\E8* I keep having this nightmare of my arm..^1. burning./", "obj_readable_room1_slash_Other_10_gml_1494_0");
                            msgnextloc("\\E4* What's funny is that..^1. you two are there^1! Haha!/%", "obj_readable_room1_slash_Other_10_gml_1495_0");
                        }
                    }
                    else
                    {
                        skip = 1;
                    }
                }
            }
        }
    }
}
if (room == room_library)
{
    var book_check = false;
    if (x < 80)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* \"Lord of the Hammer\"/", "obj_readable_room1_slash_Other_10_gml_875_0");
            global.msg[1] = stringsetloc("* (First in the award-winning fiction series by lauded historian Gerson Boom.)/%", "obj_readable_room1_slash_Other_10_gml_876_0");
        }
        if (global.chapter >= 2)
        {
            if (scr_havechar(2))
            {
                if (read == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (It's the Lord of the Hammer series.)/", "obj_readable_room1_slash_Other_10_gml_1062_0");
                    scr_anyface_next("susie", "Y");
                    msgnextloc("\\EY* Hahaha^1, Kris^1, you READ that nerdy stuff? Heh!/", "obj_readable_room1_slash_Other_10_gml_1064_0");
                    msgnextloc("\\EA* Giant swords^1, hammers^1, bloody battles.../", "obj_readable_room1_slash_Other_10_gml_1065_0");
                    msgnextloc("\\EK* ..^1. uh^1, so if there's any cool parts^1, you'd tell me^1, right?/%", "obj_readable_room1_slash_Other_10_gml_1066_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EK* Heh^1, can't believe you read things with^1, uh..^1. words./%", "obj_readable_room1_slash_Other_10_gml_1070_0");
                }
            }
            else
            {
                global.msg[0] = stringsetloc("* \"Lord of the Hammer\"/", "obj_readable_room1_slash_Other_10_gml_875_0");
                global.msg[1] = stringsetloc("* (First in the award-winning fiction series by lauded historian Gerson Boom.)/%", "obj_readable_room1_slash_Other_10_gml_876_0");
            }
        }
        if (y > 80)
        {
            if (global.chapter == 1)
            {
                global.msg[0] = stringsetloc("* (It's an unlabelled book. You look inside...)/", "obj_readable_room1_slash_Other_10_gml_881_0");
                global.msg[1] = stringsetloc("* oh.... i accidentally returned my personal journal instead of my book.../", "obj_readable_room1_slash_Other_10_gml_882_0");
                global.msg[2] = stringsetloc("* oh no.... they're putting it into their catalogue.../", "obj_readable_room1_slash_Other_10_gml_883_0");
                global.msg[3] = stringsetloc("* oh no... i have to take it out every time i want to write a new entry.../%", "obj_readable_room1_slash_Other_10_gml_884_0");
            }
            if (global.chapter >= 2)
            {
                global.msc = 1159;
                scr_text(global.msc);
                if (global.chapter == 4)
                    book_check = true;
            }
        }
    }
    if (x > 70)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* \"Please remember my name. Please. I wrote a book to help you remember.\"/", "obj_readable_room1_slash_Other_10_gml_892_0");
            global.msg[1] = stringsetloc("* (By Hots Fireguy)/%", "obj_readable_room1_slash_Other_10_gml_893_0");
        }
        if (global.chapter >= 2)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a book of magic tricks.)/", "obj_readable_room1_slash_Other_10_gml_1110_0");
            msgnextloc("* (Most of them require orbs or floating hands.)/%", "obj_readable_room1_slash_Other_10_gml_1111_0_b");
        }
        if (y > 80)
        {
            var have_susie = global.chapter >= 2 && scr_havechar(2);
            if (have_susie)
            {
                if (read == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (There's a book here.^1)&* (You licked the page...)/", "obj_readable_room1_slash_Other_10_gml_1124_0");
                    scr_anyface_next("susie", 0);
                    msgnextloc("* Hey^1, Kris^1, what the HELL are you doing?/", "obj_readable_room1_slash_Other_10_gml_1126_0_b");
                    msgnextloc("\\E5* There's a thing called sharing^1, dumbass. Heard of it?/%", "obj_readable_room1_slash_Other_10_gml_1127_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\E2* Look^1, the books are public for a reason./%", "obj_readable_room1_slash_Other_10_gml_1131_0");
                }
            }
            else
            {
                global.msg[0] = stringsetloc("* (There's a book here.^1)&* (You lick the page...^1)&* (It's delicious!)/", "obj_readable_room1_slash_Other_10_gml_897_0");
                global.msg[1] = stringsetloc("* (This must be what they meant by flavor text.)/%", "obj_readable_room1_slash_Other_10_gml_898_0");
            }
            if (global.chapter == 4)
                book_check = true;
        }
    }
    if (book_check)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\EP* (Hey^1, we need to go STUDY^1! Not look at BOOKS!)/%", "obj_readable_room1_slash_Other_10_gml_1623_0");
        if (global.plot >= 100)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E0* (No time to check out the books now.)/%", "obj_readable_room1_slash_Other_10_gml_1627_0");
        }
    }
    if (global.chapter == 4)
    {
        if (x >= 70 && x < 120 && y >= 55 && y < 65)
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Heheheh..^1. let's take these books without paying!/", "obj_readable_room1_slash_Other_10_gml_1638_0");
                msgnextloc("* (We'll just read them^1, then secretly return them.)/", "obj_readable_room1_slash_Other_10_gml_1639_0");
                msgnextloc("* It's the perfect crime.../%", "obj_readable_room1_slash_Other_10_gml_1640_0_b");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* ..^1. I wonder how Napstablook is doing without Chief Undyne./", "obj_readable_room1_slash_Other_10_gml_1644_0_b");
                msgnextloc("* (Should we check on them...?)/%", "obj_readable_room1_slash_Other_10_gml_1645_0");
            }
        }
        if (x >= 65 && x < 70 && y >= 55)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Its mind has been expanded. ..^1. by reading.)/%", "obj_readable_room1_slash_Other_10_gml_1652_0_b");
        }
    }
    if (x > 110)
    {
        global.msg[0] = stringsetloc("* (Computer Lab.^1)&* (Please surf the web responsibly.)/", "obj_readable_room1_slash_Other_10_gml_905_0");
        global.msg[1] = stringsetloc("* (In fact^1, maybe don't do it at all.)/%", "obj_readable_room1_slash_Other_10_gml_906_0");
    }
    if (x > 135)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (You looked through the window to the computer lab...)/", "obj_readable_room1_slash_Other_10_gml_911_0");
            global.msg[1] = stringsetloc("* (There seems to be a dog inside working at a computer...)/", "obj_readable_room1_slash_Other_10_gml_912_0");
            global.msg[2] = stringsetloc("* (Seems like it's making a game...)/", "obj_readable_room1_slash_Other_10_gml_913_0");
            global.msg[3] = stringsetloc("* (Seems like you shouldn't interrupt it...)/", "obj_readable_room1_slash_Other_10_gml_914_0");
            global.msg[4] = stringsetloc("* (Seems like when the game's finished^1, you can go in...)/", "obj_readable_room1_slash_Other_10_gml_915_0");
            global.msg[5] = stringsetloc("* (You just have to trust the dog...)/%", "obj_readable_room1_slash_Other_10_gml_916_0");
            if (read >= 1)
            {
                global.msg[0] = stringsetloc("* (You looked through the window to the computer lab...)/", "obj_readable_room1_slash_Other_10_gml_920_0");
                global.msg[1] = stringsetloc("* (Now the dog is just playing the maracas...)/", "obj_readable_room1_slash_Other_10_gml_921_0");
                global.msg[2] = stringsetloc("* (It's not doing any work...)/", "obj_readable_room1_slash_Other_10_gml_922_0");
                global.msg[3] = stringsetloc("* (This might take a while...)/%", "obj_readable_room1_slash_Other_10_gml_923_0");
            }
        }
        if (global.chapter == 2)
        {
            if (global.plot <= 205)
                global.msg[0] = stringsetloc("* No reason to go back in there./%", "obj_readable_room1_slash_Other_10_gml_1172_0_b");
        }
        if (global.chapter == 4)
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EK* (Hey^1, we go back in there^1, they'll figure out we stole stuff!)/%", "obj_readable_room1_slash_Other_10_gml_1695_0_c");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E2* (I mean^1, technically^1, they were our willing recruits^1, but...)/%", "obj_readable_room1_slash_Other_10_gml_1699_0");
            }
        }
    }
    if (x > 190)
    {
        if (global.chapter >= 1)
        {
            scr_speaker("no_name");
            global.msg[0] = stringsetloc("* (There's a crude drawing of an ice-cube wearing a headband.)/", "obj_readable_room1_slash_Other_10_gml_931_0");
            global.msg[1] = stringsetloc("* (\"The TeenZone: Where Teen's Can Be Kid's.\")/", "obj_readable_room1_slash_Other_10_gml_932_0");
            global.msg[2] = stringsetloc("* (A feeling of immense relief washes over you.)/%", "obj_readable_room1_slash_Other_10_gml_933_0");
            if (global.chapter == 4)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Due to licensing concerns^1, the ICE-E mascot is slated for replacement.)/", "obj_readable_room1_slash_Other_10_gml_1718_0");
                msgnextloc("* (A feeling of dread washes over you...)/%", "obj_readable_room1_slash_Other_10_gml_1719_0");
            }
        }
    }
    if (x > 220)
    {
        if (global.chapter == 1)
        {
            scr_speaker("no_name");
            global.msc = 185;
            scr_text(global.msc);
        }
        if (global.chapter >= 2)
        {
            if (scr_havechar(2))
            {
                scr_speaker("susie");
                msgsetloc(0, "* (Kris^1, we could go anywhere...)/", "obj_readable_room1_slash_Other_10_gml_1193_0");
                msgnextloc("\\E1* (And you brought us to the Teen Zone.)/%", "obj_readable_room1_slash_Other_10_gml_1194_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's the weekly cartoon review.)/", "obj_readable_room1_slash_Other_10_gml_1198_0");
                msgnextloc("* (Just looking at cartoon criticism is sapping your energy rapidly.)/%", "obj_readable_room1_slash_Other_10_gml_1199_0");
            }
            if (global.chapter == 4)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Same week^1, same anime review.)/%", "obj_readable_room1_slash_Other_10_gml_1751_0");
            }
        }
    }
}
if (room == room_lw_library_upstairs)
{
    if (x > 230 && x < 250)
    {
        global.msc = 1149;
        scr_text(global.msc);
    }
    if (x > 200 && x < 215)
    {
        global.msc = 1151;
        scr_text(global.msc);
    }
    if (x > 160 && x < 170)
    {
        global.msc = 1351;
        scr_text(global.msc);
    }
}
if (room == room_graveyard)
{
    global.msg[0] = stringsetloc("* GERSON&* RENOWNED HISTORIAN, AUTHOR, AND TEACHER/%", "obj_readable_room1_slash_Other_10_gml_948_0");
    if (x >= 150)
        global.msg[0] = stringsetloc("* CRYSTAL&* A SNOWY GEMSTONE FOR A PROUD MOTHER/%", "obj_readable_room1_slash_Other_10_gml_951_0");
    if (x >= 200)
        global.msg[0] = stringsetloc("* MUTTLER&* A BIG BONE FOR THE LEADER OF THE PACK/%", "obj_readable_room1_slash_Other_10_gml_955_0");
    if (x >= 290)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* SHYRA&* A KARAOKE MICROPHONE FOR A BRAVE SINGER/%", "obj_readable_room1_slash_Other_10_gml_961_0");
        if (global.chapter >= 2)
        {
            scr_speaker("susie");
            msgsetloc(0, "* ..^1. So^1, uh^1, this is your idea of hanging out^1, Kris?/", "obj_readable_room1_slash_Other_10_gml_1237_0");
            msgnextloc("\\EK* Going to the graveyard?/", "obj_readable_room1_slash_Other_10_gml_1238_0");
            msgnextloc("\\E2* ..^1. works for me I guess./%", "obj_readable_room1_slash_Other_10_gml_1239_0");
        }
    }
    if (global.chapter == 4)
    {
        if (global.plot >= 300)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a gravestone. It's kind of hard to read in the dark.)/%", "obj_readable_room1_slash_Other_10_gml_1819_0_b");
            if (x < 150)
            {
                if (scr_flag_get(768) == 0)
                    scr_flag_set(768, 1);
                scr_speaker("no_name");
                msgsetloc(0, "* GERSON&* RENOWNED HISTORIAN^1, AUTHOR^1, AND TEACHER/", "obj_readable_room1_slash_Other_10_gml_1829_0");
                scr_anyface_next("susie", 0);
                msgnextloc("\\E0* .../%", "obj_readable_room1_slash_Other_10_gml_1831_0");
            }
        }
    }
}
if (room == room_townhall)
{
    if (x >= 180)
        global.msg[0] = stringsetloc("* (It's a painting of the town.)/%", "obj_readable_room1_slash_Other_10_gml_983_0");
    if (x >= 240)
        global.msg[0] = stringsetloc("* (It's a small pine tree.)/%", "obj_readable_room1_slash_Other_10_gml_988_0");
    if (y >= 160)
        global.msg[0] = stringsetloc("* (It's a chair.^1)&* (Maybe it's into politics.)/%", "obj_readable_room1_slash_Other_10_gml_991_0");
}
if (room == room_beach)
{
    global.msc = 192;
    scr_text(global.msc);
}
if (room == room_diner)
{
    global.msg[0] = stringsetloc("* (Rave reviews and autographs.^1)&* (... from various normal townspeople.)/%", "obj_readable_room1_slash_Other_10_gml_1003_0");
    if (global.chapter == 4)
    {
        if (y >= 100 && y < 120)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Hot chocolate..^1. it's too hot to drink./%", "obj_readable_room1_slash_Other_10_gml_1870_0");
        }
        if (x < 60 && y >= 180)
        {
            with (obj_town_diner)
                bratty_talk = true;
            with (obj_town_diner)
                nicecream_talk = true;
            global.msc = 1343;
            scr_text(global.msc);
        }
    }
}
if (room == room_flowershop_1f)
{
    if (y > 100)
    {
        if (x < 100)
            global.msg[0] = stringsetloc("* (It's a cash register.^1)&* (There's not much change inside.)/%", "obj_readable_room1_slash_Other_10_gml_1010_0");
        if (x < 70)
            global.msg[0] = stringsetloc("* (It's a flower.)/%", "obj_readable_room1_slash_Other_10_gml_1011_0");
        if (x < 50)
            global.msg[0] = stringsetloc("* (It's some kind of catalogue..^1. There's a car magazine underneath.)/%", "obj_readable_room1_slash_Other_10_gml_1012_0");
    }
    if (y < 80)
    {
        if (x == 140)
            global.msg[0] = stringsetloc("* (It's an expertly trimmed arrangement.)/%", "obj_readable_room1_slash_Other_10_gml_1017_0");
        if (x != 140)
            global.msg[0] = stringsetloc("* (There are various flowers inside.)/%", "obj_readable_room1_slash_Other_10_gml_1018_0");
    }
}
if (room == room_flowershop_2f)
{
    if (y < 50)
        global.msg[0] = stringsetloc("* (It's a door.^1)&* (It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_1027_0");
    if (y > 60)
    {
        global.msg[0] = stringsetloc("* (Various bags of soil.)/%", "obj_readable_room1_slash_Other_10_gml_1031_0");
        if (x >= 60)
            global.msg[0] = stringsetloc("* (It's a dirty watering can.)/%", "obj_readable_room1_slash_Other_10_gml_1032_0");
        if (x >= 180)
            global.msg[0] = stringsetloc("* (There is some dirty fur stuck in the drain.)/%", "obj_readable_room1_slash_Other_10_gml_1034_0");
        if (x >= 260)
            global.msg[0] = stringsetloc("* (It's a small TV.)&* (On top are some superhero comics.)/%", "obj_readable_room1_slash_Other_10_gml_1037_0");
    }
    if (y > 120)
    {
        if (x < 160)
        {
            global.msg[0] = stringsetloc("* (It's a note.)&* (It says...)/", "obj_readable_room1_slash_Other_10_gml_1044_0");
            global.msg[1] = stringsetloc("* No rent received. Again.&* Stop giving away flowers.&* Start selling them./", "obj_readable_room1_slash_Other_10_gml_1045_0");
            global.msg[2] = stringsetloc("* You have one month.& &         - C/%", "obj_readable_room1_slash_Other_10_gml_1046_0");
        }
        else
        {
            if (read == 0)
            {
                global.msg[0] = stringsetloc("* (It's an air mattress.^1)&* (It's certainly not king-sized...)/", "obj_readable_room1_slash_Other_10_gml_1052_0");
                scr_asgface(1, 4);
                global.msg[2] = stringsetloc("* Kris^1, do you want to sleep over?/", "obj_readable_room1_slash_Other_10_gml_1054_0");
                global.msg[3] = stringsetloc("\\E1* You could use that air mattress^1, and I could.../", "obj_readable_room1_slash_Other_10_gml_1055_0");
                global.msg[4] = stringsetloc("\\E2* Er^1, use those bags of soil..^1.&* Perhaps not./%", "obj_readable_room1_slash_Other_10_gml_1056_0");
            }
            if (read >= 1)
                global.msg[0] = stringsetloc("* (It's an air mattress.^1)&* (It's certainly not king-sized...)/%", "obj_readable_room1_slash_Other_10_gml_1060_0");
        }
    }
    if (x == 225)
    {
        global.msc = 210;
        scr_text(global.msc);
    }
}
if (room == room_alphysalley)
{
    if (x <= 130)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* (It's a saucer of milk.)/%", "obj_readable_room1_slash_Other_10_gml_1077_0");
        if (global.chapter >= 2)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E7* Hey Kris^1, this free milk? It's amazing./", "obj_readable_room1_slash_Other_10_gml_1353_0");
            msgnextloc("\\E2* It just magically refreshes itself over night./%", "obj_readable_room1_slash_Other_10_gml_1354_0");
        }
    }
    else
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (It's a dirty trash can.)/%", "obj_readable_room1_slash_Other_10_gml_1091_0");
            if (y <= 100)
                global.msg[0] = stringsetloc("* (It's a trash can full of well-kept flowers.)/%", "obj_readable_room1_slash_Other_10_gml_1094_0");
        }
        if (global.chapter >= 2)
        {
            scr_speaker("bratty");
            msgsetloc(0, "\\E3* (Um^1, HEY? That's MY trash from other people's houses.)/", "obj_readable_room1_slash_Other_10_gml_1371_0");
            msgnextloc("\\E6* (Like^1, PRIVACY much? God^1, living with Azzy made you weird.)/%", "obj_readable_room1_slash_Other_10_gml_1372_0");
        }
    }
}
if (room == room_town_south)
{
    if (x <= 100)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (Police tape is blocking the way.)/", "obj_readable_room1_slash_Other_10_gml_1111_0");
            global.msg[1] = stringsetloc("* (The tape simply reads \"NGAHHHHH!!!\")/%", "obj_readable_room1_slash_Other_10_gml_1112_0");
        }
        if (global.chapter >= 2)
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (There's more police tape.)/", "obj_readable_room1_slash_Other_10_gml_1393_0");
                msgnextloc("* (It says \"NGAHHHH!!^1! I MEAN IT!!!\")/", "obj_readable_room1_slash_Other_10_gml_1394_0");
                msgnextloc("* (It's not clear what is meant by that.)/%", "obj_readable_room1_slash_Other_10_gml_1395_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (There's a lot of police tape.)/%", "obj_readable_room1_slash_Other_10_gml_1399_0");
            }
            if (global.chapter == 4)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Yesterday's police tape.)/%", "obj_readable_room1_slash_Other_10_gml_2015_0");
                if (global.plot >= 300)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (The police tape is flimsy and wet.)/%", "obj_readable_room1_slash_Other_10_gml_2020_0");
                }
            }
        }
    }
    if (global.chapter == 4 && x >= 100 && x < 140)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (splash splash) Rain is the best weather for puddles^1! I'm splashin' out!/", "obj_readable_room1_slash_Other_10_gml_2030_0");
            msgnextloc("* I'm just a kid and don't know all the weathers^1, but I'm splashin' out!/%", "obj_readable_room1_slash_Other_10_gml_2031_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Is soonami a weather?/%", "obj_readable_room1_slash_Other_10_gml_2035_0");
        }
    }
    if (x > 200 && x < 300)
    {
        if (global.chapter < 4)
        {
            if (read == 0)
            {
                snd_play(snd_knock);
                global.msg[0] = stringsetloc("* (You knocked on the door to the Police Station.)/", "obj_readable_room1_slash_Other_10_gml_1119_0");
                global.msg[1] = stringsetloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_1120_0");
                global.msg[2] = stringsetloc("* (Someone's coming up to the window.)/%", "obj_readable_room1_slash_Other_10_gml_1121_0");
                with (obj_town_event)
                    con = 50;
            }
            else
            {
                global.msg[0] = stringsetloc("* (Seems like the police aren't really feelin' it right now...)/%", "obj_readable_room1_slash_Other_10_gml_1126_0");
            }
        }
        if (global.chapter == 4)
        {
            scr_speaker("napstablook");
            msgsetloc(0, "* (the police station is closed..^1. please don't do any big crimes right now.)/%", "obj_readable_room1_slash_Other_10_gml_2060_0");
            if (global.plot >= 100)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's closed.)/%", "obj_readable_room1_slash_Other_10_gml_2065_0");
            }
        }
    }
    if (global.chapter >= 4)
    {
        if (x >= 590 && x < 610)
        {
            if (global.chapter == 4 && global.plot >= 100)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (\"Temporary hold on new patients due to rain-induced colds.\")/%", "obj_readable_room1_slash_Other_10_gml_2077_0");
                if (global.plot >= 300)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (It's closed.)/%", "obj_readable_room1_slash_Other_10_gml_2082_0");
                }
            }
        }
        if (x > 900 && x < 1100)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Library is closed this weekend due to a lack of volunteers.)/%", "obj_readable_room1_slash_Other_10_gml_2090_0");
            if (global.plot >= 100)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (\"Closed temporarily due to wet noses^1! ..^1. er^1, weather!\")/%", "obj_readable_room1_slash_Other_10_gml_2095_0");
                if (global.plot >= 300)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (It's closed.)/%", "obj_readable_room1_slash_Other_10_gml_2100_0");
                }
            }
        }
    }
}
if (room == room_town_mid)
{
    if (x > 260)
    {
        global.msg[0] = stringsetloc("* (Here at ICE-E'S PEZZA, You're Family.)/", "obj_readable_room1_slash_Other_10_gml_1136_0");
        global.msg[1] = stringsetloc("* (... Is Going to Love it!)/%", "obj_readable_room1_slash_Other_10_gml_1137_0");
        if (global.chapter == 4 && global.plot >= 300 && x < 300)
            skip = 1;
    }
    if (x >= 300)
    {
        global.msg[0] = stringsetloc("* (The entrance is locked.^1)&* (No one's inside.)/", "obj_readable_room1_slash_Other_10_gml_1141_0");
        global.msg[1] = stringsetloc("* (Seems like all of the employees are outside in costume.)/%", "obj_readable_room1_slash_Other_10_gml_1142_0");
        if (global.chapter == 4)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (ICE-E's P\"E\"ZZA is CLOS\"E\"D for NEW SIGNAG\"E\"!)/%", "obj_readable_room1_slash_Other_10_gml_2135_0");
            if (global.plot >= 300)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's closed.)/%", "obj_readable_room1_slash_Other_10_gml_2140_0");
            }
        }
    }
    if (x >= 360)
    {
        global.msg[0] = stringsetloc("* (Ice E's P\"E\"ZZA, You're number \"#1\" Spot for a piping hot pe\"E\"ce of PEZZA.)/%", "obj_readable_room1_slash_Other_10_gml_1146_0");
        if (global.chapter == 4 && global.plot >= 300 && x < 500)
            skip = 1;
    }
    if (x >= 520 && x < 630)
    {
        if (global.chapter == 4 && global.plot >= 100)
        {
            if (global.plot < 300)
            {
                var egg_text = scr_flag_get(930) > 0 && scr_flag_get(799) == 0;
                var sentence_end = egg_text ? "/" : "/%";
                scr_speaker("no_name");
                msgsetsubloc(0, "* (Looks like the diner is full.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_2154_0");
                if (egg_text)
                {
                    scr_flag_set(799, 1);
                    msgnextloc("* (..^1. a customer in the back notices you.)/", "obj_readable_room1_slash_Other_10_gml_2160_0_b");
                    msgnextloc("* (He holds up a takeout box and taps it^1, happily.)/%", "obj_readable_room1_slash_Other_10_gml_2161_0");
                }
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's closed.)/%", "obj_readable_room1_slash_Other_10_gml_2167_0");
            }
        }
    }
    if (x >= 900)
    {
        if (global.plot < 300)
        {
            if (global.plot >= 100)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It says it's closed^1, but the lights are on inside...)/%", "obj_readable_room1_slash_Other_10_gml_2178_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (\"Open\".)/%", "obj_readable_room1_slash_Other_10_gml_2182_0");
                if (scr_flag_get(798) >= 1)
                {
                    if (scr_flag_get(798) == 1)
                    {
                        scr_flag_set(798, 2);
                        with (obj_npc_facing)
                            talked = 0;
                    }
                    if (scr_flag_get(798) >= 4)
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* (\"Clopen.\")/%", "obj_readable_room1_slash_Other_10_gml_2196_0");
                    }
                    if (scr_flag_get(798) >= 6)
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* ( \" \\M1      \" )/%", "obj_readable_room1_slash_Other_10_gml_2202_0");
                    }
                }
            }
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's closed.)/%", "obj_readable_room1_slash_Other_10_gml_2167_0");
        }
    }
    if (x >= 1240)
    {
        var play_knock = true;
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (Knock knock knock...)/", "obj_readable_room1_slash_Other_10_gml_1154_0");
            global.msg[1] = stringsetloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_1444_0");
            global.msg[2] = stringsetloc("* (No response...^1)&* (... but the distant trousle of bones.)/%", "obj_readable_room1_slash_Other_10_gml_1156_0");
        }
        if (global.chapter >= 2)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Knock knock knock.)/", "obj_readable_room1_slash_Other_10_gml_1451_0");
            msgnextloc("* (Faintly...^1. faintly^1, a trousle..^1. growing further away...)/%", "obj_readable_room1_slash_Other_10_gml_1452_0");
            if (global.chapter == 4)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Knock knock knock.)/", "obj_readable_room1_slash_Other_10_gml_2229_0");
                msgnextloc("* (You hear nary a bone..^1. No rattle^1, nor trousle^1, nor xylophone tickle.)/%", "obj_readable_room1_slash_Other_10_gml_2230_0");
                if (global.plot >= 100)
                {
                    play_knock = false;
                    global.msc = 1367;
                    scr_text(global.msc);
                }
            }
        }
        if (x >= 1500)
        {
            if (global.chapter == 1)
            {
                global.msg[1] = stringsetloc("* Ooo^1, are you the human that lives at the top of town?/", "obj_readable_room1_slash_Other_10_gml_1170_0");
                global.msg[2] = stringsetloc("* Wow^1, my mommy told me about you.../", "obj_readable_room1_slash_Other_10_gml_1171_0");
                global.msg[3] = stringsetloc("* Does it hurt to be made of blood???/%", "obj_readable_room1_slash_Other_10_gml_1172_0");
            }
            if (global.chapter >= 2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Knock knock knock)/", "obj_readable_room1_slash_Other_10_gml_1483_0");
                msgnextloc("* Oooo^1, is that a humannnn?!/", "obj_readable_room1_slash_Other_10_gml_1467_0");
                msgnextloc("* If humans are made of bones.../", "obj_readable_room1_slash_Other_10_gml_1468_0");
                msgnextloc("* Where does skeletons come from...?/%", "obj_readable_room1_slash_Other_10_gml_1469_0");
                if (global.chapter >= 4 && x < 1600)
                {
                    if (global.plot < 300)
                    {
                        if (scr_flag_get(765) == 0)
                        {
                            scr_flag_set(765, 1);
                            with (obj_room_town_mid)
                                con = 0;
                            skip = 1;
                        }
                        else
                        {
                            scr_speaker("no_name");
                            msgsetloc(0, "* (Knock knock knock...)/", "obj_readable_room1_slash_Other_10_gml_2274_0");
                            msgnextloc("* .../%", "obj_readable_room1_slash_Other_10_gml_2275_0");
                        }
                    }
                    else
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* (Knock knock knock...)/", "obj_readable_room1_slash_Other_10_gml_2280_0");
                        msgnextloc("* (No response.)/%", "obj_readable_room1_slash_Other_10_gml_2281_0");
                    }
                }
            }
        }
        if (x >= 1640)
        {
            if (global.chapter == 1)
            {
                global.msg[1] = stringsetloc("* Huh..^1. that sounds like the knock of a beginner./", "obj_readable_room1_slash_Other_10_gml_1187_0");
                global.msg[2] = stringsetloc("* Come back when you've gotten better at knocking!/%", "obj_readable_room1_slash_Other_10_gml_1188_0");
            }
            if (global.chapter >= 2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Knock knock knock)/", "obj_readable_room1_slash_Other_10_gml_1483_0");
                msgnextloc("* Hmm..^1. that knocking..^1. it's amateur!/", "obj_readable_room1_slash_Other_10_gml_1484_0");
                msgnextloc("* You've still got a long way to go!/%", "obj_readable_room1_slash_Other_10_gml_1485_0");
                if (global.chapter >= 4)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (Knock knock knock...)/", "obj_readable_room1_slash_Other_10_gml_2304_0");
                    if (global.plot < 300)
                    {
                        if (read == 0)
                        {
                            msgnextloc("* The door knocking guy? No^1, this is his wife./", "obj_readable_room1_slash_Other_10_gml_2310_0");
                            msgnextloc("* Please take a break from knocking today. Thanks./%", "obj_readable_room1_slash_Other_10_gml_2311_0_b");
                        }
                        else
                        {
                            msgnextloc("* Taking breaks is vital to getting better^1, too./%", "obj_readable_room1_slash_Other_10_gml_2314_0");
                        }
                    }
                    else
                    {
                        msgnextloc("* (No response.)/%", "obj_readable_room1_slash_Other_10_gml_2318_0_b");
                    }
                }
            }
        }
        if (x >= 1860)
        {
            if (global.chapter == 1)
            {
                global.msg[1] = stringsetloc("* OY^1, Snowy^1, whaddid I TELL YAH about knockin' the door so hahd!/", "obj_readable_room1_slash_Other_10_gml_1204_0");
                global.msg[2] = stringsetloc("* Don't^1!&* Do^1!&* It!/", "obj_readable_room1_slash_Other_10_gml_1205_0");
                global.msg[3] = stringsetloc("* It's REALLY gonna hurt yah face^1! We don't have arms^1, yah know!/%", "obj_readable_room1_slash_Other_10_gml_1206_0");
            }
            if (global.chapter >= 2)
            {
                var visitedshelter = global.flag[315] == 1;
                if (!visitedshelter)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (Knock knock knock)/", "obj_readable_room1_slash_Other_10_gml_1504_0");
                    scr_anyface_next("susie", "C");
                    msgnextloc("\\EC* Hey^1, uh^1, Kris..^1. what are you doing?/", "obj_readable_room1_slash_Other_10_gml_1506_0");
                    msgnextloc("\\E1* We're going to your house^1, right?/%", "obj_readable_room1_slash_Other_10_gml_1507_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (Knock knock knock)/", "obj_readable_room1_slash_Other_10_gml_1510_0");
                    msgnextloc("* (Yo^1, uhh^1, Kris..^1. haha. Is that you? Haha...)/", "obj_readable_room1_slash_Other_10_gml_1511_0");
                    msgnextloc("* (We're not hanging out if Susie's with you!)/", "obj_readable_room1_slash_Other_10_gml_1512_0");
                    msgnextloc("* (Kris..^1. Susie sucks^1! Why didn't you stop her^1, haha...)/%", "obj_readable_room1_slash_Other_10_gml_1513_0");
                }
                if (global.chapter >= 4)
                {
                    if (global.plot >= 100)
                    {
                        play_knock = false;
                        if (global.plot < 300)
                        {
                            if (read == 0)
                            {
                                if (scr_flag_get(1555) == 0)
                                {
                                    snd_play(snd_wing);
                                    scr_speaker("no_name");
                                    msgsetloc(0, "* (You jostled the door handle.)/", "obj_readable_room1_slash_Other_10_gml_2365_0");
                                    scr_anyface_next("susie", "2");
                                    msgnextloc("\\E2* ..^1. hey^1, let's go back to your house and chill./", "obj_readable_room1_slash_Other_10_gml_2367_0_b");
                                    msgnextloc("\\EA* This place is boring..^1. y'know?/%", "obj_readable_room1_slash_Other_10_gml_2368_0_b");
                                }
                                else
                                {
                                    scr_speaker("susie");
                                    msgsetloc(0, "\\E0* ..^1. shouldn't we^1, uh^1, try to find your mom?/", "obj_readable_room1_slash_Other_10_gml_2372_0_b");
                                    msgnextloc("\\E1* Y'know^1, then we can go back to your house.../%", "obj_readable_room1_slash_Other_10_gml_2373_0");
                                }
                            }
                            else
                            {
                                scr_speaker("susie");
                                msgsetloc(0, "\\E0* .../%", "obj_readable_room1_slash_Other_10_gml_2378_0");
                            }
                        }
                        else if (scr_flag_get(1635) == 0)
                        {
                            scr_flag_set(1635, 1);
                            scr_speaker("susie");
                            msgsetloc(0, "\\EV* .../", "obj_readable_room1_slash_Other_10_gml_2387_0");
                            msgnextloc("\\EV* Let's go to your house./%", "obj_readable_room1_slash_Other_10_gml_2388_0");
                        }
                        else
                        {
                            scr_speaker("susie");
                            msgsetloc(0, "\\EV* .../%", "obj_readable_room1_slash_Other_10_gml_2392_0_b");
                        }
                    }
                }
            }
        }
        if (play_knock)
            snd_play(snd_knock);
    }
    if (global.chapter == 4 && global.plot >= 100)
    {
        if (x < 270)
        {
            if (scr_flag_get(777) == 0 && global.plot < 300)
            {
                global.msc = 1355;
                scr_text(global.msc);
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's a cardboard stand to replace the pizza place while it's closed.)/", "obj_readable_room1_slash_Other_10_gml_2434_0");
                msgnextloc("* (Somehow^1, it's more sanitary.)/%", "obj_readable_room1_slash_Other_10_gml_2435_0");
            }
        }
    }
}
if (room == room_town_north)
{
    if (x <= 250)
        global.msg[0] = stringsetloc("* (It's an ornate gate.^1)&* (It appears to be locked.)/%", "obj_readable_room1_slash_Other_10_gml_1236_0");
    if (x >= 500 && x <= 570)
    {
        if (global.chapter == 1)
        {
            global.fc = 16;
            global.typer = 5;
            global.fe = 6;
            global.msg[0] = stringsetloc("* Aww^1, Kris^1, like^1, if you wanna come in.../", "obj_readable_room1_slash_Other_10_gml_1245_0");
            global.msg[1] = stringsetloc("\\E4* Our cat-flap^1, is like^1, always open to you.../%", "obj_readable_room1_slash_Other_10_gml_1246_0");
        }
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (There's a cat flap.)/", "obj_readable_room1_slash_Other_10_gml_1539_0");
            msgnextloc("* (It's locked.)/", "obj_readable_room1_slash_Other_10_gml_1540_0");
            msgnextloc("* (Somehow.)/%", "obj_readable_room1_slash_Other_10_gml_1541_0");
            if (global.chapter == 4)
            {
                if (global.plot < 300)
                {
                    if (scr_flag_get(797) == 1)
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* (It's a locked cat flap..^1. upon further inspection^1, it seems it requires \\cR3 codes\\cW.)/", "obj_readable_room1_slash_Other_10_gml_2471_0_b");
                        msgnextloc("* (..^1. this information is useless.)/%", "obj_readable_room1_slash_Other_10_gml_2472_0");
                    }
                }
            }
        }
    }
    if (x >= 580)
    {
        global.msg[0] = stringsetloc("* (Various cat-themed junk is piled up inside the house.)/", "obj_readable_room1_slash_Other_10_gml_1258_0");
        global.msg[1] = stringsetloc("* (It seems to be a bit of a cat-sty...)/%", "obj_readable_room1_slash_Other_10_gml_1259_0");
    }
    if (x >= 650)
    {
        global.msg[0] = stringsetloc("* (It's a broken grill.)/", "obj_readable_room1_slash_Other_10_gml_1263_0");
        global.msg[1] = stringsetloc("* (... It smells like burnt cat food.)/%", "obj_readable_room1_slash_Other_10_gml_1264_0");
        if (global.chapter == 4)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's an upgraded grill. Now^1, in addition to catfood^1, it can also smell like dogfood.)/%", "obj_readable_room1_slash_Other_10_gml_2491_0");
        }
    }
    if (x >= 800)
    {
        global.msg[0] = stringsetloc("* (There's some kind of scratching noise coming from inside...)/%", "obj_readable_room1_slash_Other_10_gml_1268_0");
        if (global.chapter >= 2 && x > 900)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (There's some kind of scratching and hissing from inside.)/%", "obj_readable_room1_slash_Other_10_gml_1563_0");
            if (global.chapter == 4)
            {
                if (global.plot < 300)
                {
                    global.msc = 1361;
                    scr_text(global.msc);
                }
            }
        }
    }
    if (x >= 1090 && x <= 1130)
    {
        var play_knock = true;
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (Knock knock knock...)/", "obj_readable_room1_slash_Other_10_gml_1276_0");
            global.msg[1] = stringsetloc("* Ah, I'm afraid no one's home right now^1, darling./", "obj_readable_room1_slash_Other_10_gml_1277_0");
            global.msg[2] = stringsetloc("* Now^1, why don't you prance on home?/%", "obj_readable_room1_slash_Other_10_gml_1278_0");
            if (read >= 1)
            {
                global.msg[1] = stringsetloc("* I'm telling you^1, they're not home right now./", "obj_readable_room1_slash_Other_10_gml_1282_0");
                global.msg[2] = stringsetloc("* ... Ah^1, you just wanted to talk to me...?/", "obj_readable_room1_slash_Other_10_gml_1283_0");
                global.msg[3] = stringsetloc("* .../", "obj_readable_room1_slash_Other_10_gml_1284_0");
                global.msg[4] = stringsetloc("* My apologies^1, beautiful^1.&* I'm afraid I'm a bit of a nobody./%", "obj_readable_room1_slash_Other_10_gml_1285_0");
            }
        }
        if (global.chapter >= 2)
        {
            global.msc = 1055;
            scr_text(global.msc);
            if (global.chapter == 4)
            {
                if (global.plot < 300)
                {
                    if (scr_tenna_alt_plot())
                    {
                        if (scr_flag_get(1575) == 0)
                        {
                            global.msc = 1443;
                            scr_text(global.msc);
                        }
                        else
                        {
                            scr_speaker("no_name");
                            msgsetloc(0, "* ..^1. sometimes..^1. it's difficult./", "obj_readable_room1_slash_Other_10_gml_2550_0");
                            msgnextloc("* ..^1. not leaving this house for days on end./", "obj_readable_room1_slash_Other_10_gml_2551_0");
                            msgnextloc("* Darling^1, if you had anything^1, I'd.../%", "obj_readable_room1_slash_Other_10_gml_2552_0");
                        }
                    }
                    else if (scr_flag_get(779) < 2)
                    {
                        if (scr_flag_get(779) == 0)
                            scr_flag_set(779, 1);
                        global.msc = 1359;
                        scr_text(global.msc);
                    }
                    else
                    {
                        scr_speaker("no_name");
                        msgsetloc(0, "* (Knock knock knock.)/", "obj_readable_room1_slash_Other_10_gml_2568_0");
                        msgnextloc("* Tenna^1, you cad. What is this..^1. salacious music video?/", "obj_readable_room1_slash_Other_10_gml_2569_0");
                        msgnextloc("* Oh my^1, I think something just awakened within me.../%", "obj_readable_room1_slash_Other_10_gml_2570_0");
                    }
                }
            }
        }
        if (extflag == "night_door")
        {
            play_knock = false;
            scr_speaker("no_name");
            msgsetloc(0, "* (Knocking might wake somebody up...)/%", "obj_readable_room1_slash_Other_10_gml_2599_0");
        }
        if (play_knock)
            snd_play(snd_knock);
    }
    if (x == 1427 && y == 38)
    {
        if (global.chapter == 2)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (There's a door behind the flower shop.)/", "obj_readable_room1_slash_Other_10_gml_1617_0");
            msgnextloc("* (... but there's flowers blocking the way.)/%", "obj_readable_room1_slash_Other_10_gml_1618_0");
        }
        if (global.chapter == 4)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The back door is blocked..^1. You can only see through the basement window.)/", "obj_readable_room1_slash_Other_10_gml_2591_0_b");
            msgnextloc("* (A corkboard is covered with tons of papers^1, and documents litter the floor...)/%", "obj_readable_room1_slash_Other_10_gml_2592_0");
        }
    }
}
if (room == room_town_shelter)
{
    global.msg[0] = stringsetloc("* (It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_1302_0");
    if (global.chapter == 4)
    {
        if (global.plot >= 100 && global.plot < 300)
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EV* .../", "obj_readable_room1_slash_Other_10_gml_2629_0");
                msgnextloc("\\EV* At least..^1. we know where one of the codes is./", "obj_readable_room1_slash_Other_10_gml_2630_0");
                msgnextloc("\\EV* ..^1. Still..^1. we gotta hurry./%", "obj_readable_room1_slash_Other_10_gml_2631_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EV* .../%", "obj_readable_room1_slash_Other_10_gml_2635_0");
            }
        }
        else if (global.plot >= 300)
        {
            if (scr_flag_get(769) == 0)
            {
                scr_flag_set(769, 1);
                scr_speaker("susie");
                msgsetloc(0, "\\EV* .../", "obj_readable_room1_slash_Other_10_gml_2617_0_b");
                msgnextloc("\\EV* No closer to opening this thing^1, huh.../", "obj_readable_room1_slash_Other_10_gml_2618_0_b");
                msgnextloc("\\EV* .../", "obj_readable_room1_slash_Other_10_gml_2619_0");
                msgnextloc("\\EV* Tomorrow..^1. tomorrow^1, we have to do something./", "obj_readable_room1_slash_Other_10_gml_2620_0");
                msgnextloc("\\EV* ..^1. we have to./%", "obj_readable_room1_slash_Other_10_gml_2621_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EV* .../%", "obj_readable_room1_slash_Other_10_gml_2625_0");
            }
        }
        else
        {
            global.msc = 1433;
            scr_text(global.msc);
        }
    }
}
if (room == room_lw_icee_pizza)
{
    if (x > 40 && x < 80)
    {
        global.msc = 1022;
        scr_text(global.msc);
    }
    if (y > 110 && y < 130)
    {
        if (x > 50)
        {
            msgsetloc(0, "* (There's some condiments at the table.)/", "obj_readable_room1_slash_Other_10_gml_1615_0");
            msgnextloc("* ICE-E's \"Original\" Parmajohn Che\"E\"ese!/%", "obj_readable_room1_slash_Other_10_gml_1616_0");
        }
        if (x > 230)
        {
            msgsetloc(0, "* (There's some condiments at the table.)/", "obj_readable_room1_slash_Other_10_gml_1621_0");
            msgnextloc("* ICE-E'S Squeezable Pasta Now With New \"Shape\"/%", "obj_readable_room1_slash_Other_10_gml_1622_0");
        }
    }
    if (y < 70 && x > 220 && x < 260)
    {
        msgsetloc(0, "* (Try our new CHOCCOLATE PEZZA)/", "obj_readable_room1_slash_Other_10_gml_1629_0");
        msgnextloc("* (Melts in your pants not in your mouth)/%", "obj_readable_room1_slash_Other_10_gml_1630_0");
    }
}
if (room == room_lw_conbini)
{
    if (x > 120 && y < 90)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Various frozen bagels and treats.)/", "obj_readable_room1_slash_Other_10_gml_1640_0");
        scr_anyface_next("susie", "2");
        msgnextloc("\\E2* Hey Kris^1, wanna see if we can fit inside?/", "obj_readable_room1_slash_Other_10_gml_1642_0");
        msgnextloc("\\E5* If you just crouch down under the waffles -/", "obj_readable_room1_slash_Other_10_gml_1643_0");
        msgnextloc("\\EK* Damn^1, think someone's looking./%", "obj_readable_room1_slash_Other_10_gml_1644_0");
    }
    if (x > 240 && x < 250 && y < 90)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It looks like a normal basket of fruit^1, but when you reach in...)/", "obj_readable_room1_slash_Other_10_gml_1651_0");
        msgnextloc("* (..^1. It's incredibly deep and holds all sorts of things.)/%", "obj_readable_room1_slash_Other_10_gml_1652_0");
    }
    if (x > 200 && y < 80)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* LOOSE EGGS $1/", "obj_readable_room1_slash_Other_10_gml_1659_0");
        msgnextloc("* (It's too much responsibility for an egg.)/%", "obj_readable_room1_slash_Other_10_gml_1660_0");
        if (global.flag[439] == 1)
            msgsetloc(0, "* (Seems like there's more eggs here than usual.)/%", "obj_readable_room1_slash_Other_10_gml_1684_0");
        if (scr_litemcheck(8) && global.flag[439] == 0)
        {
            scr_litemremove(8);
            global.writersnd[1] = snd_egg;
            msgsetloc(0, "* (It's a pile of eggs.)/", "obj_readable_room1_slash_Other_10_gml_1691_0_b");
            msgnextloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_1692_0");
            msgnextloc("\\S1* (You put the Egg into the eggpile.)/", "obj_readable_room1_slash_Other_10_gml_1693_0");
            scr_anyface_next("susie", 0);
            msgnextloc("* ... did you just^1, uh^1, reverse-steal that egg?/%", "obj_readable_room1_slash_Other_10_gml_1695_0_b");
            scr_keyitemremove(2);
            skip = 0;
            global.flag[439] = 1;
        }
    }
    if (x > 280 && x < 310 && y < 90)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Grapes^1, melons^1, oranges^1, and the scent of fresh pineapples...)/%", "obj_readable_room1_slash_Other_10_gml_1667_0");
    }
    if (x > 265 && x < 280 && y < 90)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It looks like a normal palm tree^1, but it's chock-full of useful groceries.)/%", "obj_readable_room1_slash_Other_10_gml_1674_0");
    }
    if (x > 425 && x < 445 && y < 90)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a rack of candy^1, jerky^1, and various nuts.)/", "obj_readable_room1_slash_Other_10_gml_1683_0");
            scr_anyface_next("susie", 10);
            msgnextloc("\\EA* See? Jerky is candy. ..^1. And^1, uh^1, peanuts too./", "obj_readable_room1_slash_Other_10_gml_1685_0");
            scr_anyface_next("sans", "5");
            msgnextloc("\\E5* actually they're a legume./", "obj_readable_room1_slash_Other_10_gml_1687_0");
            scr_anyface_next("susie", 1);
            msgnextloc("\\E1* Peanuts?/", "obj_readable_room1_slash_Other_10_gml_1689_0");
            scr_anyface_next("sans", "2");
            msgnextloc("\\E2* jerky./%", "obj_readable_room1_slash_Other_10_gml_1691_0");
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "* How about we don't look at anything.../", "obj_readable_room1_slash_Other_10_gml_1695_0");
            msgnextloc("\\E1* That's gonna make him say something stupid./", "obj_readable_room1_slash_Other_10_gml_1696_0");
            scr_anyface_next("sans", "5");
            msgnextloc("\\E5* ..^1. pickings are looking slim^1, ma'am./%", "obj_readable_room1_slash_Other_10_gml_1698_0");
        }
    }
    if (x > 140 && y > 150)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ice-E's Pizza Pin-Ups Mangazine./", "obj_readable_room1_slash_Other_10_gml_1708_0");
            msgnextloc("* HOt and fresh chease^1, pepperonie^1, Just like in your Dream's.../%", "obj_readable_room1_slash_Other_10_gml_1709_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Hot Piza Picks! Now with 3 Pixels Or MOre, In Hot and Spicy REsolution!/%", "obj_readable_room1_slash_Other_10_gml_1716_0");
        }
    }
    if (x > 170 && y > 150)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* There're some car magazines on the racks./", "obj_readable_room1_slash_Other_10_gml_1726_0");
            msgnextloc("* It might be fun to look at them^1,/", "obj_readable_room1_slash_Other_10_gml_1727_0");
            msgnextloc("* But there's other people around.../%", "obj_readable_room1_slash_Other_10_gml_1728_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* It's a fluffy dog magazine^1. The inside has samples like fragrance ads.../", "obj_readable_room1_slash_Other_10_gml_1734_0");
            msgnextloc("* But it's all different dog fur for you to touch./", "obj_readable_room1_slash_Other_10_gml_1735_0");
            scr_anyface_next("susie", "5");
            msgnextloc("\\E5* Hey^1, don't hog the ads!!/%", "obj_readable_room1_slash_Other_10_gml_1737_0");
        }
    }
    if (x > 200 && y > 150)
        msgsetloc(0, "* It's a zine for Jockington fans. Seems popular./%", "obj_readable_room1_slash_Other_10_gml_1746_0");
    if (x > 240 && y > 150)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's a bunch of cards and heart shaped chocolates./", "obj_readable_room1_slash_Other_10_gml_1753_0");
        msgnextloc("* \"Get well soon!\"&* \"I'm glad your bike crashed\"/%", "obj_readable_room1_slash_Other_10_gml_1755_0");
    }
    if (x > 400 && x < 420 && y < 80)
    {
        snd_play(snd_bell);
        global.interact = 0;
        myinteract = 0;
        with (obj_mainchara)
            onebuffer = 3;
        exit;
    }
    if (x > 400 && x < 415 && y > 160)
    {
        scr_speaker("sans");
        msgsetloc(0, "\\E2* that stuff? it's used. half off./", "obj_readable_room1_slash_Other_10_gml_1774_0");
        scr_anyface_next("susie", 0);
        msgnextloc("* ..^1. What is it?/", "obj_readable_room1_slash_Other_10_gml_1776_0");
        scr_anyface_next("sans", 5);
        msgnextloc("\\E5* trash./%", "obj_readable_room1_slash_Other_10_gml_1778_0");
    }
    if (x > 435 && x < 445 && y > 150)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You can't reach the top^1, rendering it impossible to get a basket.)/", "obj_readable_room1_slash_Other_10_gml_1787_0");
            msgnextloc("* (You'll never be able to buy something in this state...)/%", "obj_readable_room1_slash_Other_10_gml_1788_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (One was the Throne of God's^1, this is the Throne of Evil's.)/%", "obj_readable_room1_slash_Other_10_gml_1792_0");
        }
    }
}
if (room == room_lw_police)
{
    if (x > 110 && x < 130 && y > 60 && y < 80)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (You skimmed a news article about Undyne.)/", "obj_readable_room1_slash_Other_10_gml_1806_0");
        msgnextloc("* New Police Chief Undyne's Explosive Debut/", "obj_readable_room1_slash_Other_10_gml_1807_0");
        msgnextloc("* ..^1. passionate young rookie..^1. becomes the new police chief./", "obj_readable_room1_slash_Other_10_gml_1808_0");
        msgnextloc("* Though energetic^1, it may be hard to live up to the legacy.../", "obj_readable_room1_slash_Other_10_gml_1809_0");
        msgnextloc("* ..^1. after Asgore Dreemurr was removed from the force.../", "obj_readable_room1_slash_Other_10_gml_1810_0");
        msgnextloc("* (..^1. there's no need to read any more.)/%", "obj_readable_room1_slash_Other_10_gml_1811_0");
    }
    if (x > 80 && x < 90 && y < 150 && y > 140)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Photos of Chief Undyne and Deputy Napstablook.)/", "obj_readable_room1_slash_Other_10_gml_1818_0");
        msgnextloc("* (Undyne is rescuing all of Catti's family from a tree.)/", "obj_readable_room1_slash_Other_10_gml_1819_0");
        msgnextloc("* (..^1. Napstablook is also stuck in the tree somehow.)/%", "obj_readable_room1_slash_Other_10_gml_1820_0");
    }
    if (x > 60 && x < 70 && y > 170)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Well-cared-for flowers.)/%", "obj_readable_room1_slash_Other_10_gml_1827_0");
    }
}
if (room == room_dw_castle_rooms_kris)
{
    if (x > 150 && x < 200)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's a wardrobe full of all sorts of different clothes./", "obj_readable_room1_slash_Other_10_gml_1837_0");
        msgnextloc("* You could wear whatever you want./%", "obj_readable_room1_slash_Other_10_gml_1838_0");
    }
    if (x > 200 && x < 280)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's a shelf./", "obj_readable_room1_slash_Other_10_gml_1845_0");
        msgnextloc("* All sorts of keepsakes could be put here./%", "obj_readable_room1_slash_Other_10_gml_1846_0");
    }
    if (x > 310 && x < 390)
    {
        if (global.chapter < 4)
        {
            if (global.flag[207] >= 2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* It's a trash can./", "obj_readable_room1_slash_Other_10_gml_1855_0");
                scr_anyface_next("ralsei", 3);
                msgnextloc("\\E3* Here^1, Kris^1! In case I make another manual.../", "obj_readable_room1_slash_Other_10_gml_1857_0");
                msgnextloc("\\E2* You can throw it directly in here!/%", "obj_readable_room1_slash_Other_10_gml_1858_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* It's a stand for your Manual./", "obj_readable_room1_slash_Other_10_gml_1861_0");
                scr_anyface_next("ralsei", 2);
                msgnextloc("\\E2* I thought you might want to keep it here in case you want to read it!/%", "obj_readable_room1_slash_Other_10_gml_1863_0");
            }
        }
    }
    if (x > 390 && x < 500 && y < 280)
    {
        if (global.flag[409] == 0)
            global.flag[409] = 1;
        if (global.flag[252] == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* It's a bed that's been carefully crafted./", "obj_readable_room1_slash_Other_10_gml_1875_0");
            msgnextloc("* It's suitable for a bed inspector./%", "obj_readable_room1_slash_Other_10_gml_1876_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* It's your bed./", "obj_readable_room1_slash_Other_10_gml_1880_0");
            msgnextloc("* It feels incredibly soft. Like sleeping on a dream.../%", "obj_readable_room1_slash_Other_10_gml_1881_0");
        }
    }
    if (x > 450 && y > 360)
    {
        var haveSusie = scr_havechar(2);
        var sentenceEnd = haveSusie ? "/" : "/%";
        scr_speaker("no_name");
        msgsetsubloc(0, "* It's some decorative moss. Looks delicious.~1", sentenceEnd, "obj_readable_room1_slash_Other_10_gml_1921_0_b");
        if (haveSusie)
        {
            scr_anyface_next("susie", "K");
            msgnextloc("\\EK* Why the hell does YOUR room get moss!?/%", "obj_readable_room1_slash_Other_10_gml_1925_0_b");
        }
    }
}
if (room == room_dw_castle_rooms_susie)
{
    if (x > 140 && x < 250)
    {
        if (global.chapter < 4)
        {
            if (global.flag[410] == 0)
                global.flag[410] = 1;
            scr_speaker("susie");
            msgsetloc(0, "\\E2* Cool^1, spike bed./", "obj_readable_room1_slash_Other_10_gml_1896_0");
            msgnextloc("\\EA* Now I can stab myself during the night./", "obj_readable_room1_slash_Other_10_gml_1897_0");
            msgnextloc("\\E2* Finally some convenience./%", "obj_readable_room1_slash_Other_10_gml_1898_0");
        }
    }
    if (x > 250 && x < 315)
    {
        if (read == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E7* Damn^1, there's everything in here!/", "obj_readable_room1_slash_Other_10_gml_1907_0");
            msgnextloc("* Pinecones^1, chalk^1, moss^1, jars of salsa^1,/", "obj_readable_room1_slash_Other_10_gml_1908_0");
            msgnextloc("* Pieces of ice^1, black crumbs from the toaster^1, jawbreakers.../", "obj_readable_room1_slash_Other_10_gml_1909_0");
            msgnextloc("\\E2* ..^1. Oh^1, and like actual food^1, too./%", "obj_readable_room1_slash_Other_10_gml_1910_0");
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E5* Hey Kris^1, stop eye-bogarting my snacks./%", "obj_readable_room1_slash_Other_10_gml_1913_0");
        }
    }
    if (x > 340 && x < 430)
    {
        scr_speaker("ralsei");
        msgsetloc(0, "\\E0* Susie^1, you didn't get to read the manual.../", "obj_readable_room1_slash_Other_10_gml_1921_0");
        msgnextloc("\\E2* So I put it over here for you./", "obj_readable_room1_slash_Other_10_gml_1922_0");
        scr_anyface_next("susie", 21);
        msgnextloc("\\EL* Cool^1, I'll read it before bed./", "obj_readable_room1_slash_Other_10_gml_1924_0");
        msgnextloc("\\E2* That'll put me to sleep./%", "obj_readable_room1_slash_Other_10_gml_1925_0");
    }
    if (x > 430 && x < 500)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's a clothes drawer full of spikey and dangerous clothing./", "obj_readable_room1_slash_Other_10_gml_1932_0");
        msgnextloc("* All the clothes are ripping each other up into shreds./", "obj_readable_room1_slash_Other_10_gml_1933_0");
        scr_anyface_next("susie", "2");
        msgnextloc("\\E2* Hell yeah!!^1! Jealous^1, Kris!?/%", "obj_readable_room1_slash_Other_10_gml_1935_0");
    }
}
if (room == room_dw_ralsei_castle_1f)
{
    if (x > 350 && x < 450)
        msgsetloc(0, "* (2F : LIVING QUARTERS)&* (3F : EXTENDED LIVING QUARTERS! NEW!)/%", "obj_readable_room1_slash_Other_10_gml_3040_0");
    if (x > 570 && x < 680)
        msgsetloc(0, "* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_1948_0");
    if (x > 950 && x < 1050)
        msgsetloc(0, "* (BF : LIVING QUARTERS FOR BAD GUYS)/%", "obj_readable_room1_slash_Other_10_gml_1953_0");
}
if (room == room_dw_ralsei_castle_2f)
{
    if (x > 1040 && x < 1150)
    {
        if (read == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EA* Hey Ralsei^1, what's up here?/", "obj_readable_room1_slash_Other_10_gml_1964_0");
            scr_anyface_next("ralsei", 2);
            msgnextloc("\\E2* Oh^1, just more rooms I'm renovating!/", "obj_readable_room1_slash_Other_10_gml_1966_0");
            scr_anyface_next("susie", 2);
            msgnextloc("\\E2* ..^1. so is your room up there?/", "obj_readable_room1_slash_Other_10_gml_1968_0");
            scr_anyface_next("ralsei", 26);
            msgnextloc("\\EQ* Er^1, yes^1! I still^1, um^1, haven't dusted it though.../", "obj_readable_room1_slash_Other_10_gml_1970_0");
            scr_anyface_next("susie", 2);
            msgnextloc("\\E2* Yeah^1, like we need to see your nerdy glasses collection anyway./%", "obj_readable_room1_slash_Other_10_gml_1972_0");
        }
        else
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\EG* Sorry^1, work in progress!/%", "obj_readable_room1_slash_Other_10_gml_1976_0");
        }
    }
}
if (room == room_dw_ralsei_castle_3f)
{
    if (x > 1220 && y < 250)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Your friends are still in Ralsei's room...)/%", "obj_readable_room1_slash_Other_10_gml_3084_0");
    }
    if (extflag == "tea_party_prompt")
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E6* Hey^1, what's past here...?/", "obj_readable_room1_slash_Other_10_gml_3090_0");
        scr_anyface_next("ralsei", "9");
        msgnextloc("\\E9* Um..^1. instead of looking over there.../", "obj_readable_room1_slash_Other_10_gml_3092_0");
        msgnextloc("\\EQ* How about seeing the \\cYspecial surprise\\cW in your rooms?/%", "obj_readable_room1_slash_Other_10_gml_3093_0");
    }
    else if (extflag == "ralsei_room_prompt")
    {
        if (i_ex(obj_ch4_PDC06A))
        {
            with (obj_ch4_PDC06A)
                con = 0;
        }
        skip = 1;
    }
    else if (extflag == "tv_closed")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It seems to be closed...)/%", "obj_readable_room1_slash_Other_10_gml_3101_0");
    }
}
if (room == room_dw_castle_town)
{
    if (extflag == "bakery_sign")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Mama Miba^1! Welcome to TOP Bakery!/", "obj_readable_room1_slash_Other_10_gml_2124_0");
        msgnextloc("* Our special chefs spin baked goods at the TOP of their class!/%", "obj_readable_room1_slash_Other_10_gml_2125_0");
    }
    if (extflag == "closed_shop")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The Music Shop is closed^1! Everyone's busy this time!)/%", "obj_readable_room1_slash_Other_10_gml_3120_0");
    }
    if (extflag == "closed_tv")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Seems that the building isn't ready to open yet...)/", "obj_readable_room1_slash_Other_10_gml_3126_0");
        msgnextloc("* (Maybe there wasn't enough staff.)/%", "obj_readable_room1_slash_Other_10_gml_3127_0");
    }
}
if (room == room_dw_castle_restaurant)
{
    if (x > 200 && x < 300)
    {
        myinteract = 0;
        with (obj_npc_room)
        {
            if (sprite_index == spr_lancer_lt_mustache)
                event_user(0);
        }
        exit;
    }
    if (x > 300 && x < 400)
    {
        myinteract = 0;
        with (obj_npc_hammerguy)
            event_user(0);
        exit;
    }
}
if (room == room_dw_castle_east_door)
{
    if (sprite_index == spr_tasque_idle_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Seems like it's gone stray without its master...)/%", "obj_readable_room1_slash_Other_10_gml_2160_0");
    }
    if (sprite_index == spr_maus_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Squeak...)/%", "obj_readable_room1_slash_Other_10_gml_2165_0");
    }
    if (sprite_index == spr_npc_poppup)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* TANJOUBY.../%", "obj_readable_room1_slash_Other_10_gml_2170_0");
    }
    if (sprite_index == spr_traffic_car_side_legs_small_left)
    {
        skip = 1;
        snd_play(snd_smallcar_yelp);
    }
}
if (room == room_dw_castle_dojo)
{
    scr_speaker("no_name");
    global.msg[0] = stringsetloc("* (It's a bed for three people^1, or one three-headed person.)/%", "obj_readable_room1_slash_Other_10_gml_2177_0");
}
if (room == room_lw_computer_lab)
{
    if (x > 40 && x < 60 && y > 40 && y < 50)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The closet is spacious and full of old electronics.)/", "obj_readable_room1_slash_Other_10_gml_2318_0");
        msgnextloc("* (A large person could easily fit inside.)/%", "obj_readable_room1_slash_Other_10_gml_2319_0");
    }
    if (x > 150 && x < 170 && y > 115 && y < 130)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like the library's state-of-the-art public laptop.)/", "obj_readable_room1_slash_Other_10_gml_2326_0");
        msgnextloc("* (Someone left it on.)/%", "obj_readable_room1_slash_Other_10_gml_2327_0");
    }
    if (x > 220 && x < 250 && y > 40 && y < 50)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's full of many backup devices^1, like extra mice^1, extra keyboards^1, or extra maracas.)/%", "obj_readable_room1_slash_Other_10_gml_2334_0");
    }
    if (x > 70 && x < 95 && y > 90 && y < 150)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a computer. The monitor is flickering brightly.)/%", "obj_readable_room1_slash_Other_10_gml_2341_0");
    }
    if (x > 220 && x < 240 && y > 100 && y < 110)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_2348_0");
        msgnextloc("* (A dolphin screensaver is advertising some kind of malware.)/%", "obj_readable_room1_slash_Other_10_gml_2349_0");
    }
    if (x > 220 && x < 240 && y > 120 && y < 140)
    {
        if (global.flag[309] < 9)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_2360_0");
            msgnextloc("* (Someone tried to check their email^1, but the Internet is down.)/%", "obj_readable_room1_slash_Other_10_gml_2361_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_2366_0");
            msgnextloc("* (... It's nothing but a blue screen. Looks like it crashed.)/%", "obj_readable_room1_slash_Other_10_gml_2367_0");
        }
    }
    if (x > 120 && x < 140 && y > 25 && y < 40)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Various posters talking about Internet safety.)/%", "obj_readable_room1_slash_Other_10_gml_2377_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You suddenly thought about how your day might have been different...)/", "obj_readable_room1_slash_Other_10_gml_2381_0");
            msgnextloc("* (..^1. If the poster with that orange cat was still on the wall.)/%", "obj_readable_room1_slash_Other_10_gml_2382_0");
        }
    }
    if (x > 30 && x < 40 && y > 170 && x < 190)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a trashcan. You get the feeling it doesn't have any friends.)/", "obj_readable_room1_slash_Other_10_gml_2390_0");
        msgnextloc("* (It's hard to explain why you feel this way about a trashcan.)/%", "obj_readable_room1_slash_Other_10_gml_2391_0");
    }
    if (x > 230 && x < 250 && y > 170 && y < 190)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a recycling bin.)/", "obj_readable_room1_slash_Other_10_gml_2398_0");
        msgnextloc("* (Looks like someone accidentally printed off a lot of useless emails.)/%", "obj_readable_room1_slash_Other_10_gml_2399_0");
    }
}
if (room == room_dw_castle_cafe)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (The jukebox is broken.)&* (Feels like you might never find a working one...)/%", "obj_readable_room1_slash_Other_10_gml_2897_0");
}
if (room == room_dw_castle_rooms_ralsei)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (The curtains are fluttering.)/%", "obj_readable_room1_slash_Other_10_gml_3288_0");
    if (!i_ex(obj_ch4_PDC06B))
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Ralsei said he had no hobbies^1, but he at least likes Window.)/%", "obj_readable_room1_slash_Other_10_gml_3293_0");
    }
}
if (room == room_lw_church_main)
{
    if (extflag == "susie")
    {
        if (scr_flag_get(1619) == 0)
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E7* Hey Kris^1, I'LL get to the bottom of this juice./", "obj_readable_room1_slash_Other_10_gml_3306_0");
                msgnextloc("\\E2* YOU get to the bottom of the cluice./", "obj_readable_room1_slash_Other_10_gml_3307_0");
                msgnextloc("\\EK* Clues. Whatever./%", "obj_readable_room1_slash_Other_10_gml_3308_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E2* The longer you trip^1, the more I'm gonna sip./%", "obj_readable_room1_slash_Other_10_gml_3312_0");
            }
        }
        else if (scr_flag_get(1619) == 1)
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E2* Hey^1, you got something?/", "obj_readable_room1_slash_Other_10_gml_3319_0");
                msgnextloc("\\E0* ..^1. What^1, you wanna figure more out before you spill it?/", "obj_readable_room1_slash_Other_10_gml_3320_0");
                if (scr_flag_get(1620) == 1 || scr_flag_get(1657) == 1)
                {
                    msgnextloc("\\EL* Damn^1, if only Ralsei was there to solve it for you./", "obj_readable_room1_slash_Other_10_gml_3325_0");
                    msgnextloc("\\E2* Too bad there's a shortage of \\cYglasses nerds\\cW in here./%", "obj_readable_room1_slash_Other_10_gml_3326_0");
                }
                if (scr_flag_get(1621) == 1)
                {
                    msgnextloc("\\EN* Man^1, too bad Noelle can't help us.../", "obj_readable_room1_slash_Other_10_gml_3331_0");
                    msgnextloc("\\E9* ..^1. She'd probably figure this out in no time./%", "obj_readable_room1_slash_Other_10_gml_3332_0");
                }
            }
            else
            {
                if (scr_flag_get(1620) == 1 || scr_flag_get(1657) == 1)
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EA* Damn^1, if only Ralsei was there to solve it for you./", "obj_readable_room1_slash_Other_10_gml_3339_0");
                    msgnextloc("\\E2* Too bad there's a shortage of \\cYglasses nerds\\cW in here./%", "obj_readable_room1_slash_Other_10_gml_3340_0");
                }
                if (scr_flag_get(1621) == 1)
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EN* Man^1, too bad Noelle can't help us.../", "obj_readable_room1_slash_Other_10_gml_3346_0");
                    msgnextloc("\\E9* ..^1. She'd probably figure this out in no time./%", "obj_readable_room1_slash_Other_10_gml_3347_0");
                }
            }
        }
        else
        {
            global.msc = 1268;
            scr_text(global.msc);
        }
    }
    if (extflag == "punch")
    {
        if (scr_flag_get(719) > 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Juice. There's no reason to get more.)/%", "obj_readable_room1_slash_Other_10_gml_3362_0");
        }
        else
        {
            global.msc = 1323;
            scr_text(global.msc);
        }
    }
    if (extflag == "noelle")
    {
        with (obj_ch4_PDC03A_rudy_toriel)
            con = 60;
        skip = 1;
    }
    if (extflag == "organ")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (A giant organ.)/", "obj_readable_room1_slash_Other_10_gml_3379_0");
        msgnextloc("* (..^1. There hasn't been a reason to play this in a while.)/%", "obj_readable_room1_slash_Other_10_gml_3380_0");
        if (global.plot >= 290)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The organ.)/", "obj_readable_room1_slash_Other_10_gml_3385_0");
            msgnextloc("* (..^1. No reason to play it now.)/%", "obj_readable_room1_slash_Other_10_gml_3386_0");
        }
    }
    if (extflag == "door_top")
    {
        global.msc = 1449;
        scr_text(global.msc);
    }
}
if (room == room_lw_noellehouse_main)
{
    if (x > 510 && x < 530 && y < 130)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a heart or human-soul shaped pillow^1, depending on your opinion.)/%", "obj_readable_room1_slash_Other_10_gml_3403_0");
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                scr_speaker("noelle");
                msgsetloc(0, "\\E4* My mom just..^1. collects heart pillows for some reason./", "obj_readable_room1_slash_Other_10_gml_3410_0");
                msgnextloc("\\EH* (When Kris was little^1, they'd take one of these...)/", "obj_readable_room1_slash_Other_10_gml_3411_0");
                msgnextloc("\\EI* (Then pretend to \"rip out their heart\" and chase me.)/%", "obj_readable_room1_slash_Other_10_gml_3412_0");
            }
            else
            {
                scr_speaker("noelle");
                msgsetloc(0, "\\E3* My mom just loves red heart-shaped objects?/%", "obj_readable_room1_slash_Other_10_gml_3416_0");
            }
        }
    }
    if (x > 580 && x < 600 && y < 140)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_3425_0");
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* (click...) Yep..^1. It's locked^1, all right./", "obj_readable_room1_slash_Other_10_gml_3432_0");
                msgnextloc("\\E1* Noelle^1, you give it a shot./", "obj_readable_room1_slash_Other_10_gml_3433_0");
                scr_anyface_next("noelle", 18);
                msgnextloc("\\EI* Um^1, o-okay? (..^1. why are we trying to open my parents' room?)/%", "obj_readable_room1_slash_Other_10_gml_3435_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (You and Susie continue to try to open the locked door in front of Noelle.)/%", "obj_readable_room1_slash_Other_10_gml_3439_0");
            }
        }
        if (global.plot >= 65)
            extflag = "door_blocked";
    }
    if (x > 370 && x < 390 && y < 330)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's Noelle's absurdly dangerous ninja weapon collection.)/%", "obj_readable_room1_slash_Other_10_gml_3453_0");
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EK* What's with the ninja shurakins?/", "obj_readable_room1_slash_Other_10_gml_3460_0");
                scr_anyface_next("noelle", 8);
                msgnextloc("\\E8* FAHAHA^1! Those are snowflakes^1, Susie!/", "obj_readable_room1_slash_Other_10_gml_3462_0");
                msgnextloc("\\E3* We made them from paper in Toriel's class a long time ago.../", "obj_readable_room1_slash_Other_10_gml_3463_0");
                scr_anyface_next("susie", 11);
                msgnextloc("\\EB* ..^1. then why are they metal?/", "obj_readable_room1_slash_Other_10_gml_3465_0");
                scr_anyface_next("noelle", 1);
                msgnextloc("\\E1* Oh./", "obj_readable_room1_slash_Other_10_gml_3467_0");
                msgnextloc("\\E0* My mom had them..^1. bronzed./%", "obj_readable_room1_slash_Other_10_gml_3468_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E2* Kris^1, where the hell are YOUR shurakins?/", "obj_readable_room1_slash_Other_10_gml_3472_0");
                scr_anyface_next("noelle", "8");
                msgnextloc("\\E8* Umm^1, Kris overcut their snowflake and it fell apart./", "obj_readable_room1_slash_Other_10_gml_3474_0");
                msgnextloc("\\E9* (I did make a new one for them^1, but...)/%", "obj_readable_room1_slash_Other_10_gml_3475_0");
            }
        }
    }
    if (x > 410 && x < 430 && y < 350)
    {
        var trig = false;
        with (obj_mainchara)
        {
            if (place_meeting(x, y, obj_doorAny))
                trig = true;
        }
        if (trig)
        {
            skip = 1;
            global.interact = meminteract;
            exit;
        }
        scr_speaker("no_name");
        msgsetloc(0, "* (It's Dess's room. Technically^1, you could just walk in.)/%", "obj_readable_room1_slash_Other_10_gml_3484_0");
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* Hey^1, what's in here? Looks^1, uh..^1. suspicious./", "obj_readable_room1_slash_Other_10_gml_3491_0");
                scr_anyface_next("noelle", 9);
                msgnextloc("\\E9* Umm^1, sorry..^1. guests aren't allowed in there./", "obj_readable_room1_slash_Other_10_gml_3493_0");
                scr_anyface_next("susie", 20);
                msgnextloc("\\EK* Cool^1, sounds^1, uh^1, suspicious./%", "obj_readable_room1_slash_Other_10_gml_3495_0");
            }
            else
            {
                scr_speaker("noelle");
                msgsetloc(0, "\\E9* (It's just my sister's room^1, but...)/%", "obj_readable_room1_slash_Other_10_gml_3499_0");
            }
        }
        if (global.plot >= 65)
            extflag = "door_blocked";
    }
    if (x > 640 && x < 660 && y < 350)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's the bathroom door.)/%", "obj_readable_room1_slash_Other_10_gml_3539_0");
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                var small_text = stringsetloc("(Dammit, Kris!)", "obj_readable_room1_slash_Other_10_gml_3547_0");
                scr_smallface(0, "susie", 5, 370, 224, small_text);
                scr_speaker("susie");
                msgsetloc(0, "\\E0* (Kris is staring super intense..^1. this room has gotta be it.)/", "obj_readable_room1_slash_Other_10_gml_3548_0");
                msgnextloc("\\E1* Sorry Noelle^1, but we gotta go in here.../", "obj_readable_room1_slash_Other_10_gml_3549_0");
                scr_anyface_next("noelle", 11);
                msgnextloc("\\EB* To..^1. to the bathroom?\\f0/%", "obj_readable_room1_slash_Other_10_gml_3551_0");
            }
        }
        if (global.plot >= 65)
            extflag = "door_blocked";
    }
    if (x > 420 && x < 450 && y >= 440 && y < 500)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a thermostat. The only option is cold.)/%", "obj_readable_room1_slash_Other_10_gml_3565_0");
    }
    if (x > 150 && x < 170 && y > 440)
    {
        skip = 0;
        if (scr_havechar(2) && scr_flag_get(726) == 0)
        {
            with (obj_ch4_PDC09A)
                con = 0;
            skip = 1;
        }
        else
        {
            with (obj_homealone_dancing_santa)
            {
                if (x > 150 && x < 170 && y > 440)
                    alarm[0] = 1;
            }
            if (scr_havechar(2) && scr_flag_get(727) == 0)
            {
                scr_flag_set(727, 1);
                scr_speaker("noelle");
                msgsetloc(0, "\\EI* (There wouldn't be so many Santas with dead batteries...)/", "obj_readable_room1_slash_Other_10_gml_3592_0");
                msgnextloc("\\EH* (If Kris hadn't glued the cases shut trying to \"starve them\"...)/%", "obj_readable_room1_slash_Other_10_gml_3593_0");
            }
            else
            {
                skip = 1;
            }
        }
    }
    if (x > 200 && x < 210 && y > 460)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a fridge containing lots of greens and bottled water.)/%", "obj_readable_room1_slash_Other_10_gml_3606_0");
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EK* Why is there so much..^1. bottled^1, water in here?/", "obj_readable_room1_slash_Other_10_gml_3612_0");
                scr_anyface_next("noelle", 3);
                msgnextloc("\\E3* Umm^1, it's just..^1. convenient^1, you know?/", "obj_readable_room1_slash_Other_10_gml_3614_0");
                scr_anyface_next("susie", "2");
                msgnextloc("\\E2* (Wait until she learns about the free water from the sink)/%", "obj_readable_room1_slash_Other_10_gml_3616_0");
            }
            else
            {
                scr_speaker("noelle");
                msgsetloc(0, "\\E8* I usually bring an icy bottle with me to school^1, too!/", "obj_readable_room1_slash_Other_10_gml_3620_0");
                scr_anyface_next("susie", 11);
                msgnextloc("\\EB* Huh..^1. coulda swore I saw you using the bubbler after me before./", "obj_readable_room1_slash_Other_10_gml_3622_0");
                scr_anyface_next("noelle", "M");
                msgnextloc("\\EM* FAHA^1, yeah^1, must've been extra thirsty^1, that day^1! Phew!/%", "obj_readable_room1_slash_Other_10_gml_3624_0");
            }
        }
    }
    if (x > 450 && x < 470 && y > 570)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a squishy sounding assortment of snacks.)/%", "obj_readable_room1_slash_Other_10_gml_3633_0");
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                var small_text_a = stringsetloc("(Why, Noelle. Why did you slice the cheese into hearts?)", "obj_readable_room1_slash_Other_10_gml_3642_0");
                var small_text_b = stringsetloc("(I don't remember if you eat the wooden stick things)", "obj_readable_room1_slash_Other_10_gml_3643_0_b");
                var l1 = 
                {
                    x: 120,
                    y: 165
                };
                var l2 = 
                {
                    x: 120,
                    y: 235
                };
                scr_smallface(0, "noelle", 18, l1.x, l1.y, small_text_a);
                scr_smallface(1, "susie", 11, l2.x, l2.y, small_text_b);
                scr_speaker("noelle");
                msgsetloc(0, "\\E3* So^1, um^1, this is the snack tray.../", "obj_readable_room1_slash_Other_10_gml_3643_0");
                scr_anyface_next("susie", "6");
                msgnextloc("\\E6* .../", "obj_readable_room1_slash_Other_10_gml_3645_0");
                scr_anyface_next("noelle", "8");
                msgnextloc("\\E8* .../", "obj_readable_room1_slash_Other_10_gml_3647_0");
                scr_anyface_next("no_name", 0);
                msgnextloc("\\f0\\f1/%", "obj_readable_room1_slash_Other_10_gml_3649_0");
            }
        }
    }
    if (x > 500 && x < 550 && y > 460)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The auto-treat-catcher is ready to nab anything in range.)/%", "obj_readable_room1_slash_Other_10_gml_3660_0");
        if (scr_havechar(2))
        {
            if (scr_flag_get(782) == 0)
            {
                scr_flag_set(782, 1);
                with (obj_ch4_PDC09A)
                    con = 20;
                skip = 1;
            }
            else
            {
                scr_speaker("noelle");
                msgsetloc(0, "\\E8* This one..^1. was my dad's idea./%", "obj_readable_room1_slash_Other_10_gml_3673_0");
            }
        }
    }
    if (x > 710 && y >= 450 && y < 500)
    {
        if (scr_havechar(2) && scr_flag_get(726) == 0)
        {
            with (obj_ch4_PDC09A)
                con = 0;
            skip = 1;
        }
        else
        {
            with (obj_homealone_dancing_santa)
            {
                if (x > 710 && y >= 450)
                    alarm[0] = 1;
            }
            skip = 1;
        }
    }
    if (x >= 100 && x < 120 && y >= 450)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The house's back door. No need to leave.)/%", "obj_readable_room1_slash_Other_10_gml_3704_0");
        if (global.plot >= 65)
            extflag = "door_blocked";
    }
    if (x >= 460 && x < 480 && y >= 310)
    {
        if (scr_havechar(2) && scr_flag_get(726) == 0)
        {
            with (obj_ch4_PDC09A)
                con = 0;
            skip = 1;
        }
        else
        {
            with (obj_homealone_dancing_santa)
            {
                if (x > 460 && x < 480 && y > 300)
                    alarm[0] = 1;
            }
            skip = 1;
        }
    }
    if (extflag == "door_blocked")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (No reason to enter.)/%", "obj_readable_room1_slash_Other_10_gml_3734_0");
    }
    if (x >= 570 && x < 590 && y >= 300 && y <= 330)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a tree that would potentially fall down if you climbed it.)/%", "obj_readable_room1_slash_Other_10_gml_3741_0");
    }
}
if (room == room_lw_noellehouse_noelle)
{
    if (extflag == "computer")
    {
        var wallpaper = [stringsetloc("Noelle's family in the snow.", "obj_readable_room1_slash_Other_10_gml_3773_0"), stringsetloc("Noelle's family looking festive.", "obj_readable_room1_slash_Other_10_gml_3774_0"), stringsetloc("Noelle's family edited to be elves.", "obj_readable_room1_slash_Other_10_gml_3775_0"), stringsetloc("a motion-blurred photo of you as a kid.", "obj_readable_room1_slash_Other_10_gml_3776_0"), stringsetloc("Dess holding a cracked baseball bat.", "obj_readable_room1_slash_Other_10_gml_3777_0"), stringsetloc("a picture of a far-off, snowy city.", "obj_readable_room1_slash_Other_10_gml_3778_0"), stringsetloc("Noelle and Dess at the pageant as kids.", "obj_readable_room1_slash_Other_10_gml_3779_0"), stringsetloc("some green dog puppet thing.", "obj_readable_room1_slash_Other_10_gml_3780_0")];
        var wallpaper_index = floor(random_range(0, array_length_1d(wallpaper)));
        scr_speaker("no_name");
        msgsetloc(0, "* (It's Noelle's computer. The cycling wallpaper is...)/", "obj_readable_room1_slash_Other_10_gml_3786_0");
        msgnextsubloc("* (..^1. ~1)/%", wallpaper[wallpaper_index], "obj_readable_room1_slash_Other_10_gml_3787_0");
        if (scr_havechar(2))
        {
            global.msc = 1331;
            scr_text(global.msc);
        }
    }
    if (extflag == "bed")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's Noelle's bed. There's ample space to hide underneath.)/%", "obj_readable_room1_slash_Other_10_gml_3800_0");
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's Noelle's bed. Under it is a metal CD with a photo of Noelle in dark makeup.)/", "obj_readable_room1_slash_Other_10_gml_3807_0");
                scr_anyface_next("susie", 6);
                msgnextloc("\\E6* Woah^1, what the hell is this?/", "obj_readable_room1_slash_Other_10_gml_3809_0");
                scr_anyface_next("noelle", 3);
                msgnextloc("\\E3* UMM..^1. Catti^1, wanted a custom cover for her mix CD^1, so.../", "obj_readable_room1_slash_Other_10_gml_3811_0");
                scr_anyface_next("susie", "M");
                msgnextloc("\\EM* ..^1. it's cool. You should^1, uh..^1. do this look..^1. more./", "obj_readable_room1_slash_Other_10_gml_3813_0");
                scr_anyface_next("noelle", 8);
                msgnextloc("\\E8* Faha^1, if you can get my mom to let me go grimdark?/%", "obj_readable_room1_slash_Other_10_gml_3815_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's Noelle's bed. Under it is a rock CD with a photo of Noelle in dark makeup.)/%", "obj_readable_room1_slash_Other_10_gml_3819_0");
            }
        }
    }
    if (extflag == "couch")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a couch^1, for watching the TV.)/%", "obj_readable_room1_slash_Other_10_gml_3828_0");
    }
    if (extflag == "tv")
    {
        var sentence_end = (scr_havechar(2) && read == 0) ? "/" : "/%";
        scr_speaker("no_name");
        msgsetsubloc(0, "* (It's a state of the art high-definition TV with old game consoles under it.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_3836_0");
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                scr_anyface_next("susie", "6");
                msgnextloc("\\E6* Why do you..^1. have a flatscreen in here?/", "obj_readable_room1_slash_Other_10_gml_3843_0");
                scr_anyface_next("noelle", 8);
                msgnextloc("\\E8* Oh^1! Umm^1, yeah^1, Berdly keeps saying I should get a CRT. Faha!/%", "obj_readable_room1_slash_Other_10_gml_3845_0");
            }
        }
    }
    if (extflag == "plant")
    {
        var sentence_end = (scr_havechar(2) && scr_flag_get(730) == 0) ? "/" : "/%";
        scr_speaker("no_name");
        msgsetsubloc(0, "* (It's a Christmas cactus.)&* (You remember it's named 'Krismas.')~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_3855_0");
        if (scr_flag_get(730) == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a cactus that apparently got poorly renamed at some point.)/%", "obj_readable_room1_slash_Other_10_gml_3860_0");
        }
        if (scr_havechar(2) && scr_flag_get(730) == 0)
        {
            scr_flag_set(730, 1);
            scr_anyface_next("noelle", 4);
            msgnextloc("\\E4* Umm^1, this cactus? Berdly calls it \"Tsuntsun...\"/%", "obj_readable_room1_slash_Other_10_gml_3868_0");
        }
    }
    if (extflag == "desk")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's Noelle's homework desk.)/%", "obj_readable_room1_slash_Other_10_gml_3876_0");
        if (scr_flag_get(733) == 0)
        {
            scr_litemget(15);
            scr_itemget_anytype(50, "weapon");
            snd_play(snd_item);
            if (noroom == 0)
            {
                scr_flag_set(733, 1);
                scr_speaker("no_name");
                msgsetloc(0, "* (It's Noelle's homework desk. You took a pencil out of habit.)/%", "obj_readable_room1_slash_Other_10_gml_3889_0");
            }
        }
    }
    if (extflag == "closet")
    {
        if (read == 0)
        {
            var sentence_end = (scr_havechar(2) && read == 0) ? "/" : "/%";
            scr_speaker("no_name");
            msgsetsubloc(0, "* (A great hiding place^1, although it smells like detergent and deer.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_3901_0");
            if (scr_havechar(2) && read == 0)
            {
                scr_anyface_next("susie", 20);
                msgnextloc("\\EK* ..^1. what are these little^1, uh^1, wings in here?/", "obj_readable_room1_slash_Other_10_gml_3906_0");
                scr_anyface_next("noelle", 4);
                msgnextloc("\\E4* Um^1, oh^1, haha^1, those? I've had those since I was a little kid.../", "obj_readable_room1_slash_Other_10_gml_3908_0");
                msgnextloc("\\E3* They're from when I was the angel in the Holiday Pageant./", "obj_readable_room1_slash_Other_10_gml_3909_0");
                msgnextloc("\\E9* ..^1. But I liked them so much^1, I just..^1. kept wearing them./%", "obj_readable_room1_slash_Other_10_gml_3910_0");
            }
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (A clothes wardrobe. A pair of small angel wings are inside..^1. worn out and tattered.)/%", "obj_readable_room1_slash_Other_10_gml_3915_0");
        }
    }
}
if (room == room_lw_noellehouse_kitchen)
{
    if (x > 100 && x < 115)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The fridge is packed with festive foods.)&* (..^1. and a jar of pickles.)/%", "obj_readable_room1_slash_Other_10_gml_3926_0");
    }
    if (x > 140 && x < 150)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The sink is sparkling clean.)/%", "obj_readable_room1_slash_Other_10_gml_3933_0");
    }
    if (x > 180 && x < 190)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (New stovetop^1, ancient katana.)/%", "obj_readable_room1_slash_Other_10_gml_3940_0");
        if (scr_havechar(2) && read == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EK* ..^1. Anyone gonna say anything about the giant sword?/", "obj_readable_room1_slash_Other_10_gml_3945_0");
            scr_anyface_next("noelle", 4);
            msgnextloc("\\E4* Oh^1, it's just my mom's katana./", "obj_readable_room1_slash_Other_10_gml_3947_0");
            msgnextloc("\\E8* Normal knives aren't enough for dad's fruitcake^1! Faha!/%", "obj_readable_room1_slash_Other_10_gml_3948_0");
        }
    }
    if (x > 220 && x < 230)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (In the cupboard are..^1. cutters for gingerbread monsters.)/%", "obj_readable_room1_slash_Other_10_gml_3956_0");
    }
    if (x > 550 && x < 570 && y > 160)
    {
        if (scr_havechar(2))
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E7* Woah^1, you play piano?/", "obj_readable_room1_slash_Other_10_gml_3967_0");
                scr_anyface_next("noelle", "9");
                msgnextloc("\\E9* Umm^1, no. We..^1. just kind of^1, um^1, have one. Faha./%", "obj_readable_room1_slash_Other_10_gml_3969_0");
            }
            else
            {
                scr_speaker("noelle");
                msgsetloc(0, "\\E9* No one really..^1. plays it anymore./%", "obj_readable_room1_slash_Other_10_gml_3973_0");
            }
        }
        else
        {
            global.msc = 1333;
            scr_text(global.msc);
        }
    }
    if (x > 530 && x < 540 && y < 110)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a highly climbable looking tree.)/%", "obj_readable_room1_slash_Other_10_gml_3986_0");
    }
}
if (room == room_lw_noellehouse_dess)
{
    if (x > 30 && x < 40 && y < 120)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's Dess's bed. Underneath are army rations^1, guitar picks^1, paintball gear^1, ice skates...)/", "obj_readable_room1_slash_Other_10_gml_3996_0");
        msgnextloc("* (..^1. and a badly traced drawing of a dragon.)/%", "obj_readable_room1_slash_Other_10_gml_3997_0");
    }
    if (x > 240 && x < 280 && y > 130 && y < 150)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Rollerblades^1, wiffle bat. Looking at these things makes your head hurt./%", "obj_readable_room1_slash_Other_10_gml_4011_0");
    }
    if (x > 240 && x < 280 && y > 160 && y < 170)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* A violin^1, a flute^1, a microphone.../", "obj_readable_room1_slash_Other_10_gml_4018_0");
        msgnextloc("* They all look very expensive^1, and very dented./%", "obj_readable_room1_slash_Other_10_gml_4019_0");
    }
    if (x > 110 && x < 120 && y < 90)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's an oversized walk-in closet.)/", "obj_readable_room1_slash_Other_10_gml_4028_0");
            msgnextloc("* (It's covered in band posters^1, and some handmade posters...)/", "obj_readable_room1_slash_Other_10_gml_4029_0");
            msgnextloc("* (..^1. for shows that may or may not have ever happened.)/%", "obj_readable_room1_slash_Other_10_gml_4030_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's an excessively large walk-in closet.)/%", "obj_readable_room1_slash_Other_10_gml_4034_0");
        }
    }
    if (x > 20 && x < 30 && y < 180)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a shelf. In the front are all the holiday-themed games and movies...)/", "obj_readable_room1_slash_Other_10_gml_4042_0");
        msgnextloc("* (..^1. and at the back are all the scary games you never got to play.)/%", "obj_readable_room1_slash_Other_10_gml_4043_0");
    }
    if (x > 170 && x < 180 && y > 200)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a CD player. Underneath are tons of punk rock CDs..^1. and one still-sealed ska CD.)/%", "obj_readable_room1_slash_Other_10_gml_4050_0");
    }
    if (x > 230 && x < 240 && y > 200)
    {
        global.msc = 1431;
        scr_text(global.msc);
    }
    if (x > 50 && x < 60 && y > 190)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a computer. The monitor is unplugged.)/%", "obj_readable_room1_slash_Other_10_gml_4064_0");
    }
    if (extflag == "hockey_puck")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a hockey puck. Looks like it would hurt.)/%", "obj_readable_room1_slash_Other_10_gml_4070_0");
    }
}
if (room == room_town_church)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (The door is locked..^1. no one is inside.)/%", "obj_readable_room1_slash_Other_10_gml_4077_0");
    if (extflag == "locked_church_door")
    {
        scr_speaker("susie");
        msgsetloc(0, "\\EC* (Dude^1, that's the last place we should go right now.)/%", "obj_readable_room1_slash_Other_10_gml_4082_0");
    }
    if (extflag == "church_door_night")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* No reason to go back in there./%", "obj_readable_room1_slash_Other_10_gml_4088_0");
    }
    if (y >= 340)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (These clothes hold no power over you any more.)/%", "obj_readable_room1_slash_Other_10_gml_4095_0");
        if (x >= 350)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Your church clothes have returned to the earth.)/%", "obj_readable_room1_slash_Other_10_gml_4100_0");
        }
    }
    if (x >= 470 && x < 480)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Flowers in a trashcan. Nothing unusual.)/%", "obj_readable_room1_slash_Other_10_gml_4107_0");
    }
}
if (room == room_lw_noellehouse_closet)
{
    var presents_checked = scr_flag_get(1627);
    var presents_convo = presents_checked == 3 && scr_havechar("susie") && scr_havechar("noelle");
    scr_flag_set(1627, presents_checked + 1);
    var sentence_end = presents_convo ? "/" : "/%";
    scr_speaker("no_name");
    msgsetsubloc(0, "* (It's an empty gift box.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_4120_0");
    if (presents_convo)
    {
        var small_text_a = stringsetloc("Huh? ... reference?", "obj_readable_room1_slash_Other_10_gml_4129_0");
        var small_text_b = stringsetloc("(I'll stop talking now.)", "obj_readable_room1_slash_Other_10_gml_4130_0_b");
        var l1 = 
        {
            x: 120,
            y: 165
        };
        var l2 = 
        {
            x: 120,
            y: 225
        };
        scr_smallface(0, "susie", 6, l1.x, l1.y, small_text_a);
        scr_smallface(1, "noelle", 9, l2.x, l2.y, small_text_b);
        scr_anyface_next("noelle", "2");
        msgnextloc("\\E2* Umm^1, Kris? Do you need to check^1, all of these?/", "obj_readable_room1_slash_Other_10_gml_4128_0");
        scr_anyface_next("susie", "0");
        msgnextloc("\\E0* I mean..^1. gotta admit this room is kinda sus./", "obj_readable_room1_slash_Other_10_gml_4130_0");
        msgnextloc("\\EB* ..^1. especially that vent./", "obj_readable_room1_slash_Other_10_gml_4131_0");
        scr_anyface_next("noelle", "4");
        msgnextloc("\\E4* Haha^1, nice reference^1, Susie!/", "obj_readable_room1_slash_Other_10_gml_4133_0");
        scr_anyface_next("no_name", 0);
        msgnextloc("\\f0\\f1/%", "obj_readable_room1_slash_Other_10_gml_4135_0");
    }
}
if (room == room_dw_castle_rooms_queen)
{
    if ((x >= 170 && x < 180) || (x >= 380 && x < 400))
    {
        var times_interacted = read;
        if (i_ex(obj_room_castle_queen))
        {
            times_interacted = obj_room_castle_queen.speaker_interact;
            with (obj_room_castle_queen)
                speaker_interact++;
        }
        if (times_interacted == 0)
        {
            var small_text = stringsetloc("I Made It", "obj_readable_room1_slash_Other_10_gml_4159_0");
            var xloc = 430;
            if (global.lang == "ja")
                xloc = 370;
            scr_smallface(0, "queen", 12, xloc, 75, small_text);
            scr_speaker("queen");
            msgsetloc(0, "\\E8* Wow This Tune Is Bangin' Who Made It\\f0/%", "obj_readable_room1_slash_Other_10_gml_4154_0");
        }
        else
        {
            var small_text_a = stringsetloc("Audiophiles?", "obj_readable_room1_slash_Other_10_gml_4165_0");
            var small_text_b = stringsetloc("Audio Files", "obj_readable_room1_slash_Other_10_gml_4166_0");
            var xbuff = 0;
            if (global.lang == "ja")
                xbuff = -40;
            scr_smallface(0, "ralsei", 21, 250 + xbuff, 65, small_text_a);
            scr_smallface(1, "queen", 1, 430 + xbuff, 75, small_text_b);
            scr_speaker("queen");
            msgsetloc(0, "\\EQ* State Of The Art 32kbps Bitrate For Audio Files\\f0\\f1/%", "obj_readable_room1_slash_Other_10_gml_4160_0");
        }
    }
    if (x >= 260 && x < 270)
    {
        if (scr_flag_get(791) == 0)
        {
            scr_flag_set(791, 1);
            if (i_ex(obj_room_castle_queen))
            {
                with (obj_room_castle_queen)
                    queen_drink_convo = true;
                skip = 1;
            }
        }
        else
        {
            var small_text = stringsetloc("Your Free", "obj_readable_room1_slash_Other_10_gml_4189_0");
            var loc = 400;
            if (global.lang == "ja")
                loc = 380;
            scr_smallface(0, "queen", 1, loc, 75, small_text);
            scr_speaker("queen");
            msgsetloc(0, "\\E9* And Look On The Right Check That Out/", "obj_readable_room1_slash_Other_10_gml_4182_0");
            msgnextloc("\\ED* I Built A New City With The Free Space I Found In: The Wall/", "obj_readable_room1_slash_Other_10_gml_4183_0");
            scr_anyface_next("ralsei", "X");
            msgnextloc("\\EX* Umm^1, it's not free?\\f0/%", "obj_readable_room1_slash_Other_10_gml_4185_0");
        }
    }
    if (x >= 640)
    {
        if (y >= 60 && y < 80)
        {
            snd_play(snd_noise);
            with (obj_room_castle_queen)
                car_pause_toggle = true;
            skip = 1;
        }
        if (y >= 150 && y < 170)
        {
            snd_play(snd_carhonk);
            scr_speaker("no_name");
            msgsetloc(0, "* (Looks like a touring band.)/", "obj_readable_room1_slash_Other_10_gml_4204_0");
            msgnextloc("* (..^1. They only do the touring part though.)/%", "obj_readable_room1_slash_Other_10_gml_4205_0");
        }
        if (y >= 200)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's keeping the streets clean.)/%", "obj_readable_room1_slash_Other_10_gml_4211_0");
        }
        if (y >= 260)
        {
            if (x < 800)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Looks like Head Hathy's trying computer dating...)/%", "obj_readable_room1_slash_Other_10_gml_4219_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Looks like Werewerewire's trying computer dating...)/%", "obj_readable_room1_slash_Other_10_gml_4223_0");
            }
        }
    }
}
if (room == room_dw_castle_rooms_tenna)
{
    if (y >= 270)
    {
        if (scr_flag_get(779) < 2)
        {
            if (read == 0)
            {
                scr_speaker("rouxls");
                msgsetloc(0, "\\E0* (The TV guy shalth Notice my Brillianthce any day Nowe...)/", "obj_readable_room1_slash_Other_10_gml_4236_0");
                scr_anyface_next("tenna", 0);
                msgnextloc("* Gee^1, haha^1, what a stupid looking lamp^1, folks^1! Like the lamp itself is stupid!/", "obj_readable_room1_slash_Other_10_gml_4238_0");
                scr_anyface_next("rouxls", "0");
                msgnextloc("\\E0* (...)/", "obj_readable_room1_slash_Other_10_gml_4240_0");
                scr_anyface_next("tenna", 0);
                msgnextloc("* It also has a small ass./", "obj_readable_room1_slash_Other_10_gml_4242_0");
                scr_anyface_next("rouxls", 5);
                msgnextloc("\\E5* WHAT DID THOU SAYETH ABOUT MOI!?/%", "obj_readable_room1_slash_Other_10_gml_4244_0");
            }
            else
            {
                with (obj_room_castle_tenna)
                    lamp_on = true;
                scr_speaker("rouxls");
                msgsetloc(0, "\\E6* (Rouxls. Don't loseth it. Keepeth your Eyese on the Pryese.)/%", "obj_readable_room1_slash_Other_10_gml_4250_0");
            }
        }
        else
        {
            scr_speaker("rouxls");
            msgsetloc(0, "\\E5* (I'm sure-eth the TV Guy will return any day Nowe...)/", "obj_readable_room1_slash_Other_10_gml_4231_0");
            msgnextloc("\\E6* (And noticeth^1, my Brillianthce.)/%", "obj_readable_room1_slash_Other_10_gml_4232_0");
        }
    }
}
if (room == room_dw_church_bookcase)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (There's a suspicious book here^1, but it's a bit too high to reach.)/%", "obj_readable_room1_slash_Other_10_gml_4258_0");
    if (extflag == "door")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The door is locked with some mechanism.)/%", "obj_readable_room1_slash_Other_10_gml_4264_0");
        if (i_ex(obj_ch4_DCA05))
        {
            if (obj_ch4_DCA05.con == 3)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EC* Don't bother me^1, I'm figuring out this door thing./%", "obj_readable_room1_slash_Other_10_gml_4271_0");
            }
        }
    }
    if (extflag == "ralsei")
    {
        scr_speaker("ralsei");
        msgsetloc(0, "\\E8* (Phew..^1. should be okay until we reach the study...)/", "obj_readable_room1_slash_Other_10_gml_4280_0");
        msgnextloc("\\EU* H-huh? Sorry^1, Kris^1! Thanks for paying so much attention to me!/%", "obj_readable_room1_slash_Other_10_gml_4281_0");
        if (scr_flag_get(834) == 0)
        {
            global.msc = 1369;
            scr_text(global.msc);
        }
    }
}
if (room == room_dw_church_gersonstudy)
{
    if (extflag == "item_fountain")
    {
        if (scr_flag_get(1570) == 0)
        {
            scr_flag_set(1570, 1);
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a pool of water. ..^1. huh?)/", "obj_readable_room1_slash_Other_10_gml_4299_0");
            msgnextloc("* (A feather drifted into it..^1. and turned into coins!)/", "obj_readable_room1_slash_Other_10_gml_4300_0");
            msgnextloc("* (Throw something inside?)/%", "obj_readable_room1_slash_Other_10_gml_4301_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a pool of water. Throw something in?)/%", "obj_readable_room1_slash_Other_10_gml_4305_0");
        }
        with (obj_dw_gerson_study)
            fountain_active = true;
    }
    else if (extflag == "central_door")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The door is locked with some contraption.)/", "obj_readable_room1_slash_Other_10_gml_4312_0");
        scr_anyface_next("ralsei", "d");
        msgnextloc("\\Ed* I feel a dark presence past here.../", "obj_readable_room1_slash_Other_10_gml_4314_0");
        msgnextloc("\\EQ* ..^1. This must lead to the Fountain./%", "obj_readable_room1_slash_Other_10_gml_4315_0");
    }
    else if (extflag == "central_door_dog")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Sealed by a canine force.)/%", "obj_readable_room1_slash_Other_10_gml_4319_0");
    }
    else
    {
        if (extflag == "jackenstein")
        {
            with (obj_dw_gerson_study)
                jack_look = true;
            global.msc = 1407;
        }
        else if (extflag == "plaque")
        {
            global.msc = 1423;
            with (obj_dw_gerson_study)
                hide_sparkle();
        }
        else if (extflag == "gerson_shop")
        {
            global.msc = 1451;
        }
        scr_text(global.msc);
    }
}
if (room == room_dw_church_jackenstein)
{
    if (extflag == "jack_heal")
    {
        skip = 1;
        with (obj_ch4_DCA08D)
            ralsei_heal = true;
    }
}
if (room == room_dw_church_glass)
{
    if (extflag == "glass")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The glass is broken.)/%", "obj_readable_room1_slash_Other_10_gml_4355_0");
    }
}
if (room == room_lw_church_entrance)
{
    if (extflag == "church_door")
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E0* The door's locked.../%", "obj_readable_room1_slash_Other_10_gml_4364_0");
        if (scr_flag_get(873) == 0)
        {
            scr_flag_set(873, 1);
            scr_speaker("susie");
            msgsetloc(0, "\\E0* Yeah^1, it's locked./", "obj_readable_room1_slash_Other_10_gml_4371_0");
            msgnextloc("\\EY* I guess we could just break some windows.../", "obj_readable_room1_slash_Other_10_gml_4372_0");
            msgnextloc("\\EZ* What? The parts between the stained glass are steel?/", "obj_readable_room1_slash_Other_10_gml_4373_0");
            msgnextloc("\\E0* ..^1. huh. Guess I'll trust you on that one./%", "obj_readable_room1_slash_Other_10_gml_4374_0");
        }
    }
    else if (extflag == "church_door_listen")
    {
        global.msc = 1391;
        scr_text(global.msc);
    }
    else if (extflag == "choir_room_door")
    {
        var sentence_end = (scr_flag_get(1535) == 0) ? "/" : "/%";
        scr_speaker("no_name");
        msgsetsubloc(0, "* (You hear various people rehearsing inside.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_4384_0");
        if (scr_flag_get(1535) == 0)
        {
            scr_flag_set(1535, 1);
            scr_anyface_next("susie", 20);
            msgnextloc("\\EK* Damn^1, we don't have to sing too^1, do we?/", "obj_readable_room1_slash_Other_10_gml_4392_0");
            msgnextloc("\\E0* When I was little^1, I remember being somewhere like this./", "obj_readable_room1_slash_Other_10_gml_4393_0");
            msgnextloc("\\E1* Got in trouble for \"yelling the wrong song\"./", "obj_readable_room1_slash_Other_10_gml_4394_0");
            msgnextloc("\\EC* Like^1, how am I supposed to know the melody the first time?/", "obj_readable_room1_slash_Other_10_gml_4395_0");
            msgnextloc("\\EB* Or where the song starts. Or ends. Or whatever./%", "obj_readable_room1_slash_Other_10_gml_4396_0");
        }
    }
    else if (extflag == "office_room_door")
    {
        var sentence_end = (scr_flag_get(1536) == 0) ? "/" : "/%";
        scr_speaker("no_name");
        msgsetsubloc(0, "* (It's the door to some sort of office.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_4403_0");
        if (scr_flag_get(1536) == 0)
        {
            scr_flag_set(1536, 1);
            scr_anyface_next("susie", 0);
            msgnextloc("\\E0* ..^1. hmm..^1. seems like a decent place for clues./", "obj_readable_room1_slash_Other_10_gml_4411_0");
            msgnextloc("\\E1* Let's not break in when your mom is around though./", "obj_readable_room1_slash_Other_10_gml_4412_0");
            msgnextloc("\\EC* She's probably got a sixth sense for you doing something wrong./%", "obj_readable_room1_slash_Other_10_gml_4413_0");
        }
    }
}
if (room == room_dw_churchc_final_prophecy)
{
    if (extflag == "ralsei")
    {
        with (obj_ch4_DCC03)
            progress_scene();
        skip = 1;
    }
    else if (extflag == "ralsei_okay")
    {
        scr_speaker("ralsei");
        msgsetloc(0, "\\EQ*  .../%", "obj_readable_room1_slash_Other_10_gml_4427_0");
    }
    else if (extflag == "final")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It seems the way is blocked.)/%", "obj_readable_room1_slash_Other_10_gml_4435_0");
        if (global.plot >= 270 && scr_flag_get(1634) == 0)
        {
            with (obj_ch4_DCC03)
                con = 48;
            skip = 1;
        }
    }
}
if (room == room_lw_church_entrance)
{
    if (extflag == "candles")
    {
        if (global.plot < 200)
        {
            var sentence_end = (scr_flag_get(1506) == 0) ? "/" : "/%";
            scr_speaker("no_name");
            msgsetsubloc(0, "* (It's an altar full of hope candles. Each one has a person's name on it.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_4454_0");
            if (scr_flag_get(1506) == 0)
            {
                scr_flag_set(1506, 1);
                msgnextloc("* (\"Asriel\"..^1. \"Asgore\"..^1. \"Kris\"..^1. your mother must have lit those ones.)/", "obj_readable_room1_slash_Other_10_gml_4459_0");
                msgnextloc("* (..^1. Susie pretended to blow out your candle.)/", "obj_readable_room1_slash_Other_10_gml_4460_0");
                scr_anyface_next("susie", "9");
                msgnextloc("\\E9* Happy birthday^1, loser./%", "obj_readable_room1_slash_Other_10_gml_4462_0");
            }
        }
        else if (scr_flag_get(1507) == 0)
        {
            skip = 1;
            with (obj_church_entrance)
                con = 5;
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Hope candles.)/%", "obj_readable_room1_slash_Other_10_gml_4473_0");
        }
    }
    else if (extflag == "extinguisher")
    {
        if (global.plot < 200)
        {
            var small_text = stringsetloc("They should make one of these\nthat shoots whip cream", "obj_readable_room1_slash_Other_10_gml_4491_0");
            var l1 = 
            {
                x: 320,
                y: 240
            };
            scr_smallface(0, "susie", 2, l1.x, l1.y, small_text);
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a fire extinguisher.)&* (For some reason you have the feeling...)/", "obj_readable_room1_slash_Other_10_gml_4483_0");
            msgnextloc("* (..^1. Susie will say something stupid about it.)\\f0/%", "obj_readable_room1_slash_Other_10_gml_4484_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a fire extinguisher.)/", "obj_readable_room1_slash_Other_10_gml_4488_0");
            scr_anyface_next("susie", 20);
            msgnextloc("\\EK* (Guess they use that to put out the candles?)/%", "obj_readable_room1_slash_Other_10_gml_4490_0");
        }
    }
    else if (extflag == "holy_water")
    {
        if (global.plot < 200)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EL* Kris^1, go get jugs. We're keeping this./", "obj_readable_room1_slash_Other_10_gml_4497_0");
            msgnextloc("\\E6* ..^1. actually^1, stop. There's a motion sensor to stop free drinks./", "obj_readable_room1_slash_Other_10_gml_4498_0");
            msgnextloc("\\EK* Damn. Well^1, at least we got the FREE milk./%", "obj_readable_room1_slash_Other_10_gml_4499_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a bowl of blessed water with a motion sensor to stop cats from drinking it.)/", "obj_readable_room1_slash_Other_10_gml_4503_0");
            msgnextloc("* (It's not clear what happens if you touch the sensor.)/%", "obj_readable_room1_slash_Other_10_gml_4504_0");
        }
    }
    else if (extflag == "bookshelf")
    {
        if (global.plot < 200)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a bookshelf full of hymnals and scripture.)/", "obj_readable_room1_slash_Other_10_gml_4511_0");
            msgnextloc("* (..^1. and some copies of Lord of the Hammer.)/%", "obj_readable_room1_slash_Other_10_gml_4512_0");
        }
        else if (scr_flag_get(1508) == 0)
        {
            scr_flag_set(1508, 1);
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a bookshelf full of hymnals and scripture.)/", "obj_readable_room1_slash_Other_10_gml_4520_0");
            msgnextloc("* (..^1. Huh? Inside one of the books is a letter...!)/", "obj_readable_room1_slash_Other_10_gml_4521_0");
            msgnextloc("* (...)&* (...)&* (It was the letter \"a\"!)/%", "obj_readable_room1_slash_Other_10_gml_4522_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Reading in the dark is bad for your eyes.)/%", "obj_readable_room1_slash_Other_10_gml_4526_0");
        }
    }
}
if (room == room_lw_church_office)
{
    if (extflag == "pitcher")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a large pitcher of water.)/", "obj_readable_room1_slash_Other_10_gml_4537_0");
        msgnextloc("* (Cups are stored below it.)/%", "obj_readable_room1_slash_Other_10_gml_4538_0");
    }
    else if (extflag == "drinks")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Juice^1, and wafer-like crackers.)/%", "obj_readable_room1_slash_Other_10_gml_4542_0");
    }
    else if (extflag == "cupboard")
    {
        var sentence_end = (scr_flag_get(1504) == 0) ? "/" : "/%";
        scr_speaker("no_name");
        msgsetsubloc(0, "* (Documents...)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_4548_0");
        if (scr_flag_get(1504) == 0)
        {
            scr_flag_set(1504, 1);
            scr_anyface_next("susie", "D");
            msgnextloc("\\ED* ..^1. guess the lock number could be in here.../", "obj_readable_room1_slash_Other_10_gml_4555_0");
            msgnextloc("\\E1* But^1, it'd take forever to search through./", "obj_readable_room1_slash_Other_10_gml_4556_0");
            msgnextloc("\\E0* ..^1. let's look somewhere else./%", "obj_readable_room1_slash_Other_10_gml_4557_0");
        }
    }
    else if (extflag == "books")
    {
        var sentence_end = (scr_flag_get(1505) == 0) ? "/" : "/%";
        scr_speaker("no_name");
        msgsetsubloc(0, "* (Books. Many copies of Lord of the Hammer..^1. and some unlabeled notebooks.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_4564_0");
        if (scr_flag_get(1505) == 0)
        {
            scr_flag_set(1505, 1);
            scr_anyface_next("susie", "D");
            msgnextloc("\\ED* It'd..^1. take a while to search through all this./%", "obj_readable_room1_slash_Other_10_gml_4571_0");
        }
    }
    else if (extflag == "susie_letter")
    {
        scr_speaker("susie");
        global.fe = 0;
        global.fc = 0;
        msgsetloc(0, "* \"Alvin/", "obj_readable_room1_slash_Other_10_gml_4578_0");
        msgnextloc("* Your old man was proud of you./", "obj_readable_room1_slash_Other_10_gml_4579_0");
        msgnextloc("* The reason he didnt come to church alot/", "obj_readable_room1_slash_Other_10_gml_4580_0");
        msgnextloc("* is beacause he wanted you to follow your dream./", "obj_readable_room1_slash_Other_10_gml_4581_0");
        msgnextloc("* Hes sorry he never said that right./", "obj_readable_room1_slash_Other_10_gml_4582_0");
        msgnextloc("* So write your own story's./", "obj_readable_room1_slash_Other_10_gml_4583_0");
        msgnextloc("* Its okay if even if there not perfect./", "obj_readable_room1_slash_Other_10_gml_4584_0");
        msgnextloc("* Sinserely a friend\"/%", "obj_readable_room1_slash_Other_10_gml_4585_0");
    }
    else if (extflag == "plaque")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a plaque bearing the words of a famous writer.)/", "obj_readable_room1_slash_Other_10_gml_4589_0");
        msgnextloc("* (\"Hope comes to those who believe. And for those that cannot...\")/", "obj_readable_room1_slash_Other_10_gml_4590_0");
        msgnextloc("* (\"..^1. May our hope shine so brightly...\")/", "obj_readable_room1_slash_Other_10_gml_4591_0");
        msgnextloc("* (\"..^1. That they^1, too^1, may keep shelter from the dark.\")/%", "obj_readable_room1_slash_Other_10_gml_4592_0");
    }
    else if (extflag == "hanging")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Seems to be some sort of incense container.)/%", "obj_readable_room1_slash_Other_10_gml_4596_0");
    }
    else if (extflag == "case")
    {
        if (scr_flag_get(1556) == 0)
        {
            scr_flag_set(1556, 1);
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a glass container..^1. you looked inside.)/", "obj_readable_room1_slash_Other_10_gml_4604_0");
            msgnextloc("* (It's a small metal hammer^1, and a photo of an old man..^1. both covered in dust.)/", "obj_readable_room1_slash_Other_10_gml_4605_0");
            scr_anyface_next("susie", 13);
            msgnextloc("\\ED* Kris^1, let's..^1. not look at it anymore./%", "obj_readable_room1_slash_Other_10_gml_4607_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a glass container.)/%", "obj_readable_room1_slash_Other_10_gml_4611_0");
        }
    }
}
if (room == room_lw_church_choir)
{
    if (extflag == "closet")
    {
        if (scr_flag_get(1510) == 0)
        {
            global.msc = 1399;
            scr_text(global.msc);
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E1* Jack is in there..^1. Guess we can get him tomorrow or something./%", "obj_readable_room1_slash_Other_10_gml_4627_0");
        }
    }
    else if (extflag == "wardrobe")
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The wardrobe is full of choir robes..^1. There's even one in your size.)/", "obj_readable_room1_slash_Other_10_gml_4634_0");
            scr_anyface_next("susie", 7);
            msgnextloc("\\E7* Damn^1, why don't we get to wear these?/", "obj_readable_room1_slash_Other_10_gml_4636_0");
            msgnextloc("\\EK* ..^1. What^1, I would have to sing or something?/", "obj_readable_room1_slash_Other_10_gml_4637_0");
            msgnextloc("\\E2* ..^1. Hey^1, why don't they just let me play the drums? Heheh./%", "obj_readable_room1_slash_Other_10_gml_4638_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a ward for robes.)/%", "obj_readable_room1_slash_Other_10_gml_4642_0");
        }
    }
    else if (extflag == "bells")
    {
        global.msc = 1401;
        scr_text(global.msc);
    }
    else if (extflag == "piano")
    {
        if (scr_flag_get(1511) == 0)
        {
            skip = 1;
            with (obj_room_church_choir)
                inspect_piano();
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EN* ..^1. yeah. I liked playing the drums./", "obj_readable_room1_slash_Other_10_gml_4657_0");
            msgnextloc("\\E2* Can't really screw it up^1, y'know? It's just hitting stuff./%", "obj_readable_room1_slash_Other_10_gml_4658_0");
        }
    }
}
if (room == room_town_krisyard)
{
    if (extflag == "locked_door")
    {
        if (scr_flag_get(1555) == 0)
        {
            scr_flag_set(1555, 1);
            scr_speaker("susie");
            msgsetloc(0, "\\E6* ..^1. huh?/", "obj_readable_room1_slash_Other_10_gml_4673_0");
            msgnextloc("\\E5* Hey^1, the door's locked!/", "obj_readable_room1_slash_Other_10_gml_4674_0");
            msgnextloc("\\EC* ..^1. seriously? Ugh^1, you don't have a key...?/", "obj_readable_room1_slash_Other_10_gml_4675_0");
            msgnextloc("\\EK* Damn^1, well^1, your mom's doing her choir practice^1, right?/", "obj_readable_room1_slash_Other_10_gml_4676_0");
            msgnextloc("\\E4* Guess we can go to church and bother her for it..^1. ugh./%", "obj_readable_room1_slash_Other_10_gml_4677_0");
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E4* ..^1. We're locked out. Let's just go bother your mom at church./", "obj_readable_room1_slash_Other_10_gml_4681_0");
            msgnextloc("\\EK* Not worth breaking a window to get inside./%", "obj_readable_room1_slash_Other_10_gml_4682_0");
        }
    }
}
if (room == room_town_noellehouse)
{
    if (extflag == "snack_platter")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (As a matter of fact^1, the platter lacks snacks.)/%", "obj_readable_room1_slash_Other_10_gml_4692_0");
    }
}
if (room == room_dw_church_knightclimb_post)
{
    if (extflag == "switch")
    {
        with (obj_dw_church_knightclimbpost)
            unlock_anim();
        skip = 1;
    }
    else if (extflag == "grand_door")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (A Grand Door..^1. it seems to be locked solid.)/%", "obj_readable_room1_slash_Other_10_gml_4705_0");
    }
}
if (room == room_dw_castle_tv)
{
    if (extflag == "zapper")
    {
        with (obj_room_castle_tv)
            con = 0;
        skip = 1;
    }
    if (extflag == "construction")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Mystery game^1! Currently under construction!)/%", "obj_readable_room1_slash_Other_10_gml_4721_0");
    }
    if (extflag == "code_entry")
    {
        global.msc = 1464;
        scr_text(global.msc);
    }
    if (extflag == "code_entry_hint")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The PASSWORD is 6453^1! Don't forget it...!)/%", "obj_readable_room1_slash_Other_10_gml_4759_0");
    }
    if (extflag == "rhythm_closed")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Currently under construction!)/", "obj_readable_room1_slash_Other_10_gml_4727_0");
        msgnextloc("* (Would be done if there were more recruits from TV World!)/%", "obj_readable_room1_slash_Other_10_gml_4728_0");
    }
    if (extflag == "desk_empty")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Now recruiting someone to be at this desk^1! Yikes!)/%", "obj_readable_room1_slash_Other_10_gml_4734_0");
    }
}
if (room == room_dw_castle_tv_rhythm)
{
    if (extflag == "pippins")
    {
        global.msc = 1439;
        scr_text(global.msc);
    }
    else if (extflag == "poster")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (RHYTHM GAME^1! Press the buttons in time with the notes to get a high score!)/", "obj_readable_room1_slash_Other_10_gml_4747_0");
        msgnextloc("* (Ask PIPPINS and SHADOWGUY for more details!)/%", "obj_readable_room1_slash_Other_10_gml_4748_0");
    }
    else
    {
        if (i_ex(obj_room_castle_tv_rhythm))
            obj_room_castle_tv_rhythm.select_door(extflag);
        global.msc = 1441;
        scr_text(global.msc);
    }
}
if (room == room_dw_castle_rooms_kris_susie)
{
    if (extflag == "bed_susie")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Susie's bed^1, perfectly made by someone else.)/%", "obj_readable_room1_slash_Other_10_gml_4766_0");
    }
    if (extflag == "fridge")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Susie's fridge^1, perfectly stocked by someone else.)/%", "obj_readable_room1_slash_Other_10_gml_4772_0");
    }
    if (extflag == "shelf")
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E6* Hey^1, what happened to our stuff?/", "obj_readable_room1_slash_Other_10_gml_4778_0");
        scr_anyface_next("ralsei", "K");
        msgnextloc("\\EK* Um^1! I placed it all in storage.../", "obj_readable_room1_slash_Other_10_gml_4780_0");
        msgnextloc("\\EJ* Don't worry^1, I'll bring it back next time!/%", "obj_readable_room1_slash_Other_10_gml_4781_0");
    }
    if (extflag == "wardrobe")
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E9* Nice^1, still got my rock 'n' roll outfit!/%", "obj_readable_room1_slash_Other_10_gml_4787_0");
    }
    if (extflag == "drawer")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a drawer. ..^1. It's full of green crayons.)/%", "obj_readable_room1_slash_Other_10_gml_4793_0");
    }
    if (extflag == "bed_kris")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (..^1. What kind of dreams would you see if you slept here?)/%", "obj_readable_room1_slash_Other_10_gml_4799_0");
        if (scr_flag_get(747) > 0)
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EA* Heh^1, you got tons of awards here./", "obj_readable_room1_slash_Other_10_gml_4807_0");
                msgnextloc("\\E7* ..^1. Not the BEST one though^1, right^1, Kris?/", "obj_readable_room1_slash_Other_10_gml_4808_0");
                scr_anyface_next("ralsei", 21);
                msgnextloc("\\EL* Huh? What's..^1. the best one?/", "obj_readable_room1_slash_Other_10_gml_4810_0");
                scr_anyface_next("susie", 2);
                msgnextloc("\\E2* Just a super cool one Kris got today./", "obj_readable_room1_slash_Other_10_gml_4812_0");
                scr_anyface_next("ralsei", "H");
                msgnextloc("\\EH* Really? Um^1, congratulations^1, Kris!/", "obj_readable_room1_slash_Other_10_gml_4814_0");
                scr_anyface_next("susie", 9);
                msgnextloc("\\E9* Yeah^1, congrats./%", "obj_readable_room1_slash_Other_10_gml_4816_0");
            }
            else
            {
                scr_speaker("ralsei");
                msgsetloc(0, "\\E1* Kris^1, if you want any kind of award.../", "obj_readable_room1_slash_Other_10_gml_4820_0");
                msgnextloc("\\E2* I can add it for you...!/", "obj_readable_room1_slash_Other_10_gml_4821_0");
                scr_anyface_next("susie", "7");
                msgnextloc("\\E7* (He can't^1, though.)/%", "obj_readable_room1_slash_Other_10_gml_4823_0");
            }
        }
    }
    if (extflag == "chair")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (A chair. It has not yet been given a name.)/%", "obj_readable_room1_slash_Other_10_gml_4831_0");
    }
    if (extflag == "table")
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E6* Dude^1, you gonna leave your slice half-eaten?/", "obj_readable_room1_slash_Other_10_gml_4837_0");
        scr_anyface_next("ralsei", "K");
        msgnextloc("\\EK* Um^1, I..^1. I'll deal with it when we leave the room!/%", "obj_readable_room1_slash_Other_10_gml_4839_0");
    }
    if (extflag == "table_alt")
    {
        if (read == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E7* Hey^1, your cake slice is full again!/", "obj_readable_room1_slash_Other_10_gml_4848_0");
            scr_anyface_next("ralsei", "K");
            msgnextloc("\\EK* Umm^1, I didn't want to leave half-eaten food around.../", "obj_readable_room1_slash_Other_10_gml_4850_0");
            scr_anyface_next("susie", 20);
            msgnextloc("\\EK* So you like^1, what? Rejenarate it?/%", "obj_readable_room1_slash_Other_10_gml_4852_0");
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E4* Dude^1, you should fix it by eating it./", "obj_readable_room1_slash_Other_10_gml_4856_0");
            scr_anyface_next("ralsei", "Q");
            msgnextloc("\\EQ* I will^1! ..^1. later./%", "obj_readable_room1_slash_Other_10_gml_4858_0");
        }
    }
}
if (room == room_dw_ralsei_castle_front)
{
    if (extflag == "shutta")
    {
        global.msc = 1445;
        scr_text(global.msc);
    }
}
if (room == room_dw_churchc_titanclimb1_post)
{
    if (extflag == "sparkle")
    {
        global.msc = 1447;
        scr_text(global.msc);
    }
}
if (room == room_dw_churchc_finalclimb)
{
    if (extflag == "cup_stack")
    {
        if (scr_flag_get(1650) == 0)
        {
            scr_flag_set(1650, 1);
            scr_speaker("no_name");
            msgsetloc(0, "* So..^1. how long shall we stack up like this...?/", "obj_readable_room1_slash_Other_10_gml_4902_0");
            msgnextloc("* Ah^1, until the Lightners reign victorious...!/", "obj_readable_room1_slash_Other_10_gml_4903_0");
            msgnextloc("* Yes^1, yes^1, you're right^1! We are helping^1, aren't we?!/%", "obj_readable_room1_slash_Other_10_gml_4904_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Oh^1, you there^1! Young knights^1! Help stack up for the Lightners...!/%", "obj_readable_room1_slash_Other_10_gml_4908_0");
        }
    }
}
if (room == room_dw_church_bellhall_bookroom)
{
    if (extflag == "door_locked")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Something is blocking the doorway.)/", "obj_readable_room1_slash_Other_10_gml_4885_0");
        msgnextloc("* (..^1. It's a door.)/%", "obj_readable_room1_slash_Other_10_gml_4886_0");
    }
}
if (room == room_dw_castle_tv_zone_1)
{
    if (extflag == "statue")
    {
        skip = 1;
        with (obj_room_castle_tv_zone_1)
            show_convo("statue");
    }
    else if (extflag == "statue_cat")
    {
        skip = 1;
        with (obj_room_castle_tv_zone_1)
            show_convo("statue_cat");
    }
}
if (room == room_dw_castle_tv_zone_2)
{
    skip = 1;
    if (i_ex(obj_room_castle_tv_zone_2))
        obj_room_castle_tv_zone_2.show_convo(extflag);
}
if (room == room_dw_castle_tv_zone_3)
{
    skip = 1;
    if (i_ex(obj_room_castle_tv_zone_3))
        obj_room_castle_tv_zone_3.show_convo(extflag);
}
if (room == room_dw_castle_tv_zone_battle)
{
    skip = 1;
    if (i_ex(obj_room_castle_tv_zone_battle))
        obj_room_castle_tv_zone_battle.show_convo(extflag);
}
if (room == room_dw_castle_tv_zone_minigame)
{
    if (extflag == "mike_s")
    {
        skip = 1;
        with (obj_room_castle_tv_zone_minigame)
            show_convo("mike_s");
    }
    else if (extflag == "mike_l")
    {
        skip = 1;
        with (obj_room_castle_tv_zone_minigame)
            show_convo("mike_l");
    }
    else if (extflag == "mike_m")
    {
        skip = 1;
        with (obj_room_castle_tv_zone_minigame)
            show_convo("mike_m");
    }
    else if (extflag == "mouse")
    {
        skip = 1;
        with (obj_room_castle_tv_zone_minigame)
            show_convo("mouse");
    }
    else if (extflag == "bomb")
    {
        skip = 1;
        with (obj_room_castle_tv_zone_minigame)
            show_convo("bomb");
    }
}
if (skip == 0)
    mydialoguer = instance_create(0, 0, obj_dialoguer);
read += 1;
if (skip == 1)
{
    global.interact = 0;
    skip = 0;
}

enum UnknownEnum
{
    Value_0,
    Value_8 = 8,
    Value_25 = 25,
    Value_28 = 28,
    Value_938 = 938
}
