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
}
if (room == room_dw_ralsei_castle_1f)
{
    if (global.flag[304] == 0)
    {
        scr_speaker("ralsei");
        msgsetloc(0, "\\E2* Oh!^1! I nearly forgot!^1! This is where I cook!!/", "obj_npc_room_animated_slash_Other_10_gml_94_0");
        scr_anyface_next("susie", "K");
        msgnextloc("\\EK* You cook everything in a giant witch's pot...?/", "obj_npc_room_animated_slash_Other_10_gml_96_0");
        scr_anyface_next("ralsei", 2);
        msgnextloc("\\EH* Of course^1! Cauldron-cooking is very convenient!/%", "obj_npc_room_animated_slash_Other_10_gml_98_0");
    }
    else
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E7* Okay^1, now make a chocolate one!/", "obj_npc_room_animated_slash_Other_10_gml_104_0");
        scr_anyface_next("ralsei", 26);
        msgnextloc("\\EQ* Why don't we go upstairs first?/%", "obj_npc_room_animated_slash_Other_10_gml_106_0");
        if (global.plot >= 15)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E7* How 'bout a strawberry cake as a room-warming gift?/", "obj_npc_room_animated_slash_Other_10_gml_112_0");
            scr_anyface_next("ralsei", 26);
            msgnextloc("\\EQ* There's a slice of cake in your fridge^1, Susie!/", "obj_npc_room_animated_slash_Other_10_gml_114_0");
            scr_anyface_next("susie", 22);
            msgnextloc("\\EM* But it's not cauldron-fresh!/%", "obj_npc_room_animated_slash_Other_10_gml_116_0");
        }
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
}
if (room == room_dw_castle_town)
{
    if (sprite_index == spr_npc_swatchling_sweep)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Young masters^1! Thank you for such a wide space to clean!/", "obj_npc_room_animated_slash_Other_10_gml_303_0");
        msgnextloc("* The people here have such clean hearts as well./", "obj_npc_room_animated_slash_Other_10_gml_304_0");
        msgnextloc("* (Sukkiri.)/%", "obj_npc_room_animated_slash_Other_10_gml_305_0");
    }
    if (sprite_index == spr_npc_rabbick_sweep)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's nice to make friends that like good clean fun!/", "obj_npc_room_animated_slash_Other_10_gml_311_0");
        msgnextloc("* (Sukkiri.)/%", "obj_npc_room_animated_slash_Other_10_gml_312_0");
    }
    if (sprite_index == spr_virovirokun_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Uh-huh^1, uh-huh^1! I wonder if she'll be back.../", "obj_npc_room_animated_slash_Other_10_gml_318_0");
        msgnextloc("* 'ey boss^1! We're just reminiscing about fighting you!/%", "obj_npc_room_animated_slash_Other_10_gml_319_0");
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
}
if (room == room_dw_ralsei_castle_2f)
{
    scr_speaker("no_name");
    msgsetloc(0, "* I keep ending up in this situation.../", "obj_npc_room_animated_slash_Other_10_gml_605_0");
    msgnextloc("* Can't say I'm a fan...^1. Or can I?/%", "obj_npc_room_animated_slash_Other_10_gml_606_0");
}
if (room == room_castle_tutorial)
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
if (room == room_dw_green_room)
{
    if (sprite_index == spr_npc_pippins_gaming)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Why are they being so dramatic? They only got second./%", "obj_npc_room_animated_slash_Other_10_gml_253_0");
    }
    if (extflag == "elnina_gaming")
    {
        if (scr_flag_get(1210) == 0)
        {
            with (obj_room_green_room)
                con = 150;
            talked++;
            myinteract = 0;
            exit;
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Thanks^1, Kris^1! You're a real cucumber^1, you know? Umm^1, not a cool one^1, but.../%", "obj_npc_room_animated_slash_Other_10_gml_267_0");
        }
    }
    if (extflag == "susie_gaming")
    {
        if (talked == 0)
        {
            with (obj_room_green_room)
                con = 24;
            talked++;
            myinteract = 0;
            exit;
        }
        else
        {
            with (obj_room_green_room)
                con = 35;
            talked++;
            myinteract = 0;
            exit;
        }
    }
    if (extflag == "lancer")
    {
        if (global.plot >= 150)
        {
        }
        else
        {
            with (obj_room_green_room)
                con = 60;
            talked++;
            myinteract = 0;
            exit;
        }
    }
}
if (room == room_dw_changing_room)
{
    if (sprite_index == spr_npc_rouxls_makeup)
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Who be-eth^1, who be-eth?/", "obj_npc_room_animated_slash_Other_10_gml_314_0");
            msgnextloc("* If you wanteth mine Authographe^1, getteth in line.../%", "obj_npc_room_animated_slash_Other_10_gml_315_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Who be-eth^1, who be-eth?/", "obj_npc_room_animated_slash_Other_10_gml_320_0");
            msgnextloc("* Don't bothereth me when I'm doingst mine makeup.../%", "obj_npc_room_animated_slash_Other_10_gml_321_0");
        }
    }
}
if (room == room_dw_b3bs_rouxls_lanina)
{
    if (extflag == "controller")
    {
        global.msc = 1278;
        scr_text(global.msc);
    }
    if (extflag == "elnina")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* U-umm^1, Rouxls^1, how long do I have to cry...?/", "obj_npc_room_animated_slash_Other_10_gml_345_0");
            scr_anyface_next("rouxls", "0");
            msgnextloc("\\E0* If I know Pippinses^1, they liketh Pool./", "obj_npc_room_animated_slash_Other_10_gml_347_0");
            msgnextloc("\\E3* So if we filleth up \"Pools\" with thine Tearse.../", "obj_npc_room_animated_slash_Other_10_gml_348_0");
            msgnextloc("\\E4* Then...?/", "obj_npc_room_animated_slash_Other_10_gml_349_0");
            msgnextloc("\\E1* .../", "obj_npc_room_animated_slash_Other_10_gml_350_0");
            msgnextloc("\\E6* THEN??? ANY ONE???/%", "obj_npc_room_animated_slash_Other_10_gml_351_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Hope we get to play something else..^1. later.../%", "obj_npc_room_animated_slash_Other_10_gml_356_0");
        }
    }
    if (extflag == "lanino")
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* U-umm^1, Rouxls^1, I.../", "obj_npc_room_animated_slash_Other_10_gml_365_0");
            scr_anyface_next("rouxls", 0);
            msgnextloc("\\E0* Oh^1, Lanino deareth^1, don't crye./", "obj_npc_room_animated_slash_Other_10_gml_367_0");
            msgnextloc("\\E4* That's one the first Rules of Relationshipse./", "obj_npc_room_animated_slash_Other_10_gml_368_0");
            msgnextloc("\\E6* Also^1, thoust crying ability seems Uselesse./%", "obj_npc_room_animated_slash_Other_10_gml_369_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I..^1. I can't help it.../%", "obj_npc_room_animated_slash_Other_10_gml_374_0_b");
        }
    }
}
if (room == room_cutscene_tester)
{
    scr_funnytext_init(0, 0, 0, 2916, 0, 0);
    scr_speaker("tenna");
    msgset(0, "* \\O0^1/");
    msgnext("* This room is \\O0^1, isn't it?? Let's go again!!!/");
    msgnext("* IT WAS!!! It was terribly \\O0^1!!! Let's go!!!/");
    msgnext("* Let's! Go!!!! Again!!!! Don't you want to have terrible \\O0^1 again??/%");
}
myinteract = 3;
mydialoguer = instance_create(0, 0, obj_dialoguer);
talked += 1;
