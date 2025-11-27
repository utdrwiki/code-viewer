global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
global.msg[0] = stringsetloc("* The pain itself is reason why./%", "obj_npc_room_animated_slash_Other_10_gml_8_0");
if (scr_debug())
    global.msg[0] = stringset("* [NO TEXT] (obj_npc_room_animated)/%");
if (room == room_town_mid)
{
    if (sprite_index == spr_npc_icemascot2)
    {
        global.msg[0] = stringsetloc("* Would you be interested in trying some of our many 24 Pezza Flavors?/", "obj_npc_room_animated_slash_Other_10_gml_15_0");
        global.msg[1] = stringsetloc("* We've got Normal,/", "obj_npc_room_animated_slash_Other_10_gml_16_0");
        global.msg[2] = stringsetloc("* Cheese,/", "obj_npc_room_animated_slash_Other_10_gml_17_0");
        global.msg[3] = stringsetloc("* Ice,/", "obj_npc_room_animated_slash_Other_10_gml_18_0");
        global.msg[4] = stringsetloc("* Gravy,/", "obj_npc_room_animated_slash_Other_10_gml_19_0");
        global.msg[5] = stringsetloc("* Double Ice,/", "obj_npc_room_animated_slash_Other_10_gml_20_0");
        global.msg[6] = stringsetloc("* Peeperoniss,/", "obj_npc_room_animated_slash_Other_10_gml_21_0");
        global.msg[7] = stringsetloc("* And more^1!&* Stop on down at ICE-E's PEZZA!/%", "obj_npc_room_animated_slash_Other_10_gml_22_0");
        if (talked >= 1)
        {
            global.msg[0] = stringsetloc("* Psst^1, can I tell you a mascot secret^1? I only started working here because.../", "obj_npc_room_animated_slash_Other_10_gml_26_0");
            global.msg[1] = stringsetloc("* The logo made me think it was an ice-cream shop.../", "obj_npc_room_animated_slash_Other_10_gml_27_0");
            global.msg[2] = stringsetloc("* But I ended up really loving my job^1! And my co-workers^1, too^1! Heehee!/%", "obj_npc_room_animated_slash_Other_10_gml_28_0");
        }
    }
    if (sprite_index == spr_npc_icemascot_fake)
        global.msg[0] = stringsetloc("* ICE ME UP^1!&* ICE ME UP^1, BOSS!!!/%", "obj_npc_room_animated_slash_Other_10_gml_35_0");
    if (sprite_index == spr_npc_icemascot1)
    {
        global.msg[0] = stringsetloc("* (Oh^1, God^1, someone's actually here...)&* Uhhhh.../", "obj_npc_room_animated_slash_Other_10_gml_40_0");
        global.msg[1] = stringsetloc("* Ice E's P\"E\"ZZA^1, You're number \"#1\" Spot for a piping hot pe\"E\"ce of PEZZA./", "obj_npc_room_animated_slash_Other_10_gml_41_0");
        global.msg[2] = stringsetloc("* .../", "obj_npc_room_animated_slash_Other_10_gml_42_0");
        global.msg[3] = stringsetloc("* ... H..^1. Hey^1!&* Hey^1, wait a second!/", "obj_npc_room_animated_slash_Other_10_gml_43_0");
        global.msg[4] = stringsetloc("* I recognize you!/%", "obj_npc_room_animated_slash_Other_10_gml_44_0");
        with (obj_town_event)
            con = 20;
    }
}
if (room == room_diner)
{
    if (global.chapter == 1)
    {
        global.msg[0] = stringsetloc("* I like the vibe of the waitresses here^1.&* Maybe I should sign up^1, too.../", "obj_npc_room_animated_slash_Other_10_gml_51_0");
        global.msg[1] = stringsetloc("* ... Nah^1, serving drinks wouldn't really suit a fire elemental./", "obj_npc_room_animated_slash_Other_10_gml_52_0");
        global.msg[2] = stringsetloc("* If I got nervous^1, I'd just melt all the ice./%", "obj_npc_room_animated_slash_Other_10_gml_53_0");
        if (talked >= 1)
            global.msg[0] = stringsetloc("* What if I just served coffee^1?&* Nah^1, that sounds like a lawsuit waiting to happen.../%", "obj_npc_room_animated_slash_Other_10_gml_56_0");
    }
    if (global.chapter >= 2)
    {
        if (sprite_index == spr_npc_catti_mom_no1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* WOO!!^1! Catti!^1! You go^1, girl!!!/", "obj_npc_room_animated_slash_Other_10_gml_70_0");
            msgnextloc("* Show those customers who's boss^1, little lady!!/", "obj_npc_room_animated_slash_Other_10_gml_71_0");
            msgnextloc("* Kick their toosh!^1! Woo!!^1! Beat them down!^1! You got this!!/%", "obj_npc_room_animated_slash_Other_10_gml_72_0");
        }
        if (sprite_index == spr_npc_catty_ukelele)
        {
            global.msc = 1039;
            scr_text(global.msc);
        }
        if (global.chapter == 4)
        {
            if (sprite_index == spr_npc_icee_suit_platter)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* GREASE ME UP^1, CHIEF!/%", "obj_npc_room_animated_slash_Other_10_gml_91_0");
            }
        }
    }
}
if (room == room_cc_clover)
    global.msg[0] = stringsetloc("* (It's a boombox.^1)&* (It's playing clubs music.)/%", "obj_npc_room_animated_slash_Other_10_gml_62_0");
