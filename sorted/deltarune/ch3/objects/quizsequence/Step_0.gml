if (keyboard_check_pressed(vk_f5) && init && con >= 2 && scr_debug())
{
    kr_answer[0] = choose(0, 1);
    kr_answer[1] = choose(0, 1);
    kr_answer[2] = choose(0, 1);
    ra_answer[0] = choose(0, 1);
    ra_answer[1] = choose(0, 1);
    ra_answer[2] = choose(0, 1);
    su_answer[0] = choose(0, 1);
    su_answer[1] = choose(0, 1);
    su_answer[2] = choose(0, 1);
    if (quizno > 15 && quizno <= 19)
        quiz_length = 1;
    else
        quiz_length = 3;
    total_correct = 0;
    timer = 0;
    con = 7;
    safe_delete(questionwriter);
}
if (init == 0)
{
    if (quiz_length > 0)
        quizno = quizQs[0];
    scr_quiztext(quizno);
    if (board4)
        gameshowblue = 2237064;
    if (!board4)
    {
        snd_free_all();
        global.currentsong[0] = snd_init("TV_GAME.ogg");
        if (quizno >= 15)
            snd_pitch(global.currentsong[1], 1.5);
    }
    init = 1;
    snd_play(snd_nes_nocontroller);
    if (board4)
    {
        global.currentsong[0] = snd_init("board_4_challenge.ogg");
        screen = instance_find(obj_dw_gameshow_screen_lava, 0);
    }
    else
    {
    }
}
if (i_ex(quizzler))
{
    if (subcon >= 1)
    {
        if (subcon >= 2)
            quizzler.su_podium = sresult ? 2 : 3;
        if (subcon >= 3)
            quizzler.kr_podium = correct ? 2 : 3;
        if (subcon >= 1)
            quizzler.ra_podium = rresult ? 2 : 3;
    }
    else
    {
        quizzler.su_podium = ssel ? 1 : 0;
        if (myanswer != -1)
            quizzler.kr_podium = (con == 4) ? 1 : 0;
        quizzler.ra_podium = rsel ? 1 : 0;
    }
}
if (con == 0)
{
    if (!pausestart)
        timer += 1;
    if (i_ex(questionwriter))
        instance_destroy(questionwriter);
    if (timer >= 45 && !i_ex(quizzler))
    {
        quizzler = instance_create(camerax(), cameray(), obj_quizroom);
        quizzler.bg = instance_create(camerax(), cameray(), obj_quizroom_bg);
        quizzler.bg.visible = false;
        if (board4)
        {
            quizzler.board4 = true;
            quizzler.bg.depth = newdepth - 1000;
        }
        global.currentsong[1] = mus_loop(global.currentsong[0]);
    }
    if (timer >= 60)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    global.msg[0] = question;
    questionlength = string_length(question);
    global.typer = 100;
    if (global.lang == "ja")
        global.typer = 101;
    questionwriter = instance_create(146, 82, obj_writer_quiz);
    questionwriter.depth = depth;
    questionwriter.board4 = board4;
    if (quizno >= 15 && quizno <= 19)
    {
        timelimit = fast_timelimit;
        questionwriter.shake = 0.505;
        if (quizno == 19)
        {
            with (questionwriter)
            {
                charline *= 2;
                textscale /= 2;
                hspace /= 2;
                vspace /= 2;
            }
        }
    }
    else
    {
        timelimit = base_timelimit;
    }
    con = 2;
    buffer = 5;
}
if (con < 5 && tenna_timer > 0)
{
    if (con > 2)
        tenna_timer = 0;
    else
        tenna_timer--;
    if (tenna_timer <= 0)
    {
        quizzler.tenna.sprite_index = quizzler.tenna_podium;
        quizzler.tenna.bounce = 1;
        quizzler.tenna.image_index = 3;
    }
}
if (con == 2)
{
    if (timer == 10 && quizid == "asriel")
        snd_pitch_time(global.currentsong[1], 0.1, 250);
    timer++;
    var nextstep = false;
    if (timer >= (questionlength + 4) || (i_ex(questionwriter) && questionwriter.reachedend == 1))
        nextstep = true;
    if (nextstep)
    {
        if (false && quiz_index == 0 && !board4)
        {
            con = 2.5;
            timer_delay = 30;
            countdown = timelimit;
        }
        else
        {
            timer = 0;
            anser = 0;
            con = 3;
            countdown = 0;
            if (quizid == "asriel")
            {
                auto = true;
                con = 4;
            }
        }
    }
}
if (con == 2.5 && timer_delay <= 0)
    con = 3;
