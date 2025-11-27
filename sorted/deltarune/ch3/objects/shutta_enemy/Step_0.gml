with (obj_heroparent)
{
    if (object_index == obj_herokris)
        depth = 160;
    if (object_index == obj_herosusie)
        depth = 157;
    if (object_index == obj_heroralsei)
        depth = 154;
}
if (!i_ex(obj_herosusie) || !i_ex(obj_heroralsei))
{
    if (debugvar == false && scr_debug())
    {
        scr_debug_print("You need Susie and Ralsei for this battle");
        debugvar = true;
    }
    exit;
}
if (endbattle == true && !i_ex(obj_writer))
    scr_spare(myself);
if (intro == 1 && room == room_board_2)
{
    global.batmusic[0] = snd_init("rudebuster_boss.ogg");
    global.batmusic[1] = mus_loop_ext(global.batmusic[0], 0.7, 1);
    talked = 0;
    intro = 4;
}
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        with (obj_shutta_shine)
            instance_destroy();
        if (scr_monsterpop() != 1)
        {
            myattackchoice = 3;
        }
        else
        {
            if (attackorder == 0)
                myattackchoice = 0;
            if (attackorder == 1)
                myattackchoice = 1;
            if (attackorder == 2)
                myattackchoice = 2;
            attackorder++;
            if (attackorder > 2)
                attackorder = 0;
        }
        myattackpriority = 1;
        if (myattackchoice == 2)
            myattackpriority = 50;
        scr_attackpriority(myattackpriority - 1);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        global.typer = 50;
        var usegenericdialogue = false;
        var rotationfailballoon1string = stringsetloc("Oh, a miserable&picture. This is a&mistake./%", "obj_shutta_enemy_slash_Step_0_gml_62_0_b");
        if (amiabossfight && photoactcount == 1)
        {
            if (turns > 0 && photosuccessballoon == 0)
            {
                usegenericdialogue = true;
                freefailcount++;
            }
            else if (photosuccessballoon == 1)
            {
                msgsetloc(0, "The brilliant photo!&I can't believe&it's your first shoot!/%", "obj_shutta_enemy_slash_Step_0_gml_69_0");
                ballooncon = 1;
                balloonend = 0;
            }
            else
            {
                msgsetloc(0, "Not in the mood&for the photo shoot?&Mmmm.../%", "obj_shutta_enemy_slash_Step_0_gml_70_0");
                ballooncon = 2;
                balloonend = 0;
                freefailcount++;
            }
            if (freefailcount == 1)
            {
                freefailcount++;
            }
            else if (justusedcameraact)
            {
                photoactcount++;
                if (photoactcount == 7)
                    photoactcount = 3;
                if (global.mercymod[obj_shutta_enemy.myself] >= 80)
                    photoactcount = 8;
            }
        }
        else if (amiabossfight && !justusedcameraact && photoactcount > 1)
        {
            usegenericdialogue = true;
        }
        else if (amiabossfight && justusedcameraact)
        {
            if (photoactcount == 2)
            {
                if (photosuccessballoon == 1)
                {
                    msgsetloc(0, "Ooo la la. Was my&smile always so&beautiful?/%", "obj_shutta_enemy_slash_Step_0_gml_74_0");
                    ballooncon = 3;
                    balloonend = 0;
                }
                else
                {
                    msgset(0, rotationfailballoon1string);
                    ballooncon = 4;
                    balloonend = 0;
                    rotationfailcount++;
                }
            }
            else if (photoactcount == 3)
            {
                if (photosuccessballoon == 1)
                {
                    msgsetloc(0, "Ooo la la. The&exquisite Lancer&for our collection./%", "obj_shutta_enemy_slash_Step_0_gml_79_0");
                    ballooncon = 5;
                    balloonend = 0;
                }
                else
                {
                    msgsetloc(0, "Ooo la la. We&will have to do&the re-take./%", "obj_shutta_enemy_slash_Step_0_gml_80_0");
                    ballooncon = 6;
                    balloonend = 0;
                    lancerfailcount++;
                }
            }
            else if (photoactcount == 4)
            {
                if (photosuccessballoon == 1)
                {
                    msgsetloc(0, "Ah, the beautiful&wildlife photo of&the Susie in her&natural environment.../%", "obj_shutta_enemy_slash_Step_0_gml_84_0");
                    ballooncon = 7;
                    balloonend = 0;
                }
                else
                {
                    msgsetloc(0, "Ah, the Kris has&failed the Toilet&Challenge./%", "obj_shutta_enemy_slash_Step_0_gml_85_0");
                    ballooncon = 8;
                    balloonend = 0;
                    toiletfailcount++;
                }
            }
            else if (photoactcount == 5)
            {
                if (photosuccessballoon == 1)
                {
                    msgsetloc(0, "Ooo la la. The&Ralsei!&I would recognize&that silhouette.../%", "obj_shutta_enemy_slash_Step_0_gml_89_0");
                    ballooncon = 9;
                    balloonend = 0;
                }
                else
                {
                    msgsetloc(0, "Ooo la la. Kris,&don't you recognize&The Ralsei, your&dear companion,&your friendship,&little flossy boy,&the bimbito./%", "obj_shutta_enemy_slash_Step_0_gml_90_0");
                    ballooncon = 10;
                    balloonend = 0;
                    ralseifailcount++;
                }
            }
            else if (photoactcount == 6)
            {
                if (photosuccessballoon == 1)
                {
                    msgsetloc(0, "Ohhh, so beautiful!&I save the picture,&I save the picture./%", "obj_shutta_enemy_slash_Step_0_gml_94_0");
                    ballooncon = 11;
                    balloonend = 0;
                }
                else
                {
                    msgset(0, rotationfailballoon1string);
                    ballooncon = 4;
                    balloonend = 0;
                }
            }
            else if (photoactcount == 7)
            {
                if (photosuccessballoon == 1)
                {
                    msgsetloc(0, "Ohh, little monogram&boy, he jumps and&jumps./%", "obj_shutta_enemy_slash_Step_0_gml_99_0");
                    ballooncon = 12;
                    balloonend = 0;
                }
                else
                {
                    msgsetloc(0, "Ohhh, the picture.&I save the picture!/%", "obj_shutta_enemy_slash_Step_0_gml_100_0");
                    ballooncon = 13;
                    balloonend = 0;
                }
            }
            else
            {
                usegenericdialogue = true;
            }
            if (photoactcount == 2 && rotationfailcount == 1)
            {
                rotationfailcount++;
            }
            else if (photoactcount == 3 && lancerfailcount == 1)
            {
                lancerfailcount++;
            }
            else if (photoactcount == 4 && toiletfailcount == 1)
            {
                toiletfailcount++;
            }
            else if (photoactcount == 5 && ralseifailcount == 1)
            {
                ralseifailcount++;
            }
            else
            {
                photoactcount++;
                if (photoactcount == 7)
                    photoactcount = 3;
            }
            if (global.mercymod[obj_shutta_enemy.myself] >= 80)
                photoactcount = 8;
        }
        if (!amiabossfight || usegenericdialogue)
        {
            var _ext = "";
            if (amiabossfight)
                _ext = "/%";
            rr = choose(0, 1, 2, 3, 4, 5);
            if (rr == 0)
                msgsetsubloc(0, "How are we&LOOKING today?~1", _ext, "obj_shutta_enemy_slash_Step_0_gml_121_0");
            if (rr == 1)
                msgsetsubloc(0, "POSE and... HOLD!&Can we get a little smolder?~1", _ext, "obj_shutta_enemy_slash_Step_0_gml_122_0");
            if (rr == 2)
                msgsetsubloc(0, "The energy, baby,&EYE am LOVING it!~1", _ext, "obj_shutta_enemy_slash_Step_0_gml_123_0");
            if (rr == 3)
                msgsetsubloc(0, "Work it baby,&WORK it!~1", _ext, "obj_shutta_enemy_slash_Step_0_gml_124_0");
            if (rr == 4)
                msgsetsubloc(0, "How's my ATTACK ALBUM?&I'll let you in it too!~1", _ext, "obj_shutta_enemy_slash_Step_0_gml_125_0");
            if (rr == 5)
                msgsetsubloc(0, "My memory is&photographic,&photo-TASTIC!&Wanna see?~1", _ext, "obj_shutta_enemy_slash_Step_0_gml_126_0");
            if (sharpshootballoon)
            {
                msgsetloc(0, "My handlashes&are so curled!", "obj_shutta_enemy_slash_Step_0_gml_116_0");
                sharpshootballoon = false;
            }
            ballooncon = 0;
            balloonend = 1;
        }
        scr_enemyblcon(x - 5, global.monstery[myself], 10);
        photosuccessballoon = 0;
        justusedcameraact = false;
        talked = 1;
        talktimer = 0;
        rtimer = 0;
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
        if (!amiabossfight)
            talked = 1;
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
                msgsetloc(0, "Now how about I &shoot... YOU?/%", "obj_shutta_enemy_slash_Step_0_gml_161_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "Then how about&I shoot... YOU?/%", "obj_shutta_enemy_slash_Step_0_gml_162_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 3)
            {
                msgsetloc(0, "The camera added&10 pounds of pure&happiness to my&teeth.../%", "obj_shutta_enemy_slash_Step_0_gml_163_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 4)
            {
                msgsetloc(0, "Let us agree to&delete this&picture. Forever./%", "obj_shutta_enemy_slash_Step_0_gml_164_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 5)
            {
                msgsetloc(0, "How about a fashion&photo with the little&monogram boy later?/%", "obj_shutta_enemy_slash_Step_0_gml_165_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 6)
            {
                msgsetloc(0, "Lancer, keep doing&stretches to keep&your tongue warmed-up./%", "obj_shutta_enemy_slash_Step_0_gml_166_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 7)
            {
                msgsetloc(0, "Destruction,&Destruction,&Ah, it lights&my smile./%", "obj_shutta_enemy_slash_Step_0_gml_167_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 8)
            {
                msgsetloc(0, "Ah... no, no,&I blame the&lighting.../%", "obj_shutta_enemy_slash_Step_0_gml_168_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 9)
            {
                msgsetloc(0, "Well, I would&recognize it &multiple places,&I suppose./%", "obj_shutta_enemy_slash_Step_0_gml_169_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 10)
            {
                msgsetloc(0, "Me neither./%", "obj_shutta_enemy_slash_Step_0_gml_170_0_b");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 11)
            {
                msgsetloc(0, "It's my new &background,&it's my new&foreground./%", "obj_shutta_enemy_slash_Step_0_gml_171_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 12)
            {
                msgsetloc(0, "A perfect photo of&a little joy.&I rate it E10+./%", "obj_shutta_enemy_slash_Step_0_gml_172_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 13)
            {
                msgsetloc(0, "Ohh, the picture.&I delete the picture!/%", "obj_shutta_enemy_slash_Step_0_gml_173_0");
                ballooncon = 0;
                balloonend = 1;
            }
            talked = 0.7;
            global.typer = 50;
            scr_enemyblcon(x - 5, global.monstery[myself], 10);
            ralseitalks = 0;
            susietalks = 0;
            alarm[6] = 1;
        }
    }
    if (amiabossfight && talked == 1 && scr_isphase("enemytalk") && !i_ex(obj_writer))
    {
        global.mnfight = 1.5;
        attackchosen = false;
    }
    if (!amiabossfight && talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    if (global.mnfight == 1.5)
    {
        if (!instance_exists(obj_growtangle))
            instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
        if (!instance_exists(obj_moveheart) && !i_ex(obj_heart))
            scr_moveheart();
        global.mnfight = 2;
        scr_turntimer(90);
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 1)
            posecon = 1;
        if (rtimer == 12)
        {
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "shutta 1";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 146;
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 64;
                dc.difficulty = 0;
            }
            if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "shutta 2";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 147;
                dc.difficulty = 3;
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 64;
                dc.difficulty = 3;
                dc.special = 1;
            }
            if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "shutta 3";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 145;
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 64;
                dc.difficulty = 3;
                dc.special = 2;
            }
            if (myattackchoice == 3)
            {
                if (i_ex(obj_zapper_enemy) || i_ex(obj_shadowman_enemy))
                {
                    dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 64;
                    dc.difficulty = 3;
                    dc.special = 2;
                }
            }
            scr_turntimer(200);
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3);
            if (amiabossfight == true)
            {
                global.fc = 22;
                global.battletyper = 80;
                rr = choose(0, 1, 2);
                if (irandom(100) < 3)
                    rr = 3;
                if (rr == 0)
                    global.battlemsg[0] = stringsetloc("* LIGHTS! CAMERA! ... CAMERAAAA!", "obj_shutta_enemy_slash_Step_0_gml_129_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* HEY, GET ONE FOR FUNKIEST HOME VIDEOS, FOLKS!", "obj_shutta_enemy_slash_Step_0_gml_130_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* MAKE MEMORIES YOU'LL LOOK BACK ON! ^1... EVERY DAY!", "obj_shutta_enemy_slash_Step_0_gml_131_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetloc("* WOUGH! SMELLS LIKE A DARKROOM! ... GET IT???", "obj_shutta_enemy_slash_Step_0_gml_132_0");
            }
            else
            {
                if (scr_messagepriority(random(2)))
                {
                    var substring = string(myself);
                    if (rr == 0)
                        global.battlemsg[0] = stringsetloc("* Shuttah struttahs.", "obj_shutta_enemy_slash_Step_0_gml_139_0");
                    if (rr == 1)
                        global.battlemsg[0] = stringsetloc("* Shuttah sings in a gasping voice.", "obj_shutta_enemy_slash_Step_0_gml_140_0");
                    if (rr == 2)
                        global.battlemsg[0] = stringsetloc("* Shuttah takes selfies from two angles at once.", "obj_shutta_enemy_slash_Step_0_gml_141_0");
                    if (rr == 3)
                        global.battlemsg[0] = stringsetloc("* Shuttah considers the best lighting for its attack.", "obj_shutta_enemy_slash_Step_0_gml_142_0");
                }
                if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3) && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Shuttah's starting to look sepia.", "obj_shutta_enemy_slash_Step_0_gml_144_0");
                if (global.mercymod[myself] >= 100 && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Shuttah preps for its RECRUITment portrait.", "obj_shutta_enemy_slash_Step_0_gml_145_0");
                if (global.monsterstatus[myself] == 1 && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Shuttah is so TIRED, it can't keep its shutters open.", "obj_shutta_enemy_slash_Step_0_gml_146_0");
                if (irandom(100) < 3)
                    global.battlemsg[0] = stringsetloc("* Smells like a darkroom... ironically enough.", "obj_shutta_enemy_slash_Step_0_gml_147_0");
            }
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        if (photoactcount == 4 && global.hp[2] < 1)
            photoactcount = 5;
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* SHUTTAH - When its eyes snap shut, memories are made in grey./%", "obj_shutta_enemy_slash_Step_0_gml_170_0");
        scr_battletext_default();
    }
    var inpname = scr_get_input_name(4);
    var photoacttext = stringsetsubloc("* Press directions to aim!&* Press ~1 to take the photo!", inpname, "obj_shutta_enemy_slash_Step_0_gml_174_0");
    if (global.lang == "ja" && scr_is_switch_os())
        photoacttext = stringsetsub("＊ 方向ボタンで　狙え！\n＊ ~1で　シャッターを切れ！", inpname);
    if (i_ex(obj_shadowman_enemy) || i_ex(obj_zapper_enemy))
        photoacttext = stringsetloc("* Photo the most bullets!", "obj_shutta_enemy_slash_Step_0_gml_314_0");
    if (actingral == 2 && filter == false)
    {
        with (obj_shutta_enemy)
            filter = true;
        if (global.flag[512] == 0 && simultotal == 1)
        {
            msgsetloc(0, "* Ralsei adds a filter to the photo! It's easier to center photos!!/%", "obj_shutta_enemy_slash_Step_0_gml_181_0");
            global.flag[512] = 1;
        }
        else
        {
            msgsetloc(0, "* Ralsei adds a filter!/%", "obj_shutta_enemy_slash_Step_0_gml_184_0");
        }
        scr_battletext_default();
        exit;
    }
    if (acting == 2 && actcon == 0 && !i_ex(obj_writer))
    {
        fastphoto = false;
        acting = 3.1;
    }
    if (acting == 3 && actcon == 0 && !i_ex(obj_writer))
    {
        fastphoto = true;
        acting = 3.1;
    }
    if (acting == 4 && actcon == 0 && !i_ex(obj_writer))
    {
        powerphoto = true;
        acting = 3.1;
    }
    if (acting == 3.1 && actcon == 0 && !i_ex(obj_writer))
    {
        justusedcameraact = true;
        var _pipestring = stringsetloc("* Take a photo Shuttah!/%", "obj_shutta_enemy_slash_Step_0_gml_349_0");
        var _palmstring = stringsetloc("* Take a photo any character!/%", "obj_shutta_enemy_slash_Step_0_gml_204_0");
        var _toiletstring = stringsetloc("* Take a photo of an explosion! Time it right!/%", "obj_shutta_enemy_slash_Step_0_gml_205_0");
        var _lancerstring = stringsetloc("* Take a photo of Lancer's tongue!/%", "obj_shutta_enemy_slash_Step_0_gml_352_0");
        var _rotationtring = stringsetloc("* Take a photo of Shuttah's Smile!/%", "obj_shutta_enemy_slash_Step_0_gml_353_0");
        var _ralseitring = stringsetloc("* Take a photo of Ralsei!/%", "obj_shutta_enemy_slash_Step_0_gml_354_0");
        var _bullettring = stringsetloc("* Photo as many bullets as you can!", "obj_shutta_enemy_slash_Step_0_gml_355_0");
        if (amiabossfight == true)
        {
            if (photoactcount == 1)
                msgsetloc(0, "* Take a full-body photo of anyone!/%", "obj_shutta_enemy_slash_Step_0_gml_359_0");
            if (photoactcount == 2)
                msgset(0, _rotationtring);
            if (photoactcount == 3)
                msgset(0, _lancerstring);
            if (photoactcount == 4)
                msgset(0, _toiletstring);
            if (photoactcount == 5)
                msgset(0, _ralseitring);
            if (photoactcount == 6)
                msgset(0, _rotationtring);
            if (photoactcount == 7)
                msgset(0, _lancerstring);
            if (photoactcount == 8)
                msgsetloc(0, "* Take a photo of all the heroes together!/%", "obj_shutta_enemy_slash_Step_0_gml_366_0");
        }
        else
        {
            var _rand = choose(0, 1, 2);
            if (_rand == 0)
            {
                photoactcount = 5;
                msgset(0, _ralseitring);
            }
            if (_rand == 1)
            {
                photoactcount = 3;
                msgset(0, _lancerstring);
            }
            if (_rand == 2)
            {
                photoactcount = 2;
                msgset(0, _rotationtring);
            }
        }
        scr_battletext_default();
        acting = 3.2;
    }
    if (acting == 3.2 && actcon == 0 && (!i_ex(obj_writer) || i_ex(obj_shadowman_enemy) || i_ex(obj_zapper_enemy)))
    {
        var _controller = instance_create(x, y, obj_shutta_photo_controller);
        _controller.enemy = id;
        _controller.fastphoto = true;
        _controller.posemax = 50 + irandom(20);
        _controller.powerphoto = powerphoto;
        if (filter)
        {
            _controller.centered_distance = 47;
            _controller.reticle_size = 18;
        }
        if (fastphoto == false)
            _controller.timer_duration = 300;
        if (fastphoto == true)
            _controller.timer_duration = 150;
        if (amiabossfight == true && photoactcount == 0)
            _controller.timer_duration = 540;
        if (!i_ex(obj_shadowman_enemy) && !i_ex(obj_zapper_enemy))
        {
            msgset(0, photoacttext);
            scr_battletext_default();
        }
        with (obj_writer)
            pos = 100;
        fastphoto = false;
        acting = 5;
    }
    if (acting == 5 && !i_ex(obj_writer) && !i_ex(obj_shutta_photo_controller))
    {
        if (amiabossfight == true && global.mercymod[myself] > 99)
        {
            if (endcon == 1 && !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "The most lovely photo!&My album, my heart are full./%", "obj_shutta_enemy_slash_Step_0_gml_420_0");
                scr_enemyblcon(x - 5, global.monstery[myself], 10);
                endcon = 2;
            }
            if (endcon == 2 && !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "Normally,&my photos are&all grey.../%", "obj_shutta_enemy_slash_Step_0_gml_428_0");
                scr_enemyblcon(x - 10, global.monstery[myself] - 20, 10);
                endcon = 3;
            }
            if (endcon == 3 && !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "... but you've&turned my sky blue,&blue, BLUE!/%", "obj_shutta_enemy_slash_Step_0_gml_436_0");
                scr_enemyblcon(x - 5, global.monstery[myself], 10);
                endcon = 4;
            }
            if (endcon == 4 && !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "I forgive you!&Now, adieu!&In the name of/%", "obj_shutta_enemy_slash_Step_0_gml_444_0");
                scr_enemyblcon(x - 5, global.monstery[myself], 10);
                endcon = 5;
            }
            if (endcon == 5 && !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "... T H E   L O V E.../%", "obj_shutta_enemy_slash_Step_0_gml_452_0");
                scr_enemyblcon(x - 5, global.monstery[myself], 10);
                endcon = 6;
            }
            if (endcon == 6 && !i_ex(obj_writer))
            {
                talktimer = 0;
                endcon = 7;
                scr_spare(myself);
            }
        }
        else
        {
            actcon = 1;
            acting = 0;
        }
    }
    if (actingsus == 1 && actconsus == 1)
    {
        if (global.flag[511] == 0 && simultotal == 1)
        {
            msgsetloc(0, "* Susie blinks during a photo!/%", "obj_shutta_enemy_slash_Step_0_gml_270_0");
            scr_battletext_default();
            global.flag[511] = 1;
            actcon = 1;
            actonsus = 20;
        }
        else
        {
            var _text = "_";
            var rand = choose(0, 1, 2);
            if (rand == 0)
                _text = stringsetloc("* Susie sneezes during a photo!", "obj_shutta_enemy_slash_Step_0_gml_280_0");
            if (rand == 1)
                _text = stringsetloc("* Susie blurs during a photo!", "obj_shutta_enemy_slash_Step_0_gml_281_0");
            if (rand == 2)
                _text = stringsetloc("* Susie blinks during a photo!", "obj_shutta_enemy_slash_Step_0_gml_282_0");
            if (simultotal == 1)
            {
                msgset(0, _text + "/%");
                scr_battletext_default();
                with (obj_face)
                    instance_destroy();
            }
            else
            {
                msgset(0, _text);
                scr_simultext("susie");
            }
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
        actingsus = 0;
        if (amiabossfight == true)
            scr_mercyadd(myself, 5);
        else
            scr_mercyadd(myself, 25);
    }
    if (actingral == 1 && actconral == 1)
    {
        var _text = "_";
        var rand = choose(0, 1, 2);
        if (rand == 0)
            _text = stringsetloc("* Ralsei stared into the camera!", "obj_shutta_enemy_slash_Step_0_gml_584_0");
        if (rand == 1)
            _text = stringsetloc("* Ralsei has a perfect hair day!", "obj_shutta_enemy_slash_Step_0_gml_585_0");
        if (rand == 2)
            _text = stringsetloc("* Ralsei's photo got overexposed!", "obj_shutta_enemy_slash_Step_0_gml_586_0");
        if (simultotal == 1)
        {
            msgset(0, _text + "/%");
            scr_battletext_default();
            with (obj_face)
                instance_destroy();
            actconral = 20;
        }
        else
        {
            msgset(0, _text);
            scr_simultext("ralsei");
            if (simulorderral == 0)
                actconral = 20;
            else
                actconral = 0;
        }
        actingral = 0;
        if (amiabossfight == true)
            scr_mercyadd(myself, 5);
        else
            scr_mercyadd(myself, 35);
    }
    if (actingral == 2 && actconral == 1)
    {
        actcon = 1;
        actingral = 0;
        actconral = 0;
    }
    if (actcon == 20 || actconsus == 20 || actconral == 20)
    {
        if (scr_terminate_writer())
        {
            actconsus = -1;
            actconral = -1;
            actcon = 1;
        }
    }
    if (actcon == 1 && !instance_exists(obj_writer))
        scr_nextact();
}
if (state == 3)
{
    if (amiabossfight == false)
        scr_enemyhurt_tired_after_damage(0.5);
    scr_enemy_hurt();
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("1")))
    {
        photoactcount = 0;
        scr_debug_print("photo 1: free picture");
    }
    if (keyboard_check_pressed(ord("2")))
    {
        photoactcount = 1;
        scr_debug_print("photo 2: rotation easy");
    }
    if (keyboard_check_pressed(ord("3")))
    {
        photoactcount = 2;
        scr_debug_print("photo 3: lancer easy");
    }
    if (keyboard_check_pressed(ord("4")))
    {
        photoactcount = 3;
        scr_debug_print("photo 4: toilet explosion");
    }
    if (keyboard_check_pressed(ord("5")))
    {
        photoactcount = 4;
        scr_debug_print("photo 5: ralsei");
    }
    if (keyboard_check_pressed(ord("6")))
    {
        photoactcount = 5;
        scr_debug_print("photo 6: rotation hard");
    }
    if (keyboard_check_pressed(ord("7")))
    {
        photoactcount = 6;
        scr_debug_print("photo 7: lancer hard");
    }
    if (keyboard_check_pressed(ord("8")))
    {
        photoactcount = 7;
        scr_debug_print("photo 8: family photo");
    }
}

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