if (room == room_dw_ralsei_castle_front)
{
    if (sprite_index == spr_npc_trashy)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Oh boy^1, oh boy!^1! I'm Trashy!^1! Haha!!/", "obj_npc_room_animated_slash_Other_10_gml_94_0_b");
        msgnextloc("* I bet I'm gonna make a lot of new friends!!/%", "obj_npc_room_animated_slash_Other_10_gml_95_0");
    }
    if (extflag == "tasque")
    {
        snd_play(snd_electric_meow);
        myinteract = 3;
        mydialoguer = -1;
        exit;
    }
    if (extflag == "poppup")
    {
        snd_play(snd_bwaap);
        myinteract = 3;
        mydialoguer = -1;
        exit;
    }
    if (extflag == "maus")
    {
        snd_play(snd_mouse);
        myinteract = 3;
        mydialoguer = -1;
        exit;
    }
    if (extflag == "cround")
    {
        snd_play_x(snd_mouse, 0.7, 0.8);
        myinteract = 3;
        mydialoguer = -1;
        exit;
    }
}
if (room == room_dw_ralsei_castle_1f)
{
    scr_speaker("susie");
    msgsetloc(0, "\\E7* Can you make a cheesecake this time!?/", "obj_npc_room_animated_slash_Other_10_gml_150_0_b");
    scr_anyface_next("ralsei", 26);
    msgnextloc("\\EQ* Umm^1, let's head upstairs^1, first.../%", "obj_npc_room_animated_slash_Other_10_gml_152_0_b");
    if (scr_flag_get(1514) > 0)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E9* (Hey^1, Kris^1, let's make Ralsei a cake next time!)/", "obj_npc_room_animated_slash_Other_10_gml_158_0");
        msgnextloc("\\EB* (..^1. just help me find the ignition on this thing...)/%", "obj_npc_room_animated_slash_Other_10_gml_159_0");
    }
}
if (room == room_lw_icee_pizza)
{
    if (sprite_index == spr_npc_warrior)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* THE PIZZA'S SAUCE IS BOILING RED./", "obj_npc_room_animated_slash_Other_10_gml_150_0");
        msgnextloc("* BURBLING^1, BURNING LIKE MY BLOOD YEARNS FOR BATTLE!!!/", "obj_npc_room_animated_slash_Other_10_gml_151_0");
        msgnextloc("* HAAAAAAAAAAAAAAAHHHHH!!!!!/", "obj_npc_room_animated_slash_Other_10_gml_152_0");
        msgnextloc("* I^1, THE WARRIOR^1, SHALL SHOW IT THE WIZARD'S FIST!!!/%", "obj_npc_room_animated_slash_Other_10_gml_153_0");
    }
}
if (room == room_townhall)
{
    if (sprite_index == spr_npc_icee_suit)
    {
        msgsetloc(0, "* PUT ME IN^1, COACH!!!/", "obj_npc_room_animated_slash_Other_10_gml_161_0");
        msgnextloc("* PUT ME IN!!!/%", "obj_npc_room_animated_slash_Other_10_gml_162_0");
    }
}
if (room == room_dw_castle_dungeon)
{
    if (sprite_index == spr_smallcheckers_front)
        msgsetloc(0, "* (It's violently protecting the jail.)/%", "obj_npc_room_animated_slash_Other_10_gml_170_0");
    if (sprite_index == spr_smallcheckers_sleep)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's doing an absolutely reprehensible job of protecting the jail.)/%", "obj_npc_room_animated_slash_Other_10_gml_194_0");
    }
}
if (room == room_dw_castle_town)
{
    if (extflag == "swatchling")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Oh^1, boss. You know I respect your decisions.../", "obj_npc_room_animated_slash_Other_10_gml_205_0");
            msgnextloc("* But^1, this Zapper creature you recruited is a bit..^1. much./", "obj_npc_room_animated_slash_Other_10_gml_206_0");
            msgnextloc("* I have everything handled^1, so why not let him retire?/%", "obj_npc_room_animated_slash_Other_10_gml_207_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* He tried to wipe his face with my little bunny here.../", "obj_npc_room_animated_slash_Other_10_gml_211_0");
            msgnextloc("* So now we are having a bit of a cleaning contest./", "obj_npc_room_animated_slash_Other_10_gml_212_0");
            msgnextloc("* ..^1. but he's such a CLOD^1, his very presence dirties the ground!/%", "obj_npc_room_animated_slash_Other_10_gml_213_0");
        }
    }
    else if (extflag == "ribbick")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Ribbit^1, ribbit.../", "obj_npc_room_animated_slash_Other_10_gml_218_0");
        msgnextloc("* (It's supporting Zapper out of fear.)/%", "obj_npc_room_animated_slash_Other_10_gml_219_0");
    }
    else if (extflag == "rabbick")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's doing its best to cheer Swatchling on.)/", "obj_npc_room_animated_slash_Other_10_gml_223_0");
        msgnextloc("* (Doki-doki. Sukkiri.)/%", "obj_npc_room_animated_slash_Other_10_gml_224_0");
    }
}
if (room == room_town_church)
{
    if (talked == 0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Having a wide-open space is great for us kids./", "obj_npc_room_animated_slash_Other_10_gml_374_0");
        msgnextloc("* Sometimes it's good to get your freak out./%", "obj_npc_room_animated_slash_Other_10_gml_375_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* And sometimes..^1. It's bad to get your freak out./%", "obj_npc_room_animated_slash_Other_10_gml_379_0");
    }
    if (extflag == "wolf_ribbon")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ice Wolf prepares for the Festival. Call me Faw Faw./%", "obj_npc_room_slash_Other_10_gml_1189_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Mayor ordered Ice Wolf to buy flowers..^1. Nice business for Flower Man./%", "obj_npc_room_slash_Other_10_gml_1193_0");
        }
    }
}
if (room == room_darkness_example)
{
    if (instance_exists(obj_followinglight) && obj_followinglight.timer <= 0)
    {
        scr_speaker("no_name");
        if (talked == 0)
            msgsetloc(0, "* (..^1.it's too dark to hear anything.)/%", "obj_npc_room_animated_slash_Other_10_gml_374_0");
        else
            msgsetloc(0, "* And sometimes... it's too dark get your freak out./%", "obj_npc_room_animated_slash_Other_10_gml_374_0");
        talked--;
    }
    else if (talked == 0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Having a pitch-back space is great for us kids./", "obj_npc_room_animated_slash_Other_10_gml_374_0");
        msgnextloc("* Sometimes it's good to get your freak out./%", "obj_npc_room_animated_slash_Other_10_gml_375_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* And sometimes..^1. It's bad to get your freak out./%", "obj_npc_room_animated_slash_Other_10_gml_379_0");
    }
}
if (room == room_darkness_example_2)
{
    scr_speaker("no_name");
    msgset(0, "* Yes?/%");
}
if (room == room_dw_ralsei_castle_2f)
{
    scr_speaker("no_name");
    msgsetloc(0, "* I keep ending up in this situation.../", "obj_npc_room_animated_slash_Other_10_gml_605_0");
    msgnextloc("* Can't say I'm a fan...^1. Or can I?/%", "obj_npc_room_animated_slash_Other_10_gml_606_0");
}
if (room == room_castle_tutorial)
{
    if (global.chapter == 2)
    {
        if (sprite_index == spr_npc_sweet)
        {
            scr_miniface_init_sweet();
            scr_speaker("no_name");
            msgsetloc(0, "\\m1\t\t*This town's great!/", "obj_npc_room_animated_slash_Other_10_gml_611_0");
            msgnextloc("\\m1\t\t*Just^1, wish everyone else was&\there^1, too.../%", "obj_npc_room_animated_slash_Other_10_gml_612_0_b");
        }
        if (sprite_index == spr_npc_hatguy)
        {
            if (talked == 0)
            {
                scr_miniface_init_sweet();
                scr_speaker("no_name");
                msgsetloc(0, "\\m3\t\t*Yo^1, chief. If you \\cYrecruit\\cW&\tenough fans for us^1,/", "obj_npc_room_animated_slash_Other_10_gml_622_0");
                msgnextloc("\\m3\t\t*We might be able to make our&\tmusic shop again.../", "obj_npc_room_animated_slash_Other_10_gml_623_0");
                msgnextloc("\\m3\t\t*Hey^1, we might even give you a&\t\\cYdiscount\\cW!/%", "obj_npc_room_animated_slash_Other_10_gml_624_0");
            }
            else
            {
                scr_miniface_init_sweet();
                scr_speaker("no_name");
                msgsetloc(0, "\\m3\t\t*Ya hear that^1, chief? Keep up&\tthe recruiting.../%", "obj_npc_room_animated_slash_Other_10_gml_630_0");
            }
        }
        if (sprite_index == spr_npc_kk)
        {
            scr_miniface_init_sweet();
            scr_speaker("no_name");
            msgsetloc(0, "\\m2\t\t*I got to keep my box./%", "obj_npc_room_animated_slash_Other_10_gml_639_0");
        }
    }
    if (global.chapter == 4)
    {
        if (sprite_index == spr_diamond_fan)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I'm trying to start a \"fan club\" but we don't have any members./", "obj_npc_room_animated_slash_Other_10_gml_327_0");
            msgnextloc("* Think you could recruit anyone^1, chief...?/%", "obj_npc_room_animated_slash_Other_10_gml_328_0");
            if (extflag == "has_recruits")
            {
                if (talked == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Look guys^1, it's in the wrist. The wrist./", "obj_npc_room_animated_slash_Other_10_gml_335_0");
                    msgnextloc("* You wanna be part of the Fan Club^1, you gotta be good at fanning!/%", "obj_npc_room_animated_slash_Other_10_gml_336_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* Boss^1, you wanna learn how to fan? Or are you just a fan of fanning?/%", "obj_npc_room_animated_slash_Other_10_gml_340_0");
                }
            }
        }
        if (sprite_index == spr_npc_shadowman_fan)
        {
            var sax_files = [511, 167, 567, 148];
            var sax_index = irandom(array_length_1d(sax_files) - 1);
            snd_play(sax_files[sax_index]);
            myinteract = 3;
            mydialoguer = -1;
            exit;
        }
        if (sprite_index == spr_npc_coody_leaf)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Munf^1, munf...)/", "obj_npc_room_animated_slash_Other_10_gml_359_0");
            msgnextloc("* Such is the way of the worm.../%", "obj_npc_room_animated_slash_Other_10_gml_360_0");
        }
        if (sprite_index == spr_npc_swatchling_fan)
        {
            if (talked == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* A powerful computer like Our Lady Grace needs powerful fans!/%", "obj_npc_room_animated_slash_Other_10_gml_368_0_b");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* This is how ancient people cooled their computers..^1. right?/%", "obj_npc_room_animated_slash_Other_10_gml_372_0");
            }
        }
    }
}
if (room == room_lw_noellehouse_main)
{
    global.msc = 1264;
    scr_text(global.msc);
}
if (room == room_lw_church_main)
{
    if (sprite_index == spr_npc_catti_mom_no1_full)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Code? If you mean the code to success^1, look at MY man and MY girl!/", "obj_npc_room_animated_slash_Other_10_gml_393_0");
            msgnextloc("* They knocked out the whole damn congregation!^1! Way to go^1, family!!/%", "obj_npc_room_animated_slash_Other_10_gml_394_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* The congregation was MASSACRED^1! They got SHUT down!/", "obj_npc_room_animated_slash_Other_10_gml_398_0");
            msgnextloc("* No one will ever come here again!!^1! Cattenheimers stay WINNING!/%", "obj_npc_room_animated_slash_Other_10_gml_399_0");
        }
    }
}
if (room == room_town_south)
{
    if (sprite_index == spr_npc_snailcar)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* No cops^1, no speed limit^1! I can go as slow as I want!/%", "obj_npc_room_animated_slash_Other_10_gml_409_0");
    }
}
if (room == room_alphysalley)
{
    if (scr_flag_get(760) == 0)
        scr_flag_set(760, 1);
    if (talked == 0)
    {
        scr_speaker("catty");
        msgsetloc(0, "\\E8* OMG^1! Krissy!!^1! Do you^1, like^1, want some of my free milk!?/", "obj_npc_room_animated_slash_Other_10_gml_423_0");
        scr_anyface_next("susie", 5);
        msgnextloc("\\E5* (That's MY free milk^1, you furry freak...)/%", "obj_npc_room_animated_slash_Other_10_gml_425_0");
    }
    else
    {
        scr_speaker("catty");
        msgsetloc(0, "\\E6* Like^1, don't be shy^1! It's my milk and I love sharing!!/", "obj_npc_room_animated_slash_Other_10_gml_429_0");
        scr_anyface_next("susie", 17);
        msgnextloc("\\EH* (I'll bury you you goddamn milk pirate)/%", "obj_npc_room_animated_slash_Other_10_gml_431_0");
    }
}
if (room == room_dw_castle_rooms_queen)
{
    if (sprite_index == spr_npc_trashy)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Boy oh boy^1, I'm Trashy^1! I sure love being a wacky roommate!/", "obj_npc_room_animated_slash_Other_10_gml_442_0");
            msgnextloc("* ..^1. I wish. Lately^1, I'M the only one that picks up and puts trash in their body!/%", "obj_npc_room_animated_slash_Other_10_gml_443_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I wish my roommate was a little more like me./", "obj_npc_room_animated_slash_Other_10_gml_447_0");
            msgnextloc("* A giant bouncy trashcan^1, but with big red lips and eyelashes like a girl. Mmm.../%", "obj_npc_room_animated_slash_Other_10_gml_448_0");
        }
    }
}
if (room == room_dw_castle_rooms_tenna)
{
    if (sprite_index == spr_tenna_dance_cabbage_smol)
    {
        if (talked == 0)
        {
            with (obj_room_castle_tenna)
                tenna_con = 0;
            myinteract = 3;
            mydialoguer = -1;
            talked += 1;
            exit;
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EK* ..^1. aren't you normally way bigger?/", "obj_npc_room_animated_slash_Other_10_gml_466_0");
            scr_anyface_next("tenna", 0);
            msgnextloc("* Everything's bigger on TV^1, kid^1! Hahaha^1! Hahahaha!/", "obj_npc_room_animated_slash_Other_10_gml_468_0");
            msgnextloc("* Please find someone to adopt me/%", "obj_npc_room_animated_slash_Other_10_gml_469_0");
        }
    }
}
if (room == room_cc_lancer)
{
    if (sprite_index == spr_ponman_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It is receiving enrichment from tamping the soft soil.)/%", "obj_npc_room_animated_slash_Other_10_gml_479_0");
    }
    if (sprite_index == spr_npc_hacker_grass)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Psst. It's me^1, da Hacker. I'm gathering gween gween's for a secret Life's Hack./", "obj_npc_room_animated_slash_Other_10_gml_487_0");
            msgnextloc("* Get a terrariam for your computer^1, and you can touch grass as you game./%", "obj_npc_room_animated_slash_Other_10_gml_488_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* If you're a married from a girl^1, any Life's Hack^1, is a Wife's Hack./%", "obj_npc_room_animated_slash_Other_10_gml_492_0");
        }
    }
    if (sprite_index == spr_npc_swatchling_peck)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Hmm? What am I doing^1, boss? Oh^1, just^1, er..^1. g-gathering worms^1, you see.../", "obj_npc_room_animated_slash_Other_10_gml_499_0");
        msgnextloc("* ..^1. Don't tell anyone^1, but I kind of want to work for that..^1. Rouxls Kaard./%", "obj_npc_room_animated_slash_Other_10_gml_500_0");
    }
}
if (room == room_dw_church_gersonstudy)
{
    if (extflag == "guei_study")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like it's studying.)/%", "obj_npc_room_animated_slash_Other_10_gml_509_0");
    }
    else if (extflag == "guei_top")
    {
        snd_play(snd_motor_ghost);
        myinteract = 3;
        mydialoguer = -1;
        exit;
    }
}
if (room == room_town_noellehouse)
{
    if (extflag == "asgore")
    {
        global.msc = 1435;
        scr_text(global.msc);
    }
}
if (room == room_dw_castle_cafe)
{
    if (extflag == "shadowguy_dance")
    {
        var sax_files = [511, 167, 567];
        var sax_index = irandom(array_length(sax_files) - 1);
        snd_play(sax_files[sax_index]);
        myinteract = 3;
        mydialoguer = -1;
        exit;
    }
    if (extflag == "tasque_dance")
    {
        snd_play(snd_electric_meow);
        myinteract = 3;
        mydialoguer = -1;
        exit;
    }
}
if (room == room_dw_castle_dojo)
{
    if (sprite_index == spr_hatguy_idle)
    {
        if (talked == 0)
        {
            scr_miniface_init_sweet();
            scr_speaker("no_name");
            msgsetloc(0, "\\m3\t\t*Hey^1, boss. Thought the Dojo&\tcould use some new beats.../", "obj_npc_room_animated_slash_Other_10_gml_558_0");
            msgnextloc("\\m3\t\t*Maybe something a little&\tromantic-like^1, for the&\tmadamoizels?/%", "obj_npc_room_animated_slash_Other_10_gml_559_0");
        }
        else
        {
            scr_miniface_init_sweet();
            scr_speaker("no_name");
            msgsetloc(0, "\\m3\t\t*I didn't know there was a&\tthree-for-one babes deal in&\ttown^1, boss!/", "obj_npc_room_animated_slash_Other_10_gml_564_0");
            msgnextloc("\\m3\t\t*I'm gonna give these fine&\tladies the reverse-diss of&\ta lifetime.../%", "obj_npc_room_animated_slash_Other_10_gml_565_0");
        }
    }
}
myinteract = 3;
mydialoguer = instance_create(0, 0, obj_dialoguer);
talked += 1;
