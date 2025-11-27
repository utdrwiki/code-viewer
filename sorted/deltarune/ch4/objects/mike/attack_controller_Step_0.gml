if (scr_debug())
{
    if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check_pressed(ord("1")))
    {
        action = 13;
        debug_mikes();
        print_message("skipped to last attack!");
    }
}
if (!(global.is_console || onSteamDeck()))
{
    if (audio_get_recorder_count() == 0 && global.right_click_mic == 0)
        global.right_click_mic = 2;
}
if (phase == 0 && global.use_mic && !global.right_click_mic)
{
    var mx = 100;
    var my = 0;
    var mwidth = 440;
    var mheight = 100;
    var ly = cameray() + my + (mheight / 2) + 32;
    var lw = point_distance(camerax() + mx + 96, 0, (camerax() + mx + mwidth) - 96, 0);
    var lx = camerax() + mx + 96 + (lw * (global.mic_sensitivity / 4));
    obj_mike_hand.x = obj_mike_controller.mx;
    obj_mike_hand.y = obj_mike_controller.my;
    if (obj_mike_controller.hand_type == 2 || collision_rectangle(camerax() + mx + 86, ly - 46, (camerax() + mx + mwidth) - 96, ly - 30, obj_mike_hand, false, true))
    {
        if (scr_mouse_left())
        {
            obj_mike_controller.hand_type = 2;
            global.mic_sensitivity = clamp(inverselerp(camerax() + mx + 86, (camerax() + mx + mwidth) - 96, obj_mike_controller.mx - 12) * 4, 0.1, 4);
        }
    }
}
if (target <= 0 || target > 3)
    target = 1;
if (global.hp[target] <= 0 || global.hp[target] != lasthp || global.char[target - 1] == 0)
{
    lasttarget = target;
    target += 1;
    if (target > 3)
        target = 1;
    lasthp = global.hp[target];
}
with (obj_collidebullet)
{
    target = other.target - 1;
    damage = 20 * instance_number(obj_heroparent);
}
with (obj_face)
    depth = -2;
with (obj_writer)
    prevent_mash_buffer = 3;
