function scr_itemuse(arg0)
{
    w = arg0;
    usable = 0;
    replaceable = 0;
    if (global.charselect < 3)
        _gc = global.char[global.charselect];
    suspos = -1;
    ralpos = -1;
    noepos = -1;
    for (i = 0; i < 3; i += 1)
    {
        if (global.char[i] == 2)
            suspos = i;
        if (global.char[i] == 3)
            ralpos = i;
        if (global.char[i] == 4)
            noepos = i;
    }
    switch (arg0)
    {
        case 0:
            itemnameb = " ";
            itemdescb = "---";
            break;
        case 1:
            scr_healitem(global.charselect, 40);
            usable = 1;
            if (_gc == 2)
                scr_itemcomment(global.charselect, stringsetloc("Yeahh!! That's good!", "scr_itemuse_slash_scr_itemuse_gml_31_0"));
            if (_gc == 3)
            {
                if (scr_havechar(2))
                    scr_itemcomment(suspos, stringsetloc("Hey, feed ME!!!", "scr_itemuse_slash_scr_itemuse_gml_36_0"));
                scr_itemcomment(global.charselect, stringsetloc("Yummy!!! Marshmallows!!", "scr_itemuse_slash_scr_itemuse_gml_38_0"));
            }
            if (_gc == 4)
                scr_itemcomment(global.charselect, stringsetloc("Oh, it's... sticky?", "scr_itemuse_slash_scr_itemuse_gml_42_0"));
            break;
        case 2:
            reviveamt = ceil(global.maxhp[global.char[global.charselect]] / 2);
            scr_healitem(global.charselect, reviveamt);
            usable = 1;
            if (_gc == 2)
            {
                if (scr_havechar("susie"))
                    scr_itemcomment(suspos, stringsetloc("I'm ALIVE!!!", "scr_itemuse_slash_scr_itemuse_gml_54_0"));
                if (scr_havechar("ralsei"))
                    scr_itemcomment(ralpos, stringsetloc("(You weren't dead)", "scr_itemuse_slash_scr_itemuse_gml_55_0"));
            }
            if (_gc == 3)
            {
                if (scr_havechar("susie"))
                    scr_itemcomment(suspos, stringsetloc("(Don't look it)", "scr_itemuse_slash_scr_itemuse_gml_60_0"));
                if (scr_havechar("ralsei"))
                    scr_itemcomment(ralpos, stringsetloc("Ah, I'm refreshed!", "scr_itemuse_slash_scr_itemuse_gml_61_0"));
            }
            if (_gc == 4)
                scr_itemcomment(global.charselect, stringsetloc("Mints? I love mints!", "scr_itemuse_slash_scr_itemuse_gml_65_0"));
            break;
        case 4:
            global.interact = 6;
            with (obj_darkcontroller)
                charcon = 0;
            global.menuno = -1;
            charcon = 0;
            global.fc = 0;
            global.fe = 0;
            global.typer = 6;
            global.msg[0] = stringsetloc("* (You tried to read the manual^1, but it was so dense it made your head spin...)/%", "scr_itemuse_slash_scr_itemuse_gml_82_0");
            instance_create(0, 0, obj_dialoguer);
            break;
        case 5:
            scr_healitem(global.charselect, 20);
            usable = 1;
            break;
        case 6:
            scr_healitem_all(160);
            if (scr_havechar(2))
                scr_itemcomment(suspos, stringsetloc("Mmm, seconds!", "scr_itemuse_slash_scr_itemuse_gml_94_0"));
            if (scr_havechar(3))
                scr_itemcomment(ralpos, stringsetloc("Whoops.", "scr_itemuse_slash_scr_itemuse_gml_95_0"));
            if (scr_havechar(4))
                scr_itemcomment(noepos, stringsetloc("Happy birthday! Haha!", "scr_itemuse_slash_scr_itemuse_gml_96_0"));
            usable = 1;
            break;
        case 7:
            var healamount = 80;
            if (global.chapter == 2)
                healamount = 140;
            if (global.chapter == 3)
                healamount = 150;
            if (global.chapter == 4)
                healamount = 160;
            scr_healitem_all(healamount);
            if (scr_havechar(2))
                scr_itemcomment(suspos, stringsetloc("I'm dizzy.", "scr_itemuse_slash_scr_itemuse_gml_110_0"));
            if (scr_havechar(3))
                scr_itemcomment(ralpos, stringsetloc("Mmm, thank you!", "scr_itemuse_slash_scr_itemuse_gml_111_0"));
            if (scr_havechar(4))
                scr_itemcomment(noepos, stringsetloc("My eyes are spinning...", "scr_itemuse_slash_scr_itemuse_gml_112_0"));
            usable = 1;
            break;
        case 8:
            _healchoice = 70;
            usable = 1;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("Cooked to perfection!", "scr_itemuse_slash_scr_itemuse_gml_123_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("A bit burnt...?", "scr_itemuse_slash_scr_itemuse_gml_127_0"));
            if (global.char[global.charselect] == 4)
            {
                _healchoice = 20;
                scr_itemcomment(global.charselect, stringsetloc("I-is this real meat...?", "scr_itemuse_slash_scr_itemuse_gml_132_0"));
            }
            scr_healitem(global.charselect, _healchoice);
            break;
        case 9:
            scr_healitem(global.charselect, 1);
            usable = 1;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("Mmm... face", "scr_itemuse_slash_scr_itemuse_gml_143_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("(uncomfortable)", "scr_itemuse_slash_scr_itemuse_gml_147_0"));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, stringsetloc("Umm, what is this? It's cute...", "scr_itemuse_slash_scr_itemuse_gml_151_0"));
            break;
        case 10:
            _healchoice = 4;
            usable = 1;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("Why this!?", "scr_itemuse_slash_scr_itemuse_gml_161_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("Let's be healthy!", "scr_itemuse_slash_scr_itemuse_gml_165_0"));
            if (global.char[global.charselect] == 4)
            {
                scr_itemcomment(global.charselect, stringsetloc("Something to graze on!", "scr_itemuse_slash_scr_itemuse_gml_169_0"));
                _healchoice = 90;
            }
            scr_healitem(global.charselect, _healchoice);
            break;
        case 11:
            scr_healitem_all(70);
            if (scr_havechar(2))
                scr_itemcomment(suspos, stringsetloc("Quit hogging!", "scr_itemuse_slash_scr_itemuse_gml_177_0"));
            if (scr_havechar(3))
                scr_itemcomment(ralpos, stringsetloc("(It's cut evenly...)", "scr_itemuse_slash_scr_itemuse_gml_178_0"));
            if (scr_havechar(4))
                scr_itemcomment(noepos, stringsetloc("(Kris took two thirds of it...)", "scr_itemuse_slash_scr_itemuse_gml_179_0"));
            usable = 1;
            break;
        case 12:
            usable = 1;
            if (global.char[global.charselect] == 1)
                scr_healitem(global.charselect, 20);
            if (global.char[global.charselect] == 2)
            {
                scr_healitem(global.charselect, 80);
                scr_itemcomment(global.charselect, stringsetloc("Mmm, blood!", "scr_itemuse_slash_scr_itemuse_gml_193_0"));
            }
            if (global.char[global.charselect] == 3)
            {
                scr_healitem(global.charselect, 50);
                scr_itemcomment(global.charselect, stringsetloc("Aah, sticky...", "scr_itemuse_slash_scr_itemuse_gml_198_0"));
            }
            if (global.char[global.charselect] == 4)
            {
                scr_healitem(global.charselect, 30);
                scr_itemcomment(global.charselect, stringsetloc("Mmm... what!? It's blood!?", "scr_itemuse_slash_scr_itemuse_gml_203_0"));
            }
            break;
        case 13:
            usable = 1;
            if (global.char[global.charselect] == 1)
                scr_healitem(global.charselect, 80);
            if (global.char[global.charselect] == 2)
            {
                scr_healitem(global.charselect, 20);
                scr_itemcomment(global.charselect, stringsetloc("THAT'S it?", "scr_itemuse_slash_scr_itemuse_gml_217_0"));
            }
            if (global.char[global.charselect] == 3)
            {
                scr_healitem(global.charselect, 50);
                scr_itemcomment(global.charselect, stringsetloc("Aww, thanks, Kris!", "scr_itemuse_slash_scr_itemuse_gml_222_0"));
            }
            if (global.char[global.charselect] == 4)
            {
                scr_healitem(0, 35);
                scr_healitem(global.charselect, 35);
                scr_itemcomment(global.charselect, stringsetloc("Umm, it's ok, Kris, I'll share...", "scr_itemuse_slash_scr_itemuse_gml_229_0"));
            }
            break;
        case 14:
            usable = 1;
            scr_healitem(global.charselect, 500);
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("(It's SO good!)", "scr_itemuse_slash_scr_itemuse_gml_239_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("K-Kris!? I...", "scr_itemuse_slash_scr_itemuse_gml_243_0"));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, stringsetloc("(Huh? I didn't know Kris liked this flavor.)", "scr_itemuse_slash_scr_itemuse_gml_247_0"));
            break;
        case 15:
            scr_healitem(global.charselect, 50);
            usable = 1;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("Cool, it's wriggling.", "scr_itemuse_slash_scr_itemuse_gml_257_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("Yum, is this spaghetti?", "scr_itemuse_slash_scr_itemuse_gml_261_0"));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, stringsetloc("Tastes like... jumprope?", "scr_itemuse_slash_scr_itemuse_gml_265_0"));
            break;
        case 16:
            scr_healitem(global.charselect, 80);
            usable = 1;
            if (_gc == 1)
                snd_play(snd_cd_bagel_kris);
            if (_gc == 2)
            {
                snd_play(snd_cd_bagel_susie);
                scr_itemcomment(global.charselect, stringsetloc("It's got crunch.", "scr_itemuse_slash_scr_itemuse_gml_275_0"));
            }
            if (_gc == 3)
            {
                snd_play(snd_cd_bagel_ralsei);
                scr_itemcomment(global.charselect, stringsetloc("How elegant!", "scr_itemuse_slash_scr_itemuse_gml_279_0"));
            }
            if (_gc == 4)
            {
                snd_play(snd_cd_bagel_noelle);
                scr_itemcomment(global.charselect, stringsetloc("What a nice song...", "scr_itemuse_slash_scr_itemuse_gml_283_0"));
            }
            break;
        case 17:
            scr_speaker("noone");
            msgsetloc(0, "* (The clothes are stuck to the doll...)/", "scr_itemuse_slash_scr_itemuse_gml_290_0");
            msgnextloc("* (There's no way you can use this.)/%", "scr_itemuse_slash_scr_itemuse_gml_291_0");
            scr_itemdialoguer();
            break;
        case 18:
            usable = 1;
            _healamount = 10;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, scr_text(1460));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, scr_text(1461));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, scr_text(1462));
            scr_healitem(global.charselect, _healamount);
            break;
        case 19:
            usable = 1;
            _healamount = 10;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, scr_text(1460));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, scr_text(1461));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, scr_text(1462));
            scr_healitem(global.charselect, _healamount);
            break;
        case 20:
            usable = 1;
            _healamount = 10;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, scr_text(1460));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, scr_text(1461));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, scr_text(1462));
            scr_healitem(global.charselect, _healamount);
            break;
        case 21:
            usable = 1;
            _healamount = 10;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, scr_text(1460));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, scr_text(1461));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, scr_text(1462));
            scr_healitem(global.charselect, _healamount);
            break;
        case 22:
            _healchoice = 60;
            usable = 1;
            replaceable = 8;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("C'mon, gimme the rest!", "scr_itemuse_slash_scr_itemuse_gml_418_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("M-maybe give Susie the rest?", "scr_itemuse_slash_scr_itemuse_gml_422_0"));
            if (global.char[global.charselect] == 4)
            {
                _healchoice = 20;
                scr_itemcomment(global.charselect, stringsetloc("Th... there's MORE!?", "scr_itemuse_slash_scr_itemuse_gml_427_0"));
            }
            scr_healitem(global.charselect, _healchoice);
            break;
        case 23:
            scr_healitem(global.charselect, 120);
            usable = 1;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("Hey, this rules!", "scr_itemuse_slash_scr_itemuse_gml_438_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("Nice and chalky.", "scr_itemuse_slash_scr_itemuse_gml_442_0"));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, stringsetloc("(I-isn't this the chalk I gave her?)", "scr_itemuse_slash_scr_itemuse_gml_446_0"));
            break;
        case 24:
            scr_healitem(global.charselect, 100);
            usable = 1;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("Hell'd you call this!?", "scr_itemuse_slash_scr_itemuse_gml_456_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("I made this.", "scr_itemuse_slash_scr_itemuse_gml_460_0"));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, stringsetloc("B-Brainfreeze! ... kidding!", "scr_itemuse_slash_scr_itemuse_gml_464_0"));
            break;
        case 25:
            scr_healitem_all(30);
            usable = 1;
            if (scr_havechar(2))
                scr_itemcomment(suspos, stringsetloc("I'm NOT wearing it.", "scr_itemuse_slash_scr_itemuse_gml_472_0"));
            if (scr_havechar(3))
                scr_itemcomment(ralpos, stringsetloc("How sweet!", "scr_itemuse_slash_scr_itemuse_gml_473_0"));
            if (scr_havechar(4))
                scr_itemcomment(noepos, stringsetloc("Reminds me of one of my sweaters.", "scr_itemuse_slash_scr_itemuse_gml_474_0"));
            break;
        case 26:
            usable = 1;
            var heal_amount = 90;
            if (global.char[global.charselect] == 1)
                heal_amount = 100;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("It says GUTS!", "scr_itemuse_slash_scr_itemuse_gml_487_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("It says Fluffy...", "scr_itemuse_slash_scr_itemuse_gml_491_0"));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, stringsetloc("I... I can't read these symbols...", "scr_itemuse_slash_scr_itemuse_gml_495_0"));
            scr_healitem(global.charselect, heal_amount);
            break;
        case 27:
            usable = 0;
            scr_speaker("noone");
            global.msg[0] = stringsetloc("* (You felt tense.)/", "scr_itemuse_slash_scr_itemuse_gml_504_0");
            global.msg[1] = stringsetloc("* (... try using it in battle.)/%", "scr_itemuse_slash_scr_itemuse_gml_505_0");
            scr_itemdialoguer();
            break;
        case 28:
            usable = 0;
            scr_speaker("noone");
            global.msg[0] = stringsetloc("* (You felt tense.)/", "scr_itemuse_slash_scr_itemuse_gml_512_0");
            global.msg[1] = stringsetloc("* (... try using it in battle.)/%", "scr_itemuse_slash_scr_itemuse_gml_513_0");
            scr_itemdialoguer();
            break;
        case 29:
            usable = 0;
            scr_speaker("noone");
            global.msg[0] = stringsetloc("* (You felt tense.)/", "scr_itemuse_slash_scr_itemuse_gml_520_0");
            global.msg[1] = stringsetloc("* (... try using it in battle.)/%", "scr_itemuse_slash_scr_itemuse_gml_521_0");
            scr_itemdialoguer();
            break;
        case 30:
            usable = 1;
            scr_healitem_all(10);
            if (scr_havechar(2))
                scr_itemcomment(suspos, stringsetloc("Don't throw dust at me!", "scr_itemuse_slash_scr_itemuse_gml_529_0"));
            if (scr_havechar(3))
                scr_itemcomment(ralpos, stringsetloc("It's minty!", "scr_itemuse_slash_scr_itemuse_gml_530_0"));
            if (scr_havechar(4))
                scr_itemcomment(noepos, stringsetloc("What are you sprinkling?", "scr_itemuse_slash_scr_itemuse_gml_531_0"));
            break;
        case 31:
            usable = 1;
            scr_healitem_all(50);
            if (scr_havechar(2))
                scr_itemcomment(suspos, stringsetloc("Don't throw mints at me!", "scr_itemuse_slash_scr_itemuse_gml_538_0"));
            if (scr_havechar(3))
                scr_itemcomment(ralpos, stringsetloc("It's minty!", "scr_itemuse_slash_scr_itemuse_gml_539_0"));
            if (scr_havechar(4))
                scr_itemcomment(noepos, stringsetloc("What are you throwing?", "scr_itemuse_slash_scr_itemuse_gml_540_0"));
            break;
        case 32:
            if (global.char[global.charselect] != 4)
            {
                global.hp[_gc] = max(global.hp[_gc] - 20, 1);
                snd_play(snd_hurt1);
            }
            usable = 1;
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("Ugh! ...tastes good?", "scr_itemuse_slash_scr_itemuse_gml_553_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("Ow... er, thanks, Kris!", "scr_itemuse_slash_scr_itemuse_gml_557_0"));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, stringsetloc("(I'll... just pretend to drink it...)", "scr_itemuse_slash_scr_itemuse_gml_561_0"));
            break;
        case 33:
            usable = 0;
            scr_speaker("noone");
            global.msg[0] = stringsetloc("* (Where'd this come from?)/%", "scr_itemuse_slash_scr_itemuse_gml_575_0");
            scr_itemdialoguer();
            break;
        case 34:
            usable = 1;
            if (global.char[global.charselect] == 1)
            {
                if (global.filechoice == 1 && scr_havechar("noelle"))
                    scr_itemcomment(noepos, stringsetloc("What are you, a unicorn? Faha.", "scr_itemuse_slash_scr_itemuse_gml_580_0"));
            }
            else
            {
                var item_comment = "";
                if (global.char[global.charselect] == 2)
                {
                    item_comment = stringsetloc("Butterscotch, nice!", "scr_itemuse_slash_scr_itemuse_gml_588_0");
                    if (global.filechoice == 1)
                        item_comment = stringsetloc("Ack, it's leaking!", "scr_itemuse_slash_scr_itemuse_gml_592_0");
                    else if (global.filechoice == 2)
                        item_comment = stringsetloc("... obviously isn't real blood.", "scr_itemuse_slash_scr_itemuse_gml_595_0");
                }
                if (global.char[global.charselect] == 3)
                {
                    item_comment = stringsetloc("Wow, what a nice flavor!", "scr_itemuse_slash_scr_itemuse_gml_600_0");
                    if (global.filechoice == 1)
                        item_comment = stringsetloc("Look at my long nose!", "scr_itemuse_slash_scr_itemuse_gml_604_0");
                    else if (global.filechoice == 2)
                        item_comment = stringsetloc("Rare? I ate a rare item?", "scr_itemuse_slash_scr_itemuse_gml_607_0");
                }
                if (global.char[global.charselect] == 4)
                {
                    item_comment = stringsetloc("Mmm, butterscotch!", "scr_itemuse_slash_scr_itemuse_gml_612_0");
                    if (global.filechoice == 1)
                        item_comment = stringsetloc("\"Brain freeze is for the weak!\"", "scr_itemuse_slash_scr_itemuse_gml_616_0_b");
                    else if (global.filechoice == 2)
                        item_comment = stringsetloc("I can hardly tell it's not, um, real blood.", "scr_itemuse_slash_scr_itemuse_gml_619_0_b");
                }
                scr_itemcomment(global.charselect, item_comment);
            }
            scr_healitem(global.charselect, 100);
            break;
        case 35:
            if (global.char[global.charselect] == 1)
            {
                usable = 1;
                scr_healitem(global.charselect, 100);
                if (scr_havechar("susie"))
                    scr_itemcomment(suspos, stringsetloc("Huh?", "scr_itemuse_slash_scr_itemuse_gml_637_0"));
                if (scr_havechar("ralsei"))
                    scr_itemcomment(ralpos, stringsetloc("Where'd it go?", "scr_itemuse_slash_scr_itemuse_gml_642_0"));
                if (scr_havechar("noelle"))
                    scr_itemcomment(noepos, stringsetloc("Kris! (I wanted that...)", "scr_itemuse_slash_scr_itemuse_gml_647_0"));
            }
            else
            {
                usable = 0;
                if (global.char[global.charselect] == 2)
                    scr_itemcomment(global.charselect, stringsetloc("Hell no.", "scr_itemuse_slash_scr_itemuse_gml_654_0"));
                if (global.char[global.charselect] == 3)
                    scr_itemcomment(global.charselect, stringsetloc("Is... that, um, nutritious?", "scr_itemuse_slash_scr_itemuse_gml_658_0"));
                if (global.char[global.charselect] == 4)
                    scr_itemcomment(global.charselect, stringsetloc("C... Can we keep it?", "scr_itemuse_slash_scr_itemuse_gml_662_0"));
            }
            break;
        case 36:
            usable = 1;
            scr_healitem(global.charselect, 20);
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("Fine, I'll finish it.", "scr_itemuse_slash_scr_itemuse_gml_674_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("Aw, you saved me half?", "scr_itemuse_slash_scr_itemuse_gml_678_0"));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, stringsetloc("(Whatever, it's just Kris's...)", "scr_itemuse_slash_scr_itemuse_gml_682_0"));
            break;
        case 37:
            usable = 1;
            scr_healitem(global.charselect, 80);
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("Like my old school.", "scr_itemuse_slash_scr_itemuse_gml_693_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("Is this legal?", "scr_itemuse_slash_scr_itemuse_gml_697_0"));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, stringsetloc("Here, I refreezed it!", "scr_itemuse_slash_scr_itemuse_gml_701_0"));
            break;
        case 38:
            usable = 1;
            scr_healitem_all(100);
            if (scr_havechar(2))
                scr_itemcomment(suspos, stringsetloc("Rich people eat THIS?", "scr_itemuse_slash_scr_itemuse_gml_710_0"));
            if (scr_havechar(3))
                scr_itemcomment(ralpos, stringsetloc("P... pinky up!", "scr_itemuse_slash_scr_itemuse_gml_711_0"));
            if (scr_havechar(4))
                scr_itemcomment(noepos, stringsetloc("Caviar AGAIN?", "scr_itemuse_slash_scr_itemuse_gml_712_0"));
            break;
        case 39:
            usable = 1;
            scr_healitem(global.charselect, 140);
            if (global.char[global.charselect] == 2)
                scr_itemcomment(global.charselect, stringsetloc("Look, I'm a roach.", "scr_itemuse_slash_scr_itemuse_gml_722_0"));
            if (global.char[global.charselect] == 3)
                scr_itemcomment(global.charselect, stringsetloc("I'm a comfy caterpillar!", "scr_itemuse_slash_scr_itemuse_gml_726_0"));
            if (global.char[global.charselect] == 4)
                scr_itemcomment(global.charselect, stringsetloc("I'm, um, an alien?", "scr_itemuse_slash_scr_itemuse_gml_730_0"));
            break;
        case 300:
            break;
        case 301:
            with (obj_darkcontroller)
                charcon = 0;
            global.menuno = -1;
            charcon = 0;
            global.fc = 0;
            global.fe = 0;
            global.typer = 6;
            snd_play_x(snd_phone, 0.7, 1);
            global.msg[0] = stringsetloc("* (You tried to call on the Cell Phone.)", "scr_itemuse_slash_scr_itemuse_gml_426_0");
            instance_create(0, 0, obj_dialoguer);
            instance_create(0, 0, obj_darkphone_event);
            global.interact = 1;
            break;
        case 302:
            snd_play(snd_egg);
            scr_speaker("noone");
            global.msg[0] = stringsetloc("* (You used the Egg.)/%", "scr_itemuse_slash_scr_itemuse_gml_441_0");
            scr_itemdialoguer();
            break;
        case 308:
            if (scr_sideb_get_phase() < 3 || global.chapter != 2)
            {
                snd_stop(snd_splat);
                snd_play_x(snd_splat, 1, (global.submenucoord[4] / 10) + 0.8);
            }
            else
            {
                snd_stop(snd_petrify);
                snd_play(snd_petrify);
            }
            break;
        case 313:
            if (scr_flag_get(1269) == 0)
            {
                scr_flag_set(1269, 1);
                scr_speaker("no_name");
                msgsetloc(0, "* You held the crystal up to your eye./", "scr_itemuse_slash_scr_itemuse_gml_747_0");
                msgnextloc("* For some strange reason^1, for just a brief moment.../", "scr_itemuse_slash_scr_itemuse_gml_748_0");
                msgnextloc("* You thought you saw the television get smashed to pieces./%", "scr_itemuse_slash_scr_itemuse_gml_749_0");
            }
            else if (scr_flag_get(1270) == 0)
            {
                scr_flag_set(1270, 1);
                scr_speaker("no_name");
                msgsetloc(0, "* You held the crystal up to your eye./", "scr_itemuse_slash_scr_itemuse_gml_624_0");
                msgnextloc("* ..^1. but nothing happened./%", "scr_itemuse_slash_scr_itemuse_gml_625_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* It doesn't seem very useful./%", "scr_itemuse_slash_scr_itemuse_gml_629_0");
            }
            scr_itemdialoguer();
            break;
    }
}
