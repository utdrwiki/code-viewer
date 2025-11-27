global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
image_speed = 0.2;
if (global.darkzone == 1)
    image_speed = 0.1;
global.msg[0] = stringsetloc("* Is that a cut on your face^1, or part of your eye?/%", "obj_npc_facing_slash_Other_10_gml_12_0");
if (scr_debug())
    global.msg[0] = stringset("* [NO TEXT] (obj_npc_facing)/%");
if (room == room_alphysclass)
{
    if (utsprite == spr_noelle_walk_up_lw)
    {
        global.msc = 100;
        if (talked > 0)
            global.msc = 102;
        scr_text(global.msc);
        global.fe = 0;
        global.fc = 3;
        global.typer = 12;
        if (global.plot >= 3)
        {
            global.msg[0] = stringsetloc("* Don't worry^1, Kris!/", "obj_npc_facing_slash_Other_10_gml_31_0");
            global.msg[1] = stringsetloc("\\E4* I've always thought Susie can't be so bad^1, you know?/", "obj_npc_facing_slash_Other_10_gml_32_0");
            global.msg[2] = stringsetloc("\\E0* I'm sure everything will turn out fine!/%", "obj_npc_facing_slash_Other_10_gml_33_0");
            if (talked >= 1)
            {
                global.typer = 23;
                global.fe = 3;
                global.msg[0] = stringsetloc("* And^1, if you have time^1, could you say hi to her for me...?/%", "obj_npc_facing_slash_Other_10_gml_39_0");
            }
        }
    }
    if (utsprite == spr_berdly_ut)
    {
        global.fc = 12;
        global.fe = 1;
        global.typer = 13;
        global.msg[0] = stringsetloc("* Ah^1, Kris^1.&* Late again^1, I see./", "obj_npc_facing_slash_Other_10_gml_50_0");
        global.msg[1] = stringsetloc("\\E0* Hmm? You need a partner?/", "obj_npc_facing_slash_Other_10_gml_51_0");
        global.msg[2] = stringsetloc("\\E1* Sorry^1, I'm already partners with the 2nd smartest student./", "obj_npc_facing_slash_Other_10_gml_52_0");
        global.msg[3] = stringsetloc("\\E3* Though..^1. wait^1!&* Kris^1, now that I think about it.../", "obj_npc_facing_slash_Other_10_gml_53_0");
        global.msg[4] = stringsetloc("\\E4* Your unique skillset might help a LOT on this assignment!/", "obj_npc_facing_slash_Other_10_gml_54_0");
        global.msg[5] = stringsetloc("\\E2* Pfft^1, NOT^1!&* I actually want to get an \"A!\"/%", "obj_npc_facing_slash_Other_10_gml_55_0");
        if (talked > 0)
        {
            global.msg[0] = stringsetloc("* Ask elsewhere^1, Kris! I actually want to get an \"A!\"/", "obj_npc_facing_slash_Other_10_gml_59_0");
            global.msg[1] = stringsetloc("\\E2* If you can't get anyone^1, maybe your mom will be your partner again!/%", "obj_npc_facing_slash_Other_10_gml_60_0");
        }
        if (global.plot >= 3)
        {
            global.fe = 3;
            global.msg[0] = stringsetloc("\\E3* Kris^1, didn't I SAY being late was a bad idea?/", "obj_npc_facing_slash_Other_10_gml_67_0");
            global.msg[1] = stringsetloc("\\E0* Hmm^1, it's almost as if you should have^1, as they say.../", "obj_npc_facing_slash_Other_10_gml_68_0");
            global.msg[2] = stringsetloc("\\E1* Listened?/%", "obj_npc_facing_slash_Other_10_gml_69_0");
            if (talked > 0)
                global.msg[0] = stringsetloc("\\E0* Alas^1, Kris^1.&* I already tried to help you.../%", "obj_npc_facing_slash_Other_10_gml_73_0");
        }
    }
    if (utsprite == spr_snowy_ut)
    {
        global.msg[0] = stringsetloc("* Partn'er^1?&* I hardly know 'er!!/", "obj_npc_facing_slash_Other_10_gml_83_0");
        global.msg[1] = stringsetloc("* Ha ha ha!^1!&* Whaddya think of that one!^1?&* Funny^1, right???/", "obj_npc_facing_slash_Other_10_gml_84_0");
        global.msg[2] = stringsetloc("* ... No?/", "obj_npc_facing_slash_Other_10_gml_85_0");
        global.msg[3] = stringsetloc("* Well^1, I got NEWS for you^1, PAL^1!&* I already GOT a partner!^1!&* SCRAM!/%", "obj_npc_facing_slash_Other_10_gml_86_0");
        if (talked > 0)
        {
            global.msg[0] = stringsetloc("* That's right^1, KRIS^1!&* I got the GOOD partner!/", "obj_npc_facing_slash_Other_10_gml_90_0");
            global.msg[1] = stringsetloc("* And WE'RE going to be laughing all the way to the BANK!/", "obj_npc_facing_slash_Other_10_gml_91_0");
            global.msg[2] = stringsetloc("* Because I need money^1, and I'm also VERY funny./%", "obj_npc_facing_slash_Other_10_gml_92_0");
        }
        if (global.plot >= 3)
        {
            global.msg[0] = stringsetloc("* Kris^1, don't listen to 'em^1.&* It's not that bad./", "obj_npc_facing_slash_Other_10_gml_98_0");
            global.msg[1] = stringsetloc("* You'll PROBABLY survive Susie beating you up./", "obj_npc_facing_slash_Other_10_gml_99_0");
            global.msg[2] = stringsetloc("* You're just gonna fail when she doesn't do ANY of your project!!/", "obj_npc_facing_slash_Other_10_gml_100_0");
            global.msg[3] = stringsetloc("* It's like we always say^1, Kris..^1.&* You SUZ, you LOSE!!!/", "obj_npc_facing_slash_Other_10_gml_101_0");
            global.msg[4] = stringsetloc("* ... uhhh^1, that's not very reassuring, huh./%", "obj_npc_facing_slash_Other_10_gml_102_0");
            if (talked > 0)
                global.msg[0] = stringsetloc("\\E0* Hey Kris^1, if you die^1, can I have your brother's CDs?/%", "obj_npc_facing_slash_Other_10_gml_106_0");
        }
    }
    if (utsprite == spr_mkid_ut)
    {
        global.msg[0] = stringsetloc("* Yo^1, Kris^1!&* Show up earlier next time!/", "obj_npc_facing_slash_Other_10_gml_116_0");
        global.msg[1] = stringsetloc("* I ended up having to partner with Snowy^1, haha.../", "obj_npc_facing_slash_Other_10_gml_117_0");
        global.msg[2] = stringsetloc("* Now he keeps turning to me and saying \"Howdy, Partner!\" like a cowboy.../%", "obj_npc_facing_slash_Other_10_gml_118_0");
        if (talked > 0)
            global.msg[0] = stringsetloc("* Yo^1, Kris^1, you're lucky^1.&* I'd rather be partnerless than this^1, haha.../%", "obj_npc_facing_slash_Other_10_gml_122_0");
        if (global.plot >= 3)
        {
            global.msg[0] = stringsetloc("* Yo^1! Kris^1! I'm sorry^1!&* If I had just waited to be your partner.../", "obj_npc_facing_slash_Other_10_gml_128_0");
            global.msg[1] = stringsetloc("* You wouldn't have to be HER'S^1!&* She's gonna pound you to pieces^1, Kris!/", "obj_npc_facing_slash_Other_10_gml_129_0");
            global.msg[2] = stringsetloc("* And then kick the butts of all those little pieces!/%", "obj_npc_facing_slash_Other_10_gml_130_0");
            if (talked > 0)
                global.msg[0] = stringsetloc("\\E0* Kris^1, just keep running and don't look back!/%", "obj_npc_facing_slash_Other_10_gml_134_0");
        }
    }
    if (utsprite == spr_catti_ut)
    {
        global.fc = 13;
        global.fe = 0;
        global.msg[0] = stringsetloc("\\E0* (Click, click, tap, tap...)/", "obj_npc_facing_slash_Other_10_gml_147_0");
        global.msg[1] = stringsetloc("\\E1* ... taken./%", "obj_npc_facing_slash_Other_10_gml_148_0");
        if (global.plot >= 3)
        {
            global.msg[0] = stringsetloc("\\E0* (Click, click, tap, tap...)/", "obj_npc_facing_slash_Other_10_gml_152_0");
            global.msg[1] = stringsetloc("\\E2* ... don't die./%", "obj_npc_facing_slash_Other_10_gml_153_0");
        }
    }
    if (utsprite == spr_jockington_ut)
    {
        global.fc = 14;
        global.msg[0] = stringsetloc("* Kris^1! You KNOW Jockington and Catti^1, Are ALWAYS partners!/", "obj_npc_facing_slash_Other_10_gml_161_0");
        global.msg[1] = stringsetloc("* We're the ultimate academic duo^1, Ever since our first gym class!/", "obj_npc_facing_slash_Other_10_gml_162_0");
        global.msg[2] = stringsetloc("* It was hula hoop day^1, and they ran out of hoops^1, for us.../", "obj_npc_facing_slash_Other_10_gml_163_0");
        global.msg[3] = stringsetloc("* So she used me instead^1!&* That's our origin story!/%", "obj_npc_facing_slash_Other_10_gml_164_0");
        if (talked > 0)
        {
            global.msg[0] = stringsetloc("* We SEEM different^1, but me and Catti have a TON^1, In common!/", "obj_npc_facing_slash_Other_10_gml_168_0");
            global.msg[1] = stringsetloc("* We both like breathing^1, and unhinging our jaws!/%", "obj_npc_facing_slash_Other_10_gml_169_0");
        }
        if (global.plot >= 3)
        {
            global.msg[0] = stringsetloc("\\E0* Kris^1, if I had arms.../", "obj_npc_facing_slash_Other_10_gml_176_0");
            global.msg[1] = stringsetloc("\\E2* I would take off this cool hat in rememberance of you./%", "obj_npc_facing_slash_Other_10_gml_177_0");
        }
    }
    if (utsprite == spr_alphysu)
    {
        if (global.chapter == 1)
        {
            global.fc = 11;
            global.typer = 20;
            global.fe = 3;
            global.msg[0] = stringsetloc("\\E3* What?&* Wh-what am I watching on my phone?/", "obj_npc_facing_slash_Other_10_gml_189_0");
            global.msg[1] = stringsetloc("\\E0* It's schoolwork^1, of course./", "obj_npc_facing_slash_Other_10_gml_190_0");
            global.msg[2] = stringsetloc("\\E4* A..^1. animated schoolwork..^1. and.../", "obj_npc_facing_slash_Other_10_gml_191_0");
            global.msg[3] = stringsetloc("\\E5* H-hey^1, Kris^1, have you chosen a partner yet?/%", "obj_npc_facing_slash_Other_10_gml_192_0");
            if (talked > 0)
            {
                global.fe = 7;
                global.msg[0] = stringsetloc("\\E7* (Don't worry^1, Mew Mew.^1)&* (You'll ALWAYS be MY partner.)/%", "obj_npc_facing_slash_Other_10_gml_196_0");
            }
            if (global.plot >= 3)
            {
                global.fe = 5;
                global.msg[0] = stringsetloc("* Kris^1? What's the hold-up?&* Go out there!/%", "obj_npc_facing_slash_Other_10_gml_202_0");
            }
        }
        if (global.chapter == 2)
        {
            scr_speaker("alphys");
            global.msg[0] = stringsetloc("\\E0* Kris^1, get a good sleep tonight^1, okay?/%", "obj_npc_facing_slash_Other_10_gml_208_0");
            if (talked == 0)
            {
                global.msc = 1000;
                scr_text(global.msc);
            }
        }
    }
}
if (room == room_library)
{
    if (room == room_library)
    {
        if (x < 140)
        {
            global.fc = 12;
            global.typer = 13;
            global.msg[0] = stringsetloc("\\E3* Kris^1!&* You survived Susie^1!&* I was getting worried!/", "obj_npc_facing_slash_Other_10_gml_230_0");
            if (global.flag[256] == 1)
                global.msg[0] = stringsetloc("\\E0* OK^1, Kris^1, now for something more important./", "obj_npc_facing_slash_Other_10_gml_232_0");
            global.msg[1] = stringsetloc("\\E1* Now you can finally pay off your family debt./", "obj_npc_facing_slash_Other_10_gml_233_0");
            global.msg[2] = stringsetloc("\\E0* How to Draw Dragons is 2583 days overdue./", "obj_npc_facing_slash_Other_10_gml_234_0");
            global.msg[3] = stringsetloc("\\E2* However^1, Kris^1.&* I am a benevolent volunteer assistant./", "obj_npc_facing_slash_Other_10_gml_235_0");
            global.msg[4] = stringsetloc("\\E4* If you turn it in this week^1, I'll reduce your fine to.../", "obj_npc_facing_slash_Other_10_gml_236_0");
            global.msg[5] = stringsetloc("\\E2* A mere $64.23^1!&* Consider it^1, Kris!/%", "obj_npc_facing_slash_Other_10_gml_237_0");
            if (talked >= 1)
            {
                global.msg[0] = stringsetloc("\\E3* Ah^1, did you forget what it looks like?/", "obj_npc_facing_slash_Other_10_gml_241_0");
                global.msg[1] = stringsetloc("\\E0* The front is^1, perhaps..^1. a mauve dragon wearing lipstick./", "obj_npc_facing_slash_Other_10_gml_242_0");
                global.msg[2] = stringsetloc("\\E0* And as for her clothes^1, I believe they are^1, well.../", "obj_npc_facing_slash_Other_10_gml_243_0");
                global.msg[3] = stringsetloc("\\E2* You know^1, Kris^1, I think you'll know it when you see it!/%", "obj_npc_facing_slash_Other_10_gml_244_0");
            }
            if (global.flag[255] >= 1 && global.flag[256] == 0)
            {
                global.msg[0] = stringsetloc("\\E3* What^1? Hospital window^1? What are you talking about?/", "obj_npc_facing_slash_Other_10_gml_249_0");
                global.msg[1] = stringsetloc("\\E5* I'm sorry^1, Kris^1.&* I don't have time to do such things./", "obj_npc_facing_slash_Other_10_gml_250_0");
                global.msg[2] = stringsetloc("\\E0* Because I'm..^1. Hmm..^1. What do they say?/", "obj_npc_facing_slash_Other_10_gml_251_0");
                global.msg[3] = stringsetloc("\\E2* CONTRIBUTING TO SOCIETY?/", "obj_npc_facing_slash_Other_10_gml_252_0");
                global.msg[4] = stringsetloc("\\E2* You should try it someday^1, Kris!/", "obj_npc_facing_slash_Other_10_gml_253_0");
                global.msg[5] = stringsetloc("\\E2* It's actually quite gratifying!/%", "obj_npc_facing_slash_Other_10_gml_254_0");
                global.flag[256] = 1;
                talked = -1;
            }
            if (global.chapter >= 4)
            {
                if (scr_havechar(2))
                {
                    side = 0;
                    global.msc = 1337;
                    scr_text(global.msc);
                }
            }
        }
        if (x > 150 && x < 220)
        {
            global.fc = 14;
            global.fe = 0;
            global.msg[0] = stringsetloc("* Kris^1! What'sup!/", "obj_npc_facing_slash_Other_10_gml_269_0");
            global.msg[1] = stringsetloc("* Catti's working^1, so I'm starting^1, on our Project!/", "obj_npc_facing_slash_Other_10_gml_270_0");
            global.msg[2] = stringsetloc("* I've already^1, copied a bunch of pictures./", "obj_npc_facing_slash_Other_10_gml_271_0");
            scr_noface(3);
            global.msg[4] = stringsetloc("* (It's the same picture of a soccer ball 73 times.)/%", "obj_npc_facing_slash_Other_10_gml_273_0");
            if (talked >= 1)
                global.msg[0] = stringsetloc("* You could say I'm having a Ball^1!&* Hah haha!/%", "obj_npc_facing_slash_Other_10_gml_277_0");
        }
        if (x > 220)
        {
            global.msg[0] = stringsetloc("* gotta go to colleg..^1.&* so tem stuby..^1.&* HARD!!!!/", "obj_npc_facing_slash_Other_10_gml_283_0");
            global.msg[1] = stringsetloc("* (She's reading a comic full of hot demon guys.)/%", "obj_npc_facing_slash_Other_10_gml_284_0");
        }
    }
}
if (room == room_flowershop_1f)
{
    global.fc = 10;
    global.fe = 1;
    global.typer = 18;
    global.msg[0] = stringsetloc("\\E1* Say^1, Kris..^1.&* I was thinking./", "obj_npc_facing_slash_Other_10_gml_297_0");
    global.msg[1] = stringsetloc("\\E3* Perhaps when Asriel comes home.../", "obj_npc_facing_slash_Other_10_gml_298_0");
    global.msg[2] = stringsetloc("\\E0* We could all go to the diner^1, just like old times.../", "obj_npc_facing_slash_Other_10_gml_299_0");
    global.msg[3] = stringsetloc("\\E6* My treat./", "obj_npc_facing_slash_Other_10_gml_300_0");
    global.msg[4] = stringsetloc("\\E0* Doesn't that sound yummy?/%", "obj_npc_facing_slash_Other_10_gml_301_0");
    if (talked >= 1)
    {
        global.msg[0] = stringsetloc("\\E1* Then we could all have a nice drive around town./", "obj_npc_facing_slash_Other_10_gml_305_0");
        global.msg[1] = stringsetloc("\\E2* I might need to clean out my truck^1, but.../%", "obj_npc_facing_slash_Other_10_gml_306_0");
    }
}
if (room == room_flowershop_2f)
{
    global.fc = 10;
    global.fe = 2;
    global.typer = 18;
    global.msg[0] = stringsetloc("\\E2* Yes^1, these flowers are still kicking./", "obj_npc_facing_slash_Other_10_gml_315_0");
    global.msg[1] = stringsetloc("\\E0* Quite hard to take care of them in this climate.../%", "obj_npc_facing_slash_Other_10_gml_316_0");
}
if (room == room_alphysalley)
{
    global.fc = 11;
    global.fe = 0;
    global.typer = 20;
    global.msc = 285;
    scr_text(global.msc);
}
if (room == room_town_south)
{
    if (global.chapter == 1)
    {
        global.typer = 17;
        global.msc = 335;
        scr_text(global.msc);
    }
}
if (room == room_town_mid)
{
    image_speed = 0;
    image_index = 0;
    if (dtsprite == spr_sans_d)
    {
        if (global.chapter != 4)
        {
            global.typer = 14;
            global.fc = 6;
            global.fe = 0;
            global.msc = 370;
            if (global.flag[273] >= 1)
                global.msc = 371;
            scr_text(global.msc);
            with (obj_town_event)
                con = 70;
        }
        else
        {
            if (scr_flag_get(798) < 2)
            {
                if (scr_flag_get(798) == 0)
                    scr_flag_set(798, 1);
                if (talked == 0)
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EK* So^1, uh^1, can we go into the store?/", "obj_npc_facing_slash_Other_10_gml_375_0");
                    scr_anyface_next("sans", 2);
                    msgnextloc("\\E2* sorry kid. check the sign./%", "obj_npc_facing_slash_Other_10_gml_377_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EK* Uhh^1, we looked at the sign./", "obj_npc_facing_slash_Other_10_gml_381_0");
                    scr_anyface_next("sans", 2);
                    msgnextloc("\\E2* yeah^1, but did you check it?/%", "obj_npc_facing_slash_Other_10_gml_383_0");
                }
            }
            if (scr_flag_get(798) >= 2)
            {
                if (talked == 0)
                {
                    if (scr_flag_get(798) < 3)
                        scr_flag_set(798, 3);
                    scr_speaker("susie");
                    msgsetloc(0, "\\E0* Yeah^1, we checked the sign. It says \"open.\"/", "obj_npc_facing_slash_Other_10_gml_397_0");
                    scr_anyface_next("sans", 2);
                    msgnextloc("\\E2* oh man^1, thanks for checking that. that's wrong./", "obj_npc_facing_slash_Other_10_gml_399_0");
                    scr_anyface_next("susie", 5);
                    msgnextloc("\\E5* ..^1. then change your stupid sign!/", "obj_npc_facing_slash_Other_10_gml_401_0");
                    scr_anyface_next("sans", 5);
                    msgnextloc("\\E5* alright^1, i'm on it. one changed sign^1, comin' up./%", "obj_npc_facing_slash_Other_10_gml_403_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EB* I don't see you changing your sign./", "obj_npc_facing_slash_Other_10_gml_407_0");
                    scr_anyface_next("sans", 2);
                    msgnextloc("\\E2* got it. come back in a bit./%", "obj_npc_facing_slash_Other_10_gml_409_0");
                }
            }
            if (scr_flag_get(798) >= 4)
            {
                if (talked == 0)
                {
                    if (scr_flag_get(798) < 5)
                        scr_flag_set(798, 5);
                    scr_speaker("susie");
                    msgsetloc(0, "\\EK* So can we go in yet?/", "obj_npc_facing_slash_Other_10_gml_423_0");
                    scr_anyface_next("sans", 2);
                    msgnextloc("\\E2* hmm. what does the sign say?/", "obj_npc_facing_slash_Other_10_gml_425_0");
                    scr_anyface_next("susie", 11);
                    msgnextloc("\\EB* It says..^1. \"clopen.\"/", "obj_npc_facing_slash_Other_10_gml_427_0");
                    msgnextloc("\\EK* ..^1. the hell's that mean?/", "obj_npc_facing_slash_Other_10_gml_428_0");
                    scr_anyface_next("sans", 1);
                    msgnextloc("\\E1* beats me. i just work here./", "obj_npc_facing_slash_Other_10_gml_430_0");
                    scr_anyface_next("susie", 5);
                    msgnextloc("\\E5* Well change it again!/", "obj_npc_facing_slash_Other_10_gml_432_0");
                    scr_anyface_next("sans", 2);
                    msgnextloc("\\E2* alright. you're the boss./%", "obj_npc_facing_slash_Other_10_gml_434_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EB* I don't see you changing your sign./", "obj_npc_facing_slash_Other_10_gml_438_0");
                    scr_anyface_next("sans", 3);
                    msgnextloc("\\E3* got it. come back in a bit./%", "obj_npc_facing_slash_Other_10_gml_440_0");
                }
            }
            if (scr_flag_get(798) >= 6)
            {
                if (scr_flag_get(798) < 7)
                {
                    scr_flag_set(798, 7);
                    scr_speaker("susie");
                    msgsetloc(0, "\\E6* What the heck does THAT sign mean?/", "obj_npc_facing_slash_Other_10_gml_451_0");
                    scr_anyface_next("sans", 2);
                    msgnextloc("\\E2* hmm. seems to indicate some kind of sans./", "obj_npc_facing_slash_Other_10_gml_453_0");
                    scr_anyface_next("susie", 12);
                    msgnextloc("\\EC* So does it say the door's open or closed?/", "obj_npc_facing_slash_Other_10_gml_455_0");
                    scr_anyface_next("sans", 1);
                    msgnextloc("\\E1* guess it just means there's a skeleton in front of the door./", "obj_npc_facing_slash_Other_10_gml_457_0");
                    scr_anyface_next("susie", 20);
                    msgnextloc("\\EK* But the door's locked^1, right? It's closed!/", "obj_npc_facing_slash_Other_10_gml_459_0");
                    scr_anyface_next("sans", 2);
                    msgnextloc("\\E2* locked? nah^1, it's been unlocked this whole time./", "obj_npc_facing_slash_Other_10_gml_461_0");
                    scr_anyface_next("susie", 11);
                    msgnextloc("\\EB* So it is open./", "obj_npc_facing_slash_Other_10_gml_463_0");
                    scr_anyface_next("sans", 3);
                    msgnextloc("\\E3* nah. no one's in there^1, but it's not closed./", "obj_npc_facing_slash_Other_10_gml_465_0");
                    msgnextloc("\\E0* it's an inbetween state..^1. like..^1. hm./", "obj_npc_facing_slash_Other_10_gml_466_0");
                    msgnextloc("\\E5* like^1, \"clopen.\"/", "obj_npc_facing_slash_Other_10_gml_467_0");
                    msgnextloc("\\E2* hm. kinda makes you wish we had a sign for that./", "obj_npc_facing_slash_Other_10_gml_468_0");
                    scr_anyface_next("susie", 20);
                    msgnextloc("\\EK* (Kris^1, we're done with this guy...)/%", "obj_npc_facing_slash_Other_10_gml_470_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EK* (Kris^1, we're done with this guy...)/%", "obj_npc_facing_slash_Other_10_gml_474_0");
                }
            }
        }
    }
    if (dtsprite == spr_alphysd)
    {
        if (scr_flag_get(269) > 0)
        {
            if (scr_flag_get(763) == 0)
                scr_flag_set(763, 1);
            if (talked == 0)
            {
                scr_speaker("alphys");
                msgsetloc(0, "\\E0* ..^1. Kris^1, I^1, um..^1. you know that daily saucer of milk I put out?/", "obj_npc_facing_slash_Other_10_gml_493_0");
                msgnextloc("\\E8* .../", "obj_npc_facing_slash_Other_10_gml_494_0");
                msgnextloc("\\E9* I..^1. I have regrets./%", "obj_npc_facing_slash_Other_10_gml_495_0");
            }
            else
            {
                scr_speaker("alphys");
                msgsetloc(0, "\\E9* What do I do with my leftover milk? Just look at it?/%", "obj_npc_facing_slash_Other_10_gml_499_0");
            }
        }
        else if (talked == 0)
        {
            global.msc = 1345;
            scr_text(global.msc);
        }
        else
        {
            scr_speaker("alphys");
            msgsetloc(0, "\\E2* Umm..^1. Maybe you should go enjoy your weekend^1, Kris.../%", "obj_npc_facing_slash_Other_10_gml_510_0");
        }
    }
}
if (room == room_town_north)
{
    if (dtsprite == spr_noelle_walk_down_lw)
    {
        global.msc = 385;
        global.typer = 12;
        global.fc = 3;
        global.fe = 0;
        scr_text(global.msc);
    }
    if (global.chapter == 4)
    {
        if (talked == 0)
        {
            if (scr_flag_get(786) == 0)
                scr_flag_set(786, 1);
            scr_speaker("sans");
            msgsetloc(0, "\\E0* heya. don't mind me. just fixing up this grill./", "obj_npc_facing_slash_Other_10_gml_537_0");
            msgnextloc("\\E2* want a hotdog?/", "obj_npc_facing_slash_Other_10_gml_538_0");
            scr_anyface_next("susie", 7);
            msgnextloc("\\E7* Heck yeah^1! (..^1. wait^1, isn't that a cattail?)/%", "obj_npc_facing_slash_Other_10_gml_540_0");
        }
        else
        {
            scr_speaker("sans");
            msgsetloc(0, "\\E1* it's low calorie stuff. so you won't feel \"grillty.\"/", "obj_npc_facing_slash_Other_10_gml_544_0");
            scr_anyface_next("susie", 11);
            msgnextloc("\\EB* It's inedible./", "obj_npc_facing_slash_Other_10_gml_546_0");
            scr_anyface_next("sans", 3);
            msgnextloc("\\E3* we call that zero calories^1, miss./%", "obj_npc_facing_slash_Other_10_gml_548_0");
        }
    }
}
if (room == room_dw_ralsei_castle_2f)
{
    if (talked == 0)
    {
        scr_speaker("queen");
        msgsetloc(0, "\\E1* Ralsei Will Soon Setup.EXE My Room For Me Upstairs/", "obj_npc_facing_slash_Other_10_gml_500_0");
        msgnextloc("\\EA* Do Not Worry/", "obj_npc_facing_slash_Other_10_gml_501_0");
        msgnextloc("\\EP* I Have A Long Spreadsheet Of Demands Ready Ha Ha/", "obj_npc_facing_slash_Other_10_gml_502_0");
        scr_anyface_next("ralsei", 26);
        msgnextloc("\\EQ* Umm^1, I-I'll try my best!/", "obj_npc_facing_slash_Other_10_gml_504_0");
        scr_anyface_next("queen", 1);
        msgnextloc("\\E1* Quick Q How Many Breakable Pots Do You Have/", "obj_npc_facing_slash_Other_10_gml_506_0");
        scr_anyface_next("ralsei", 22);
        msgnextloc("\\EM* I..^1. Let me count and get back to you on that.../%", "obj_npc_facing_slash_Other_10_gml_508_0");
    }
    else
    {
        scr_speaker("queen");
        msgsetloc(0, "\\E1* Kris^1, Do Give Noelle My Regards/", "obj_npc_facing_slash_Other_10_gml_512_0");
        msgnextloc("\\EB* Any Leftover Regards You Can Give To Berdly/%", "obj_npc_facing_slash_Other_10_gml_513_0");
    }
}
if (room == room_lw_church_main)
{
    if (extflag == "toriel")
    {
        scr_speaker("toriel");
        msgsetloc(0, "\\E1* Sorry honey^1, I'm still catching up with Rudy./", "obj_npc_facing_slash_Other_10_gml_588_0");
        msgnextloc("\\E0* You and Susie can go home earlier if you want to./%", "obj_npc_facing_slash_Other_10_gml_589_0");
    }
    if (extflag == "bratty")
    {
        if (talked == 0)
        {
            scr_speaker("bratty");
            msgsetloc(0, "\\E3* Code? No clue^1, I don't go here. I just randomly decided to today./", "obj_npc_facing_slash_Other_10_gml_597_0");
            msgnextloc("\\E6* By the way that girl's reading was^1, like^1, SO bad./", "obj_npc_facing_slash_Other_10_gml_598_0");
            msgnextloc("\\E5* It was so awful you can't help but smile^1, you know? ..^1. Like?/", "obj_npc_facing_slash_Other_10_gml_599_0");
            msgnextloc("\\E6* Like^1, what does \\cYthat girl\\cW think she knows?/%", "obj_npc_facing_slash_Other_10_gml_600_0");
        }
        else
        {
            scr_speaker("bratty");
            msgsetloc(0, "\\E0* ..^1. think she'll go to the diner after this? I mean^1, I am./", "obj_npc_facing_slash_Other_10_gml_604_0");
            msgnextloc("\\E6* Ugh^1, guess I have to watch her to make sure she doesn't go./%", "obj_npc_facing_slash_Other_10_gml_605_0");
        }
    }
    if (extflag == "grandma")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Shelter? No^1, no^1, now you know that's not a wholesome place!/", "obj_npc_facing_slash_Other_10_gml_614_0");
            msgnextloc("* You could stand to learn a thing or two from that polite young man..^1. Burghley./%", "obj_npc_facing_slash_Other_10_gml_615_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Just the other day^1, that young man told me you wavedash./", "obj_npc_facing_slash_Other_10_gml_619_0");
            msgnextloc("* Now I haven't told your mother^1, but please^1, for dear shame!/%", "obj_npc_facing_slash_Other_10_gml_620_0");
        }
    }
    if (extflag == "jockington")
    {
        if (talked == 0)
        {
            scr_speaker("jockington");
            msgsetloc(0, "* Kris. Folled you^1! Ha Ha^1, bet you thought I was^1, Catti!/", "obj_npc_facing_slash_Other_10_gml_629_0");
            msgnextloc("* Today's Game was wild^1,^1! I think we Won..^1. What? \"Codes?\"/", "obj_npc_facing_slash_Other_10_gml_630_0");
            msgnextloc("* Sorry. don't know That. Never will. Been real./%", "obj_npc_facing_slash_Other_10_gml_631_0");
        }
        else
        {
            scr_speaker("jockington");
            msgsetloc(0, "* For her^1, I go the big Church Match^1, as her Substitute Player./", "obj_npc_facing_slash_Other_10_gml_635_0");
            msgnextloc("* For me^1, she Covered in Hair Always. We Do What^1, the other can n't!/%", "obj_npc_facing_slash_Other_10_gml_636_0");
        }
    }
}
remanimspeed = image_speed;
myinteract = 3;
mydialoguer = instance_create(0, 0, obj_dialoguer);
if (side >= 0)
    mydialoguer.side = side;
talked += 1;