if (phase == 0 && canclick)
{
    global.msgno = 0;
    for (i = 0; i < 100; i++)
        global.msg[i] = stringsetloc("", "obj_mike_attack_controller_slash_Step_0_gml_35_0");
    with (obj_herokris)
    {
        if (place_meeting(x, y, obj_hand_collision) && x == xstart)
        {
            other.phase = 0.1;
            other.petting = 0;
            other.alarm[5] = 45;
            other.star = 0;
            other.caster = 0;
            with (obj_mike_controller)
            {
                hand_shake = 30;
                hand_type = 3;
            }
            with (obj_hand_collision)
                instance_destroy();
        }
    }
    with (obj_herosusie)
    {
        if (place_meeting(x, y, obj_hand_collision) && x == xstart)
        {
            other.phase = 0.1;
            other.petting = 1;
            other.alarm[5] = 45;
            other.star = 1;
            other.caster = 1;
            x = xstart - 14;
            y = ystart + 8;
            scr_shakeobj();
            with (obj_mike_controller)
            {
                hand_shake = 45;
                hand_type = 5;
            }
            state = 8;
            sprite_index = spr_susie_angry_down_dw;
            snd_play(snd_sussurprise);
            with (obj_hand_collision)
                instance_destroy();
        }
    }
    with (obj_heroralsei)
    {
        if (place_meeting(x, y, obj_hand_collision) && x == xstart)
        {
            other.phase = 0.1;
            other.petting = 2;
            other.alarm[5] = 30;
            other.star = 2;
            other.caster = 2;
            state = 8;
            if (obj_mike_attack_controller.pet_current[2] > 1)
            {
                sprite_index = spr_ralsei_splat;
                y = ystart + 30;
                snd_play(snd_splat);
            }
            else
            {
                if (sprite_index != spr_ralsei_dance)
                {
                    x = xstart + 16;
                    y = ystart + 6;
                }
                else
                {
                    x = xstart + 2;
                    y = ystart - 2;
                }
                sprite_index = spr_ralsei_down_surprised2;
                snd_play(snd_pacify);
            }
            with (obj_hand_collision)
            {
                scr_sparkle(8);
                instance_destroy();
            }
        }
    }
    with (obj_mike_battle)
    {
        if (place_meeting(x, y, obj_hand_collision) && x == newx)
        {
            act = 1;
            other.phase = 0.1;
            other.petting = 3;
            blush = 50;
            with (obj_hand_collision)
                instance_destroy();
        }
    }
}
if (phase == 0.1)
{
    with (obj_writer)
        instance_destroy();
    global.msgno = 0;
    switch (petting)
    {
        case 3:
        default:
            msgset(0, pet_text[0]);
            msg_cap = 0;
            break;
        case 0:
            msgset(0, pet_text[1]);
            msgnext(hero_text[min(pet_current[0], 2)][0]);
            msg_cap = 1;
            pet_current[0]++;
            break;
        case 1:
            msgset(0, pet_text[2]);
            scr_anyface_next("susie", 1);
            msgnext(hero_text[min(pet_current[1], 2)][1]);
            msg_cap = 2;
            pet_current[1]++;
            global.msgno = 1;
            break;
        case 2:
            msgset(0, pet_text[3]);
            if (pet_current[2] < 2)
            {
                scr_anyface_next("ralsei", 1);
                msg_cap = 2;
            }
            else
            {
                msg_cap = 1;
            }
            msgnext(hero_text[min(pet_current[2], 2)][2]);
            pet_current[2]++;
            global.msgno = 1;
            break;
    }
    scr_battletext();
    battlewriter.depth = -1;
    timer = 0;
    phase = 0.2;
}
else if (phase == 0.2)
{
    if (battlewriter.pos >= (string_length(battlewriter.mystring) + 2))
    {
        timer += 1;
        if (alarm[5] < 0 && obj_mike_controller.hand_type != 4 && ((global.use_mic || obj_mike_attack_controller.text_skip) && scr_mouse_leftclick()))
            timer = 61;
    }
    else if (alarm[5] < 0 && obj_mike_controller.hand_type != 4 && ((global.use_mic || obj_mike_attack_controller.text_skip) && scr_mouse_leftclick()))
    {
        battlewriter.pos = string_length(battlewriter.mystring) + 2;
    }
    if (battlewriter.pos < (string_length(battlewriter.mystring) + 2))
        battlewriter.pos = scr_approach(battlewriter.pos, string_length(battlewriter.mystring) + 2, 0.1);
    if (timer > (60 + (30 * instance_number(obj_smallface))))
    {
        if (battlewriter.msgno < msg_cap)
        {
            timer = 0;
            with (battlewriter)
                scr_nextmsg();
        }
        else
        {
            phase = 0.3;
        }
        global.msgno -= 1;
    }
}
else if (phase == 0.3)
{
    global.typer = 50;
    global.msgno = 0;
    with (obj_face)
        instance_destroy();
    with (obj_writer)
        instance_destroy();
    msg_max = 0;
    msg_current = 0;
    talking = true;
    switch (action)
    {
        case 0:
            text_speed = 2;
            msgsetloc(msg_max++, "Hey, nice to&meetcha!", "obj_mike_attack_controller_slash_Step_0_gml_238_0");
            msgsetloc(msg_max++, "It's me, Motormouth Mike!&The Micro Phone who&croons and groans!", "obj_mike_attack_controller_slash_Step_0_gml_239_0");
            msgsetloc(msg_max++, "Nice of you to drop by...&NOT! NOT AT ALL,&NO no no!", "obj_mike_attack_controller_slash_Step_0_gml_240_0");
            msgsetloc(msg_max++, "Look with your private&eyes! This is a private&room, a private room,&see!?", "obj_mike_attack_controller_slash_Step_0_gml_241_0");
            msgsetloc(msg_max++, "We are live, we are on &air, we are recording,&YOU are background&noise! Get out!", "obj_mike_attack_controller_slash_Step_0_gml_242_0");
            msgsetloc(msg_max++, "... Or these 48 volts&ain't gonna be just&for show!", "obj_mike_attack_controller_slash_Step_0_gml_243_0");
            main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
            with (obj_mike_battle)
                talking = true;
            break;
        case 1:
            text_speed = 2;
            msgsetloc(msg_max++, "That's right!&That's right!&It's me, Mike!", "obj_mike_attack_controller_slash_Step_0_gml_253_0");
            msgsetloc(msg_max++, "Always has been,&always will be!", "obj_mike_attack_controller_slash_Step_0_gml_254_0");
            msgsetloc(msg_max++, "They call me&motormouth because&I NEVER stop talking!&EVER! Hahaha!", "obj_mike_attack_controller_slash_Step_0_gml_255_0");
            msgsetloc(msg_max++, "I'm sure you heard me.&You did, didncha!?", "obj_mike_attack_controller_slash_Step_0_gml_256_0");
            msgsetloc(msg_max++, "You can't tune me&out, nosiree,&yessiree!", "obj_mike_attack_controller_slash_Step_0_gml_257_0");
            msgsetloc(msg_max++, "I'm always on the air,&in the air, all around&you, even within you!", "obj_mike_attack_controller_slash_Step_0_gml_258_0");
            msgsetloc(msg_max++, "NOW GET OUT!!!!", "obj_mike_attack_controller_slash_Step_0_gml_259_0");
            main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
            with (obj_mike_battle)
                talking = true;
            break;
        case 2:
            text_speed = 2;
            msgsetloc(msg_max++, "Mike all day,&Mike all night!", "obj_mike_attack_controller_slash_Step_0_gml_269_0");
            msgsetloc(msg_max++, "I'm the best and most&beloved, Tenna's&favorite! Hahaha!", "obj_mike_attack_controller_slash_Step_0_gml_270_0");
            msgsetloc(msg_max++, "Always there for him!&Never not there!&I'm always there!&Never not!", "obj_mike_attack_controller_slash_Step_0_gml_271_0");
            msgsetloc(msg_max++, "I do his therapy,&his psychology,&his analogies,&his first aid,&his last aid,", "obj_mike_attack_controller_slash_Step_0_gml_272_0");
            msgsetloc(msg_max++, "His lemonade,&his grenades,&his eyedrops,&his nose drops,&His cough drops!", "obj_mike_attack_controller_slash_Step_0_gml_273_0");
            msgsetloc(msg_max++, "I tuck him in at&night, I play&his bedtime&programs, I sing&his theme song,", "obj_mike_attack_controller_slash_Step_0_gml_274_0");
            msgsetloc(msg_max++, "And most of all,&I record everything&he ever says,", "obj_mike_attack_controller_slash_Step_0_gml_275_0");
            msgsetloc(msg_max++, "And even some&things he never says!", "obj_mike_attack_controller_slash_Step_0_gml_276_0");
            msgsetloc(msg_max++, "Now GET OUT!!!", "obj_mike_attack_controller_slash_Step_0_gml_277_0");
            main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
            with (obj_mike_battle)
                talking = true;
            break;
        case 3:
            text_speed = 0.1;
            msgsetloc(msg_max++, ". . .", "obj_mike_attack_controller_slash_Step_0_gml_302_0");
            main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
            break;
        case 4:
            text_speed = 2;
            msgsetloc(msg_max++, "Hey, don't look shocked!&It's me, Mike!&Mike, who famously&loves to talk!", "obj_mike_attack_controller_slash_Step_0_gml_312_0");
            msgsetloc(msg_max++, "I'm going to talk&right now! Listen!", "obj_mike_attack_controller_slash_Step_0_gml_313_0");
            main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
            convo = 1;
            break;
        case 5:
            text_speed = 2;
            msgsetloc(msg_max++, "So I look a little&different.&Well what's the big&deal!?", "obj_mike_attack_controller_slash_Step_0_gml_324_0");
            msgsetloc(msg_max++, "I just changed my&outfit! That little&costume was so&cramped!", "obj_mike_attack_controller_slash_Step_0_gml_325_0");
            msgsetloc(msg_max++, "That's what was&tiring me out!&I still feel&miserable!", "obj_mike_attack_controller_slash_Step_0_gml_326_0");
            main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
            convo = 1;
            break;
        case 6:
            text_speed = 0.1;
            msgsetloc(msg_max++, "Nice to meet ya.&It's me.&Big mouth Mike.", "obj_mike_attack_controller_slash_Step_0_gml_338_0");
            msgsetloc(msg_max++, "Dey calls me dat,&'cause I don'ts&shaddup, see?", "obj_mike_attack_controller_slash_Step_0_gml_339_0");
            msgsetloc(msg_max++, "Dis is a private room.&We got private…&uh, eyes. We been...&investigatin' you.", "obj_mike_attack_controller_slash_Step_0_gml_340_0");
            msgsetloc(msg_max++, "we, uh...&We like what we see.&Keep it up.", "obj_mike_attack_controller_slash_Step_0_gml_341_0");
            main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
            with (obj_mike_battle)
                talking = true;
            break;
        case 7:
            text_speed = 0.1;
            msgsetloc(msg_max++, "Uhh...", "obj_mike_attack_controller_slash_Step_0_gml_351_0");
            msgsetloc(msg_max++, "Nice to meet ya.&Some more.&I'm still Mike.", "obj_mike_attack_controller_slash_Step_0_gml_352_0");
            msgsetloc(msg_max++, "Big Mouth Mike.", "obj_mike_attack_controller_slash_Step_0_gml_353_0");
            main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
            with (obj_mike_battle)
                talking = true;
            convo = 1;
            break;
        case 8:
            text_speed = 0.1;
            msgsetloc(msg_max++, "Nice to meet you.&Some more again.&It's me.", "obj_mike_attack_controller_slash_Step_0_gml_364_0");
            msgsetloc(msg_max++, "Modern Mike. And I,&my mouth is big.&Because I talk a lot.", "obj_mike_attack_controller_slash_Step_0_gml_365_0");
            main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
            with (obj_mike_battle)
                talking = true;
            convo = 1;
            break;
        case 9:
            text_speed = 2;
            msgsetloc(msg_max++, "Usually, we split&this all up!", "obj_mike_attack_controller_slash_Step_0_gml_376_0");
            msgsetloc(msg_max++, "One Mike does all&the talking...", "obj_mike_attack_controller_slash_Step_0_gml_377_0");
            main_text = scr_enemyblcon(mike_small.x - 64, mike_small.y, 10);
            with (mike_small)
                talking = true;
            convo = 1;
            break;
        case 10:
            text_speed = 2;
            msgsetloc(msg_max++, "Everyone thinks&there's only one Mike.&One!", "obj_mike_attack_controller_slash_Step_0_gml_388_0");
            main_text = scr_enemyblcon(mike_small.x - 64, mike_small.y, 10);
            with (mike_small)
                talking = true;
            convo = 1;
            break;
        case 11:
        case 12:
            text_speed = 2;
            msgsetloc(msg_max++, "...", "obj_mike_attack_controller_slash_Step_0_gml_401_0");
            main_text = scr_enemyblcon(mike_small.x - 64, mike_small.y, 10);
            with (mike_small)
                talking = false;
            break;
        case 13:
            text_speed = 2;
            msgsetloc(msg_max++, "But we can't let this&get out! No...", "obj_mike_attack_controller_slash_Step_0_gml_412_0");
            msgsetloc(msg_max++, "If people knew there&was more than one&Mike...", "obj_mike_attack_controller_slash_Step_0_gml_413_0");
            msgsetloc(msg_max++, "Everybody would want&to be Mike!!!", "obj_mike_attack_controller_slash_Step_0_gml_414_0");
            msgsetloc(msg_max++, "Well, we're not letting&that happen!!", "obj_mike_attack_controller_slash_Step_0_gml_415_0");
            msgsetloc(msg_max++, "Boys... It's time for&our ultimate attack!!", "obj_mike_attack_controller_slash_Step_0_gml_416_0");
            main_text = scr_enemyblcon(mike_small.x - 64, mike_small.y, 10);
            with (mike_small)
                talking = true;
            break;
    }
    phase = 0.4;
    timer = 0;
}
else if (phase == 0.4)
{
    if (instance_number(obj_writer) == 0)
    {
        timer += 1;
        if (timer > 15)
        {
            timer = 0;
            if (convo > 0)
                phase = 0.6;
            else
                phase = 0.5;
        }
    }
    else
    {
        with (main_text.mywriter)
        {
            if (global.flag[10] == 1 && button3_h())
            {
                other.timer = 9999;
                pos = string_length(mystring) + 2;
            }
            if (pos >= (string_length(mystring) + 2))
            {
                other.timer += 1;
                with (obj_mike_battle)
                    talking = false;
                if ((global.use_mic || obj_mike_attack_controller.text_skip) && (scr_mouse_leftclick() || scr_mouse_rightclick()))
                    other.timer = 150;
                if (other.timer >= (75 + (floor(other.text_speed) * 35)))
                {
                    other.timer = 0;
                    other.msg_current += 1;
                    scr_nextmsg();
                    if (other.msg_current == other.msg_max)
                    {
                        if (other.convo > 0)
                            other.phase = 0.6;
                        else
                            other.phase = 0.5;
                        with (obj_writer)
                            instance_destroy();
                    }
                    else
                    {
                        with (obj_mike_battle)
                            talking = true;
                    }
                }
            }
            else
            {
                if (pos < (string_length(mystring) + 2))
                    pos = scr_approach(pos, string_length(mystring) + 2, other.text_speed);
                if ((global.use_mic || obj_mike_attack_controller.text_skip) && scr_mouse_leftclick())
                {
                    if (pos < (string_length(mystring) + 2))
                    {
                        pos = string_length(mystring) + 2;
                        other.timer = 0;
                    }
                }
                if ((global.use_mic || obj_mike_attack_controller.text_skip) && scr_mouse_rightclick())
                {
                    if (pos < (string_length(mystring) + 2))
                    {
                        pos = string_length(mystring) + 2;
                        other.timer = 120;
                    }
                }
            }
        }
    }
}
else if (phase == 0.6)
{
    timer += 1;
    if (timer > 15)
    {
        msg_max = 0;
        msg_current = 0;
        switch (action)
        {
            case 4:
                if (convo == 1)
                {
                    text_speed = 0.1;
                    msgsetloc(msg_max++, ". . .", "obj_mike_attack_controller_slash_Step_0_gml_523_0");
                    main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
                    convo += 1;
                }
                else if (convo == 2)
                {
                    text_speed = 2;
                    msgsetloc(msg_max++, "Did you hear?&That was great,&right!? Real&verbose!!", "obj_mike_attack_controller_slash_Step_0_gml_530_0");
                    main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
                    convo = 0;
                }
                break;
            case 5:
                if (convo == 1)
                {
                    text_speed = 0.1;
                    msgsetloc(msg_max++, ". . .", "obj_mike_attack_controller_slash_Step_0_gml_542_0");
                    main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
                    convo += 1;
                }
                else if (convo == 2)
                {
                    text_speed = 2;
                    msgsetloc(msg_max++, "Miserable, I said.&MISERABLE.", "obj_mike_attack_controller_slash_Step_0_gml_549_0");
                    main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
                    convo += 1;
                }
                else if (convo == 3)
                {
                    msgsetloc(msg_max++, ":-(", "obj_mike_attack_controller_slash_Step_0_gml_555_0");
                    main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
                    with (obj_mike_battle)
                        sprite_index = spr_mike_med_sad;
                    convo = 0;
                }
                break;
            case 7:
                if (convo == 1)
                {
                    text_speed = 2;
                    msgsetloc(msg_max++, "Sorry, I mean&motormouth Mike!!&My name's&motormouth Mike!!", "obj_mike_attack_controller_slash_Step_0_gml_570_0");
                    main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
                    convo += 1;
                }
                else if (convo == 2)
                {
                    text_speed = 0.1;
                    msgsetloc(msg_max++, "Yea. Modern mouth&Mike. You know.", "obj_mike_attack_controller_slash_Step_0_gml_577_0");
                    main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
                    with (obj_mike_battle)
                        talking = true;
                    convo = 0;
                }
                break;
            case 8:
                if (convo == 1)
                {
                    text_speed = 2;
                    msgsetloc(msg_max++, "Motormouth!!!&Motormouth Mike!!!&My name is motormouth!!&Mike!!!", "obj_mike_attack_controller_slash_Step_0_gml_592_0");
                    main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
                    convo += 1;
                }
                else if (convo == 2)
                {
                    text_speed = 0.1;
                    msgsetloc(msg_max++, "Yeah. What he's said.", "obj_mike_attack_controller_slash_Step_0_gml_599_0");
                    msgsetloc(msg_max++, "I'm motor Mike.", "obj_mike_attack_controller_slash_Step_0_gml_600_0");
                    main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
                    with (obj_mike_battle)
                        talking = true;
                    convo += 1;
                }
                else if (convo == 3)
                {
                    text_speed = 2;
                    msgsetloc(msg_max++, "MOTORMOUTH!!!!!!", "obj_mike_attack_controller_slash_Step_0_gml_607_0");
                    main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
                    convo = 0;
                }
                break;
            case 9:
                if (convo == 1)
                {
                    text_speed = 0.1;
                    msgsetloc(msg_max++, "One Mike is the&muscles...", "obj_mike_attack_controller_slash_Step_0_gml_620_0");
                    main_text = scr_enemyblcon(mike_big.x - 64, mike_big.y + 32, 10);
                    with (mike_big)
                        talking = true;
                    convo += 1;
                }
                else if (convo == 2)
                {
                    text_speed = 0.1;
                    msgsetloc(msg_max++, "...", "obj_mike_attack_controller_slash_Step_0_gml_628_0");
                    main_text = scr_enemyblcon(mike_medium.x - 80, mike_medium.y, 10);
                    convo += 1;
                }
                else if (convo == 3)
                {
                    text_speed = 0.1;
                    msgsetloc(msg_max++, "And one Mike, uh,&listens!", "obj_mike_attack_controller_slash_Step_0_gml_634_0");
                    main_text = scr_enemyblcon(mike_small.x - 64, mike_small.y, 10);
                    with (mike_small)
                        talking = true;
                    convo += 1;
                }
                else if (convo == 4)
                {
                    text_speed = 0.1;
                    msgsetloc(msg_max++, "You gotta have&a Mike that listens.", "obj_mike_attack_controller_slash_Step_0_gml_642_0");
                    main_text = scr_enemyblcon(mike_big.x - 64, mike_big.y + 32, 10);
                    with (mike_big)
                        talking = true;
                    convo = 0;
                }
                break;
            case 10:
                if (convo == 1)
                {
                    text_speed = 0.1;
                    msgsetloc(msg_max++, "But there ain't.&There's, uh...&Two.", "obj_mike_attack_controller_slash_Step_0_gml_657_0");
                    main_text = scr_enemyblcon(mike_big.x - 64, mike_big.y + 32, 10);
                    with (mike_big)
                        talking = true;
                    convo += 1;
                }
                else if (convo == 2)
                {
                    text_speed = 2;
                    msgsetloc(msg_max++, "Three!!!", "obj_mike_attack_controller_slash_Step_0_gml_665_0");
                    main_text = scr_enemyblcon(mike_small.x - 64, mike_small.y, 10);
                    with (mike_small)
                        talking = true;
                    convo += 1;
                }
                else if (convo == 3)
                {
                    text_speed = 0.1;
                    msgsetloc(msg_max++, "Sorry. I forget him&cause he doesn't talk.", "obj_mike_attack_controller_slash_Step_0_gml_673_0");
                    main_text = scr_enemyblcon(mike_big.x - 64, mike_big.y + 32, 10);
                    with (mike_big)
                        talking = true;
                    convo = 0;
                }
                break;
        }
        timer = 0;
        phase = 0.4;
    }
}
else if (phase == 0.5)
{
    action += 1;
    phase = 1;
    timer = 0;
    wave = 0;
    alpha = 1;
    talking = false;
    if (!instance_exists(obj_darkener))
        instance_create(0, 0, obj_darkener);
    with (obj_darkener)
        depth = obj_herokris.depth + 1;
    with (obj_writer)
        instance_destroy();
}
if (phase == 1)
{
    if (action != 14 && action < 16)
    {
        with (obj_mike_battle)
            move = true;
    }
    with (obj_heroparent)
    {
        if (other.alarm[5] <= 0)
            x = scr_approach(x, xstart - 300, 8);
    }
    if (action == 1)
    {
        timer += 1;
        if (wave == 0 && timer == 30)
        {
            with (obj_mike_controller)
                type = 1;
            wave = 0.1;
        }
        if (wave == 0.1)
        {
            if (timer == 30)
            {
                with (obj_mike_controller)
                {
                    sign_index = 0;
                    sign_col = 65280;
                    sign_action = 1;
                }
            }
            if (obj_mike_controller.microphone_volume > 70)
            {
                wave = 0;
                snd_play(snd_coin);
            }
        }
        else if (timer > 30 && instance_number(obj_mike_crowd) == 0 && obj_mike_controller.sign_y == obj_mike_controller.sign_ystart && instance_number(obj_mike_quiet) == 0)
        {
            wave += 1;
            if (wave == 2)
            {
                alarm[3] = 120;
                obj_mike_controller.sign_x2 = camerax() + (camerawidth() * 0.75);
            }
            obj_mike_controller.sign_x = camerax() + (camerawidth() * (0.25 * (4 - wave)));
            if (wave >= 3)
            {
                obj_mike_controller.sign_x = camerax() + (camerawidth() * 0.5);
                wave = 0;
                phase = 2;
            }
            else
            {
                with (obj_mike_controller)
                {
                    sign_index = 0;
                    sign_col = 65280;
                }
                var sign_side = 0;
                if (obj_mike_controller.sign_x < (camerax() + (camerawidth() / 2)))
                    sign_side = -1;
                else if (obj_mike_controller.sign_x > (camerax() + (camerawidth() / 2)))
                    sign_side = 1;
                if (sign_side == 0)
                {
                    for (i = 0; i < 20; i++)
                    {
                        var ob = instance_create_depth(16 + camerax() + (i * 32), cameray() + cameraheight() + 100, depth - 1, obj_mike_crowd);
                        ob.type = 2;
                    }
                }
                else
                {
                    for (i = 0; i < 8; i++)
                    {
                        var ob = instance_create_depth(camerax() + (camerawidth() / 2) + (((camerawidth() / 2) + 300 + (i * 32)) * sign_side), cameray() + 260, depth - 1, obj_mike_crowd);
                        ob.hspeed = 6 * -sign_side;
                    }
                }
            }
        }
    }
    if (action == 2)
    {
        timer += 1;
        if (wave == 0 && timer == 15)
        {
            with (obj_mike_controller)
                type = 1;
        }
        if (timer > 15 && instance_number(obj_mike_crowd) == 0 && instance_number(obj_mike_quiet) == 0 && instance_number(obj_mike_pipe) == 0 && obj_mike_controller.sign_y == obj_mike_controller.sign_ystart)
        {
            wave += 1;
            if (wave == 4)
            {
                wave = 0;
                timer = 0;
                phase = 2;
            }
            else
            {
                switch (wave)
                {
                    case 0:
                    case 2:
                        with (obj_mike_controller)
                        {
                            sign_index = 0;
                            sign_col = 65280;
                        }
                        var newside = choose(1, 2, 3);
                        while (newside == lastside)
                            newside = choose(1, 2, 3);
                        lastside = newside;
                        obj_mike_controller.sign_x = camerax() + (camerawidth() * (0.25 * newside));
                        var sign_side = 0;
                        if (obj_mike_controller.sign_x < (camerax() + (camerawidth() / 2)))
                            sign_side = -1;
                        else if (obj_mike_controller.sign_x > (camerax() + (camerawidth() / 2)))
                            sign_side = 1;
                        if (wave > 1)
                            alarm[3] = 130 - abs(sign_side * 20) - (wave * 5);
                        if (sign_side == 0)
                        {
                            for (i = 0; i < 20; i++)
                            {
                                var ob = instance_create_depth(16 + camerax() + (i * 32), cameray() + cameraheight() + 100, depth - 1, obj_mike_crowd);
                                ob.type = 2;
                                ob.ytarget = 160;
                                ob.wave_speed = 5;
                            }
                        }
                        else
                        {
                            for (i = 0; i < (13 + wave); i++)
                            {
                                var ob = instance_create_depth(camerax() + (camerawidth() / 2) + (((camerawidth() / 2) + 200 + (i * 32)) * sign_side), cameray() + 260, depth - 1, obj_mike_crowd);
                                ob.hspeed = (4 + wave) * -sign_side;
                                ob.wave_height = 16;
                            }
                        }
                        break;
                    case 3:
                        var sign_side = 1;
                        with (obj_mike_controller)
                        {
                            sign_index = 2;
                            sign_col = 65535;
                        }
                        obj_mike_controller.sign_x = camerax() + (camerawidth() * 0.75);
                        for (i = 0; i < 5; i++)
                        {
                            var ob = instance_create_depth(camerax() + camerawidth() + 200 + (i * 200), cameray() + 150 + (160 * sign_side), depth - 1, obj_mike_pipe);
                            ob.hspeed = -4 * applause_speed;
                            sign_side = -sign_side;
                        }
                        break;
                }
            }
        }
    }
    if (action == 3)
    {
        timer += 1;
        if (wave == 0 && timer == 15)
        {
            with (obj_mike_controller)
                type = 1;
        }
        if (timer > 15 && instance_number(obj_mike_crowd) == 0 && instance_number(obj_mike_quiet) == 0 && instance_number(obj_mike_pipe) == 0 && obj_mike_controller.sign_y == obj_mike_controller.sign_ystart)
        {
            wave += 1;
            if (wave == 4)
            {
                wave = 0;
                timer = 0;
                phase = 3;
            }
            else
            {
                switch (wave)
                {
                    case 1:
                        with (obj_mike_controller)
                        {
                            sign_index = 0;
                            sign_col = 65280;
                        }
                        obj_mike_controller.sign_x = camerax() + (camerawidth() * 0.5);
                        var sign_side = 0;
                        alarm[3] = 130 - abs(sign_side * 20) - (wave * 5);
                        if (sign_side == 0)
                        {
                            for (i = 0; i < 20; i++)
                            {
                                var ob = instance_create_depth(16 + camerax() + (i * 32), cameray() + cameraheight() + 100, depth - 1, obj_mike_crowd);
                                ob.type = 2;
                                ob.ytarget = 160;
                                ob.wave_speed = 5;
                            }
                        }
                        else
                        {
                            for (i = 0; i < (13 + wave); i++)
                            {
                                var ob = instance_create_depth(camerax() + (camerawidth() / 2) + (((camerawidth() / 2) + 200 + (i * 32)) * sign_side), cameray() + 260, depth - 1, obj_mike_crowd);
                                ob.hspeed = (4 + wave) * -sign_side;
                                ob.wave_height = 16;
                            }
                        }
                        break;
                    case 0:
                    case 2:
                        var sign_side = -1;
                        with (obj_mike_controller)
                        {
                            sign_index = 2;
                            sign_col = 65535;
                        }
                        obj_mike_controller.sign_x = camerax() + (camerawidth() * 0.75);
                        for (i = 0; i < 9; i++)
                        {
                            var ob = instance_create_depth(camerax() + camerawidth() + 200 + (i * 240), cameray() + 150 + (160 * sign_side), depth - 1, obj_mike_pipe);
                            ob.hspeed = -7 * applause_speed;
                            ob.scale = irandom_range(50, 130);
                            sign_side = -sign_side;
                        }
                        break;
                }
            }
        }
    }
    if (action == 4)
    {
        timer += 1;
        if (wave == 0 && timer == 15)
        {
            with (obj_mike_controller)
            {
                type = 2;
                hand_distance = 140;
            }
            var _sn = snd_play(snd_power, 1, 0.3);
            snd_pitch_time(_sn, 1.2, 30);
        }
        if (wave == 0 && timer == 25)
        {
            wave += 1;
            scr_spawn_cats_random(1, 0);
            with (obj_mike_cat)
                wait_time = 320;
        }
        if (wave == 1 && instance_number(obj_mike_cat) == 0)
        {
            wave += 1;
            scr_spawn_cats(_cat_num[0], _cat_time[0]);
        }
        if (wave == 2 && instance_number(obj_mike_cat) == 0)
        {
            wave = 0;
            timer = 0;
            phase = 2;
        }
    }
    if (action == 5)
    {
        timer += 1;
        if (wave == 0 && timer == 10)
        {
            with (obj_mike_controller)
                type = 2;
            with (obj_mike_battle)
                move = true;
            instance_create_depth(camerax() + 140, cameray() + 100, depth - 2, obj_mike_bigcat);
            instance_create_depth((camerax() + camerawidth()) - 140, cameray() + 100, depth - 2, obj_mike_bigcat);
            instance_create_depth(camerax() + 140, cameray() + 250, depth - 2, obj_mike_bigcat);
            instance_create_depth((camerax() + camerawidth()) - 140, cameray() + 250, depth - 2, obj_mike_bigcat);
            with (obj_mike_bigcat)
                happiness_speed = 0.75 * other.cat_happiness;
            for (i = 0; i < instance_number(obj_mike_bigcat); i++)
            {
                var bc = instance_find(obj_mike_bigcat, i);
                bc.happiness = 100 + (i * 20);
            }
        }
        with (obj_mike_controller)
            hand_distance = scr_approach(hand_distance, 120, 2);
        if (timer > 450)
        {
            wave = 0;
            timer = 0;
            phase = 2;
            with (obj_mike_hairball)
            {
                scr_sparkle(5);
                instance_destroy();
            }
            with (obj_mike_bigcat)
                action = 2;
        }
    }
    if (action == 6)
    {
        timer += 1;
        with (obj_mike_cat)
        {
            if (x > obj_mike_controller.x)
            {
                hspeed = -5.25;
                friction = 0;
            }
        }
        if (wave == 0 && timer == 15)
        {
            with (obj_mike_controller)
            {
                type = 2;
                hand_distance = 80;
            }
        }
        if (timer > 15 && instance_number(obj_mike_crowd) == 0 && instance_number(obj_mike_quiet) == 0 && instance_number(obj_mike_pipe) == 0)
        {
            wave += 1;
            if (wave == 2)
            {
                wave = 0;
                timer = 0;
                phase = 3;
                with (obj_mike_cat)
                {
                    scr_sparkle(8);
                    instance_destroy();
                }
            }
            else
            {
                var sign_side = -1;
                with (obj_mike_controller)
                {
                    sign_index = 2;
                    sign_col = 65535;
                }
                obj_mike_controller.sign_x = camerax() + (camerawidth() * 0.75);
                var wait_x = 800;
                for (ii = 0; ii < 9; ii++)
                {
                    var ob = instance_create_depth(120 + irandom(30), cameray() + ((ii + 1) * 32), depth - 4, obj_mike_cat);
                    with (ob)
                    {
                        flip = true;
                        active = true;
                        wait = -1;
                        x = camerax() + camerawidth() + 300;
                    }
                }
                for (i = 0; i < 6; i++)
                {
                    var ob = instance_create_depth(wait_x + camerax() + camerawidth() + 200 + (i * 240), cameray() + 150 + (160 * sign_side), depth - 1, obj_mike_pipe);
                    ob.hspeed = -5;
                    ob.scale = irandom_range(50, 130);
                    sign_side = -sign_side;
                    for (ii = 0; ii < 3; ii++)
                    {
                        ob = instance_create_depth(120 + irandom(30), cameray() + 150 + ((ii + 1) * 32 * sign_side), depth - 4, obj_mike_cat);
                        with (ob)
                        {
                            wait_time = 15;
                            flip = true;
                            active = true;
                            wait = -1;
                            x = wait_x + camerax() + camerawidth() + 200 + (other.i * 255);
                        }
                    }
                }
            }
        }
    }
    if (action == 7)
    {
        timer += 1;
        if (wave == 0 && timer == 15)
        {
            with (obj_mike_controller)
            {
                type = 3;
                var _sn = snd_play(snd_power, 1, 0.3);
                snd_pitch_time(_sn, 1.2, 30);
                line_width = 0;
                line_xpos = 0;
                line_ypos = -32;
                y = cameray() + (cameraheight() / 2) + line_ypos;
            }
            with (obj_mike_controller)
            {
                sign_index = 2;
                sign_col = 65535;
            }
            var sign_side = 1;
            obj_mike_controller.sign_x = camerax() + (camerawidth() * (0.5 + (sign_side * 0.25)));
            for (i = 0; i < 15; i++)
            {
                var ob = instance_create_depth(camerax() + (camerawidth() / 2) + (((camerawidth() / 2) + 200 + (i * 32)) * sign_side), cameray() + 275, depth - 1, obj_mike_crowd);
                ob.hspeed = -7 * sign_side;
                ob = instance_create_depth(camerax() + (camerawidth() / 2) + (((camerawidth() / 2) + 200 + (i * 32)) * sign_side), cameray() + 150, depth - 1, obj_mike_crowd);
                ob.hspeed = -7 * sign_side;
            }
        }
        if (timer > 15)
        {
            with (obj_mike_controller)
                line_width = scr_approach(line_width, 150, 2);
        }
        if (wave == 0 && timer >= 240 && instance_number(obj_mike_crowd) == 0 && obj_mike_controller.sign_y == obj_mike_controller.sign_ystart)
        {
            wave += 1;
            pawtype = 0;
            attacks = 3;
            paw_aim = 1;
            paw_reload = _paw_time[0];
            alarm[1] = 1;
        }
        if (wave == 1 && instance_number(obj_mike_paw) == 0 && attacks <= 0 && counter <= -1)
        {
            wave = 0;
            timer = 0;
            phase = 2;
        }
    }
    if (action == 8)
    {
        timer += 1;
        if (wave == 0 && timer >= 15)
        {
            with (obj_mike_controller)
                type = 3;
            wave += 1;
            scr_spawn_cats_falling(_falling_num, _falling_time, 4);
        }
        if (wave == 1 && instance_number(obj_mike_spike) == 0)
        {
            wave = 0;
            timer = 0;
            phase = 2;
        }
    }
    if (action == 9)
    {
        timer += 1;
        if (wave == 0 && timer >= 30)
        {
            with (obj_mike_controller)
                type = 3;
            wave += 1;
            pawtype = 0;
            mid_reload = 2;
            mid_attack = true;
            paw_aim = 1;
            attacks = 5;
            paw_reload = _paw_time[1];
            alarm[1] = 1;
        }
        if (wave == 1 && instance_number(obj_mike_spike) == 0 && attacks == 0 && instance_number(obj_mike_paw) == 0 && counter <= -1)
        {
            wave = 0;
            timer = 0;
            phase = 3;
        }
    }
    if (action == 10)
    {
        timer += 1;
        if (wave == 0 && timer == 30)
        {
            with (obj_mike_controller)
                type = 4;
            var _sn = snd_play(snd_power, 1, 0.3);
            snd_pitch_time(_sn, 1.2, 30);
        }
        with (obj_mike_controller)
        {
            hand_distance = scr_approach(hand_distance, 180, 2);
            line_width = scr_approach(line_width, 100, 2);
        }
        if (wave == 0 && timer >= 45)
        {
            wave = 1;
            with (obj_mike_battle)
                move = true;
            cat_max = _grab_cats;
            var side = choose(camerax() + irandom_range(64, 128), (camerax() + camerawidth()) - irandom_range(64, 128));
            var a = instance_create_depth(side, 56, depth - 1, obj_mike_grabcat);
            a.wait_max = 1;
            if (instance_number(obj_mike_catbasket) == 0)
            {
                with (instance_create_depth(camerax() + (camerawidth() / 2), cameray() + 280, depth + 1, obj_mike_catbasket))
                    type = 1;
            }
        }
        if (wave == 1)
        {
            if (instance_number(obj_mike_grabcat) == 0)
            {
                scr_spawn_cats_random(_cat_num[3], _cat_time[3]);
                var side = choose(camerax() + irandom_range(64, 128), (camerax() + camerawidth()) - irandom_range(64, 128));
                instance_create_depth(side, 64, depth - 1, obj_mike_grabcat);
                cat_max -= 1;
                wave = 2;
                timer = 0;
            }
        }
        if (wave == 2)
        {
            if (instance_number(obj_mike_grabcat) == 0)
            {
                scr_spawn_cats_random(_cat_num[3], _cat_time[3]);
                var side = choose(camerax() + irandom_range(64, 128), (camerax() + camerawidth()) - irandom_range(64, 128));
                instance_create_depth(side, 64, depth - 1, obj_mike_grabcat);
                cat_max -= 1;
                if (cat_max == 0)
                    wave = 3;
            }
        }
        if (wave == 3 && (instance_number(obj_mike_grabcat) == 0 || timer > 450))
        {
            wave = 0;
            timer = 0;
            phase = 2;
            with (obj_mike_cat)
            {
                scr_sparkle(8);
                instance_destroy();
            }
            with (obj_mike_grabcat)
            {
                scr_sparkle(8);
                instance_destroy();
            }
        }
    }
    if (action == 11)
    {
        timer += 1;
        if (wave == 0 && timer >= 15)
        {
            with (obj_mike_controller)
            {
                type = 4;
                line_width = 150;
            }
            wave += 1;
            pawtype = 0;
            mid_reload = 2;
            paw_aim = 1;
            mid_attack = false;
            attacks = 9;
            paw_reload = _paw_time[2];
            alarm[1] = 1;
        }
        if (wave == 1 && attacks == 7)
        {
            wave = 2;
            instance_create_depth(camerax() + 120, cameray() + 160, depth, obj_mike_bigcat);
            instance_create_depth((camerax() + camerawidth()) - 120, cameray() + 160, depth, obj_mike_bigcat);
            with (obj_mike_bigcat)
                happiness_speed = 0.4 * other.cat_happiness;
        }
        with (obj_mike_controller)
            hand_distance = scr_approach(hand_distance, 90, 2);
        if (wave == 2 && attacks == 0 && instance_number(obj_mike_paw) == 0 && instance_number(obj_mike_spike) == 0 && counter <= -1)
        {
            wave = 0;
            timer = 0;
            phase = 2;
            action += 2;
            with (obj_mike_bigcat)
                action = 2;
        }
    }
    if (action == 12)
    {
        timer += 1;
        if (wave == 0 && timer >= 30)
        {
            with (obj_mike_controller)
                type = 4;
        }
        with (obj_mike_controller)
        {
            hand_distance = scr_approach(hand_distance, 160, 2);
            line_width = scr_approach(line_width, 200, 2);
        }
        if (wave == 0 && timer >= 45)
        {
            wave = 1;
            with (obj_mike_battle)
                move = true;
            cat_max = 6;
            var side = choose(camerax() + irandom_range(64, 128), (camerax() + camerawidth()) - irandom_range(64, 128));
            instance_create_depth(side, 64, depth - 1, obj_mike_grabcat);
            if (instance_number(obj_mike_catbasket) == 0)
            {
                with (instance_create_depth(camerax() + (camerawidth() / 2), cameray() + 280, depth + 1, obj_mike_catbasket))
                    type = 1;
            }
        }
        if (wave == 1)
        {
            if (instance_number(obj_mike_grabcat) == 0)
            {
                var side = choose(camerax() + irandom_range(64, 128), (camerax() + camerawidth()) - irandom_range(64, 128));
                instance_create_depth(side, 64, depth - 1, obj_mike_grabcat);
                cat_max -= 1;
                if (cat_max == 0)
                    wave = 2;
            }
        }
        if (wave == 2 && instance_number(obj_mike_grabcat) == 0)
        {
            with (obj_mike_cat)
            {
                scr_sparkle(8);
                instance_destroy();
            }
            wave = 0;
            timer = 0;
            phase = 2;
        }
    }
    if (action == 13)
    {
        timer += 1;
        if (wave == 0 && timer == 15)
        {
            with (obj_mike_controller)
                type = 4;
            wave += 1;
        }
        if (wave == 1 && timer == 60)
            wave = 2;
        if (wave == 2 && instance_number(obj_mike_cat) == 0)
        {
            wave = 0;
            timer = 0;
            phase = 2;
        }
    }
    if (action == 14)
    {
        timer += 1;
        if (wave == 0 && timer == 1)
        {
            with (obj_mike_controller)
            {
                type = 4;
                line_width = 20;
                hand_distance = 140;
            }
        }
        if (wave == 0 && timer == 15)
            instance_create_depth((camerax() + camerawidth()) - 100, cameray() + 200, depth - 2, obj_mike_combo);
        if (instance_number(obj_mike_combo) == 1)
        {
            with (obj_mike_controller)
            {
                line_width = scr_approach(line_width, 140, 2);
                if (y < 300)
                    line_ypos += 2;
                y = scr_approach(y, 300, 2);
            }
        }
        if (wave == 2)
        {
            if (obj_mike_combo.hp <= (obj_mike_combo.hp_max - 2))
            {
                wave = 3;
                instance_create_depth(camerax() + 90, cameray() + 270, depth - 1, obj_mike_bigcat);
                instance_create_depth((camerax() + camerawidth()) - 90, cameray() + 270, depth - 1, obj_mike_bigcat);
            }
        }
        if (wave == 4)
        {
            if (obj_mike_combo.hp <= 0)
            {
                wave = 7;
                action = 15;
                with (obj_mike_cat)
                    alarm[1] = 5;
                with (obj_mike_bigcat)
                    action = 2;
                with (obj_mike_spike)
                {
                    scr_sparkle(8);
                    instance_destroy();
                }
                with (obj_mike_combo)
                {
                    flash = true;
                    image_alpha = 1;
                }
                counter = 0;
            }
            else
            {
                dog_x = scr_approach(dog_x, 96, 2);
            }
        }
    }
}
else if (phase != 3 || move_party)
{
    if (move_party)
    {
        with (obj_darkener)
            darken = 0;
    }
    with (obj_heroparent)
    {
        if (other.alarm[5] <= 0)
            x = scr_approach(x, xstart, 8);
    }
    with (obj_mike_controller)
        hand_distance = scr_approach(hand_distance, 220, 8);
}
if (phase == 2)
{
    talking = false;
    with (obj_darkener)
        darken = 0;
    with (obj_mike_controller)
        type = 5;
    phase = 0;
    with (obj_mike_battle)
        move = false;
    with (obj_herokris)
        idlesprite = spr_kris_dance;
    with (obj_herosusie)
        idlesprite = spr_susie_dance;
    with (obj_heroralsei)
        idlesprite = spr_ralsei_dance;
    var txt = irandom(2);
    while (txt == text_last)
        txt = irandom(2);
    text_last = txt;
    if (action < 3)
        global.msg[0] = text[txt][0];
    else if (action < 6)
        global.msg[0] = text[txt][1];
    else if (action < 9)
        global.msg[0] = text[txt][2];
    else if (action == 13)
        global.msg[0] = text[3][3];
    else
        global.msg[0] = text[txt][3];
    if (action != 13 && irandom(100) < 3)
        global.msg[0] = text[0][4];
    scr_battletext_default();
    battlewriter.depth = -1;
}
if (phase == 3)
{
    if (wave == 0)
    {
        with (obj_mike_battle)
            move = false;
        wave = 1;
        talking = true;
    }
    if (wave == 1 && obj_mike_battle.x == obj_mike_battle.newx)
    {
        wave = 2;
        msg_max = 0;
        msg_current = 0;
        switch (mike)
        {
            case 0:
                text_speed = 2;
                msgsetloc(msg_max++, "Huff... puff...", "obj_mike_attack_controller_slash_Step_0_gml_1680_0");
                msgsetloc(msg_max++, "I think Mike...&Needs a little break...", "obj_mike_attack_controller_slash_Step_0_gml_1681_0");
                msgsetloc(msg_max++, "I'll be back...&In a sec...", "obj_mike_attack_controller_slash_Step_0_gml_1682_0");
                main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
                with (obj_mike_battle)
                    talking = true;
                mike = 1;
                break;
            case 1:
                text_speed = 2;
                msgsetloc(msg_max++, "All right, that's&enough already.", "obj_mike_attack_controller_slash_Step_0_gml_1692_0");
                msgsetloc(msg_max++, "I'm not feeling&quite myself!!!&I think I really&need to take a break.", "obj_mike_attack_controller_slash_Step_0_gml_1693_0");
                convo = 1;
                main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
                mike = 2;
                break;
            case 2:
                text_speed = 0.1;
                msgsetloc(msg_max++, "What does Mike say&next.", "obj_mike_attack_controller_slash_Step_0_gml_1704_0");
                main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
                with (obj_mike_battle)
                    talking = true;
                with (obj_mike_battle)
                    type = 2;
                convo = 1;
                mike = 3;
                break;
            case 3:
                text_speed = 0.1;
                msgsetloc(msg_max++, "That ain't worked&so good.", "obj_mike_attack_controller_slash_Step_0_gml_1716_0");
                msgsetloc(msg_max++, "Boss, can we just&use our normal&attacks?", "obj_mike_attack_controller_slash_Step_0_gml_1717_0");
                main_text = scr_enemyblcon(mike_big.x - 64, mike_big.y + 32, 10);
                with (mike_big)
                    talking = true;
                last_talker = mike_big;
                convo = 1;
                mike = 4;
                break;
        }
    }
    if (wave == 2)
    {
        if (instance_number(obj_writer) > 0)
        {
            with (main_text.mywriter)
            {
                if (global.flag[10] == 1 && button3_h())
                {
                    other.timer = 9999;
                    pos = string_length(mystring) + 2;
                }
                if (pos >= (string_length(mystring) + 2))
                {
                    with (obj_mike_battle)
                        talking = false;
                    other.timer += 1;
                    if ((global.use_mic || obj_mike_attack_controller.text_skip) && (scr_mouse_leftclick() || scr_mouse_rightclick()))
                        other.timer = 300;
                    if (other.timer >= (75 + other.txt_wait + (floor(other.text_speed) * 35)))
                    {
                        other.timer = 0;
                        other.msg_current += 1;
                        scr_nextmsg();
                        if (other.msg_current == other.msg_max)
                        {
                            if (other.convo > 0)
                            {
                                if (other.combo)
                                {
                                    other.wave = 5;
                                    other.move_party = true;
                                    with (obj_mike_battle)
                                        action = 1;
                                }
                                else
                                {
                                    other.wave = 4;
                                }
                                other.timer = 0;
                            }
                            else if (other.ending)
                            {
                                other.timer = 0;
                                other.wave = 0;
                                other.action = 18;
                            }
                            else
                            {
                                other.wave = 3;
                                if (instance_number(obj_mike_battle) == 1)
                                {
                                    with (obj_mike_battle)
                                        action = 1;
                                }
                            }
                            with (obj_writer)
                                instance_destroy();
                        }
                        else if (other.last_talker != -1)
                        {
                            with (other.last_talker)
                                talking = true;
                        }
                        else
                        {
                            with (obj_mike_battle)
                                talking = true;
                        }
                    }
                }
                else
                {
                    if (pos < (string_length(mystring) + 2))
                        pos = scr_approach(pos, string_length(mystring) + 2, other.text_speed);
                    if ((global.use_mic || obj_mike_attack_controller.text_skip) && scr_mouse_leftclick())
                    {
                        if (pos < (string_length(mystring) + 2))
                        {
                            pos = string_length(mystring) + 2;
                            other.timer = 0;
                        }
                    }
                    if ((global.use_mic || obj_mike_attack_controller.text_skip) && scr_mouse_rightclick())
                    {
                        if (pos < (string_length(mystring) + 2))
                        {
                            pos = string_length(mystring) + 2;
                            other.timer = 120;
                        }
                    }
                }
            }
        }
        else
        {
            timer += 1;
            if (convo > 0 && timer > 15)
            {
                wave = 4;
                timer = 0;
            }
        }
    }
    if (wave == 3)
    {
        if (obj_mike_battle.x == obj_mike_battle.newx && obj_mike_battle.action == 0)
        {
            wave = 0;
            phase = 2;
        }
    }
    if (wave == 4)
    {
        timer += 1;
        if (timer > 15)
        {
            msg_max = 0;
            msg_current = 0;
            switch (action)
            {
                case 6:
                    if (convo == 1)
                    {
                        text_speed = 0.1;
                        msgsetloc(msg_max++, ". . .", "obj_mike_attack_controller_slash_Step_0_gml_1841_0");
                        main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
                        convo += 1;
                    }
                    else if (convo == 2)
                    {
                        text_speed = 2;
                        msgsetloc(msg_max++, "I said, I think&MIKE really needs&to TAKE A BREAK!!!", "obj_mike_attack_controller_slash_Step_0_gml_1848_0");
                        main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
                        convo = 0;
                    }
                    break;
                case 9:
                    if (convo == 1)
                    {
                        text_speed = 2;
                        msgsetloc(msg_max++, "Don't ask that, idiot!!&YOU'RE mike!!!", "obj_mike_attack_controller_slash_Step_0_gml_1861_0");
                        main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
                        convo += 1;
                    }
                    else if (convo == 2)
                    {
                        text_speed = 0.1;
                        msgsetloc(msg_max++, "Oh yeahs.", "obj_mike_attack_controller_slash_Step_0_gml_1868_0");
                        msgsetloc(msg_max++, "So whys can't I say&whatever's I want?", "obj_mike_attack_controller_slash_Step_0_gml_1869_0");
                        main_text = scr_enemyblcon(obj_mike_battle.x - 64, obj_mike_battle.y, 10);
                        with (obj_mike_battle)
                            talking = true;
                        convo += 1;
                    }
                    else if (convo == 3)
                    {
                        text_speed = 2;
                        msgsetloc(msg_max++, "All right, that's it!!", "obj_mike_attack_controller_slash_Step_0_gml_1877_0");
                        main_text = scr_enemyblcon((camerax() + camerawidth()) - 32, obj_mike_battle.y - 96, 10);
                        convo += 1;
                        combo = true;
                    }
                    else if (convo == 4)
                    {
                        text_speed = 2;
                        msgsetloc(msg_max++, "Look, I admit it!&There's more than&one Mike!!! More&than one!!!", "obj_mike_attack_controller_slash_Step_0_gml_1885_0");
                        msgsetloc(msg_max++, "And now that you know,&there's no way we can&let you out of here&alive!!!", "obj_mike_attack_controller_slash_Step_0_gml_1886_0");
                        main_text = scr_enemyblcon(mike_small.newx - 80, mike_small.y, 10);
                        with (mike_small)
                            talking = true;
                        convo = 0;
                        combo = false;
                        move_party = false;
                    }
                    break;
                case 17:
                    if (convo == 1)
                    {
                        text_speed = 2;
                        msgsetloc(msg_max++, "What? No, no way!!", "obj_mike_attack_controller_slash_Step_0_gml_1903_0");
                        msgsetloc(msg_max++, "I mean, wait.&These ARE&our normal attacks!!", "obj_mike_attack_controller_slash_Step_0_gml_1904_0");
                        main_text = scr_enemyblcon(mike_small.newx - 80, mike_small.y, 10);
                        with (mike_small)
                            talking = true;
                        convo += 1;
                    }
                    else if (convo == 2)
                    {
                        text_speed = 0.1;
                        msgsetloc(msg_max++, "All right, take out&your gun, buddy!!!", "obj_mike_attack_controller_slash_Step_0_gml_1912_0");
                        main_text = scr_enemyblcon(mike_big.x - 64, mike_big.y + 32, 10);
                        with (mike_big)
                            talking = true;
                        convo += 1;
                    }
                    else if (convo == 3)
                    {
                        mus_volume(global.currentsong[1], 0, 120);
                        scr_screenflash(0.25);
                        snd_loop(snd_mike_ending);
                        with (mike_medium)
                        {
                            image_speed = 0.25;
                            sprite_index = spr_shadowman_reload;
                            visible = false;
                            repeat (8)
                                instance_create(x + random_range(sprite_width / 3, -sprite_width / 3), y + random_range(sprite_height / 3, -sprite_height / 3), obj_mike_smoke);
                        }
                        with (mike_big)
                        {
                            sprite_index = spr_zapper_jump;
                            image_speed = 0.5;
                            repeat (8)
                            {
                                visible = false;
                                instance_create(x + random_range(sprite_width / 3, -sprite_width / 3), y + random_range(sprite_height / 3, -sprite_height / 3), obj_mike_smoke);
                            }
                        }
                        convo += 1;
                        wave = 100;
                        timer = 0;
                        exit;
                    }
                    else if (convo == 4)
                    {
                        text_speed = 2;
                        msgsetloc(msg_max++, "Wait, timeout, timeout!!!", "obj_mike_attack_controller_slash_Step_0_gml_1953_0");
                        main_text = scr_enemyblcon(mike_small.newx - 80, mike_small.y, 10);
                        with (mike_small)
                            talking = true;
                        convo = 0;
                        ending = true;
                        mus_volume(global.currentsong[1], 0, 50);
                    }
                    break;
            }
            timer = 0;
            wave = 2;
        }
    }
    if (wave == 5)
    {
        if (obj_mike_battle.x == obj_mike_battle.newx && obj_mike_battle.action == 0)
            wave = 4;
    }
}
if (wave == 100)
{
    timer += 1;
    if (timer == 5)
    {
        with (mike_small)
        {
            friction = 0.25;
            gravity = 1;
            vspeed = -6;
            hspeed = -5;
            image_xscale = -2;
            sad = true;
        }
    }
    if (timer > 120)
    {
        with (obj_mike_battle)
            visible = true;
        wave = 4;
        timer = -30;
        snd_stop(snd_mike_ending);
        with (obj_mike_smoke)
            act = 1;
    }
}
if (action == 16)
{
    timer += 1;
    move_party = true;
    if (timer > 60)
    {
        timer = 0;
        phase = 3;
        action = 17;
    }
}
if (action == 18)
{
    timer += 1;
    if (timer >= 30)
    {
        with (obj_mike_controller)
            battle_active = false;
        with (obj_volumebar)
            instance_destroy();
        with (obj_mike_battle)
            move = true;
        with (obj_mike_minigame_bg)
            act = 1;
        action = 19;
        finished = 1;
        mus_volume(global.batmusic[1], 0, 15);
    }
}
if (action == 20)
{
    display_hits = true;
    action = 0;
}
if (counter == 0 && action < 14)
{
    sound_play(snd_screenshake);
    var side = choose(cameray(), cameray() + cameraheight());
    if (instance_number(obj_mike_spike) > 0)
        side = cameray() + cameraheight();
    if (pawtype == 1)
    {
        for (i = 0; i < 3; i++)
        {
            instance_create_depth(x - 90, side, depth - 1, obj_mike_paw);
            instance_create_depth(x + 90, side, depth - 1, obj_mike_paw);
        }
    }
    else
    {
        for (i = 0; i < 5; i++)
            instance_create_depth(x, side, depth - 1, obj_mike_paw);
    }
}
