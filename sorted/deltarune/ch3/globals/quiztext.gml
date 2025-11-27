function scr_quiztext(arg0)
{
    question = "QUESTION?";
    reward = 100;
    penalty = 50;
    correctanswer = 1;
    topic = "DEFAULT";
    answeroption[0] = stringset("ANSWER1");
    answeroption[1] = stringset("ANSWER2");
    answeroption[2] = stringset("ANSWER3");
    answeroption[3] = stringset("ANSWER4");
    commentcount = 1;
    commentcontent[0] = stringsetloc("COMMENT", "scr_quiztext_slash_scr_quiztext_gml_18_0");
    commenttriangle[0] = spr_ch3_ballcon_triangle1;
    commentx[0] = 210;
    commenty[0] = 340;
    commenttriangleside[0] = 0;
    commentchar[0] = 1;
    commentcreatetimer[0] = 30;
    commentdestroytime[0] = 120;
    su_guess = -1;
    ra_guess = -1;
    sprite = -4;
    image = 0;
    extra = false;
    image_timer = 6;
    reward = 100;
    penalty = 20;
    if (arg0 == 12 && global.flag[1083] == 0)
        arg0 = 5;
    switch (arg0)
    {
        case 0:
            su_wait = 150;
            su_guess = 2;
            ra_wait = 180;
            ra_guess = 1;
            question = stringsetloc("WHAT TIME IS IT RIGHT NOW?", "scr_quiztext_slash_scr_quiztext_gml_48_0_b");
            topic = "WHATTIME";
            quizid = "whattime";
            correctanswer = -1;
            answeroption[0] = stringsetloc("TV-THIRTY!", "scr_quiztext_slash_scr_quiztext_gml_53_0_b");
            answeroption[1] = stringsetloc("TV TIME!!!", "scr_quiztext_slash_scr_quiztext_gml_54_0_b");
            answeroption[2] = stringsetloc("PAST MIDNIGHT", "scr_quiztext_slash_scr_quiztext_gml_55_0_b");
            if (current_weekday == 4)
                answeroption[3] = stringsetloc("WEDNESDAY", "scr_quiztext_slash_scr_quiztext_gml_57_0");
            else if (current_weekday == 3 && current_hour == 23 && current_minute >= 59 && current_second >= 40)
                answeroption[3] = stringsetloc("TUESDAY", "scr_quiztext_slash_scr_quiztext_gml_59_0");
            else
                answeroption[3] = stringsetloc("THURSDAY", "scr_quiztext_slash_scr_quiztext_gml_60_0_b");
            commentcount = 1;
            scr_quizcomment(0, stringsetloc("Uhhh...", "scr_quiztext_slash_scr_quiztext_gml_65_0"), 1);
            skiptimer = -180;
            break;
        case 1:
            su_wait = 240;
            su_guess = 1;
            ra_wait = 210;
            ra_guess = 1;
            question = stringsetloc("BRAND A VALUES THIS RALSEI AT $8! WHAT'S THE TRUE VALUE!?", "scr_quiztext_slash_scr_quiztext_gml_75_0_b");
            topic = "RALSEIPLUSH";
            quizid = "ralseiplush";
            sprite = scr_84_get_sprite("spr_quiz_ralsei_plush");
            spritex = 240;
            spritey = 96;
            correctanswer = -1;
            answeroption[0] = stringsetloc("HIGHER", "scr_quiztext_slash_scr_quiztext_gml_83_0_b");
            answeroption[1] = stringsetloc("LOWER", "scr_quiztext_slash_scr_quiztext_gml_84_0_b");
            answeroption[2] = stringsetloc("PRICELESS", "scr_quiztext_slash_scr_quiztext_gml_85_0");
            answeroption[3] = stringsetloc("$32.00 MSRP", "scr_quiztext_slash_scr_quiztext_gml_86_0");
            commentcount = 4;
            scr_quizcomment(0, stringsetloc("Free if#you steal it.", "scr_quiztext_slash_scr_quiztext_gml_91_0"), 1);
            scr_quizcomment(1, stringsetloc("My... value...?", "scr_quiztext_slash_scr_quiztext_gml_92_0"), 2, 90, 90);
            scr_quizcomment(2, stringsetloc("This...?", "scr_quiztext_slash_scr_quiztext_gml_93_0"), 2, 210);
            scr_quizcomment(3, stringsetloc("Assuming you#steal it.", "scr_quiztext_slash_scr_quiztext_gml_94_0"), 1, 255);
            skiptimer = -105;
            break;
        case 2:
            su_wait = 210;
            su_guess = 0;
            ra_wait = 240;
            ra_guess = 0;
            question = stringsetloc("WHAT'S KRIS'S FAVORITE FOOD?", "scr_quiztext_slash_scr_quiztext_gml_95_0");
            topic = "FOOD";
            quizid = "favfood";
            correctanswer = 1;
            answeroption[0] = stringsetloc("CHOCOLATE", "scr_quiztext_slash_scr_quiztext_gml_99_0");
            answeroption[1] = stringsetloc("PIE", "scr_quiztext_slash_scr_quiztext_gml_100_0");
            answeroption[2] = stringsetloc("SALSA", "scr_quiztext_slash_scr_quiztext_gml_101_0");
            answeroption[3] = stringsetloc("JAM", "scr_quiztext_slash_scr_quiztext_gml_102_0");
            commentcount = 3;
            scr_quizcomment(0, stringsetloc("Uh...", "scr_quiztext_slash_scr_quiztext_gml_107_0"), 1);
            scr_quizcomment(1, stringsetloc("Chocolate, duh.", "scr_quiztext_slash_scr_quiztext_gml_108_0"), 1, 210);
            scr_quizcomment(2, stringsetloc("... Chocolate, right?", "scr_quiztext_slash_scr_quiztext_gml_109_0"), 2, 240);
            skiptimer = 180;
            break;
        case 3:
            su_wait = 180;
            su_guess = 0;
            ra_wait = 240;
            ra_guess = 2;
            question = stringsetloc("WHAT IS THE NAME OF THIS SHOW'S HOST?", "scr_quiztext_slash_scr_quiztext_gml_119_0");
            topic = "HOST";
            quizid = "tenna";
            correctanswer = 2;
            answeroption[0] = stringsetloc("MR. TV GUY", "scr_quiztext_slash_scr_quiztext_gml_123_0");
            answeroption[1] = stringsetloc("MR. LIL' NOSE", "scr_quiztext_slash_scr_quiztext_gml_124_0");
            answeroption[2] = stringsetloc("MR. TENNA", "scr_quiztext_slash_scr_quiztext_gml_125_0");
            answeroption[3] = stringsetloc("MR. EMAIL", "scr_quiztext_slash_scr_quiztext_gml_126_0");
            commentcount = 3;
            scr_quizcomment(0, stringsetloc("His LAST name?", "scr_quiztext_slash_scr_quiztext_gml_131_0"), 1);
            scr_quizcomment(1, stringsetloc("His LAST name.", "scr_quiztext_slash_scr_quiztext_gml_132_0"), 1, 180);
            scr_quizcomment(2, stringsetloc("Um...", "scr_quiztext_slash_scr_quiztext_gml_133_0"), 2, 240);
            skiptimer = 150;
            break;
        case 4:
            su_wait = 210;
            su_guess = 3;
            ra_wait = 270;
            ra_guess = 2;
            question = stringsetloc("WHAT IS THE HIGHLY MEMORABLE HEADING OF \"TV TIME?\"", "scr_quiztext_slash_scr_quiztext_gml_143_0");
            topic = "TVTIME";
            quizid = "tvtime";
            correctanswer = 1;
            answeroption[0] = stringsetloc("~DON'T TOUCH THAT DIAL!", "scr_quiztext_slash_scr_quiztext_gml_147_0");
            answeroption[1] = stringsetloc("~MARVELOUS MYSTERY BOARD", "scr_quiztext_slash_scr_quiztext_gml_148_0");
            answeroption[2] = stringsetloc("~MAGICAL MYSTERY BOARD", "scr_quiztext_slash_scr_quiztext_gml_149_0");
            answeroption[3] = stringsetloc("~DON'T LICK THE SCREEN!", "scr_quiztext_slash_scr_quiztext_gml_150_0");
            commentcount = 2;
            scr_quizcomment(0, stringsetloc("This just makes sense.", "scr_quiztext_slash_scr_quiztext_gml_155_0"), 1, 210);
            scr_quizcomment(1, stringsetloc("Everyone loves magic!", "scr_quiztext_slash_scr_quiztext_gml_156_0"), 2, 270);
            skiptimer = 150;
            break;
        case 5:
            su_wait = 30;
            su_guess = 0;
            ra_wait = 150;
            ra_guess = 0;
            schoose = -1;
            susBehavior = 0;
            question = stringsetloc("WHAT'S THE NAME OF THIS KID? SERIOUSLY I DON'T REMEMBER.", "scr_quiztext_slash_scr_quiztext_gml_168_0");
            topic = "KID";
            quizid = "lancer";
            sprite = spr_lancer_dt;
            spritex = 250;
            spritey = 100;
            correctanswer = 0;
            extra = true;
            answeroption[0] = stringsetloc("LANCER", "scr_quiztext_slash_scr_quiztext_gml_176_0");
            answeroption[1] = stringsetloc("DANCER", "scr_quiztext_slash_scr_quiztext_gml_177_0");
            answeroption[2] = stringsetloc("PRANCER", "scr_quiztext_slash_scr_quiztext_gml_178_0");
            answeroption[3] = stringsetloc("MR. GENEROSITY", "scr_quiztext_slash_scr_quiztext_gml_179_0");
            global.flag[1083] = 1;
            commentcount = 1;
            scr_quizcomment(0, stringsetloc("Easy.", "scr_quiztext_slash_scr_quiztext_gml_185_0"), 1);
            skiptimer = -90;
            break;
        case 6:
            su_guess = irandom(3);
            ra_guess = irandom(3);
            correctanswer = irandom(3);
            var _newThrash = global.flag[226] == 0 && global.flag[435] == 0;
            if (_newThrash)
                correctanswer = irandom(2);
            extra_obj = instance_create(camerax() + board_tilex(9), cameray() + board_tiley(3.25), obj_quiz_thrashmachine);
            extra_obj.part[1] = global.flag[220];
            extra_obj.part[0] = global.flag[221];
            extra_obj.part[2] = global.flag[222];
            if (_newThrash)
            {
                extra_obj.part[1] = irandom(3);
                extra_obj.part[0] = irandom(3);
                extra_obj.part[2] = irandom(3);
                extra_obj.colorflag[1] = irandom(31);
                extra_obj.colorflag[0] = irandom(31);
                extra_obj.colorflag[2] = irandom(31);
                var _partID = (correctanswer < 2) ? (1 - correctanswer) : correctanswer;
                extra_obj.part[_partID] = 4;
            }
            else if (correctanswer < 3)
            {
                var _partID = (correctanswer < 2) ? (1 - correctanswer) : correctanswer;
                extra_obj.part[_partID] = (extra_obj.part[_partID] + irandom(2) + 1) % 4;
            }
            var _builtDuck = (global.flag[220] + global.flag[221] + global.flag[222]) == 9;
            var _showDuck = extra_obj.part[0] == 3 && extra_obj.part[1] == 3 && extra_obj.part[2] == 3;
            if (_newThrash && (extra_obj.part[0] + extra_obj.part[1] + extra_obj.part[2]) == 10)
                _showDuck = true;
            if (_builtDuck || _showDuck)
                question = stringsetloc("THIS THING SEEMS TO SUCK ASS. WHAT'S WRONG WITH IT?", "scr_quiztext_slash_scr_quiztext_gml_225_0");
            else
                question = stringsetloc("APPARENTLY YOU MADE THIS AWFUL THING. EXCEPT FOR... WHAT?", "scr_quiztext_slash_scr_quiztext_gml_226_0");
            topic = "AWFUL";
            quizid = "thrash";
            answeroption[0] = stringsetloc("HEAD", "scr_quiztext_slash_scr_quiztext_gml_230_0");
            answeroption[1] = stringsetloc("BODY", "scr_quiztext_slash_scr_quiztext_gml_231_0");
            answeroption[2] = stringsetloc("LEGS", "scr_quiztext_slash_scr_quiztext_gml_232_0");
            if (_builtDuck || _showDuck)
                answeroption[3] = stringsetloc("SEEMS FINE", "scr_quiztext_slash_scr_quiztext_gml_233_0");
            else
                answeroption[3] = stringsetloc("IT'S ACCURATE", "scr_quiztext_slash_scr_quiztext_gml_234_0");
            commentcount = 2;
            if (_builtDuck || _showDuck)
            {
                scr_quizcomment(0, stringsetloc("Everything.", "scr_quiztext_slash_scr_quiztext_gml_241_0"), 1);
                scr_quizcomment(1, stringsetloc("Um, I think it's cute!", "scr_quiztext_slash_scr_quiztext_gml_242_0"), 2);
                su_guess = -1;
                if (_showDuck)
                    ra_guess = 3;
                else
                    ra_guess = correctanswer;
            }
            else
            {
                su_guess = -1;
                ra_guess = -1;
                scr_quizcomment(0, stringsetloc("I dunno. I didn't make this.", "scr_quiztext_slash_scr_quiztext_gml_283_0"), 1);
                scr_quizcomment(1, stringsetloc("Kris, help...", "scr_quiztext_slash_scr_quiztext_gml_284_0"), 2);
            }
            break;
        case 7:
            su_wait = 210;
            su_guess = 2;
            ra_wait = 270;
            ra_guess = 0;
            question = stringsetloc("WHAT'S THE NAME OF THIS AWFUL GUY?", "scr_quiztext_slash_scr_quiztext_gml_294_0");
            topic = "DARKNERS";
            quizid = "pippins";
            sprite = spr_pippins_idle;
            spritex = 200;
            spritey = 100;
            correctanswer = 3;
            answeroption[0] = stringsetloc("PIPPS", "scr_quiztext_slash_scr_quiztext_gml_301_0");
            answeroption[1] = stringsetloc("DICER", "scr_quiztext_slash_scr_quiztext_gml_302_0");
            answeroption[2] = stringsetloc("TOYLET", "scr_quiztext_slash_scr_quiztext_gml_303_0");
            answeroption[3] = stringsetloc("PIPPINS", "scr_quiztext_slash_scr_quiztext_gml_304_0");
            commentcount = 1;
            scr_quizcomment(0, stringsetloc("Gotta go#with my gut.", "scr_quiztext_slash_scr_quiztext_gml_309_0"), 1, 180);
            skiptimer = 135;
            break;
        case 8:
            su_wait = 270;
            su_guess = 2;
            ra_wait = 285;
            ra_guess = 3;
            question = stringsetloc("WHAT WAS ASRIEL'S FAVORITE CHARACTER IN SMASHING FIGHTERS?", "scr_quiztext_slash_scr_quiztext_gml_318_0");
            topic = "GAMEING";
            quizid = "smash";
            correctanswer = 0;
            answeroption[0] = stringsetloc("SWORD MAGICIAN", "scr_quiztext_slash_scr_quiztext_gml_322_0");
            answeroption[1] = stringsetloc("BIG PENGUIN", "scr_quiztext_slash_scr_quiztext_gml_323_0");
            answeroption[2] = stringsetloc("PURPLE DRAGON", "scr_quiztext_slash_scr_quiztext_gml_324_0");
            answeroption[3] = stringsetloc("GREEN LIZARD", "scr_quiztext_slash_scr_quiztext_gml_325_0");
            commentcount = 2;
            scr_quizcomment(0, stringsetloc("Here's hoping your brother had taste.", "scr_quiztext_slash_scr_quiztext_gml_330_0"), 1, 240);
            scr_quizcomment(1, stringsetloc("U-umm...", "scr_quiztext_slash_scr_quiztext_gml_331_0"), 2, 225);
            skiptimer = 210;
            break;
        case 9:
            su_wait = 210;
            su_guess = 1;
            ra_wait = 180;
            ra_guess = 0;
            question = stringsetloc("WHAT DOES \"CRT\" STAND FOR, ANYWAY!?", "scr_quiztext_slash_scr_quiztext_gml_346_0");
            topic = "TV";
            quizid = "crt";
            correctanswer = 1;
            answeroption[0] = stringsetloc("COOL RICH TENNA", "scr_quiztext_slash_scr_quiztext_gml_350_0");
            answeroption[1] = stringsetloc("CATHODE RAY TUBE", "scr_quiztext_slash_scr_quiztext_gml_351_0");
            answeroption[2] = stringsetloc("CLASSIC REAL TV", "scr_quiztext_slash_scr_quiztext_gml_352_0");
            answeroption[3] = stringsetloc("CARTOONS", "scr_quiztext_slash_scr_quiztext_gml_353_0");
            commentcount = 2;
            scr_quizcomment(0, stringsetloc("Let's try flattery?", "scr_quiztext_slash_scr_quiztext_gml_358_0"), 2, 180);
            scr_quizcomment(1, stringsetloc("Seems the least stupid.", "scr_quiztext_slash_scr_quiztext_gml_359_0"), 1, 210);
            skiptimer = 150;
            break;
        case 10:
            su_wait = 240;
            su_guess = 3;
            ra_wait = 210;
            ra_guess = 3;
            question = stringsetloc("WHICH ONE OF THESE IS THE COMPOSITE VIDEO CABLE!?", "scr_quiztext_slash_scr_quiztext_gml_368_0");
            topic = "TV";
            quizid = "cable";
            sprite = spr_quiz_images;
            correctanswer = 2;
            answeroption[0] = stringsetloc("RED", "scr_quiztext_slash_scr_quiztext_gml_373_0");
            answeroption[1] = stringsetloc("WHITE", "scr_quiztext_slash_scr_quiztext_gml_374_0");
            answeroption[2] = stringsetloc("YELLOW", "scr_quiztext_slash_scr_quiztext_gml_375_0");
            answeroption[3] = stringsetloc("NONE", "scr_quiztext_slash_scr_quiztext_gml_376_0");
            commentcount = 2;
            scr_quizcomment(0, stringsetloc("Shouldn't there be a hudmy cable?", "scr_quiztext_slash_scr_quiztext_gml_381_0"), 1, 120);
            scr_quizcomment(1, stringsetloc("Wh... white...?", "scr_quiztext_slash_scr_quiztext_gml_382_0"), 2, 150);
            skiptimer = 90;
            break;
        case 11:
            su_wait = 240;
            su_guess = 1;
            ra_wait = 210;
            ra_guess = 0;
            question = stringsetloc("WHICH TV CHANNEL IS THE MOST POPULAR!?", "scr_quiztext_slash_scr_quiztext_gml_392_0");
            topic = "TV";
            quizid = "channel";
            correctanswer = 4;
            answeroption[0] = stringsetloc("THE WEATHER", "scr_quiztext_slash_scr_quiztext_gml_396_0");
            answeroption[1] = stringsetloc("B&W GAME SHOWS", "scr_quiztext_slash_scr_quiztext_gml_397_0");
            answeroption[2] = stringsetloc("NOIR MOVIE CHANNEL", "scr_quiztext_slash_scr_quiztext_gml_398_0");
            answeroption[3] = stringsetloc("NONE OF THESE", "scr_quiztext_slash_scr_quiztext_gml_399_0");
            skiptimer = 180;
            commentcount = 0;
            break;
        case 12:
            su_wait = 30;
            su_guess = 0;
            ra_wait = 210;
            ra_guess = global.flag[1073];
            schoose = -1;
            susBehavior = 0;
            question = stringsetloc("SERIOUSLY, WHAT IS THIS GUY'S NAME!?", "scr_quiztext_slash_scr_quiztext_gml_415_0");
            topic = "KID";
            quizid = "lancer2";
            sprite = spr_lancer_dt;
            spritex = 250;
            spritey = 100;
            correctanswer = global.flag[1073];
            answeroption[0] = stringsetloc("LANCER", "scr_quiztext_slash_scr_quiztext_gml_422_0");
            answeroption[1] = stringsetloc("DANCER", "scr_quiztext_slash_scr_quiztext_gml_423_0");
            answeroption[2] = stringsetloc("PRANCER", "scr_quiztext_slash_scr_quiztext_gml_424_0");
            answeroption[3] = stringsetloc("MR. GENEROSITY", "scr_quiztext_slash_scr_quiztext_gml_425_0");
            commentcount = 1;
            scr_quizcomment(0, stringsetloc("It's Lancer.", "scr_quiztext_slash_scr_quiztext_gml_430_0"), 1);
            break;
        case 13:
            su_wait = 120;
            su_guess = 3;
            ra_wait = 150;
            ra_guess = 2;
            question = stringsetloc("KRIS, WHICH SHOW WAS ASGORE'S FAVORITE!?", "scr_quiztext_slash_scr_quiztext_gml_438_0");
            topic = "TV";
            quizid = "asgorefave";
            correctanswer = 3;
            answeroption[0] = stringsetloc("COOKING SHOW", "scr_quiztext_slash_scr_quiztext_gml_442_0");
            answeroption[1] = stringsetloc("NASTY MUSIC VIDEOS", "scr_quiztext_slash_scr_quiztext_gml_443_0");
            answeroption[2] = stringsetloc("MONSTER MOVIES", "scr_quiztext_slash_scr_quiztext_gml_444_0");
            answeroption[3] = stringsetloc("COWBOY SHOW", "scr_quiztext_slash_scr_quiztext_gml_445_0");
            commentcount = 1;
            scr_quizcomment(0, stringsetloc("Kris, uhh, you know, right?", "scr_quiztext_slash_scr_quiztext_gml_450_0"), 1);
            break;
        case 14:
            su_wait = 120;
            su_guess = 3;
            ra_wait = 150;
            ra_guess = 2;
            question = stringsetloc("NOW WHEN DOES ASGORE'S FAVORITE COWBOY PUPPET SHOW AIR!?", "scr_quiztext_slash_scr_quiztext_gml_459_0");
            topic = "TV";
            quizid = "puppetshow";
            extra = true;
            correctanswer = 4;
            answeroption[0] = stringsetloc("IT WAS CANCELLED", "scr_quiztext_slash_scr_quiztext_gml_464_0");
            answeroption[1] = stringsetloc("IT WAS CANCELLED", "scr_quiztext_slash_scr_quiztext_gml_465_0");
            answeroption[2] = stringsetloc("IT WAS CANCELLED", "scr_quiztext_slash_scr_quiztext_gml_466_0");
            answeroption[3] = stringsetloc("IT WAS CANCELLED", "scr_quiztext_slash_scr_quiztext_gml_467_0");
            commentcount = 0;
            skiptimer = 0;
            break;
        case 15:
            su_guess = irandom(3);
            ra_guess = irandom(3);
            question = stringsetloc("AREN'T YOU HAVING SO MUCH FUN?", "scr_quiztext_slash_scr_quiztext_gml_482_0");
            topic = "WELL???";
            quizid = "sofun";
            correctanswer = 4;
            answeroption[0] = stringsetloc("OF COURSE!", "scr_quiztext_slash_scr_quiztext_gml_486_0");
            answeroption[1] = stringsetloc("OF COURSE!", "scr_quiztext_slash_scr_quiztext_gml_487_0");
            answeroption[2] = stringsetloc("OF COURSE!", "scr_quiztext_slash_scr_quiztext_gml_488_0");
            answeroption[3] = stringsetloc("OF COURSE!", "scr_quiztext_slash_scr_quiztext_gml_489_0");
            commentcount = 0;
            break;
        case 16:
            su_guess = irandom(3);
            ra_guess = irandom(3);
            question = stringsetloc("WHAT'S ANOTHER WORD FOR, \"TELEVISION?\"", "scr_quiztext_slash_scr_quiztext_gml_501_0");
            topic = "WELL???";
            quizid = "anotherword";
            correctanswer = 4;
            answeroption[0] = stringsetloc("MAN'S BEST FRIEND", "scr_quiztext_slash_scr_quiztext_gml_505_0");
            answeroption[1] = stringsetloc("\"THE GOOD STUFF\"", "scr_quiztext_slash_scr_quiztext_gml_506_0");
            answeroption[2] = stringsetloc("BETTER THAN EMAIL", "scr_quiztext_slash_scr_quiztext_gml_507_0");
            answeroption[3] = stringsetloc("NEVER THROWN AWAY", "scr_quiztext_slash_scr_quiztext_gml_508_0");
            commentcount = 0;
            break;
        case 17:
            su_guess = irandom(3);
            ra_guess = irandom(3);
            question = stringsetloc("WHAT'S THIS BUTTON ON THE TELEVISION DO?", "scr_quiztext_slash_scr_quiztext_gml_520_0");
            topic = "NORNAL";
            quizid = "button";
            sprite = spr_quiz_thisbutton;
            correctanswer = 4;
            answeroption[0] = stringsetloc("~NEVER PRESS IT", "scr_quiztext_slash_scr_quiztext_gml_525_0");
            answeroption[1] = stringsetloc("~I DON'T KNOW", "scr_quiztext_slash_scr_quiztext_gml_526_0");
            answeroption[2] = stringsetloc("UNUSED", "scr_quiztext_slash_scr_quiztext_gml_527_0");
            answeroption[3] = stringsetloc("~I'M SORRY. I'M SORRY", "scr_quiztext_slash_scr_quiztext_gml_528_0");
            commentcount = 0;
            break;
        case 18:
            su_guess = irandom(3);
            ra_guess = irandom(3);
            question = stringsetloc("WHAT TIME ARE YOU GONNA WATCH TV TOMORROW?", "scr_quiztext_slash_scr_quiztext_gml_540_0");
            topic = "WELL???";
            quizid = "watchtv";
            correctanswer = 4;
            answeroption[0] = stringsetloc("MORNING TIL NIGHT", "scr_quiztext_slash_scr_quiztext_gml_544_0");
            answeroption[1] = stringsetloc("DUSK TIL DAWN", "scr_quiztext_slash_scr_quiztext_gml_545_0");
            answeroption[2] = stringsetloc("~BREAKFAST TO DINNER", "scr_quiztext_slash_scr_quiztext_gml_546_0");
            answeroption[3] = stringsetloc("~~I WON'T EVEN GO TO CHURCH. I'LL#WATCH IT FOREVER. IT'S ALL I HAVE.#IT'S EVERYTHING TO ME.", "scr_quiztext_slash_scr_quiztext_gml_547_0");
            commentcount = 0;
            break;
        case 27:
            question = "WHICH IS THE WEAKEST AXE EQUIPPABLE BY FAR?";
            topic = "ADVENTURE";
            quizid = "ax";
            correctanswer = 2;
            answeroption[0] = stringsetloc("BRAVE AX", "scr_quiztext_slash_scr_quiztext_gml_580_0");
            answeroption[1] = stringsetloc("WOODEN AX", "scr_quiztext_slash_scr_quiztext_gml_581_0");
            answeroption[2] = stringsetloc("MANE AX", "scr_quiztext_slash_scr_quiztext_gml_582_0");
            answeroption[3] = stringsetloc("BROKEN AX", "scr_quiztext_slash_scr_quiztext_gml_583_0");
            su_wait = 60;
            su_guess = 2;
            ra_wait = 180;
            ra_guess = 3;
            schoose = -1;
            commentcount = 1;
            scr_quizcomment(0, stringsetloc("We freaking got this!!!", "scr_quiztext_slash_scr_quiztext_gml_593_0"), 1);
            break;
        case 28:
            su_wait = 270;
            su_guess = 2;
            ra_wait = 240;
            ra_guess = 0;
            question = "WHAT FOREST SURROUNDS CARD CASTLE?";
            topic = "FORESTS";
            quizid = "forest";
            correctanswer = 1;
            answeroption[0] = stringsetloc("SCARLET FOREST", "scr_quiztext_slash_scr_quiztext_gml_609_0");
            answeroption[1] = stringsetloc("BLOCK FOREST", "scr_quiztext_slash_scr_quiztext_gml_610_0");
            answeroption[2] = stringsetloc("RED FOREST", "scr_quiztext_slash_scr_quiztext_gml_611_0");
            answeroption[3] = stringsetloc("DUST BUNNY FOREST", "scr_quiztext_slash_scr_quiztext_gml_612_0");
            commentcount = 2;
            scr_quizcomment(0, stringsetloc("Uh, it WAS red?", "scr_quiztext_slash_scr_quiztext_gml_621_0"), 1);
            scr_quizcomment(1, stringsetloc("I think it's...#Then wait, what's Scarlet Forest again...?", "scr_quiztext_slash_scr_quiztext_gml_622_0"), 2);
            break;
        case 29:
            su_wait = 150;
            su_guess = 1;
            ra_wait = 240;
            ra_guess = 1;
            question = "WHICH ITEM CAN NOT BE BOUGHT?";
            topic = "SPEND";
            quizid = "cantbuy";
            correctanswer = 1;
            answeroption[0] = stringsetloc("SPAGHETTICODE", "scr_quiztext_slash_scr_quiztext_gml_636_0");
            answeroption[1] = stringsetloc("DICEBRACE", "scr_quiztext_slash_scr_quiztext_gml_637_0");
            answeroption[2] = stringsetloc("ROYALPIN", "scr_quiztext_slash_scr_quiztext_gml_638_0");
            answeroption[3] = stringsetloc("DAINTYSCARF", "scr_quiztext_slash_scr_quiztext_gml_639_0");
            commentcount = 1;
            scr_quizcomment(0, stringsetloc("Hell if I remember.", "scr_quiztext_slash_scr_quiztext_gml_644_0"), 1);
            break;
        case 30:
            question = " ";
            topic = " ";
            reward = 100;
            penalty = 6;
            correctanswer = 1;
            answeroption[0] = " ";
            answeroption[1] = " ";
            answeroption[2] = " ";
            answeroption[3] = " ";
            commentcount = 0;
            break;
        case 31:
            question = " ";
            topic = " ";
            quizid = " ";
            reward = 100;
            penalty = 20;
            correctanswer = 2;
            answeroption[0] = " ";
            answeroption[1] = " ";
            answeroption[2] = " ";
            answeroption[3] = " ";
            commentcount = 0;
            break;
        case 32:
            question = " ";
            topic = " ";
            quizid = " ";
            reward = 100;
            penalty = 20;
            correctanswer = 0;
            answeroption[0] = " ";
            answeroption[1] = " ";
            answeroption[2] = " ";
            answeroption[3] = " ";
            commentcount = 0;
            break;
        case 33:
            question = " ";
            topic = " ";
            quizid = " ";
            reward = 100;
            penalty = 20;
            correctanswer = 1;
            answeroption[0] = " ";
            answeroption[1] = " ";
            answeroption[2] = " ";
            answeroption[3] = " ";
            commentcount = 0;
            commentcontent[0] = " ";
            commenttriangle[0] = spr_ch3_ballcon_triangle1;
            commentx[0] = 210;
            commenty[0] = 340;
            commenttriangleside[0] = 0;
            commentchar[0] = 1;
            commentcreatetimer[0] = 30;
            commentdestroytime[0] = 120;
            commentcontent[1] = " ";
            commenttriangle[1] = spr_ch3_ballcon_triangle2;
            commentx[1] = 190;
            commenty[1] = 390;
            commenttriangleside[1] = 0;
            commentchar[1] = 2;
            commentcreatetimer[1] = 150;
            commentdestroytime[1] = 120;
            commentcontent[2] = " ";
            commenttriangle[2] = spr_ch3_ballcon_triangle3;
            commentx[2] = 270;
            commenty[2] = 360;
            commenttriangleside[2] = 1;
            commentchar[2] = 0;
            commentcreatetimer[2] = 240;
            commentdestroytime[2] = 120;
            break;
        case 34:
            question = " ";
            topic = " ";
            quizid = " ";
            reward = 100;
            penalty = 20;
            correctanswer = 3;
            answeroption[0] = " ";
            answeroption[1] = " ";
            answeroption[2] = " ";
            answeroption[3] = " ";
            commentcount = 0;
            break;
        case 35:
            su_wait = 240;
            su_guess = 1;
            ra_wait = 210;
            ra_guess = 1;
            question = stringsetloc("WHO IS THE HORSE-LOOKING GUY IN THE GREAT BOARD?", "scr_quiztext_slash_scr_quiztext_gml_48_0");
            topic = "HORSES";
            quizid = "horse";
            correctanswer = 1;
            answeroption[0] = stringsetloc("MR. GENEROSITY", "scr_quiztext_slash_scr_quiztext_gml_52_0");
            answeroption[1] = stringsetloc("MR. ELEGANCE", "scr_quiztext_slash_scr_quiztext_gml_53_0");
            answeroption[2] = stringsetloc("MR. TRANSQUILITY", "scr_quiztext_slash_scr_quiztext_gml_54_0");
            answeroption[3] = stringsetloc("MR. SOCIETY", "scr_quiztext_slash_scr_quiztext_gml_55_0");
            commentcount = 2;
            scr_quizcomment(0, stringsetloc("It was... Mr. Something.", "scr_quiztext_slash_scr_quiztext_gml_60_0"), 1);
            scr_quizcomment(1, stringsetloc("They're all Mr. Something.", "scr_quiztext_slash_scr_quiztext_gml_61_0"), 2);
            skiptimer = -180;
            break;
        case 36:
            su_wait = 180;
            su_guess = 3;
            ra_wait = 270;
            ra_guess = 2;
            question = stringsetloc("WHAT ACTION IS EFFECTIVE ON HATHY?", "scr_quiztext_slash_scr_quiztext_gml_71_0");
            topic = "DARKNERS";
            quizid = "hathy";
            correctanswer = 1;
            answeroption[0] = stringsetloc("KISS", "scr_quiztext_slash_scr_quiztext_gml_75_0");
            answeroption[1] = stringsetloc("FLIRT", "scr_quiztext_slash_scr_quiztext_gml_76_0");
            answeroption[2] = stringsetloc("FLATTER", "scr_quiztext_slash_scr_quiztext_gml_77_0");
            answeroption[3] = stringsetloc("COMPLIMENT", "scr_quiztext_slash_scr_quiztext_gml_78_0");
            commentcount = 2;
            scr_quizcomment(0, stringsetloc("ALL OF THESE ARE THE SAME!!!", "scr_quiztext_slash_scr_quiztext_gml_83_0"), 1);
            scr_quizcomment(1, stringsetloc("Umm, I didn't kiss anyone...", "scr_quiztext_slash_scr_quiztext_gml_84_0"), 2, 45);
            break;
        default:
            question = " ";
            topic = " ";
            quizid = " ";
            reward = 100;
            penalty = 20;
            correctanswer = 0;
            answeroption[0] = " ";
            answeroption[1] = " ";
            answeroption[2] = " ";
            answeroption[3] = " ";
            su_wait = 240;
            su_guess = 0;
            ra_wait = 180;
            ra_guess = 0;
            commentcount = 0;
            skiptimer = -30;
            break;
    }
    for (var i = 0; i < commentcount; i++)
        commentshown[i] = 0;
}

