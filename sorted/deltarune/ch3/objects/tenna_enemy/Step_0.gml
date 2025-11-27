if (!i_ex(obj_herosusie) || !i_ex(obj_heroralsei))
{
    if (debugvar == false && scr_debug())
    {
        scr_debug_print("You need Susie and Ralsei for this battle");
        debugvar = true;
    }
    exit;
}
if (audience_goes_away == true)
{
    with (obj_tenna_enemy_bg)
        audience_y_pos = lerp(audience_y_pos, 480, 0.03);
}
if (global.is_console && scr_debug())
{
    if (gamepad_button_check_pressed(0, gp_shoulderl))
    {
        if (minigameinsanity == 0)
        {
            minigameinsanity = 1;
            scr_debug_print("minigame insanity on");
        }
        else
        {
            minigameinsanity = 0;
            scr_debug_print("minigame insanity off");
        }
    }
}
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0 && obj_tenna_enemy_bg.myscore >= 1000 && haveusedultimate == true)
    {
        talked = -1;
        endcon = 1;
        end_cutscene_version = 1;
    }
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        if (attackchosen == false)
        {
            event_user(0);
            if (turns >= 10 && obj_tenna_enemy_bg.myscore < 500)
                pointsmultiplier = 1.3;
            if (turns >= 15 && obj_tenna_enemy_bg.myscore < 650)
                pointsmultiplier = 1.6;
            if (turns >= 20)
                pointsmultiplier = 2;
            attackchosen = true;
        }
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        global.fc = 22;
        global.typer = 81;
        var squential_dialogue = true;
        if ((dialogueorder >= 9 && dialogueorder < 19) || dialogueorder > 20)
            squential_dialogue = false;
        if (minigameinsanity)
        {
            msgsetloc(0, "That's it!&It's time for&the FINAL EPISODE!/%", "obj_tenna_enemy_slash_Step_0_gml_60_0");
            ballooncon = 40;
            balloonend = 0;
        }
        else if (turns == 0)
        {
            msgsetloc(0, "1000 POINTS,&JUST 1000 POINTS&AND I'LL GIVE IT UP!/%", "obj_tenna_enemy_slash_Step_0_gml_38_0");
            ballooncon = 1;
            balloonend = 0;
        }
        else if (myattackchoice == 1 && smashcutdialgue == 0)
        {
            msgsetloc(0, "Haha, no way&we can use that&take! CUT!!/%", "obj_tenna_enemy_slash_Step_0_gml_49_0_b");
            ballooncon = 3;
            smashcutdialgue = 1;
        }
        else if (myattackchoice == 2 && rimshotdialogue == 0)
        {
            msgsetloc(0, "You guys are&so good, it's&making me LAUGH!/%", "obj_tenna_enemy_slash_Step_0_gml_50_0_b");
            ballooncon = 4;
            phaseturn = 0;
            rimshotdialogue = 1;
        }
        else if (myattackchoice == 0 && squential_dialogue == false)
        {
            msgsetloc(0, "WE'VE GOT AN&ALL-STAR CAST!/%", "obj_tenna_enemy_slash_Step_0_gml_52_0");
            ballooncon = 0;
            if (dialogueorder < 19)
                dialogueorder++;
            balloonend = 1;
        }
        else if (myattackchoice == 1 && smashcutdialgue == 1 && squential_dialogue == false)
        {
            msgsetloc(0, "HOW BOUT A&LITTLE SLICE&OF LIFE!?/%", "obj_tenna_enemy_slash_Step_0_gml_53_0");
            ballooncon = 0;
            if (dialogueorder < 19)
                dialogueorder++;
            balloonend = 1;
        }
        else if (myattackchoice == 2 && rimshotdialogue == 1 && squential_dialogue == false)
        {
            msgsetloc(0, "How about we&play you a&RIMSHOT!?/%", "obj_tenna_enemy_slash_Step_0_gml_54_0");
            ballooncon = 0;
            if (dialogueorder < 19)
                dialogueorder++;
            balloonend = 1;
        }
        else if (minigameactivated && minigamecount <= 5 && minigamedialogue == 0)
        {
            msgsetloc(0, "So our STAR&contestants have&contested our STARs!/%", "obj_tenna_enemy_slash_Step_0_gml_56_0_b");
            ballooncon = 5;
            minigamedialogue = 1;
        }
        else if (minigameactivated && minigamecount >= 6 && doubleminigamedialogue == 0)
        {
            msgsetloc(0, "All right! If one&PHYSICAL CHALLENGE&isn't enough.../%", "obj_tenna_enemy_slash_Step_0_gml_57_0_b");
            ballooncon = 6;
            doubleminigamedialogue = 1;
        }
        else if (minigameactivated && squential_dialogue == false)
        {
            msgsetloc(0, "IT'S!&TV!&TIME!/%", "obj_tenna_enemy_slash_Step_0_gml_58_0_b");
            ballooncon = 0;
            balloonend = 1;
            if (dialogueorder < 19)
                dialogueorder++;
        }
        else
        {
            dialogueorder++;
            if (dialogueorder == 1)
            {
                msgsetloc(0, "Sick of the&CLASSICS!? We'll&make 'em NEO!/%", "obj_tenna_enemy_slash_Step_0_gml_65_0");
                ballooncon = 7;
                balloonend = 0;
            }
            if (dialogueorder == 2)
            {
                msgsetloc(0, "Who SAYS an&old CRT can't&learn new tricks!?/%", "obj_tenna_enemy_slash_Step_0_gml_66_0");
                ballooncon = 8;
                balloonend = 0;
            }
            if (dialogueorder == 3)
            {
                msgsetloc(0, "Ratings!? HA!&I'll show you&CHARISMA!/%", "obj_tenna_enemy_slash_Step_0_gml_67_0");
                ballooncon = 9;
                balloonend = 0;
            }
            if (dialogueorder == 4)
            {
                msgsetloc(0, "Susie, you&liked watching,&didn't you!?!/%", "obj_tenna_enemy_slash_Step_0_gml_68_0");
                ballooncon = 10;
                balloonend = 0;
            }
            if (dialogueorder == 5)
            {
                msgsetloc(0, "Tell 'em,&Susie!/%", "obj_tenna_enemy_slash_Step_0_gml_69_0");
                ballooncon = 11;
                balloonend = 0;
            }
            if (dialogueorder == 6)
            {
                msgsetloc(0, "I'm still&MARVELOUS! I'm&still MYSTERIOUS!/%", "obj_tenna_enemy_slash_Step_0_gml_70_0");
                ballooncon = 12;
                balloonend = 0;
            }
            if (dialogueorder == 7)
            {
                msgsetloc(0, "Kris!! I watched&you GROW UP!!/%", "obj_tenna_enemy_slash_Step_0_gml_71_0");
                ballooncon = 13;
                balloonend = 0;
            }
            if (dialogueorder == 8 && didkrisdoswordroute == false)
            {
                msgsetloc(0, "Who do you think&taught you to&LAUGH and CRY!?/%", "obj_tenna_enemy_slash_Step_0_gml_72_0");
                ballooncon = 14;
                balloonend = 0;
            }
            if (dialogueorder == 9 && didkrisdoswordroute == false)
            {
                msgsetloc(0, "Well, the GOOD&OLD DAYS are HERE,&Kris! On VHS!/%", "obj_tenna_enemy_slash_Step_0_gml_73_0");
                ballooncon = 15;
                balloonend = 0;
            }
            if (dialogueorder == 8 && didkrisdoswordroute == true)
            {
                msgsetloc(0, "You... you want&to have fun,&too, don't you!?/%", "obj_tenna_enemy_slash_Step_0_gml_74_0");
                ballooncon = 17;
                balloonend = 0;
            }
            if (dialogueorder == 9 && didkrisdoswordroute == true)
            {
                msgsetloc(0, "Woah, woah, woah!&Sorry, that was&out of line, folks!/%", "obj_tenna_enemy_slash_Step_0_gml_75_0");
                ballooncon = 18;
                balloonend = 0;
            }
            if (dialogueorder == 20)
            {
                msgsetloc(0, "... what!? Are&you waiting for me.../%", "obj_tenna_enemy_slash_Step_0_gml_76_0");
                ballooncon = 19;
                balloonend = 0;
            }
            if (dialogueorder == 21)
            {
                msgsetloc(0, ".../%", "obj_tenna_enemy_slash_Step_0_gml_77_0");
                ballooncon = 21;
                balloonend = 0;
            }
        }
        if (ralseitalks == 1 && instance_exists(obj_heroralsei))
        {
            global.typer = 74;
            scr_enemyblcon(obj_heroralsei.x + 75, obj_heroralsei.y + 15, 7);
            scr_guardpeek(obj_heroralsei);
        }
        else if (susietalks == 1 && instance_exists(obj_herosusie))
        {
            global.typer = 75;
            scr_enemyblcon(obj_herosusie.x + 75, obj_herosusie.y + 15, 7);
            scr_guardpeek(obj_herosusie);
        }
        else
        {
            scr_enemyblcon(x + 27, global.monstery[myself] - 36, 10);
        }
        myblcon.depth = depth - 100;
        ralseitalks = 0;
        susietalks = 0;
        if (ballooncon == 0)
        {
            talked = 0.5;
            talktimer = 0;
        }
        else
        {
            talked = 0.6;
            talktimer = 0;
        }
        rtimer = 0;
    }
    if (talked == 0.5)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            alarm[6] = 1;
        }
    }
    if (talked == 0.6)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            if (ballooncon == 1)
            {
                msgsetloc(0, "BUT DON'T THINK&IT'S GONNA&BE EASY!!&BECAUSE TODAY.../%", "obj_tenna_enemy_slash_Step_0_gml_121_0");
                ballooncon = 2;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "WE'VE GOT AN&ALL-STAR CAST!/%", "obj_tenna_enemy_slash_Step_0_gml_122_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 3)
            {
                msgsetloc(0, "CUT, I said!&CUT! ...&SMASH CUT!/%", "obj_tenna_enemy_slash_Step_0_gml_125_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 4)
            {
                msgsetloc(0, "How about we play&you a RIMSHOT!?/%", "obj_tenna_enemy_slash_Step_0_gml_126_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 5)
            {
                msgsetloc(0, "But can they&survive... Another&PHYSICAL CHALLENGE?!/%", "obj_tenna_enemy_slash_Step_0_gml_127_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 6)
            {
                msgsetloc(0, "How about a&DOUBLE FEATURE!?/%", "obj_tenna_enemy_slash_Step_0_gml_128_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 7)
            {
                msgsetloc(0, "NEO shows,&NEO programs,&just watch,&watch, WATCH!/%", "obj_tenna_enemy_slash_Step_0_gml_131_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 8)
            {
                msgsetloc(0, "LOOK!! The 6PM show!?&I'll show it at 5!!/%", "obj_tenna_enemy_slash_Step_0_gml_132_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 9)
            {
                msgsetloc(0, "HD's nothing&when you got&NOSTALGIA!/%", "obj_tenna_enemy_slash_Step_0_gml_133_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 10)
            {
                msgsetloc(0, "Come, on!&Tell 'em!&Tell 'em!/%", "obj_tenna_enemy_slash_Step_0_gml_134_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 11)
            {
                msgsetloc(0, "Say they don't&need to throw&me away!/%", "obj_tenna_enemy_slash_Step_0_gml_135_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 12)
            {
                msgsetloc(0, "Toriel oughta&know she doesn't&NEED a new TV!!/%", "obj_tenna_enemy_slash_Step_0_gml_136_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 13)
            {
                msgsetloc(0, "Just admit you&NEED ME already!!/%", "obj_tenna_enemy_slash_Step_0_gml_137_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 14)
            {
                msgsetloc(0, "... What, you think&it's MY fault you&forgot HOW!?/%", "obj_tenna_enemy_slash_Step_0_gml_138_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 15)
            {
                msgsetloc(0, "And if you've&forgotten how&to smile.../%", "obj_tenna_enemy_slash_Step_0_gml_139_0");
                ballooncon = 16;
                balloonend = 0;
            }
            else if (ballooncon == 16)
            {
                msgsetloc(0, "I'll MAKE&YOU remember./%", "obj_tenna_enemy_slash_Step_0_gml_140_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 17)
            {
                msgsetloc(0, "Isn't that a&little bit why you.../%", "obj_tenna_enemy_slash_Step_0_gml_141_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 18)
            {
                msgsetloc(0, "Back to your&regularly scheduled&programming!/%", "obj_tenna_enemy_slash_Step_0_gml_142_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 19)
            {
                msgsetloc(0, "To... to...&say something!?/%", "obj_tenna_enemy_slash_Step_0_gml_144_0");
                ballooncon = 20;
                balloonend = 0;
            }
            else if (ballooncon == 20)
            {
                msgsetloc(0, "I have nothing&to say! Nothing!/%", "obj_tenna_enemy_slash_Step_0_gml_145_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 21)
            {
                msgsetloc(0, "... All right!/%", "obj_tenna_enemy_slash_Step_0_gml_147_0");
                ballooncon = 22;
                balloonend = 0;
            }
            else if (ballooncon == 22)
            {
                msgsetloc(0, "All right, fine!&FINE, I ADMIT IT!/%", "obj_tenna_enemy_slash_Step_0_gml_148_0");
                ballooncon = 23;
                balloonend = 0;
            }
            else if (ballooncon == 23)
            {
                msgsetloc(0, "Maybe I AM a&little GLOOBY&sometimes!!/%", "obj_tenna_enemy_slash_Step_0_gml_149_0");
                ballooncon = 24;
                balloonend = 0;
            }
            else if (ballooncon == 24)
            {
                msgsetloc(0, "I AM!!!&I'm GLOOBY!!!/%", "obj_tenna_enemy_slash_Step_0_gml_150_0");
                ballooncon = 25;
                balloonend = 0;
            }
            else if (ballooncon == 25)
            {
                msgsetloc(0, "WHAT'S wrong&with THAT, HUH!?/%", "obj_tenna_enemy_slash_Step_0_gml_151_0");
                ballooncon = 26;
                balloonend = 0;
            }
            else if (ballooncon == 26)
            {
                msgsetloc(0, "We're ALL a little&GLOOBY sometimes!!/%", "obj_tenna_enemy_slash_Step_0_gml_152_0");
                ballooncon = 27;
                balloonend = 0;
            }
            else if (ballooncon == 27)
            {
                msgsetloc(0, "YOU INCLUDED,&KRIS!/%", "obj_tenna_enemy_slash_Step_0_gml_153_0");
                ballooncon = 28;
                balloonend = 0;
            }
            else if (ballooncon == 28)
            {
                msgsetloc(0, "So DON'T give&me that look!/%", "obj_tenna_enemy_slash_Step_0_gml_154_0");
                ballooncon = 29;
                balloonend = 0;
            }
            else if (ballooncon == 29)
            {
                msgsetloc(0, "That \"Oh, I've&never been&Glooby\" look!/%", "obj_tenna_enemy_slash_Step_0_gml_155_0");
                ballooncon = 30;
                balloonend = 0;
            }
            else if (ballooncon == 30)
            {
                msgsetloc(0, "YOU ARE!&YOU HAVE BEEN!&You HAVE TO be!/%", "obj_tenna_enemy_slash_Step_0_gml_156_0");
                ballooncon = 31;
                balloonend = 0;
            }
            else if (ballooncon == 31)
            {
                msgsetloc(0, "It CAN'T&just be me!/%", "obj_tenna_enemy_slash_Step_0_gml_157_0");
                ballooncon = 32;
                balloonend = 0;
            }
            else if (ballooncon == 32)
            {
                msgsetloc(0, "Just ME...&alone./%", "obj_tenna_enemy_slash_Step_0_gml_158_0");
                ballooncon = 33;
                balloonend = 0;
            }
            else if (ballooncon == 33)
            {
                msgsetloc(0, "Glooby...&against the&whole world.../%", "obj_tenna_enemy_slash_Step_0_gml_159_0");
                ballooncon = 34;
                balloonend = 0;
            }
            else if (ballooncon == 34)
            {
                msgsetloc(0, "... it&can't be.../%", "obj_tenna_enemy_slash_Step_0_gml_160_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 40)
            {
                msgsetloc(0, "What will happen&to our HEROES.../%", "obj_tenna_enemy_slash_Step_0_gml_163_0");
                ballooncon = 41;
                balloonend = 0;
            }
            else if (ballooncon == 41)
            {
                msgsetloc(0, "When they REALIZE&this show is NEVER&gonna end!?/%", "obj_tenna_enemy_slash_Step_0_gml_164_0");
                ballooncon = 0;
                balloonend = 1;
            }
            talked = 0.7;
            if (ralseitalks == 1 && instance_exists(obj_heroralsei))
            {
                global.typer = 74;
                scr_heroblcon("ralsei");
                scr_guardpeek(obj_heroralsei);
            }
            else if (susietalks == 1 && instance_exists(obj_herosusie))
            {
                global.typer = 75;
                scr_heroblcon("susie");
                scr_guardpeek(obj_herosusie);
            }
            else
            {
                global.fc = 22;
                global.typer = 81;
                scr_enemyblcon(x + 27, global.monstery[myself] - 36, 10);
            }
            myblcon.depth = depth - 100;
            ralseitalks = 0;
            susietalks = 0;
            alarm[6] = 1;
        }
    }
    if (talked == 1 && scr_isphase("enemytalk") && !i_ex(obj_writer))
    {
        global.mnfight = 1.5;
        attackchosen = false;
    }
    if (global.mnfight == 1.5)
    {
        if (myattackchoice < 3)
        {
            if (!instance_exists(obj_growtangle))
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            if (!instance_exists(obj_moveheart) && !i_ex(obj_heart))
                scr_moveheart();
        }
        global.mnfight = 2;
        scr_turntimer(90);
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            scr_randomtarget();
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "all star cast";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 125;
                dc.damage = 65;
                scr_turntimer(200);
            }
            else if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "smashcut";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 126;
                dc.damage = 65;
                scr_turntimer(260);
            }
            else if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "rimshot lensflare";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 128;
                dc.damage = 65;
                scr_turntimer(260);
            }
            else if (myattackchoice == 3)
            {
                minigametransition_con = 1;
                with (obj_darkener)
                    darken = 0;
                scr_turntimer(999);
            }
            else if (myattackchoice == 20)
            {
                global.monsterattackname[myself] = "light em up";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 150;
                scr_turntimer(999999);
            }
            else if (myattackchoice == 21)
            {
                minigametransition_con = 1;
                minigametype = "battle";
                difficulty = 1;
                scr_turntimer(999999);
            }
            turns += 1;
            global.fc = 22;
            global.typer = 81;
            rr = choose(0, 1, 2, 3, 4);
            if (rr == 0)
                global.battlemsg[0] = stringsetloc("* CLAP AND CHEER, SMILE AND SCREAM! ENTERTAINMENT ON YOUR SCREEN!", "obj_tenna_enemy_slash_Step_0_gml_230_0");
            if (rr == 1)
                global.battlemsg[0] = stringsetloc("* COWABUNGA-DERO! THAT'S THE SMOOTH TASTE OF TV TIME!", "obj_tenna_enemy_slash_Step_0_gml_231_0");
            if (rr == 2)
                global.battlemsg[0] = stringsetloc("* FRESH FROM THE JUICE! FRESH FROM THE JUICE!", "obj_tenna_enemy_slash_Step_0_gml_232_0");
            if (rr == 3)
                global.battlemsg[0] = stringsetloc("* HEAR THAT WHINE!? THAT'S YOUR CRT ASKING FOR A WALK!!", "obj_tenna_enemy_slash_Step_0_gml_233_0");
            if (rr == 4)
                global.battlemsg[0] = stringsetloc("* DON'T TOUCH THAT DIAL! THINGS ARE HEATING UP!", "obj_tenna_enemy_slash_Step_0_gml_234_0");
            var rand = irandom(99);
            if (rand == 1)
                global.battlemsg[0] = stringsetloc("* IS IT JUST ME, OR DOES IT SMELL LIKE AN ORCHARD IN HERE?", "obj_tenna_enemy_slash_Step_0_gml_237_0");
            if (rand == 2)
                global.battlemsg[0] = stringsetloc("* IS IT JUST ME, OR DOES IT SMELL KINDA EARTHY AND SMOKEY IN HERE?", "obj_tenna_enemy_slash_Step_0_gml_238_0");
            if (rand == 3)
                global.battlemsg[0] = stringsetloc("* IS IT JUST ME, OR DOES IT SMELL LIKE MARKETABLE PLUSH IN HERE?", "obj_tenna_enemy_slash_Step_0_gml_239_0");
            if (turns == 7)
                global.battlemsg[0] = stringsetloc("* COME ON KIDS, THE AUDIENCE LOVES IT!! CAN'T YOU HEAR 'EM CHEERING!? LISTEN!!", "obj_tenna_enemy_slash_Step_0_gml_241_0");
            if (turns == 8)
                global.battlemsg[0] = stringsetloc("* ... WHERE... WHERE'S THE AUDIENCE? WHERE'D THEY GO...? WHERE ARE THEY!?", "obj_tenna_enemy_slash_Step_0_gml_242_0");
            if (turns == 9)
                global.battlemsg[0] = stringsetloc("* THAT DAMN AUDIENCE! I GAVE THEM SO MANY POINTS TO BE HERE TODAY!", "obj_tenna_enemy_slash_Step_0_gml_243_0");
            if (turns == 10)
                global.battlemsg[0] = stringsetloc("* MIKE... MIKE, IF YOU'RE STILL HERE... BAN EVERYONE FROM THE GIFT SHOP!", "obj_tenna_enemy_slash_Step_0_gml_244_0");
            if (turns == 11 && (global.flag[309] == 9 || global.flag[454] == 1 || global.flag[456] == 1))
                global.battlemsg[0] = stringsetloc("* I'M NOT LIKE HIM! I'M BETTER! I SWEAR I'M BETTER! MIKE, TELL 'EM!", "obj_tenna_enemy_slash_Step_0_gml_245_0");
            if (healthphase == 1 && global.monsterhp[myself] < (global.monstermaxhp[myself] * 0.5))
            {
                healthphase = 2;
                global.battlemsg[0] = stringsetloc("* OUCH! H-HEY! WATCH WHERE YOU, UH, SWING THOSE THINGS! HAHA!", "obj_tenna_enemy_slash_Step_0_gml_247_0");
            }
            else if (healthphase == 2 && global.monsterhp[myself] < (global.monstermaxhp[myself] * 0.25))
            {
                healthphase = 3;
                global.battlemsg[0] = stringsetloc("* H-HEY, ANYONE NOTICED MY HP IS GOING DOWN!? ANYONE!?", "obj_tenna_enemy_slash_Step_0_gml_248_0");
            }
            else if (healthphase == 3 && global.monsterhp[myself] < (global.monstermaxhp[myself] * 0.166))
            {
                healthphase = 4;
                global.battlemsg[0] = stringsetloc("* WHAT AN EVENT!! THE CONTESTANTS APPEAR TO BE KILLING ME!!", "obj_tenna_enemy_slash_Step_0_gml_249_0");
            }
            if ((obj_tenna_enemy_bg.myscore + obj_tenna_enemy_bg.addscore) >= 1000)
                global.battlemsg[0] = stringsetloc("* ALRIGHT, YOU ASKED FOR IT! TIME FOR THE GRAND FINALE!", "obj_tenna_enemy_slash_Step_0_gml_251_0");
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        if ((obj_tenna_enemy_bg.myscore + obj_tenna_enemy_bg.addscore) >= 1000)
        {
            global.battlemsg[0] = stringsetloc("* ALRIGHT, YOU ASKED FOR IT! TIME FOR THE GRAND FINALE!", "obj_tenna_enemy_slash_Step_0_gml_251_0");
            audience_goes_away = true;
        }
        if (minigamefailcount > 0)
            gothit = true;
        if (bet == true && gothit == false)
            obj_tenna_enemy_bg.addscore += (betamount * 2);
        if (i_ex(obj_tenna_smashcut_attack) && gothit == 0)
            smashcutwithouttakingdamage = 1;
        popularboy = false;
        gothit = false;
        bet = false;
        minigameactivated = false;
        deletefacebug = true;
        betamount = 0;
        smashcuthurt = 0;
        pointsmultiplierthisturn = 5;
        totalfails = 0;
        scr_battle_sprite_reset("ralsei");
        if (resetralsei == true)
        {
            resetralsei = false;
            snd_play(snd_wing);
            obj_heroralsei.x = obj_heroralsei.xstart;
            obj_heroralsei.y = obj_heroralsei.ystart;
            with (obj_heroralsei)
            {
                normalsprite = spr_ralsei_walk_right;
                idlesprite = spr_ralsei_idle;
                defendsprite = spr_ralsei_defend;
                hurtsprite = spr_ralsei_hurt_fixed;
                attackreadysprite = spr_ralsei_attackready;
                attacksprite = spr_ralsei_attack;
                itemsprite = spr_ralsei_item;
                itemreadysprite = spr_ralsei_itemready;
                spellreadysprite = spr_ralsei_spellready;
                spellsprite = spr_ralsei_spell;
                defeatsprite = spr_ralsei_defeat;
                victorysprite = spr_ralsei_victory;
                actreadysprite = spr_ralsei_actready;
                actsprite = spr_ralsei_act;
            }
            repeat (26)
            {
                puff = instance_create(((obj_heroralsei.x + 50) - 60) + irandom(80), (obj_heroralsei.y - 90) + 90 + irandom(100), obj_animation);
                puff.depth = obj_heroralsei.depth - 1;
                puff.sprite_index = spr_susiezilla_houseexplosion;
                puff.image_speed = 0.5;
                puff.image_xscale = 1;
                puff.image_yscale = 1;
            }
        }
        if (lancercheat == true)
        {
            lancercheat = false;
            lancerspin = true;
            lancermarker.sprite_index = spr_lancer_lt;
            lancermarker.gravity = -0.1;
            lancermarker.image_angle = 0;
            lancermarker.x -= 80;
            lancermarker.y -= 10;
            actconsus = 0;
            actingsus = 0;
            snd_play(snd_slidewhistle);
        }
    }
}
if (popularboy == true && ralseihpprev != global.hp[3])
    obj_tenna_enemy_bg.addscore += round(abs(ralseihpprev - global.hp[3]) * 0.17);
ralseihpprev = global.hp[3];
if (lancerspin == true && lancermarker.y > (cameray() + 40) && lancermarker.gravity > 0)
{
    lancermarker.vspeed = 0;
    lancermarker.vspeed = 0;
    lancermarker.gravity = 0;
    lancermarker.image_angle = -90;
    lancermarker.sprite_index = spr_lancer_lt_stool;
    lancermarker.x += 80;
    lancermarker.y += 10;
    lancerspin = false;
    snd_play(snd_item);
    if (global.actsimulsus[myself][0] == 1)
    {
        actingsus = 1.4;
        actcon = 1;
        actconsus = 0;
    }
    else
    {
        scr_speaker("lan");
        msgsetloc(0, "\\E2* Ho ho ho! I may drop, but the points won't!/", "obj_tenna_enemy_slash_Step_0_gml_335_0");
        scr_anyface_next("no_name", 0);
        msgnextloc("* Lancer clung to the score like a koala! Points can't drop!/%", "obj_tenna_enemy_slash_Step_0_gml_337_0");
        scr_battletext();
        actingsus = 1.3;
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (deletefacebug == false)
    {
        deletefacebug = true;
        with (obj_face)
            instance_destroy();
    }
    var havejeviltail = false;
    if (global.chararmor1[1] == 7 || global.chararmor2[1] == 7 || global.chararmor1[2] == 7 || global.chararmor2[2] == 7 || global.chararmor1[3] == 7 || global.chararmor2[3] == 7)
        havejeviltail = true;
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        if (didkrisdoswordroute == true)
            msgsetloc(0, "* TENNA - Despite his size, sadly, he's quite fragile./%", "obj_tenna_enemy_slash_Step_0_gml_446_0");
        else if (global.chararmor1[1] == 21 || global.chararmor2[1] == 21 || global.chararmor1[2] == 21 || global.chararmor2[2] == 21 || global.chararmor1[3] == 21 || global.chararmor2[3] == 21)
            msgsetloc(0, "* TENNA - THE [Tragic businesmen] THAT [Died] AT THE [Now] OF THE [Story]/%", "obj_tenna_enemy_slash_Step_0_gml_449_0");
        else
            msgsetloc(0, "* TENNA - Isn't it about time you&got a new TV?/%", "obj_tenna_enemy_slash_Step_0_gml_450_0");
        scr_battletext_default();
    }
    if ((acting == 2 && actcon == 0) || (acting == 3 && actcon == 0) || (acting == 4 && actcon == 0) || (acting == 5 && actcon == 0))
    {
        if (acting == 2)
            strng = stringsetloc("Everyone gets", "obj_tenna_enemy_slash_Step_0_gml_387_0_b");
        if (acting == 3)
            strng = stringsetloc("You and Susie get", "obj_tenna_enemy_slash_Step_0_gml_385_0");
        if (acting == 4)
            strng = stringsetloc("You and Ralsei get", "obj_tenna_enemy_slash_Step_0_gml_386_0");
        if (acting == 5)
            strng = stringsetloc("You get", "obj_tenna_enemy_slash_Step_0_gml_384_0");
        acting = 5.1;
    }
    if (acting == 5.1 && actcon == 0)
    {
        var _playminigamestring = "* " + strng + stringsetloc(" ready to play...!/%", "obj_tenna_enemy_slash_Step_0_gml_393_0");
        msgset(0, _playminigamestring + "/%");
        scr_battletext_default();
        actcon = 1;
        minigameactivated = true;
        acting = 0;
        with (obj_tenna_enemy_bg)
            minigametimecon = 1;
    }
    if (acting == 6 && actcon == 0)
    {
        var _ilovetvstring = stringsetloc("* You said \"I Love TV\"!", "obj_tenna_enemy_slash_Step_0_gml_502_0");
        if (simultotal == 1)
        {
            msgset(0, _ilovetvstring + "/%");
            scr_battletext_default();
            acting = 6.1;
        }
        else
        {
            msgset(0, _ilovetvstring);
            scr_simultext("kris");
            if (simulorderkri == 0)
                actcon = 20;
            else
                actcon = -1;
            acting = 6.1;
        }
    }
    if (acting == 6.1 && actcon == 0 && !i_ex(obj_writer))
    {
        with (obj_tenna_enemy_bg)
        {
            addscore += (20 + other.extrapoints);
            if (global.hp[2] < 1 && global.hp[3] < 1)
                addscore += 20;
        }
        msgsetloc(0, "* He couldn't help but give some SCORE!/%", "obj_tenna_enemy_slash_Step_0_gml_439_0");
        scr_battletext_default();
        snd_play(snd_bell_bounce_short);
        with (obj_actor_tenna)
            pinkflash = 30;
        actcon = 1;
        acting = 0;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        if (acting != 6.1)
        {
            with (obj_tenna_enemy_bg)
            {
                addscore += 10;
                if (global.hp[1] < 1)
                    addscore += 10;
            }
        }
        else
        {
            extrapoints += 10;
            if (global.hp[1] < 1)
                extrapoints += 10;
        }
        var _s_act_string = stringsetloc("* Susie said \"I Love TV!\"", "obj_tenna_enemy_slash_Step_0_gml_457_0");
        if (simultotal == 1)
        {
            msgset(0, _s_act_string + "/%");
            scr_battletext_default();
            actconsus = 20;
        }
        else
        {
            msgset(0, _s_act_string);
            scr_simultext("susie");
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
    }
    if (actingsus == 2 && actconsus == 1)
    {
        bet = true;
        obj_herosusie.x -= 8;
        obj_herosusie.y -= 6;
        scr_act_charsprite("susie", spr_susie_zoosuit_Card, 1/3, 8);
        _charinstance.actspriteobject = _charactsprite[_charnum];
        if (havejeviltail)
        {
            betamount = 30;
            with (obj_tenna_enemy_bg)
                addscore -= 30;
        }
        else
        {
            betamount = 20;
            with (obj_tenna_enemy_bg)
                addscore -= 20;
        }
        if (!havejeviltail)
            msgsetloc(0, "* Susie bet 20 POINTs on no damage!/%", "obj_tenna_enemy_slash_Step_0_gml_387_0");
        if (havejeviltail)
        {
            msgsetloc(0, "* JOKER's bet! 30 pts on NO DAMAGE!!/%", "obj_tenna_enemy_slash_Step_0_gml_390_0");
            snd_play(snd_joker_laugh0);
        }
        scr_battletext_default();
        actingsus = 2.1;
    }
    if (actingsus == 2.1 && !i_ex(obj_writer))
    {
        scr_act_charsprite_end();
        obj_herosusie.x += 8;
        obj_herosusie.y += 6;
        scr_battle_sprite_reset("susie");
        actingsus = 2.2;
        actcon = 1;
        actconsus = 0;
    }
    if (actingral == 1 && actconral == 1)
    {
        if (acting != 6.1)
        {
            with (obj_tenna_enemy_bg)
            {
                addscore += 10;
                if (global.hp[1] < 1)
                    addscore += 10;
            }
        }
        else
        {
            extrapoints += 10;
            if (global.hp[1] < 1)
                extrapoints += 10;
        }
        var _r_act_string = stringsetloc("* Ralsei said \"I Love TV!\"", "obj_tenna_enemy_slash_Step_0_gml_517_0");
        if (simultotal == 1)
        {
            msgset(0, _r_act_string + "/%");
            scr_battletext_default();
            actconral = 20;
        }
        else
        {
            msgset(0, _r_act_string);
            scr_simultext("ralsei");
            if (simulorderral == 0)
                actconral = 20;
            else
                actconral = 0;
        }
    }
    if (actingral == 2 && actconral == 1)
    {
        popularboy = true;
        saveralseihp = global.hp[3];
        instance_create(x, y, obj_popularboy_act);
        snd_play(snd_drumroll);
        if (global.actsimulral[myself][1] == 0)
        {
            actingral = 2.1;
        }
        else
        {
            if (simulorderral == 0)
                actconral = 20;
            else
                actconral = 0;
            actingral = 2.3;
            msgsetloc(0, "* Ralsei's HP linked to points!/%", "obj_tenna_enemy_slash_Step_0_gml_602_0");
            scr_simultext("ralsei");
        }
    }
    if (actingral == 2.1 && !i_ex(obj_popularboy_act))
    {
        if (global.actsimulral[myself][1] == 0)
        {
            actingral = 2.2;
            msgsetloc(0, "* Ralsei became the center of attention!/%", "obj_tenna_enemy_slash_Step_0_gml_612_0");
            scr_battletext_default();
        }
    }
    if (actingral == 2.2 && !i_ex(obj_writer))
    {
        snd_play(snd_bump);
        with (ralseiplushmarker)
            scr_shakeobj();
        scr_speaker("ralsei");
        msgsetloc(0, "\\EU* Wh... why me!?/", "obj_tenna_enemy_slash_Step_0_gml_623_0");
        scr_anyface_next("no_name", 0);
        msgnextloc("\\EX* Any change to Ralsei's HP will give you points!/%", "obj_tenna_enemy_slash_Step_0_gml_625_0");
        scr_battletext();
        actingral = 2.3;
        actcon = 1;
        actconral = 0;
        global.actsimulral[myself][1] = 1;
    }
    if (actcon == 20 || actconsus == 20 || actconral == 20)
    {
        if (scr_terminate_writer() && obj_tenna_enemy_bg.addscore == 0)
        {
            actconsus = -1;
            actconral = -1;
            actcon = 1;
            with (obj_face)
                instance_destroy();
            if (acting == 6.1)
                actcon = 0;
        }
    }
    if (actcon == 1 && !instance_exists(obj_writer) && obj_tenna_enemy_bg.addscore == 0)
    {
        with (obj_face)
            instance_destroy();
        scr_nextact();
    }
}
if (state == 3)
{
    hurttimer -= 1;
    if (hurttimer < 0)
    {
        state = 0;
        tenna_actor.x = camerax() + 526;
        tenna_actor.y = cameray() + 260;
    }
    else
    {
        if (global.monster[myself] == 0)
            scr_defeatrun();
        hurtshake += 1;
        if (hurtshake > 1)
        {
            if (shakex > 0)
                shakex -= 1;
            if (shakex < 0)
                shakex += 1;
            shakex = -shakex;
            hurtshake = 0;
        }
    }
}
if (extrapointsviatension >= 2.5)
{
    extrapointsviatension -= 2.5;
    points++;
}
if (lancerspin == true)
{
    lancerindex++;
    if (lancerindex == 10)
        lancerindex = 2;
    if (lancerindex == 2)
        lancermarker.sprite_index = spr_lancer_ut;
    if (lancerindex == 4)
        lancermarker.sprite_index = spr_lancer_rt;
    if (lancerindex == 6)
        lancermarker.sprite_index = spr_lancer_dt;
    if (lancerindex == 8)
        lancermarker.sprite_index = spr_lancer_lt;
}
if (lancercheat == true && i_ex(obj_tenna_enemy_bg) && obj_tenna_enemy_bg.myscore < lancercheatpoints)
    obj_tenna_enemy_bg.myscore = lancercheatpoints;
if (minigametransition_con == 1)
{
    minigametransition_timer++;
    if (minigametransition_timer == 1)
    {
        tenna_actor.vspeed = -18;
        tenna_actor.hspeed = -10.5;
        tenna_actor.gravity = 2;
        tenna_actor.sprite_index = spr_tenna_attack;
        snd_play(snd_jump);
        with (obj_tenna_enemy_bg)
        {
            speedup = 0;
            slowdown = 1;
        }
    }
    if (tenna_actor.y > tenna_actor.ystart && tenna_actor.vspeed > 0)
    {
        tenna_actor.y = tenna_actor.ystart;
        tenna_actor.sprite_index = spr_tenna_grasp;
        tenna_actor._static = true;
        tenna_actor.vspeed = 0;
        tenna_actor.hspeed = 0;
        tenna_actor.gravity = 0;
        tenna_actor.x = camerax() + 320;
        tenna_actor.y = cameray() + 254;
        snd_play(snd_impact);
        scr_shakescreen();
        minigametransition_con = 1.5;
        minigametransition_timer = 0;
    }
}
if (minigametransition_con == 1.5)
{
    minigametransition_timer++;
    if (minigametransition_timer == 1)
    {
        tenna_zoom = instance_create(tenna_actor.x, tenna_actor.y - 154, obj_tenna_zoom);
        tenna_zoom.minigametype = minigametype;
        tenna_zoom.minigamedifficulty = difficulty;
        tenna_zoom.minigametype2 = minigametype2;
        tenna_zoom.minigamedifficulty2 = difficulty2;
        tenna_zoom.minigametype3 = minigametype3;
        tenna_zoom.minigamedifficulty3 = difficulty3;
        tenna_actor.x = -9999;
        tenna_actor.y = -9999;
        minigamefailcountprev = 0;
        minigamefailcount = 0;
    }
    if (minigametransition_timer == 15)
    {
        minigametransition_con = 2;
        minigametransition_timer = 0;
    }
}
if (minigametransition_con == 3)
{
    minigametransition_timer++;
    if (minigametransition_timer == 1)
    {
        tenna_actor.vspeed = -18;
        tenna_actor.hspeed = 10.5;
        tenna_actor.gravity = 2;
        tenna_actor.sprite_index = spr_tenna_attack;
        tenna_actor.image_xscale = -2;
        snd_play(snd_jump);
        if (minigamefailcount > 0)
            minigamefailcon = 1;
        else if (global.turntimer > 1)
            global.turntimer = 1;
        with (obj_tenna_enemy_bg)
        {
            speedup = 1;
            slowdown = 0;
        }
    }
    if (tenna_actor.y > tenna_actor.ystart && tenna_actor.vspeed > 0)
    {
        tenna_actor.sprite_index = spr_tenna_point_up;
        tenna_actor.vspeed = 0;
        tenna_actor.hspeed = 0;
        tenna_actor.gravity = 0;
        tenna_actor.image_xscale = 2;
        tenna_actor.x = tenna_actor.xstart;
        tenna_actor.y = tenna_actor.ystart;
        snd_play(snd_impact);
        scr_shakescreen();
        minigametransition_con = 0;
        minigametransition_timer = 0;
    }
    with (obj_vfx_twinkle)
        instance_destroy();
    with (obj_flickerdie)
        instance_destroy();
    with (obj_ch3_b4_chef_fire)
        instance_destroy();
}
if (minigamefailcount > 3)
    minigamefailcount = 3;
if (minigamefailcon == 1)
{
    if (minigamefailcount > 0 && (minigamefailtimer == 0 || minigamefailtimer == 15 || minigamefailtimer == 30))
    {
        minigamefailcount--;
        target = mytarget;
        totalfails++;
        if (totalfails == 1)
            damage = 56;
        if (totalfails == 2)
            damage = 26;
        if (totalfails > 2)
            damage = 18;
        snd_play(snd_damage);
        global.inv = -1;
        if (obj_tenna_enemy.popularboy && global.hp[3] > 0)
        {
            target = 2;
            damage *= 2;
            scr_damage();
            with (obj_heroralsei)
                instance_create(x + 30, y + 50, obj_tenna_x_hurt);
        }
        else
        {
            scr_damage_all();
            if (global.hp[1] > 0)
            {
                with (obj_herokris)
                    instance_create(x + 30, y + 50, obj_tenna_x_hurt);
            }
            if (global.hp[2] > 0)
            {
                with (obj_herosusie)
                    instance_create(x + 30, y + 50, obj_tenna_x_hurt);
            }
            if (global.hp[3] > 0)
            {
                with (obj_heroralsei)
                    instance_create(x + 30, y + 50, obj_tenna_x_hurt);
            }
        }
        global.inv = -1;
    }
    minigamefailtimer++;
    if (minigamefailcount == 0)
    {
        minigamefailtimer2++;
        if (minigamefailtimer2 == 5)
        {
            with (obj_dmgwriter)
                killactive = 1;
        }
        if (minigamefailtimer2 == 15)
        {
            minigamefailtimer = 0;
            minigamefailtimer2 = 0;
            minigamefailcon = 0;
            if (global.turntimer > 1)
                global.turntimer = 1;
        }
    }
}
if (minigamefailcount > 0 && global.turntimer < 4)
    global.turntimer = 4;
if (minigamefailcount > minigamefailcountprev && minigameinsanity)
{
    minigameinsanitydamage = true;
    for (ti = 0; ti < 3; ti += 1)
    {
        global.inv = -1;
        damage = ceil(global.hp[global.char[ti]] / 8);
        if (damage < 4)
            damage = 4;
        target = ti;
        if (global.hp[global.char[ti]] > 0 && global.char[ti] != 0)
        {
            scr_damage();
            if (i_ex(dmgwriter))
            {
                if (ti == 0)
                    dmgwriter.x -= 70;
                if (ti == 1)
                    dmgwriter.x += 170;
                if (ti == 2)
                    dmgwriter.x += 420;
                dmgwriter.y = 340;
                dmgwriter.ystart = 340;
                dmgwriter.depth = -999999999;
            }
        }
        if (phaseturn == 18 && i_ex(dmgwriter))
        {
            if (ti == 1)
                dmgwriter.x += 20;
            dmgwriter.ystart = 280;
        }
    }
    global.inv = global.invc * 30;
    target = 3;
    minigamefailcount = 0;
    minigameinsanitydamage = false;
}
minigamefailcountprev = minigamefailcount;

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