if (con == 3 || con == 3.5)
{
    if (countdown == 0)
        countdown = timelimit;
    if (!paused)
        countdown--;
    commenttimer++;
    if (commentcount > 0)
    {
        for (var i = 0; i < commentcount; i++)
        {
            if (commenttimer >= commentcreatetimer[i] && commentshown[i] == 0)
            {
                if (commentchar[i] == 0)
                {
                    var _tennabubble = scr_tennabubble(commentcontent[i], 480, 100, commentdestroytime[i], 1, -1, 64);
                    _tennabubble.tenna = quizzler.tenna;
                }
                else
                {
                    var _char;
                    if (commentchar[i] == 1)
                        _char = "su";
                    else if (commentchar[i] == 2)
                        _char = "ra";
                    if (commentcontent[i] != "")
                        scr_couchclear(_char);
                    scr_couchtalk(commentcontent[i], _char, 0, commentdestroytime[i]);
                }
                commentshown[i] = 1;
            }
        }
    }
    if ((quizid == "smash" || quizid == "favfood" || quizid == "asgorefave") && ktimer >= 0 && ktimer < 50)
    {
        if ((abs(menucoord[menu] - correctanswer) % 2) == 1 || ktimer >= 30)
        {
            ktimer++;
            if (ktimer == 30)
            {
                quizzler.kr_sprite = spr_kris_quiz_cough;
                quizzler.kr_pose = true;
                movelock = true;
                buffer = 1;
            }
            if (ktimer == 35)
            {
                quizzler.kr_index++;
                menucoord[menu] = correctanswer;
                snd_play(snd_menumove);
                snd_play_pitch(snd_cough, 3);
            }
            if (ktimer == 37 || ktimer == 40)
                quizzler.kr_index++;
            if (ktimer == 50)
            {
                quizzler.kr_pose = false;
                quizzler.kr_sprite = spr_kris_quiz_down;
                buffer = 1;
                ralbuffer = irandom_range(15, 20);
                susbuffer = irandom_range(8, 14);
                ktimer = -1;
                movelock = false;
            }
        }
        else
        {
            ktimer = 0;
        }
    }
    else if (quizid == "puppetshow")
    {
        if (commenttimer == 20)
            scr_createquizcomment(stringsetloc("Wh... WHAT!?", "obj_quizsequence_slash_Step_0_gml_224_0"), 0, 30, 4934);
        if (commenttimer == 55)
        {
            snd_play_pitch(snd_board_text_main_end, 1.5);
            rsel = true;
            ssel = true;
            snd_stop(global.currentsong[1]);
            paused = true;
        }
        if (commenttimer == 70)
            scr_createquizcomment(stringsetloc("It was CANCELLED!?#You gotta be kidding me!!", "obj_quizsequence_slash_Step_0_gml_235_0"), 0, 80, 4539, 0);
        if (commenttimer == 150)
            scr_createquizcomment(stringsetloc("No!! You're joking!! I...#I invested everything in puppets!!#Everything I had!", "obj_quizsequence_slash_Step_0_gml_239_0"), 0, 90, 773);
        if (commenttimer == 260)
            scr_createquizcomment(stringsetloc("... Alright. Ahem. It's fine.#Let's just keep going.#We're, having so much fun!", "obj_quizsequence_slash_Step_0_gml_243_0"), 0, 90, 2713);
        if (commenttimer == 350)
        {
            con = 5;
            rcorrect++;
            ra_answer[quiz_index] = 1;
            scorrect++;
            su_answer[quiz_index] = 1;
            kcorrect++;
            kr_answer[quiz_index] = 1;
            total_correct += 3;
            quiz_index++;
            timer = 55;
        }
    }
    if (!paused)
    {
        if (!movelock)
            buffer = -1;
        if (buffer <= 0)
        {
            if (down_p())
            {
                menucoord[menu] += 1;
                buffer = 1;
                ralbuffer = irandom_range(15, 20);
                susbuffer = irandom_range(8, 14);
                if (i_ex(quizzler))
                    quizzler.kr_press = 4;
                snd_play(snd_menumove);
            }
            if (up_p())
            {
                menucoord[menu] -= 1;
                buffer = 1;
                ralbuffer = irandom_range(15, 20);
                susbuffer = irandom_range(8, 14);
                if (i_ex(quizzler))
                    quizzler.kr_press = 4;
                snd_play(snd_menumove);
            }
            if (menucoord[menu] < 0)
                menucoord[menu] = 3;
            if (menucoord[menu] > 3)
                menucoord[menu] = 0;
        }
        event_user(0);
        event_user(1);
        if (button1_p() && buffer <= 0 && myanswer < 0 && commenttimer < 10)
            scr_debug_print("comment timer at " + string(commenttimer));
        if (button1_p() && buffer <= 0 && commenttimer >= 10 && myanswer < 0)
        {
            if (i_ex(quizzler))
                quizzler.kr_press = 4;
            snd_play_pitch(snd_select, choicepitch);
            choicepitch += 0.1;
            timer = 0;
            myanswer = menucoord[menu];
            if (commenttimer <= 14)
            {
                var _iscorrect = myanswer == correctanswer || correctanswer == 4;
                if (correctanswer == -1)
                {
                    if (quizid == "whattime" && myanswer != 3)
                    {
                        _iscorrect = true;
                        if (myanswer != 1)
                        {
                            if (schoose == 0)
                            {
                                schoose = -1;
                                if (susBehavior == 1)
                                    susBehavior = 3;
                            }
                        }
                    }
                    if (quizid == "ralseiplush" && (myanswer == 0 || myanswer == 3))
                        _iscorrect = true;
                }
                if (!_iscorrect)
                {
                    if (schoose == 0)
                    {
                        schoose = -1;
                        if (susBehavior == 1)
                            susBehavior = 3;
                    }
                    if (rchoose == 0)
                        rchoose = -1;
                    if (skiptimer >= 0 && quizid != "puppetshow")
                        commenttimer += skiptimer;
                }
                if (su_guess == -1)
                    su_guess = irandom(3);
                if (ra_guess == -1)
                    ra_guess = irandom(3);
                su_wait = ((su_wait - 30) / 5) + 30;
                ra_wait = ((ra_wait - 30) / 5) + 30;
            }
            if (quizid != "puppetshow")
            {
                con = 4;
                with (obj_ch3_ballcon)
                    appearcon = 2;
            }
        }
        if (countdown <= 0)
            con = 4;
    }
}
else if (con < 3)
{
    if (down_h() || up_h() || button1_h())
    {
        if (i_ex(quizzler))
            quizzler.kr_press = 2;
    }
}
if (con == 4)
{
    if (!auto && countdown >= 0)
    {
        event_user(0);
        event_user(1);
    }
    if ((rsel && ssel) || countdown <= 0 || auto)
    {
        timer++;
        if (quizid == "lancer" && extra)
        {
            if (timer == 20)
            {
                endtimer = 999999;
                global.flag[1073] = ralseicoord;
            }
            var tbubx = 480;
            var tbuby = 408;
            var ttail = 64;
            var timespace = 140;
            var starttime = 30;
            var lanname = stringsetloc("Lancer", "obj_quizsequence_slash_Step_0_gml_396_0");
            if (ralseicoord == 1)
                lanname = stringsetloc("Dancer", "obj_quizsequence_slash_Step_0_gml_397_0");
            if (ralseicoord == 2)
                lanname = stringsetloc("Prancer", "obj_quizsequence_slash_Step_0_gml_398_0");
            if (ralseicoord == 3)
                lanname = stringsetloc("Mr. Generosity", "obj_quizsequence_slash_Step_0_gml_399_0");
            var testring1 = stringsetsubloc("Interesting! His name#is ~1.", lanname, "obj_quizsequence_slash_Step_0_gml_402_0");
            if (ralseicoord != 0)
            {
                if (timer == (starttime + (timespace * 0)))
                {
                    safe_delete(obj_couchwriter);
                    safe_delete(obj_tennatalkbubble);
                    quizzler.tenna.sprite_index = spr_tenna_pose_podium;
                    quizzler.tenna.bounce = 1;
                    var tetalk = testring1;
                    scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
                }
                checkskip(starttime + (timespace * 0), starttime + (timespace * 1));
                if (timer == (starttime + (timespace * 1)))
                {
                    with (obj_tennatalkbubble)
                        instance_destroy();
                    var sutalk = stringsetloc("No it's not.", "obj_quizsequence_slash_Step_0_gml_364_0");
                    scr_couchtalk(sutalk, "susie", 2, timespace);
                    quizzler.su_sprite = spr_susie_walk_right_dw_unhappy;
                }
                checkskip(starttime + (timespace * 1), starttime + (timespace * 2));
                if (timer == (starttime + (timespace * 2)))
                {
                    quizzler.su_sprite = spr_susie_walk_down_dw_unhappy;
                    quizzler.tenna.sprite_index = spr_tenna_pose_podium;
                    quizzler.tenna.bounce = 1;
                    var tetalk = stringsetloc("Majority rules!#Sorry, Susie,#your answer is wrong!", "obj_quizsequence_slash_Step_0_gml_366_0");
                    scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
                }
                checkskip(starttime + (timespace * 2), starttime + (timespace * 3));
                if (timer == (starttime + (timespace * 3)))
                {
                    quizzler.tenna.sprite_index = spr_tenna_point_at_screen;
                    quizzler.tenna.bounce = 1;
                    endtimer = timer + 1;
                    correctanswer = ralseicoord;
                    extra = false;
                    timer = 19;
                }
            }
            else
            {
                if (timer == (starttime + (timespace * 0)))
                {
                    safe_delete(obj_couchwriter);
                    safe_delete(obj_tennatalkbubble);
                    quizzler.tenna.sprite_index = spr_tenna_pose_podium;
                    quizzler.tenna.bounce = 1;
                    var tetalk = testring1;
                    scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
                }
                checkskip(starttime + (timespace * 0), starttime + (timespace * 1));
                if (timer == (starttime + (timespace * 1)))
                {
                    endtimer = timer + 1;
                    extra = false;
                    timer = 19;
                }
            }
        }
        else if (timer == 20)
        {
            var _gotcorrect = false;
            if (subcon == 0)
            {
                sresult = 0;
                rresult = 0;
                correct = 0;
                if (rsel)
                {
                    if (quizid == "whattime" && ralseicoord != 3)
                        _gotcorrect = true;
                    else if (quizid == "ralseiplush" && (ralseicoord == 0 || ralseicoord == 3))
                        _gotcorrect = true;
                    else if (ralseicoord == correctanswer || correctanswer == 4)
                        _gotcorrect = true;
                }
                if (quizid == "ax" && ralseicoord != susiecoord)
                    quizzler.su_sprite = spr_susie_pose_what_the;
            }
            else if (subcon == 1)
            {
                if (ssel)
                {
                    if (quizid == "whattime" && susiecoord != 3)
                        _gotcorrect = true;
                    else if (quizid == "ralseiplush" && (susiecoord == 0 || susiecoord == 3))
                        _gotcorrect = true;
                    else if (susiecoord == correctanswer || correctanswer == 4)
                        _gotcorrect = true;
                }
            }
            else if (subcon == 2)
            {
                if (myanswer > -1)
                {
                    if (quizid == "whattime" && myanswer != 3)
                        _gotcorrect = true;
                    else if (quizid == "ralseiplush" && (myanswer == 0 || myanswer == 3))
                        _gotcorrect = true;
                    else if (myanswer == correctanswer || correctanswer == 4)
                        _gotcorrect = true;
                }
                if (quizid == "ax" && myanswer != susiecoord)
                    quizzler.su_sprite = spr_susie_pose_what_the;
                if (quizid == "favfood" && susiecoord == myanswer && myanswer != correctanswer)
                    quizzler.su_sprite = spr_susie_quiz_more_confused;
            }
            if (_gotcorrect)
            {
                snd_play(snd_coin);
                if (subcon == 0)
                {
                    rcorrect++;
                    rresult = 1;
                    ra_answer[quiz_index] = 1;
                }
                if (subcon == 1)
                {
                    scorrect++;
                    sresult = 1;
                    su_answer[quiz_index] = 1;
                }
                if (subcon == 2)
                {
                    kcorrect++;
                    correct = 1;
                    kr_answer[quiz_index] = 1;
                }
                total_correct++;
                q_correct++;
            }
            else
            {
                snd_play(snd_hurt1);
                if (subcon == 0)
                    ra_answer[quiz_index] = 0;
                if (subcon == 1)
                    su_answer[quiz_index] = 0;
                if (subcon == 2)
                    kr_answer[quiz_index] = 0;
            }
            subcon++;
            if (subcon == 3)
            {
                con = 5;
                quiz_index++;
                if (quiz_index >= quiz_length)
                    endtimer = 100;
                else
                    endtimer = 60;
            }
            else
            {
                timer -= 12;
            }
        }
    }
    else if (!paused)
    {
        countdown--;
    }
}
if (con == 5)
{
    if (!postcomment)
    {
        postcomment = true;
        commentcount = 0;
    }
    if (quizid == "whattime")
    {
        if (timer == 20)
            endtimer = 999999;
        var tbubx = 480;
        var tbuby = 408;
        var ttail = 64;
        var timespace = 140;
        var starttime = 30;
        if (timer == (starttime + (timespace * 0)))
        {
            safe_delete(obj_couchwriter);
            safe_delete(obj_tennatalkbubble);
            var tetalk = "";
            if (myanswer == -1)
                myanswer = choose(ralseicoord, susiecoord);
            if (myanswer == 0)
            {
                tetalk = stringsetloc("TV-THIRTY! Uh, sure!#A bit off, but we'll#go with it.", "obj_quizsequence_slash_Step_0_gml_600_0");
                quizzler.tenna.sprite_index = spr_tenna_pose_podium;
            }
            if (myanswer == 1)
            {
                tetalk = stringsetloc("THAT'S EXACTLY RIGHT#FOLKS!!! Way to start#this quiz with a BANG!", "obj_quizsequence_slash_Step_0_gml_605_0");
                quizzler.tenna.sprite_index = spr_tenna_pose_podium;
            }
            if (myanswer == 2)
            {
                tetalk = stringsetloc("Uhh, I guess that's#technically right. Sure.", "obj_quizsequence_slash_Step_0_gml_610_0");
                quizzler.tenna.sprite_index = spr_tenna_laugh_pose;
            }
            if (myanswer == 3)
            {
                tetalk = stringsetloc("Aaaaand you got the only#wrong answer. Let's hear#some boo's, folks!", "obj_quizsequence_slash_Step_0_gml_615_0");
                quizzler.tenna.sprite_index = spr_tenna_laugh_pose;
            }
            quizzler.tenna.bounce = 1;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        if (timer == (starttime + (timespace * 0) + 60) && myanswer == 3)
            snd_play(snd_crowd_ooh);
        if (timer == (starttime + (timespace * 1)))
            endtimer = timer + 1;
        for (var i = 0; i < 20; i++)
            checkskip(starttime + (timespace * i), starttime + (timespace * (i + 1)));
    }
    if (quizid == "ralseiplush")
    {
        if (timer == 20)
            endtimer = 999999;
        var tbubx = 480;
        var tbuby = 408;
        var ttail = 64;
        var timespace = 140;
        var starttime = 30;
        if (myanswer == -1)
            myanswer = choose(ralseicoord, susiecoord);
        if (myanswer == 2)
            starttime = 40;
        if (myanswer == 0 || myanswer == 3)
        {
            if (timer == (starttime + (timespace * 0)))
            {
                safe_delete(obj_couchwriter);
                safe_delete(obj_tennatalkbubble);
                quizzler.tenna.sprite_index = spr_tenna_laugh_pose;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("That's right! This#little guy costs $32!", "obj_quizsequence_slash_Step_0_gml_651_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (starttime + (timespace * 1)))
                endtimer = timer + 1;
            for (var i = 0; i < 20; i++)
                checkskip(starttime + (timespace * i), starttime + (timespace * (i + 1)));
        }
        if (myanswer == 1)
        {
            if (timer == (starttime + (timespace * 0)))
            {
                safe_delete(obj_couchwriter);
                safe_delete(obj_tennatalkbubble);
                quizzler.tenna.sprite_index = spr_tenna_pose_podium;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("Sorry folks, but this#boy ain't cheap! Maybe wait#for that Steamed Sale!", "obj_quizsequence_slash_Step_0_gml_667_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (starttime + (timespace * 1)))
                endtimer = timer + 1;
            for (var i = 0; i < 20; i++)
                checkskip(starttime + (timespace * i), starttime + (timespace * (i + 1)));
        }
        if (myanswer == 2)
        {
            if (timer == (starttime + 0))
            {
                quizzler.kr_sprite = spr_krisr_dark;
                quizzler.ra_sprite = spr_ralsei_left;
                var ratalk = stringsetloc("Aww, Kris! I...", "obj_quizsequence_slash_Step_0_gml_683_0");
                scr_couchtalk(ratalk, "ralsei", 2, 999);
            }
            checkskip(starttime + 0, starttime + 90);
            if (timer == (starttime + 90))
            {
                safe_delete(obj_couchwriter);
                quizzler.tenna.sprite_index = spr_tenna_point_left;
                quizzler.tenna.bounce = 1;
                quizzler.ra_sprite = spr_ralsei_shocked_right;
                with (quizzler.ralsei)
                    scr_shakeobj();
                snd_play(snd_wing);
                var tetalk = stringsetloc("Wrong! He costs $32!#Can't you see the PRICE TAG!?", "obj_quizsequence_slash_Step_0_gml_699_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            checkskip(starttime + 90, starttime + 90 + (timespace * 1));
            if (timer == (starttime + 90 + (timespace * 1)))
                endtimer = timer + 1;
        }
    }
    if (quizid == "ax" && total_correct < 3)
    {
        if (timer == 20)
            endtimer += 65;
        if (timer == 40)
            scr_couchtalk(stringsetloc("Oops.", "obj_quizsequence_slash_Step_0_gml_475_0"), "ra", 0, 30);
        if (timer == 65)
        {
            if (myanswer == susiecoord || ralseicoord == susiecoord)
                scr_couchtalk(stringsetloc("Why the hell didn't you trust me!?", "obj_quizsequence_slash_Step_0_gml_481_0"), "su");
            else
                scr_couchtalk(stringsetloc("Why the hell didn't you guys trust me!?", "obj_quizsequence_slash_Step_0_gml_482_0"), "su");
            quizzler.su_sprite = spr_susie_exasperated;
            with (quizzler.susie)
                scr_shakeobj();
        }
        if (timer == 70)
        {
            quizzler.ra_sprite = spr_ralsei_shocked_left;
            quizzler.kr_sprite = spr_krisl_dark;
        }
    }
    if (quizid == "favfood")
    {
        if (timer == 20)
            endtimer = 999999;
        var tbubx = 480;
        var tbuby = 408;
        var ttail = 64;
        var timespace = 140;
        var starttime = 30;
        if (correct)
        {
            if (timer == (starttime + (timespace * 0)))
            {
                safe_delete(obj_couchwriter);
                safe_delete(obj_tennatalkbubble);
                quizzler.tenna.sprite_index = spr_tenna_pose_podium;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("That's right, Kris!#Who can resist#your mother's homemade pie!", "obj_quizsequence_slash_Step_0_gml_502_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (starttime + (timespace * 1)))
            {
                quizzler.tenna.sprite_index = spr_tenna_laugh_pose;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("Nothing better than#chowing down with#the family...", "obj_quizsequence_slash_Step_0_gml_503_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (starttime + (timespace * 2)))
            {
                quizzler.tenna.sprite_index = spr_tenna_nose_blossom;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("In the warm, warm glow of your#favorite holiday specials!", "obj_quizsequence_slash_Step_0_gml_504_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (starttime + (timespace * 3)))
            {
                quizzler.tenna.sprite_index = spr_tenna_point_up;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("Right here on TV TIME!!!", "obj_quizsequence_slash_Step_0_gml_505_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (starttime + (timespace * 4)))
            {
                quizzler.tenna.sprite_index = spr_tenna_point_at_screen;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("Now, let's see those RESULTS!", "obj_quizsequence_slash_Step_0_gml_506_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (starttime + (timespace * 5)))
            {
                debug_print("ending!!");
                endtimer = timer;
                safe_delete(obj_tennatalkbubble);
            }
            for (var i = 0; i < 20; i++)
                checkskip(starttime + (timespace * i), starttime + (timespace * (i + 1)));
        }
        else
        {
            if (timer == (20 + (timespace * 0)))
            {
                quizzler.su_sprite = spr_susie_walk_right_dw;
                with (quizzler.susie)
                {
                    image_speed = 0.25;
                    scr_delay_var("image_speed", 0, 10);
                }
                var sutalk = stringsetloc("Heh, how'd you mess THAT up?", "obj_quizsequence_slash_Step_0_gml_512_0");
                scr_couchtalk(sutalk, "susie", 2, timespace);
            }
            if (timer == (20 + (timespace * 1)))
            {
                quizzler.su_sprite = spr_susie_walk_down_dw;
                quizzler.susie.image_speed = 0;
                quizzler.tenna.sprite_index = spr_tenna_tie_adjust_a;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("... Kris? Haha... Kris,#you know that's not right!", "obj_quizsequence_slash_Step_0_gml_515_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (20 + (timespace * 2)))
            {
                quizzler.tenna.sprite_index = spr_tenna_nose_blossom;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("Pie! You loved pie, didn't you?#With the family!", "obj_quizsequence_slash_Step_0_gml_516_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (20 + (timespace * 3)))
            {
                quizzler.tenna.sprite_index = spr_tenna_laugh_pose;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("You and brother with#whipped cream beards...", "obj_quizsequence_slash_Step_0_gml_517_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (20 + (timespace * 4)))
            {
                quizzler.tenna.sprite_index = spr_tenna_point_up;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("Right in front of the TV!!#Right in front of ME!", "obj_quizsequence_slash_Step_0_gml_518_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (20 + (timespace * 5)))
            {
                quizzler.tenna.sprite_index = spr_tenna_point_at_screen;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("Anyway, onto the results!!", "obj_quizsequence_slash_Step_0_gml_519_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            if (timer == (20 + (timespace * 6)))
            {
                endtimer = timer;
                safe_delete(obj_tennatalkbubble);
            }
            for (var i = 0; i < 20; i++)
                checkskip(20 + (timespace * i), 20 + (timespace * (i + 1)));
        }
    }
    if (quizid == "tenna")
    {
        if (timer == 20)
            endtimer = 999999;
        var tbubx = 480;
        var tbuby = 408;
        var ttail = 64;
        var timespace = 140;
        var starttime = 30;
        checkskip(0, starttime + (timespace * 0));
        if (timer == (starttime + (timespace * 0)))
        {
            safe_delete(obj_couchwriter);
            safe_delete(obj_tennatalkbubble);
            var tetalk = "";
            var tesprite = 2232;
            if (myanswer == 0 || myanswer == -1)
            {
                tetalk = stringsetloc("Don't you know your own TV?!", "obj_quizsequence_slash_Step_0_gml_535_0");
                tesprite = 4934;
            }
            if (myanswer == 2)
            {
                tetalk = stringsetloc("Haha, that's me, FOLKS!", "obj_quizsequence_slash_Step_0_gml_531_0");
                tesprite = 2232;
            }
            if (myanswer == 1 || myanswer == 3)
            {
                tetalk = stringsetloc("Haha! I, regret#including that answer.", "obj_quizsequence_slash_Step_0_gml_541_0");
                tesprite = 4628;
            }
            quizzler.tenna.sprite_index = tesprite;
            quizzler.tenna.bounce = 1;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        checkskip(starttime + (timespace * 0), starttime + (timespace * 1));
        if (timer == (starttime + (timespace * 1)))
            endtimer = timer + 1;
    }
    if (quizid == "channel")
    {
        if (timer == 20 && myanswer >= 0)
        {
            endtimer = 40;
            if (myanswer < 3)
            {
                scr_quizcomment_add(stringsetloc("That's right, Kris!#Smart kid!", "obj_quizsequence_slash_Step_0_gml_555_0"), 0, 60, 2232);
                scr_quizcomment_add(stringsetloc("Now, let's see those RESULTS!", "obj_quizsequence_slash_Step_0_gml_556_0"), 0, 60, 4099);
            }
            else
            {
                scr_quizcomment_add(stringsetloc("What the... OTHER!?", "obj_quizsequence_slash_Step_0_gml_560_0"), 0, 45, 2592);
                scr_quizcomment_add(stringsetloc("I mean you can just stream whatever on a Smart TV.", "obj_quizsequence_slash_Step_0_gml_561_0"), 1, 60);
                scr_quizcomment_add(stringsetloc("Smart... WHAT?#Are you calling me STUPID!?", "obj_quizsequence_slash_Step_0_gml_562_0"), 0, 60, 4628);
            }
        }
    }
    if (quizid == "smash")
    {
        if (timer == 20)
            endtimer = 999999;
        var tbubx = 382;
        var tbuby = 190;
        var ttail = 120;
        var timespace = 140;
        var starttime = 30;
        checkskip(0, starttime + (timespace * 0));
        if (timer == (starttime + (timespace * 0)))
        {
            safe_delete(obj_couchwriter);
            safe_delete(obj_tennatalkbubble);
            if (!correct)
            {
                var sutalk = stringsetloc("What the#hell, Kris?", "obj_quizsequence_slash_Step_0_gml_963_0");
                scr_couchtalk(sutalk, "susie", 2, timespace);
            }
            else
            {
                timer = starttime + (timespace * 1);
            }
        }
        if (timer == (starttime + (timespace * 1)))
        {
            with (obj_couchwriter)
                instance_destroy();
            var tesprite = 4187;
            var tetalk = stringsetloc("That's right,#Kris!", "obj_quizsequence_slash_Step_0_gml_574_0");
            if (!correct)
            {
                tetalk = stringsetloc("Kris!? Don't#you remember!?", "obj_quizsequence_slash_Step_0_gml_587_0");
                tesprite = 4934;
            }
            quizzler.tenna.sprite_index = tesprite;
            quizzler.tenna.bounce = 1;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        if (timer == (starttime + (timespace * 2)))
        {
            quizzler.tenna.bounce = 1;
            var tetalk = stringsetloc("He got#embarrassed#about liking the#green dinosaur...", "obj_quizsequence_slash_Step_0_gml_575_0");
            quizzler.tenna.sprite_index = spr_tenna_tie_adjust_a;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        if (timer == (starttime + (timespace * 3)))
        {
            quizzler.tenna.bounce = 1;
            var tetalk = stringsetloc("...and switched to#being a big fan of the#fiery magician girl!", "obj_quizsequence_slash_Step_0_gml_576_0");
            quizzler.tenna.sprite_index = spr_tenna_hooray_armsup;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        if (timer == (starttime + (timespace * 4)))
        {
            quizzler.tenna.bounce = 1;
            var tetalk = stringsetloc("Which is, maybe#its own type of#embarrassing, but...", "obj_quizsequence_slash_Step_0_gml_577_0");
            quizzler.tenna.sprite_index = spr_tenna_whisper_blush;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        if (timer == (starttime + (timespace * 5)))
        {
            quizzler.tenna.bounce = 1;
            var tetalk = stringsetloc("...Anyway, onto#the results!!", "obj_quizsequence_slash_Step_0_gml_578_0");
            quizzler.tenna.sprite_index = spr_tenna_point_at_screen;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        if (timer == (starttime + (timespace * 6)))
            endtimer = timer + 1;
        for (var i = 0; i < 20; i++)
            checkskip(starttime + (timespace * i), starttime + (timespace * (i + 1)));
    }
    if (quizid == "tvtime")
    {
        if (timer == 20)
            endtimer = 999999;
        var tbubx = 480;
        var tbuby = 408;
        var ttail = 64;
        var timespace = 140;
        var starttime = 30;
        if (correct)
        {
            checkskip(0, starttime + (timespace * 0));
            if (timer == (starttime + (timespace * 0)))
            {
                safe_delete(obj_couchwriter);
                safe_delete(obj_tennatalkbubble);
                quizzler.tenna.sprite_index = spr_tenna_pose;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("Kris!! Haha,#I knew you cared!!", "obj_quizsequence_slash_Step_0_gml_603_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            checkskip(starttime + (timespace * 0), starttime + (timespace * 1));
            if (timer == (starttime + (timespace * 1)))
                endtimer = timer + 1;
        }
        else
        {
            checkskip(0, starttime + (timespace * 0));
            if (timer == (starttime + (timespace * 0)))
            {
                safe_delete(obj_couchwriter);
                safe_delete(obj_tennatalkbubble);
                quizzler.tenna.sprite_index = spr_tenna_pose_podium;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("Haha, wow! Haha...#uhh, wow!", "obj_quizsequence_slash_Step_0_gml_607_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            checkskip(starttime + (timespace * 0), starttime + (timespace * 1));
            if (timer == (starttime + (timespace * 1)))
            {
                quizzler.tenna.sprite_index = spr_tenna_tie_adjust_c;
                quizzler.tenna.bounce = 1;
                var tetalk = stringsetloc("MIKE, uhh, can we cut#that one from air? MIKE?", "obj_quizsequence_slash_Step_0_gml_608_0");
                scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
            }
            checkskip(starttime + (timespace * 1), starttime + (timespace * 2));
            if (timer == (starttime + (timespace * 2)))
                endtimer = timer + 1;
        }
    }
    if (quizid == "sofun")
    {
        if (timer == 20)
            endtimer = 999999;
        var tbubx = 480;
        var tbuby = 408;
        var ttail = 64;
        var timespace = 140;
        var starttime = 30;
        checkskip(0, starttime + (timespace * 0));
        if (timer == (starttime + (timespace * 0)))
        {
            safe_delete(obj_couchwriter);
            safe_delete(obj_tennatalkbubble);
            var tetalk = stringsetloc("THAT'S WHAT I THOUGHT!", "obj_quizsequence_slash_Step_0_gml_617_0");
            var tesprite = 2601;
            if (!correct)
            {
                tetalk = stringsetloc("OUT OF TIME!!! WRONG!!!", "obj_quizsequence_slash_Step_0_gml_619_0");
                tesprite = 4628;
            }
            quizzler.tenna.sprite_index = tesprite;
            quizzler.tenna.bounce = true;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        checkskip(starttime + (timespace * 0), starttime + (timespace * 1));
        if (timer == (starttime + (timespace * 1)))
        {
            with (obj_tennatalkbubble)
                instance_destroy();
            endtimer = timer + 1;
        }
    }
    if (quizid == "anotherword")
    {
        if (timer == 20)
            endtimer = 999999;
        var tbubx = 480;
        var tbuby = 408;
        var ttail = 64;
        var timespace = 140;
        var starttime = 30;
        checkskip(0, starttime + (timespace * 0));
        if (timer == (starttime + (timespace * 0)))
        {
            safe_delete(obj_couchwriter);
            safe_delete(obj_tennatalkbubble);
            var tetalk = stringsetloc("All great answers!", "obj_quizsequence_slash_Step_0_gml_628_0");
            var tesprite = 3839;
            if (!correct)
            {
                tetalk = stringsetloc("WRONG! WRONG! WRONG!!!", "obj_quizsequence_slash_Step_0_gml_630_0");
                tesprite = 666;
            }
            quizzler.tenna.sprite_index = tesprite;
            quizzler.tenna.bounce = true;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        checkskip(starttime + (timespace * 0), starttime + (timespace * 1));
        if (timer == (starttime + (timespace * 1)))
        {
            with (obj_tennatalkbubble)
                instance_destroy();
            endtimer = timer + 1;
        }
    }
    if (quizid == "button")
    {
        if (timer == 20)
            endtimer = 999999;
        var tbubx = 480;
        var tbuby = 408;
        var ttail = 64;
        var timespace = 140;
        var starttime = 30;
        checkskip(0, starttime + (timespace * 0));
        if (timer == (starttime + (timespace * 0)))
        {
            safe_delete(obj_couchwriter);
            safe_delete(obj_tennatalkbubble);
            var tetalk = stringsetloc("That's right. That's#right, isn't it.", "obj_quizsequence_slash_Step_0_gml_640_0");
            var tesprite = 3839;
            if (!correct)
            {
                tetalk = stringsetloc("I KNOW WHAT YOU'RE THINKING!!!#YOU'RE WRONG!!!", "obj_quizsequence_slash_Step_0_gml_642_0");
                tesprite = 666;
            }
            quizzler.tenna.sprite_index = tesprite;
            quizzler.tenna.bounce = true;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        checkskip(starttime + (timespace * 0), starttime + (timespace * 1));
        if (timer == (starttime + (timespace * 1)))
        {
            with (obj_tennatalkbubble)
                instance_destroy();
            endtimer = timer + 1;
        }
    }
    if (quizid == "watchtv")
    {
        if (timer == 20)
            endtimer = 999999;
        var tbubx = 480;
        var tbuby = 408;
        var ttail = 64;
        var timespace = 140;
        var starttime = 30;
        checkskip(0, starttime + (timespace * 0));
        if (timer == (starttime + (timespace * 0)))
        {
            safe_delete(obj_couchwriter);
            safe_delete(obj_tennatalkbubble);
            var tetalk = stringsetloc("Whaddya know! RIGHT ANSWERS!!!", "obj_quizsequence_slash_Step_0_gml_652_0");
            var tesprite = 3839;
            if (!correct)
            {
                tetalk = stringsetloc("ANSWER, DARN YOU!!! ANSWER!!!", "obj_quizsequence_slash_Step_0_gml_654_0");
                tesprite = 666;
            }
            quizzler.tenna.sprite_index = tesprite;
            quizzler.tenna.bounce = true;
            scr_tennabubble(tetalk, tbubx, tbuby, timespace, 1, quizzler.tenna, ttail);
        }
        checkskip(starttime + (timespace * 0), starttime + (timespace * 1));
        if (timer == (starttime + (timespace * 1)))
        {
            with (obj_tennatalkbubble)
                instance_destroy();
            endtimer = timer + 1;
        }
    }
    if (commentcount > 0)
    {
        for (var i = 0; i < commentcount; i++)
        {
            if (timer >= commentcreatetimer[i] && commentshown[i] == 0)
            {
                scr_createquizcomment(commentcontent[i], commentchar[i], commentdestroytime[i], commentsprite[i], commentimage[i]);
                commentshown[i] = 1;
            }
        }
    }
    timer++;
    if (timer >= endtimer)
    {
        paused = false;
        if (board4)
        {
            if (timer == endtimer && (kr_answer[0] == 0 || su_answer[0] == 0 || ra_answer[0] == 0) && quizzler.tenna.sprite_index != spr_tenna_point_up_b)
            {
                quizzler.tenna.sprite_index = spr_tenna_point_up_b;
                quizzler.tenna.bounce = 1;
            }
            event_user(3);
            if (timer >= endtimer)
            {
                if (quizzler.con < 3)
                    quizzler.con++;
                if (quizzler.con == 4)
                    con = 8;
            }
        }
        else if (quiz_index < quiz_length)
        {
            con = 6;
            timer = 40;
        }
        else
        {
            timer = 0;
            con = 7;
        }
    }
}
if (con == 6)
{
    timer++;
    if (timer >= 55)
    {
        drawquestion = false;
        event_user(2);
    }
}
if (con == 7)
{
    if (sprite != -4)
        sprite = -4;
    if (i_ex(extra_obj))
        instance_destroy(extra_obj);
}
if (con == 5.5)
{
}
if (con == 8)
{
    with (obj_ch3_ballcon)
        appearcon = 2;
    with (questionwriter)
        instance_destroy();
    if (!board4)
    {
        global.interact = 0;
        snd_free_all();
    }
    if (board4)
    {
        snd_free(global.currentsong[0]);
        with (obj_darkcontroller)
            charcon = 0;
        with (obj_dmgwriter)
            instance_destroy();
    }
    if (i_ex(obj_ch3_gameshow))
        mus_initloop(obj_ch3_gameshow.boardmusic);
    if (i_ex(grandaddy))
    {
        var _x = round((grandaddy.x - 16) / 32) * 32;
        var _y = round((grandaddy.y - 16) / 32) * 32;
        _q = instance_create(_x, _y, obj_board_pickup);
        _q.type = "q";
        grandaddy.completed = true;
    }
    if (room == room_board_1)
    {
        var forcethrow = false;
        with (obj_board_grabobject)
            forcethrow = true;
        if (forcethrow)
            scr_board_forcethrow();
    }
    instance_destroy();
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("T")))
        debugpause = 1 - debugpause;
    if (debugpause == 1)
    {
        debug_print("Pause!!");
        countdown = timelimit;
        timer = -1;
    }
}