function scr_quizcomment(arg0, arg1, arg2, arg3 = 0, arg4 = 120)
{
    commentcontent[arg0] = stringset(arg1);
    commenttriangle[arg0] = spr_ch3_ballcon_triangle3;
    commentx[arg0] = 210;
    commenty[arg0] = 340;
    commenttriangleside[arg0] = 0;
    commentchar[arg0] = arg2;
    if (arg2 == 0)
    {
        commenttriangle[arg0] = spr_ch3_ballcon_triangle3;
        commentx[arg0] = 270;
        commenty[arg0] = 360;
        commenttriangleside[arg0] = 1;
    }
    else if (arg2 == 1)
    {
        commenttriangle[arg0] = spr_ch3_ballcon_triangle1;
        commentx[arg0] = 210;
        commenty[arg0] = 340;
        commenttriangleside[arg0] = 0;
    }
    else if (arg2 == 2)
    {
        commenttriangle[arg0] = spr_ch3_ballcon_triangle2;
        commentx[arg0] = 190;
        commenty[arg0] = 390;
        commenttriangleside[arg0] = 0;
    }
    if (arg3 > 0)
        commentcreatetimer[arg0] = arg3;
    else if (arg0 == 0)
        commentcreatetimer[0] = 30;
    else if (arg0 == 1)
        commentcreatetimer[arg0] = 120;
    else if (arg0 == 2)
        commentcreatetimer[arg0] = 210;
    else
        commentcreatetimer[arg0] = 150 + ((arg0 - 1) * 90);
    commentdestroytime[arg0] = arg4;
}

function scr_quizcomment_add(arg0, arg1, arg2 = 60, arg3 = 0, arg4 = 0, arg5 = false, arg6 = 0)
{
    if (arg4 == 0)
        arg4 = endtimer;
    else if (arg5)
        arg4 += endtimer;
    if (arg2 == 0)
        arg2 = 60;
    commentcontent[commentcount] = arg0;
    commentchar[commentcount] = arg1;
    commentcreatetimer[commentcount] = arg4;
    commentdestroytime[commentcount] = arg2;
    commentsprite[commentcount] = arg3;
    endtimer = arg4 + arg2;
    commentimage[commentcount] = arg6;
    commentshown[commentcount] = 0;
    commentcount++;
}

function scr_createquizcomment(arg0, arg1, arg2 = 120, arg3 = 0, arg4 = 0)
{
    var _sprite_only = arg0 == "";
    if (arg2 <= 0)
        arg2 = 120;
    if (arg1 == 0)
    {
        if (!_sprite_only)
        {
            var _tennabubble = scr_tennabubble(arg0, 480, 408, arg2, 1, -1, 64);
            _tennabubble.tenna = quizzler.tenna;
            _tennabubble.depth = 4950;
        }
        if (arg3 > 0)
        {
            quizzler.tenna.sprite_index = arg3;
            quizzler.tenna.bounce = 1;
            if (arg4 >= 0)
                quizzler.tenna.image_index = arg4;
        }
        exit;
    }
    else if (arg1 == 1)
    {
        arg1 = "su";
        if (arg3 > 0)
            quizzler.su_sprite = arg3;
    }
    else if (arg1 == 2)
    {
        arg1 = "ra";
        if (arg3 > 0)
            quizzler.ra_sprite = arg3;
    }
    if (!_sprite_only)
    {
        with (obj_couchwriter)
        {
            if (speaker == arg1)
                debug_print("attempting to DESTROY couchwriter");
            instance_destroy();
        }
        scr_couchtalk(arg0, arg1, 0, arg2);
    }
}

function scr_createquizcomment_old(arg0, arg1, arg2 = 120)
{
    global.msg[0] = arg0;
    var _xx = 0;
    var _yy = 0;
    var _sprite = -1;
    var _side = 0;
    if (arg1 == 0)
    {
        _sprite = spr_ch3_ballcon_triangle3;
        _xx = 270;
        _yy = 360;
        _side = 1;
    }
    else if (arg1 == 1)
    {
        _sprite = spr_ch3_ballcon_triangle1;
        _xx = 210;
        _yy = 340;
    }
    else if (arg1 == 2)
    {
        _sprite = spr_ch3_ballcon_triangle2;
        _xx = 190;
        _yy = 390;
    }
    commentobj = instance_create(_xx, _yy, obj_ch3_ballcon);
    commentobj.depth = -(10 * (commentcount + 1));
    commentobj.char = arg1;
    commentobj.trianglesprite = _sprite;
    commentobj.triangleside = _side;
    commentobj.destroytime = arg2;
}
