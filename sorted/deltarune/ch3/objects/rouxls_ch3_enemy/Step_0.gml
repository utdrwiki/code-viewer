obj_battlecontroller.oopsallacts = 1;
if (!i_ex(obj_herosusie) || !i_ex(obj_heroralsei))
{
    if (debugvar == false && scr_debug())
    {
        scr_debug_print("You need Susie and Ralsei for this battle");
        debugvar = true;
    }
    exit;
}
var text1 = stringsetloc("* Everyone acted out their performance!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_13_0");
var text2 = stringsetloc("* (Lancer recruits the enemies to your side!)/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_14_0");
var text3 = stringsetloc("* (But it wasn't too effective...)/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_15_0");
var text4 = stringsetloc("* (It's working!)/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_16_0");
var text5 = stringsetloc("* (It's highly effective!)/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_17_0");
var text6 = stringsetloc("* (The enemies joined you!)/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_18_0");
var text7 = stringsetloc("* Ralsei's ACTs don't work because he's covered in yarn!/", "obj_rouxls_ch3_enemy_slash_Step_0_gml_19_0");
var rouxlstext1 = stringsetloc("But can thou&defeast...&The powere...&of Love?/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_20_0");
var rouxlstext2 = stringsetloc("Honeyes!!!&Oh my Honeyes!!!!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_21_0");
if (global.monster[myself] == 1)
{
    if (dogtrigger > 0)
    {
        if (dogtrigger == 1)
        {
            instance_create(0, 0, obj_rouxls_annyoing_dog_controller);
            dogtrigger = 2;
        }
        exit;
    }
    if (intro == 0)
    {
        global.charturn = 3;
        scr_speaker("rouxls");
        msgsetloc(0, "\\E5* I must defeast thou, so TV Guy recognizes my Glorye!/", "obj_rouxls_ch3_enemy_slash_Step_0_gml_40_0");
        msgnextloc("\\E5* But feare not. The four of us needst not Attacke./", "obj_rouxls_ch3_enemy_slash_Step_0_gml_41_0");
        msgnextloc("\\E5* For what is a Showe... If thou dost not ACT?/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_42_0");
        scr_battletext();
        intro = 0.5;
        talked = 0.1;
    }
    if (intro == 0.5 && !i_ex(obj_writer))
    {
        intro = 1;
        cardsummon = true;
    }
    if (intro == 1 && cardsummon == false)
    {
        global.charturn = 0;
        talked = 0;
        intro = 2;
        scr_speaker("none");
        global.bmenucoord[0][0] = 2;
        global.bmenucoord[0][1] = 2;
        global.bmenucoord[0][2] = 2;
        if (obj_battlecontroller.rouxlsgridenabled == true)
            obj_battlecontroller.rouxlsbuttoncount_y = 4;
    }
    if (scr_isphase("enemytalk") && yarnendturn == 0)
    {
        if (turns == 0)
        {
            if (dancecon == 1)
            {
                dancetimer++;
                if (dancetimer <= 20)
                {
                    obj_herokris.x = lerp(obj_herokris.xstart, camerax() + 168, dancetimer / 20);
                    obj_herokris.y = lerp(obj_herokris.ystart, cameray() + 164, dancetimer / 20);
                    obj_herosusie.x = lerp(obj_herosusie.xstart, camerax() + 252, dancetimer / 20);
                    obj_herosusie.y = lerp(obj_herosusie.ystart, cameray() + 153, dancetimer / 20);
                    obj_heroralsei.x = lerp(obj_heroralsei.xstart, camerax() + 338, dancetimer / 20);
                    obj_heroralsei.y = lerp(obj_heroralsei.ystart, cameray() + 150, dancetimer / 20);
                    x = lerp(xstart, camerax() + 410, dancetimer / 20);
                    y = lerp(ystart, cameray() + 129, dancetimer / 20);
                }
                if (dancetimer == 40)
                {
                    dancetimer = 0;
                    dancecon = 2;
                }
            }
            if (dancecon == 2)
            {
                scr_battle_sprite_set("kris", spr_kris_dance, 0.25, 1);
                obj_herokris.y += 15;
                scr_battle_sprite_set("susie", spr_susie_dance, 0.25, 1);
                if (obj_heroralsei.sprite_index != spr_ralseib_yarn_1 && obj_heroralsei.sprite_index != spr_ralseib_yarn_2)
                {
                    scr_battle_sprite_set("ralsei", spr_ralsei_dance, 0.25, 1);
                    obj_heroralsei.y += 4;
                }
                danceanim = true;
                msgset(0, text1);
                scr_battletext_default();
                dancecon = 3;
            }
            if (dancecon == 3 && i_ex(obj_writer))
                rouxlsdance = true;
            if (dancecon == 3 && !i_ex(obj_writer))
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    rouxlsdance = false;
                    scr_battle_sprite_reset("kris");
                    obj_herokris.y -= 15;
                    scr_battle_sprite_reset("susie");
                    if (obj_heroralsei.sprite_index != spr_ralseib_yarn_1 && obj_heroralsei.sprite_index != spr_ralseib_yarn_2)
                    {
                        scr_battle_sprite_reset("ralsei");
                        obj_heroralsei.y -= 4;
                    }
                    danceanim = false;
                }
                if (dancetimer >= 20)
                {
                    obj_herokris.x = lerp(camerax() + 168, obj_herokris.xstart, (dancetimer - 20) / 10);
                    obj_herokris.y = lerp(cameray() + 164, obj_herokris.ystart, (dancetimer - 20) / 10);
                    obj_herosusie.x = lerp(camerax() + 252, obj_herosusie.xstart, (dancetimer - 20) / 10);
                    obj_herosusie.y = lerp(cameray() + 153, obj_herosusie.ystart, (dancetimer - 20) / 10);
                    obj_heroralsei.x = lerp(camerax() + 338, obj_heroralsei.xstart, (dancetimer - 20) / 10);
                    obj_heroralsei.y = lerp(cameray() + 150, obj_heroralsei.ystart, (dancetimer - 20) / 10);
                    x = lerp(camerax() + 410, xstart, (dancetimer - 20) / 10);
                    y = lerp(cameray() + 129, ystart, (dancetimer - 20) / 10);
                }
                if (dancetimer == 30)
                {
                    dancetimer = 0;
                    dancecon = 0;
                }
            }
        }
        if (turns == 1)
        {
            if (dancecon == 1)
            {
                dancetimer++;
                if (dancetimer <= 20)
                {
                    obj_herokris.x = lerp(obj_herokris.xstart, camerax() + 74, dancetimer / 20);
                    obj_herokris.y = lerp(obj_herokris.ystart, cameray() + 168, dancetimer / 20);
                    obj_herosusie.x = lerp(obj_herosusie.xstart, camerax() + 155, dancetimer / 20);
                    obj_herosusie.y = lerp(obj_herosusie.ystart, cameray() + 156, dancetimer / 20);
                    obj_heroralsei.x = lerp(obj_heroralsei.xstart, camerax() + 249, dancetimer / 20);
                    obj_heroralsei.y = lerp(obj_heroralsei.ystart, cameray() + 158, dancetimer / 20);
                    x = lerp(xstart, camerax() + 319, dancetimer / 20);
                    y = lerp(ystart, cameray() + 132, dancetimer / 20);
                    global.monsterinstance[1].x = lerp(global.monsterinstance[1].xstart, camerax() + 410, dancetimer / 20);
                    global.monsterinstance[1].y = lerp(global.monsterinstance[1].ystart, cameray() + 128, dancetimer / 20);
                    global.monsterinstance[2].x = lerp(global.monsterinstance[2].xstart, camerax() + 515, dancetimer / 20);
                    global.monsterinstance[2].y = lerp(global.monsterinstance[2].ystart, cameray() + 128, dancetimer / 20);
                }
                if (dancetimer == 40)
                {
                    dancetimer = 0;
                    dancecon = 2;
                }
            }
            if (dancecon == 2)
            {
                scr_battle_sprite_set("kris", spr_kris_dance, 0.25, 1);
                obj_herokris.y += 14;
                scr_battle_sprite_set("susie", spr_susie_dance, 0.25, 1);
                if (obj_heroralsei.sprite_index != spr_ralseib_yarn_1 && obj_heroralsei.sprite_index != spr_ralseib_yarn_2)
                {
                    scr_battle_sprite_set("ralsei", spr_ralsei_dance, 0.25, 1);
                    obj_heroralsei.y += 4;
                }
                with (obj_shadowman_enemy)
                {
                    if (other.phase == 1)
                    {
                        idlesprite = spr_shadowman_sax_bunny;
                        sparedsprite = spr_shadowman_sax_bunny;
                    }
                    if (other.phase == 2)
                    {
                        idlesprite = spr_shadowman_sax_cat;
                        sparedsprite = spr_shadowman_sax_cat;
                    }
                }
                danceanim = true;
                msgset(0, text1);
                scr_battletext_default();
                dancecon = 3;
            }
            if (dancecon == 3 && i_ex(obj_writer))
                rouxlsdance = true;
            if (dancecon == 3 && !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "Hooh!&Whate a battle,&art I Righte?/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_222_0");
                scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
                dancecon = 4;
            }
            if (dancecon == 4)
            {
                talktimer++;
                if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EH* Hey, we're gonna get our asses kicked just dancing around!/", "obj_rouxls_ch3_enemy_slash_Step_0_gml_234_0");
                    scr_anyface_next("ralsei", "C");
                    msgnextloc("\\EC* Th... there must be something we can do...!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_236_0");
                    scr_battletext();
                    dancecon = 5;
                    spincon = 1;
                }
            }
            if (dancecon == 5 && !i_ex(obj_writer))
            {
                dancetimer++;
                lancer.x = lerp(lancer.xstart, camerax() + 80, dancetimer / 20);
                obj_herokris.x = lerp(camerax() + 74, camerax() + 177, dancetimer / 20);
                obj_herosusie.x = lerp(camerax() + 155, camerax() + 248, dancetimer / 20);
                obj_heroralsei.x = lerp(camerax() + 249, camerax() + 328, dancetimer / 20);
                x = lerp(camerax() + 319, camerax() + 380, dancetimer / 20);
                global.monsterinstance[1].x = lerp(camerax() + 410, camerax() + 445, dancetimer / 20);
                global.monsterinstance[2].x = lerp(camerax() + 515, camerax() + 540, dancetimer / 20);
                if (dancetimer == 20)
                {
                    scr_speaker("lancer");
                    msgsetloc(0, "\\E2* Ho ho ho! A dance battle? Deal me in!/", "obj_rouxls_ch3_enemy_slash_Step_0_gml_266_0");
                    scr_anyface_next("susie", 0);
                    msgnextloc("\\E9* Lancer! Hey!/", "obj_rouxls_ch3_enemy_slash_Step_0_gml_268_0");
                    scr_anyface_next("ralsei", "C");
                    msgnextloc("\\EC* L-Lancer, help us! Rouxls used his Rules Card and.../", "obj_rouxls_ch3_enemy_slash_Step_0_gml_270_0");
                    scr_anyface_next("lancer", 1);
                    msgnextloc("\\E1* I see, I see! Don't worry! I'm on the case!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_272_0");
                    scr_battletext();
                    with (obj_battlecontroller)
                    {
                        spadebuttonenabled = true;
                        spadebuttoncount = 3;
                    }
                    dancetimer = 0;
                    dancecon = 5.5;
                }
            }
            if (dancecon == 5.5 && !i_ex(obj_writer))
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    audio_pause_sound(global.batmusic[1]);
                    with (lancer)
                        scr_oflash();
                    snd_play(snd_boost);
                    spincon = 0;
                    lancer.sprite_index = spr_lancer_pose_card;
                    anim = instance_create(lancer.x + 56, lancer.y + 10, obj_animation);
                    with (anim)
                    {
                        depth = other.lancer.depth - 2;
                        image_index = 0;
                        image_xscale = 2;
                        image_yscale = 2;
                        image_speed = 1;
                        sprite_index = spr_lancer_card_shine;
                    }
                }
                if (dancetimer == 21)
                    snd_play_x(snd_splat, 1, 0.9);
                if (dancetimer == 32)
                    snd_play_x(snd_splat, 0.6, 0.9);
                if (dancetimer == 44)
                    snd_play_x(snd_splat, 0.3, 0.9);
                if (dancetimer == 56)
                    snd_play_x(snd_splat, 0.1, 0.9);
                if (dancetimer == 68)
                    snd_play_x(snd_splat, 0.05, 0.9);
                if (dancetimer == 70)
                    dancecon = 5.7;
            }
            if (dancecon == 5.7 && !i_ex(obj_lancer_card))
            {
                scr_speaker("noone");
                msgsetloc(0, "* (Lancer used the LANCER Card! Now you can... LANCER?)/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_321_0");
                scr_battletext();
                dancecon = 6;
                dancetimer = 0;
            }
            if (dancecon == 6 && !i_ex(obj_writer))
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    rouxlsdance = false;
                    spincon = 0;
                    lancer.sprite_index = spr_lancer_dt;
                    audio_resume_sound(global.batmusic[1]);
                    scr_battle_sprite_reset("kris");
                    obj_herokris.y -= 14;
                    scr_battle_sprite_reset("susie");
                    if (obj_heroralsei.sprite_index != spr_ralseib_yarn_1 && obj_heroralsei.sprite_index != spr_ralseib_yarn_2)
                    {
                        scr_battle_sprite_reset("ralsei");
                        obj_heroralsei.y -= 4;
                    }
                    with (obj_shadowman_enemy)
                    {
                        if (other.phase == 1)
                        {
                            idlesprite = spr_shadowman_idle_bunny;
                            sparedsprite = spr_shadowman_idle_bunny;
                        }
                        if (other.phase == 2)
                        {
                            idlesprite = spr_shadowman_idle_cat;
                            sparedsprite = spr_shadowman_idle_bunny;
                        }
                    }
                    danceanim = false;
                }
                obj_herokris.x = lerp(camerax() + 177, obj_herokris.xstart, dancetimer / 10);
                obj_herokris.y = lerp(cameray() + 168, obj_herokris.ystart, dancetimer / 10);
                obj_herosusie.x = lerp(camerax() + 248, obj_herosusie.xstart, dancetimer / 10);
                obj_herosusie.y = lerp(cameray() + 156, obj_herosusie.ystart, dancetimer / 10);
                obj_heroralsei.x = lerp(camerax() + 328, obj_heroralsei.xstart, dancetimer / 10);
                obj_heroralsei.y = lerp(cameray() + 158, obj_heroralsei.ystart, dancetimer / 10);
                x = lerp(camerax() + 380, xstart, dancetimer / 10);
                y = lerp(cameray() + 132, ystart, dancetimer / 10);
                global.monsterinstance[1].x = lerp(camerax() + 445, global.monsterinstance[1].xstart, dancetimer / 10);
                global.monsterinstance[1].y = lerp(cameray() + 128, global.monsterinstance[1].ystart, dancetimer / 10);
                global.monsterinstance[2].x = lerp(camerax() + 540, global.monsterinstance[2].xstart, dancetimer / 10);
                global.monsterinstance[2].y = lerp(cameray() + 128, global.monsterinstance[2].ystart, dancetimer / 10);
                lancer.x = lerp(camerax() + 80, lancer.xstart, dancetimer / 10);
                if (dancetimer == 10)
                {
                    dancetimer = 0;
                    dancecon = 0;
                }
            }
        }
        if (turns == 2)
        {
            if (dancecon == 1)
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    lancer.y = 153;
                    msgset(0, text2);
                    scr_battletext_default();
                }
                if (dancetimer <= 20)
                {
                    lancer.x = lerp(lancer.xstart, camerax() + 216, dancetimer / 20);
                    global.monsterinstance[1].x = lerp(global.monsterinstance[1].xstart, camerax() + 323, dancetimer / 20);
                    global.monsterinstance[2].x = lerp(global.monsterinstance[2].xstart, camerax() + 323, dancetimer / 20);
                }
                if (dancetimer == 40)
                {
                    dancetimer = 0;
                    dancecon = 2;
                }
            }
            if (dancecon == 2 && !i_ex(obj_writer))
            {
                dancetimer++;
                if (dancetimer == 25)
                {
                    with (lancer)
                    {
                        scr_oflash();
                        snd_play(snd_boost);
                    }
                }
                if (dancetimer == 1)
                {
                    with (obj_shadowman_enemy)
                    {
                        if (other.phase == 1)
                        {
                            idlesprite = spr_shadowman_sax_bunny;
                            sparedsprite = spr_shadowman_sax_bunny;
                        }
                        if (other.phase == 2)
                        {
                            idlesprite = spr_shadowman_sax_cat;
                            sparedsprite = spr_shadowman_sax_cat;
                        }
                    }
                    var lancer_x = lancer.x + 42;
                    var lancer_y = lancer.y + 44;
                    if (spadepower > 1)
                        snd_play(snd_spellcast);
                    if (spadepower == 1)
                    {
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 0;
                        spade.startdir = spade.dir;
                        spade.dirend = 180;
                    }
                    if (spadepower == 2)
                    {
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 0;
                        spade.startdir = spade.dir;
                        spade.dirend = 180;
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 180;
                        spade.startdir = spade.dir;
                        spade.dirend = 360;
                    }
                    if (spadepower == 3)
                    {
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 120;
                        spade.startdir = spade.dir;
                        spade.dirend = 240;
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 0;
                        spade.startdir = spade.dir;
                        spade.dirend = 120;
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 240;
                        spade.startdir = spade.dir;
                        spade.dirend = 360;
                    }
                }
                if ((dancetimer == 1 && spadepower == 0) || (dancetimer == 30 && spadepower > 0))
                {
                    with (obj_rouxls_spade_absorb)
                        instance_destroy();
                    dancetimer = 0;
                    dancecon = 3;
                }
            }
            if (dancecon == 3)
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    if (spadepower == 0)
                    {
                        snd_play(snd_splat);
                        lancer.sprite_index = spr_lancer_faceplant;
                        star = instance_create(lancer.x + 60, lancer.y + 40, obj_rouxls_faceplant_star);
                        msgset(0, text3);
                    }
                    if (spadepower == 1)
                    {
                        spincon = 1;
                        msgset(0, text4);
                    }
                    if (spadepower == 2)
                    {
                        spincon = 1;
                        msgset(0, text4);
                    }
                    if (spadepower == 3)
                    {
                        spincon = 1;
                        msgset(0, text5);
                    }
                    if (spadepower > 0)
                    {
                        with (lancer)
                            scr_script_delayed(scr_lerpvar, 1, "x", camerax() + 216, camerax() + 186, 40);
                        with (global.monsterinstance[1])
                            scr_script_delayed(scr_lerpvar, 1, "x", camerax() + 323, camerax() + 293, 40);
                        with (global.monsterinstance[2])
                            scr_script_delayed(scr_lerpvar, 1, "x", camerax() + 323, camerax() + 293, 40);
                    }
                    scr_battletext_default();
                }
                if ((spadepower > 0 && dancetimer >= 49) || (spadepower == 0 && dancetimer == 1))
                {
                    dancetimer = 0;
                    dancecon = 4;
                    if (spadepower == 0)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 20);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 20);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (spadepower == 1)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 35);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 35);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (spadepower == 2)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 45);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 45);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (spadepower == 3)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 60);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 60);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (fastmercy == true && phase < 3)
                    {
                        with (global.monsterinstance[1])
                            scr_mercyadd(myself, 80);
                        with (global.monsterinstance[2])
                            scr_mercyadd(myself, 80);
                    }
                    spadepower = 0;
                }
            }
            if (dancecon == 4 && !i_ex(obj_writer))
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    with (obj_shadowman_enemy)
                    {
                        if (other.phase == 1)
                        {
                            idlesprite = spr_shadowman_idle_bunny;
                            sparedsprite = spr_shadowman_idle_bunny;
                        }
                        if (other.phase == 2)
                        {
                            idlesprite = spr_shadowman_idle_cat;
                            sparedsprite = spr_shadowman_idle_bunny;
                        }
                    }
                    lancer.sprite_index = spr_lancer_dt;
                    spincon = 0;
                    if (global.mercymod[1] >= 100 && global.mercymod[2] >= 100)
                    {
                        global.monsterinstance[1].image_xscale = -2;
                        global.monsterinstance[1].x += 116;
                        global.monsterinstance[2].image_xscale = -2;
                        global.monsterinstance[2].x += 116;
                    }
                }
                if (dancetimer >= 0)
                {
                    lancer.x = lerp(camerax() + 186, lancer.xstart, (dancetimer - 0) / 20);
                    if (global.mercymod[1] >= 100 && global.mercymod[2] >= 100)
                    {
                        global.monsterinstance[1].x = lerp(camerax() + 293 + 116, camerax() + 253, (dancetimer - 0) / 20);
                        global.monsterinstance[2].x = lerp(camerax() + 293 + 116, camerax() + 253, (dancetimer - 0) / 20);
                    }
                    else
                    {
                        global.monsterinstance[1].x = lerp(camerax() + 293, global.monsterinstance[1].xstart, (dancetimer - 0) / 20);
                        global.monsterinstance[2].x = lerp(camerax() + 293, global.monsterinstance[2].xstart, (dancetimer - 0) / 20);
                    }
                    with (global.monsterinstance[1])
                        depth = obj_battlecontroller.depth + 4;
                    with (global.monsterinstance[2])
                        depth = obj_battlecontroller.depth + 1;
                }
                if (dancetimer == 20)
                {
                    if (global.mercymod[1] >= 100 && global.mercymod[2] >= 100)
                    {
                        shadowman1 = instance_create_depth(global.monsterinstance[1].x, global.monsterinstance[1].y, global.monsterinstance[1].depth, obj_marker);
                        shadowman1.sprite_index = global.monsterinstance[1].sprite_index;
                        shadowman1.image_xscale = -2;
                        shadowman1.image_yscale = 2;
                        shadowman1.image_speed = 0.16666666666666666;
                        shadowman2 = instance_create_depth(global.monsterinstance[2].x, global.monsterinstance[2].y, global.monsterinstance[2].depth, obj_marker);
                        shadowman2.sprite_index = global.monsterinstance[2].sprite_index;
                        shadowman2.image_xscale = -2;
                        shadowman2.image_yscale = 2;
                        shadowman2.image_speed = 0.16666666666666666;
                        teamsize = 2;
                        with (global.monsterinstance[1])
                        {
                            scr_monsterdefeat();
                            instance_destroy();
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_monsterdefeat();
                            instance_destroy();
                        }
                        msgset(0, text6);
                        scr_battletext_default();
                        phasedone = true;
                    }
                    dancetimer = 0;
                    dancecon = 5;
                }
            }
            if (dancecon == 5 && !i_ex(obj_writer))
            {
                dancecon = 0;
                teamformationcon = 1;
                teamformationtimer = 0;
            }
        }
    }
    if (scr_isphase("enemytalk") && yarnendturn == 0)
    {
        if (turns == 3 && phase != 3)
        {
            if (dancecon == 1)
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    teamformationcon = 3;
                    teamformationtimer = 0;
                    lancer.y = 153;
                    if ((obj_heroralsei.sprite_index == spr_ralseib_yarn_1 || obj_heroralsei.sprite_index == spr_ralseib_yarn_2) && yougotyarned == false)
                    {
                        msgset(0, text7);
                        msgnext(text2);
                        yougotyarned = true;
                    }
                    else
                    {
                        msgset(0, text2);
                    }
                    scr_battletext_default();
                }
                if (dancetimer <= 20)
                {
                    lancer.x = lerp(lancer.xstart, camerax() + 216, dancetimer / 20);
                    if (i_ex(global.monsterinstance[1]))
                        global.monsterinstance[1].x = lerp(global.monsterinstance[1].xstart, camerax() + 323, dancetimer / 20);
                    if (i_ex(global.monsterinstance[2]))
                        global.monsterinstance[2].x = lerp(global.monsterinstance[2].xstart, camerax() + 323, dancetimer / 20);
                }
                if (dancetimer == 40)
                {
                    dancetimer = 0;
                    dancecon = 2;
                }
            }
            if (dancecon == 2 && !i_ex(obj_writer))
            {
                dancetimer++;
                if (dancetimer == 25)
                {
                    with (lancer)
                    {
                        scr_oflash();
                        snd_play(snd_boost);
                    }
                }
                if (dancetimer == 1)
                {
                    with (obj_shadowman_enemy)
                    {
                        if (other.phase == 1)
                        {
                            idlesprite = spr_shadowman_sax_bunny;
                            sparedsprite = spr_shadowman_sax_bunny;
                        }
                        if (other.phase == 2)
                        {
                            idlesprite = spr_shadowman_sax_cat;
                            sparedsprite = spr_shadowman_sax_cat;
                        }
                    }
                    var lancer_x = lancer.x + 42;
                    var lancer_y = lancer.y + 44;
                    if (spadepower == 1)
                    {
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 0;
                        spade.startdir = spade.dir;
                        spade.dirend = 180;
                    }
                    if (spadepower == 2)
                    {
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 0;
                        spade.startdir = spade.dir;
                        spade.dirend = 180;
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 180;
                        spade.startdir = spade.dir;
                        spade.dirend = 360;
                    }
                    if (spadepower == 3)
                    {
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 120;
                        spade.startdir = spade.dir;
                        spade.dirend = 240;
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 0;
                        spade.startdir = spade.dir;
                        spade.dirend = 120;
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 240;
                        spade.startdir = spade.dir;
                        spade.dirend = 360;
                    }
                }
                if ((dancetimer == 1 && spadepower == 0) || (dancetimer == 30 && spadepower > 0))
                {
                    with (obj_rouxls_spade_absorb)
                        instance_destroy();
                    dancetimer = 0;
                    dancecon = 3;
                }
            }
            if (dancecon == 3)
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    if (spadepower == 0)
                    {
                        snd_play(snd_splat);
                        lancer.sprite_index = spr_lancer_faceplant;
                        star = instance_create(lancer.x + 60, lancer.y + 40, obj_rouxls_faceplant_star);
                        msgset(0, text3);
                    }
                    if (spadepower == 1)
                    {
                        spincon = 1;
                        msgset(0, text4);
                    }
                    if (spadepower == 2)
                    {
                        spincon = 1;
                        msgset(0, text4);
                    }
                    if (spadepower == 3)
                    {
                        spincon = 1;
                        msgset(0, text5);
                    }
                    if (spadepower > 0)
                    {
                        with (lancer)
                            scr_script_delayed(scr_lerpvar, 1, "x", camerax() + 216, camerax() + 186, 40);
                        with (global.monsterinstance[1])
                            scr_script_delayed(scr_lerpvar, 1, "x", camerax() + 323, camerax() + 293, 40);
                        with (global.monsterinstance[2])
                            scr_script_delayed(scr_lerpvar, 1, "x", camerax() + 323, camerax() + 293, 40);
                    }
                    scr_battletext_default();
                }
                if ((spadepower > 0 && dancetimer >= 49) || (spadepower == 0 && dancetimer == 1))
                {
                    dancetimer = 0;
                    dancecon = 4;
                    if (spadepower == 0)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 20);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 20);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (spadepower == 1)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 35);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 35);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (spadepower == 2)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 45);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 45);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (spadepower == 3)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 60);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 60);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (fastmercy == true && phase < 3)
                    {
                        with (global.monsterinstance[1])
                            scr_mercyadd(myself, 80);
                        with (global.monsterinstance[2])
                            scr_mercyadd(myself, 80);
                    }
                    spadepower = 0;
                }
            }
            if (dancecon == 4 && !i_ex(obj_writer))
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    lancer.sprite_index = spr_lancer_dt;
                    spincon = 0;
                    with (obj_shadowman_enemy)
                    {
                        if (other.phase == 1)
                        {
                            idlesprite = spr_shadowman_idle_bunny;
                            sparedsprite = spr_shadowman_idle_bunny;
                        }
                        if (other.phase == 2)
                        {
                            idlesprite = spr_shadowman_idle_cat;
                            sparedsprite = spr_shadowman_idle_cat;
                        }
                    }
                    if (global.mercymod[1] >= 100 && global.mercymod[2] >= 100)
                    {
                        if (i_ex(global.monsterinstance[1]))
                        {
                            global.monsterinstance[1].image_xscale = -2;
                            global.monsterinstance[1].x += 116;
                        }
                        if (i_ex(global.monsterinstance[2]))
                        {
                            global.monsterinstance[2].image_xscale = -2;
                            global.monsterinstance[2].x += 116;
                        }
                    }
                }
                if (dancetimer >= 0)
                {
                    lancer.x = lerp(camerax() + 186, lancer.xstart, (dancetimer - 0) / 20);
                    if (global.mercymod[1] >= 100 && global.mercymod[2] >= 100)
                    {
                        if (i_ex(global.monsterinstance[1]))
                        {
                            global.monsterinstance[1].x = lerp(camerax() + 293 + 116, camerax() + 253, (dancetimer - 0) / 20);
                            if (shadowmenalreadyfired == false)
                                global.monsterinstance[1].y = lerp(global.monsterinstance[1].ystart, global.monsterinstance[1].ystart + 50, (dancetimer - 0) / 20);
                        }
                        if (i_ex(global.monsterinstance[2]))
                        {
                            global.monsterinstance[2].x = lerp(camerax() + 293 + 116, camerax() + 253, (dancetimer - 0) / 20);
                            if (shadowmenalreadyfired == false)
                                global.monsterinstance[2].y = lerp(global.monsterinstance[2].ystart, global.monsterinstance[2].ystart - 50, (dancetimer - 0) / 20);
                        }
                    }
                    else
                    {
                        if (i_ex(global.monsterinstance[1]))
                            global.monsterinstance[1].x = lerp(camerax() + 293, global.monsterinstance[1].xstart, (dancetimer - 0) / 20);
                        if (i_ex(global.monsterinstance[2]))
                            global.monsterinstance[2].x = lerp(camerax() + 293, global.monsterinstance[2].xstart, (dancetimer - 0) / 20);
                    }
                    if (shadowmenalreadyfired == false)
                    {
                        with (shadowman1)
                            depth = obj_battlecontroller.depth + 4;
                        with (shadowman2)
                            depth = obj_battlecontroller.depth + 1;
                    }
                    with (global.monsterinstance[1])
                        depth = obj_battlecontroller.depth + 3;
                    with (global.monsterinstance[2])
                        depth = obj_battlecontroller.depth + 2;
                }
                if (dancetimer == 20)
                {
                    if (global.mercymod[1] >= 100 && global.mercymod[2] >= 100)
                    {
                        shadowman3 = instance_create_depth(global.monsterinstance[1].x, global.monsterinstance[1].y, global.monsterinstance[1].depth, obj_marker);
                        shadowman3.sprite_index = global.monsterinstance[1].sprite_index;
                        shadowman3.image_xscale = -2;
                        shadowman3.image_yscale = 2;
                        shadowman3.image_speed = 0.16666666666666666;
                        shadowman4 = instance_create_depth(global.monsterinstance[2].x, global.monsterinstance[2].y, global.monsterinstance[2].depth, obj_marker);
                        shadowman4.sprite_index = global.monsterinstance[2].sprite_index;
                        shadowman4.image_xscale = -2;
                        shadowman4.image_yscale = 2;
                        shadowman4.image_speed = 0.16666666666666666;
                        teamsize = 4;
                        with (global.monsterinstance[1])
                        {
                            scr_monsterdefeat();
                            instance_destroy();
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_monsterdefeat();
                            instance_destroy();
                        }
                        msgset(0, text6);
                        scr_battletext_default();
                        phasedone = true;
                    }
                    dancetimer = 0;
                    dancecon = 5;
                }
            }
            if (dancecon == 5 && !i_ex(obj_writer))
            {
                dancecon = 0;
                teamformationcon = 1;
                teamformationtimer = 0;
            }
        }
    }
    if (scr_isphase("enemytalk") && yarnendturn == 0)
    {
        if (phase == 3 && talked != 0.6 && talked != 0.7)
        {
            if (dancecon == 1)
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    teamformationcon = 3;
                    teamformationtimer = 0;
                    lancer.y = 153;
                    if ((obj_heroralsei.sprite_index == spr_ralseib_yarn_1 || obj_heroralsei.sprite_index == spr_ralseib_yarn_2) && yougotyarned == false)
                    {
                        msgset(0, text7);
                        msgnext(text2);
                        yougotyarned = true;
                    }
                    else
                    {
                        msgset(0, text2);
                    }
                    scr_battletext_default();
                }
                if (dancetimer <= 20)
                {
                    lancer.x = lerp(lancer.xstart, camerax() + 216, dancetimer / 20);
                    if (i_ex(global.monsterinstance[1]))
                        global.monsterinstance[1].x = lerp(global.monsterinstance[1].xstart, camerax() + 323, dancetimer / 20);
                    if (i_ex(global.monsterinstance[2]))
                        global.monsterinstance[2].x = lerp(global.monsterinstance[2].xstart, camerax() + 323, dancetimer / 20);
                }
                if (dancetimer == 40)
                {
                    dancetimer = 0;
                    dancecon = 2;
                }
            }
            if (dancecon == 2 && !i_ex(obj_writer))
            {
                dancetimer++;
                if (dancetimer == 25)
                {
                    with (lancer)
                    {
                        scr_oflash();
                        snd_play(snd_boost);
                    }
                }
                if (dancetimer == 1)
                {
                    var lancer_x = lancer.x + 42;
                    var lancer_y = lancer.y + 44;
                    if (spadepower == 1)
                    {
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 0;
                        spade.startdir = spade.dir;
                        spade.dirend = 180;
                    }
                    if (spadepower == 2)
                    {
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 0;
                        spade.startdir = spade.dir;
                        spade.dirend = 180;
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 180;
                        spade.startdir = spade.dir;
                        spade.dirend = 360;
                    }
                    if (spadepower == 3)
                    {
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 120;
                        spade.startdir = spade.dir;
                        spade.dirend = 240;
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 0;
                        spade.startdir = spade.dir;
                        spade.dirend = 120;
                        spade = instance_create(lancer_x, lancer_y, obj_rouxls_spade_absorb);
                        spade.dir = 240;
                        spade.startdir = spade.dir;
                        spade.dirend = 360;
                    }
                }
                if ((dancetimer == 1 && spadepower == 0) || (dancetimer == 30 && spadepower > 0))
                {
                    with (obj_rouxls_spade_absorb)
                        instance_destroy();
                    dancetimer = 0;
                    dancecon = 3;
                }
            }
            if (dancecon == 3)
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    if (spadepower == 0)
                    {
                        snd_play(snd_splat);
                        lancer.sprite_index = spr_lancer_faceplant;
                        star = instance_create(lancer.x + 60, lancer.y + 40, obj_rouxls_faceplant_star);
                        msgset(0, text3);
                    }
                    if (spadepower == 1)
                    {
                        spincon = 1;
                        msgset(0, text4);
                    }
                    if (spadepower == 2)
                    {
                        spincon = 1;
                        msgset(0, text4);
                    }
                    if (spadepower == 3)
                    {
                        spincon = 1;
                        msgset(0, text5);
                    }
                    if (spadepower > 0)
                    {
                        with (lancer)
                            scr_script_delayed(scr_lerpvar, 1, "x", camerax() + 216, camerax() + 186, 40);
                        with (global.monsterinstance[1])
                            scr_script_delayed(scr_lerpvar, 1, "x", camerax() + 323, camerax() + 293, 40);
                        with (global.monsterinstance[2])
                            scr_script_delayed(scr_lerpvar, 1, "x", camerax() + 323, camerax() + 293, 40);
                    }
                    scr_battletext_default();
                }
                if ((spadepower > 0 && dancetimer >= 49) || (spadepower == 0 && dancetimer == 1))
                {
                    dancetimer = 0;
                    dancecon = 4;
                    if (spadepower == 0)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 20);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 20);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (spadepower == 1)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 35);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 35);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (spadepower == 2)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 45);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 45);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    if (spadepower == 3)
                    {
                        with (global.monsterinstance[1])
                        {
                            scr_mercyadd(myself, 60);
                            __mercydmgwriter.x = x + 60;
                        }
                        with (global.monsterinstance[2])
                        {
                            scr_mercyadd(myself, 60);
                            __mercydmgwriter.x = x + 60;
                        }
                    }
                    spadepower = 0;
                }
            }
            if (dancecon == 4 && !i_ex(obj_writer) && !i_ex(obj_lerpvar))
            {
                dancetimer++;
                if (dancetimer == 1)
                {
                    lancer.sprite_index = spr_lancer_dt;
                    spincon = 0;
                }
                if (dancetimer >= 0)
                {
                    lancer.x = lerp(camerax() + 186, lancer.xstart, (dancetimer - 0) / 20);
                    if (global.mercymod[1] >= 100 && global.mercymod[2] >= 100)
                    {
                    }
                    else
                    {
                        if (i_ex(global.monsterinstance[1]))
                            global.monsterinstance[1].x = lerp(camerax() + 317, global.monsterinstance[1].xstart, (dancetimer - 0) / 20);
                        if (i_ex(global.monsterinstance[2]))
                            global.monsterinstance[2].x = lerp(camerax() + 317, global.monsterinstance[2].xstart, (dancetimer - 0) / 20);
                    }
                    if (shadowmenalreadyfired == false)
                    {
                        with (shadowman1)
                            depth = obj_battlecontroller.depth + 4;
                        with (shadowman2)
                            depth = obj_battlecontroller.depth + 1;
                    }
                    with (global.monsterinstance[1])
                        depth = obj_battlecontroller.depth + 3;
                    with (global.monsterinstance[2])
                        depth = obj_battlecontroller.depth + 2;
                }
                if (dancetimer == 20)
                {
                    if (global.mercymod[1] >= 100 && global.mercymod[2] >= 100)
                    {
                        endcon = 0.5;
                        with (obj_lanino_enemy_rouxls)
                            head = 4544;
                        with (obj_elnina_enemy_rouxls)
                            head = 3799;
                        with (obj_elnina_enemy_rouxls)
                            scr_move_to_point_over_time(xstart, y, 16);
                        with (obj_lanino_enemy_rouxls)
                            scr_move_to_point_over_time(xstart, y, 16);
                        exit;
                    }
                    dancetimer = 0;
                    dancecon = 5;
                }
            }
            if (dancecon == 5 && !i_ex(obj_writer))
            {
                dancecon = 0;
                teamformationcon = 1;
                teamformationtimer = 0;
            }
        }
    }
    if (endcon != 0)
    {
        endtalktimer++;
        if (endcon == 0.5)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_dmgwriter)
                {
                    if (delaytimer >= 1)
                        killactive = 1;
                }
                for (i = 0; i < 3; i++)
                {
                    if (global.hp[i + 1] <= 0)
                    {
                        var _hltarget = global.char[i];
                        var _curhp = global.hp[_hltarget];
                        var _healpower;
                        if (_curhp <= 0)
                            _healpower = -_curhp + 5;
                        else
                            _healpower = 1;
                        scr_heal(i, _healpower);
                        with (global.charinstance[i])
                        {
                            ha = instance_create(x, y, obj_healanim);
                            ha.target = id;
                            dmgwr = scr_dmgwriter_selfchar();
                            with (dmgwr)
                            {
                                delay = 8;
                                type = 3;
                                damage = _healpower;
                            }
                            if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                            {
                                with (dmgwr)
                                    specialmessage = 3;
                            }
                            tu += 1;
                        }
                    }
                }
                for (i = 0; i < 3; i++)
                {
                    with (global.charinstance[i])
                        tu--;
                }
                msgsetloc(0, "Look! Lanino and&Elnina are.../%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1184_0");
                global.typer = 74;
                scr_enemyblcon(obj_heroralsei.x + 85, obj_heroralsei.y + 45, 10);
                myblcon.side = -1;
                scr_guardpeek(obj_heroralsei);
                endcon = 1;
                endtalktimer = 0;
            }
        }
        if (endcon == 1)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "Gehahah... Separate? &US? No, I think: &Freakinge Not./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1195_0");
                scr_enemyblcon(x - 10, global.monstery[myself] - 20, 10);
                endcon = 2;
                endtalktimer = 0;
            }
        }
        if (endcon == 2)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "I think thou Missedst&thine Vitale Fact...&Thereupon, the&THREE OF US./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1202_0");
                scr_enemyblcon(x - 10, global.monstery[myself] - 20, 10);
                endcon = 3;
                endtalktimer = 0;
            }
        }
        if (endcon == 3)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "Art in a Teame&Relationshipe./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1209_0");
                scr_enemyblcon(x - 10, global.monstery[myself] - 20, 10);
                endcon = 4;
                endtalktimer = 0;
            }
        }
        if (endcon == 4)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "Just liketh you Guyse./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1216_0");
                scr_enemyblcon(x - 10, global.monstery[myself] - 20, 10);
                endcon = 4.5;
                endtalktimer = 0;
            }
        }
        if (endcon == 4.5)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                msgsetloc(0, "The hell are you&talking about?", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1201_0");
                obj_herosusie.x += 20;
                scr_enemyblcon(obj_herosusie.x + 85, obj_herosusie.y + 45, 10);
                myblcon.side = -1;
                scr_battle_sprite_set("susie", spr_susie_shock_r, 0, 1);
                with (obj_herosusie)
                    scr_shakeobj();
                msgsetloc(0, "L... like us!?", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1208_0");
                obj_heroralsei.x += 20;
                scr_enemyblcon(obj_heroralsei.x + 85, obj_heroralsei.y + 45, 10);
                myblcon.side = -1;
                scr_battle_sprite_set("ralsei", spr_ralsei_walk_down_blush, 0, 1);
                with (obj_heroralsei)
                    scr_shakeobj();
                endcon = 4.6;
                endtalktimer = 0;
            }
        }
        if (endcon == 4.6)
        {
            if ((button3_p() || button1_p()) && endtalktimer > 15)
            {
                with (obj_writer)
                    instance_destroy();
                global.typer = 50;
                msgsetloc(0, "Wait, you guyse&artn't a Thinge?/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1249_0");
                scr_enemyblcon(x - 10, global.monstery[myself] - 20, 10);
                endcon = 4.7;
                endtalktimer = 0;
            }
        }
        if (endcon == 4.7)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                msgsetloc(0, "No./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1257_0");
                global.typer = 75;
                scr_heroblcon("susie");
                scr_guardpeek(obj_herosusie);
                endcon = 5;
            }
        }
        if (endcon == 5)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_lanino_enemy_rouxls)
                {
                    with (obj_writer)
                        instance_destroy();
                    global.typer = 50;
                    msgsetloc(0, "Umm, I.../%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1269_0");
                    scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
                    head = 3264;
                }
                endtalktimer = 0;
                endcon = 5.5;
                obj_herosusie.x -= 20;
                scr_battle_sprite_reset("susie");
                obj_heroralsei.x -= 20;
                scr_battle_sprite_reset("ralsei");
            }
        }
        if (endcon == 5.5)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                global.typer = 50;
                msgsetloc(0, "Not nowe Honeye.&I'm processinge&thise./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1285_0");
                scr_enemyblcon(x - 10, global.monstery[myself] - 20, 10);
                endcon = 6;
                endtalktimer = 0;
                talktimer = 0;
            }
        }
        if (endcon == 6)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                talktimer++;
                if (talktimer == 1)
                {
                    with (obj_writer)
                        instance_destroy();
                    with (obj_lanino_enemy_rouxls)
                        scr_move_to_point_over_time(x - 230, y, 30);
                    with (obj_elnina_enemy_rouxls)
                        head = 3799;
                    mus_volume(global.batmusic[1], 0, 60);
                }
                if (talktimer == 60)
                {
                    endtalktimer = 0;
                    talktimer = 0;
                    endcon = 6.5;
                }
            }
        }
        if (endcon == 6.5)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_writer)
                    instance_destroy();
                with (obj_lanino_enemy_rouxls)
                {
                    global.typer = 50;
                    msgsetloc(0, "Don't... don't&call me honey&anymore./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1313_0");
                    scr_enemyblcon(x + 110, global.monstery[myself] - 10, 10);
                    myblcon.side = -1;
                    pose = -1;
                }
                with (obj_elnina_enemy_rouxls)
                    head = 3799;
                endtalktimer = 0;
                endcon = 7;
            }
        }
        if (endcon == 7)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_elnina_enemy_rouxls)
                {
                    with (obj_writer)
                        instance_destroy();
                    global.typer = 50;
                    msgsetloc(0, "La... Lanino!?/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1329_0");
                    scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
                }
                endtalktimer = 0;
                endcon = 8;
            }
        }
        if (endcon == 8)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_writer)
                    instance_destroy();
                with (obj_lanino_enemy_rouxls)
                {
                    global.typer = 50;
                    msgsetloc(0, "I'm sorry, Elnina...&I'm... I'm going to&the other side../%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1342_0");
                    scr_enemyblcon(x + 110, global.monstery[myself] - 10, 10);
                    myblcon.side = -1;
                    pose = -1;
                    global.currentsong[0] = snd_init("mus_confession.ogg");
                    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.45, 1);
                }
                endtalktimer = 0;
                endcon = 9;
            }
        }
        if (endcon == 9)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_writer)
                    instance_destroy();
                with (obj_elnina_enemy_rouxls)
                {
                    global.typer = 50;
                    msgsetloc(0, "I.../%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1360_0");
                    scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
                }
                with (obj_lanino_enemy_rouxls)
                    head = 4544;
                endcon = 9.5;
                endtalktimer = 0;
            }
        }
        if (endcon == 9.5)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_writer)
                    instance_destroy();
                endcon = 10;
                endtalktimer = 0;
                talktimer = 0;
            }
        }
        if (endcon == 10)
        {
            talktimer++;
            if (endtalktimer == 1)
            {
                with (obj_elnina_enemy_rouxls)
                {
                    head = 4435;
                    scr_move_to_point_over_time(x - 230, y, 30);
                }
            }
            if (endtalktimer == 45)
            {
                endtalktimer = 0;
                endcon = 11;
                talktimer = 0;
            }
        }
        if (endcon == 11)
        {
            with (obj_elnina_enemy_rouxls)
            {
                global.typer = 50;
                msgsetloc(0, "I'm going too!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1394_0");
                scr_enemyblcon(x + 110, global.monstery[myself] - 10, 10);
                myblcon.side = -1;
                pose = -1;
            }
            endtalktimer = 0;
            endcon = 11.2;
        }
        if (endcon == 11.2)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_writer)
                    instance_destroy();
                with (obj_elnina_enemy_rouxls)
                {
                    global.typer = 50;
                    msgsetloc(0, "I thought YOU&were the one&who liked Rouxls,&so I.../%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1410_0");
                    scr_enemyblcon(x + 110, global.monstery[myself] - 10, 10);
                    myblcon.side = -1;
                    pose = -1;
                }
                talktimer = 0;
                endtalktimer = 0;
                endcon = 11.5;
            }
        }
        if (endcon == 11.5)
        {
            talktimer++;
            if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
            {
                talktimer = 0;
                endcon = 12;
            }
        }
        if (endcon == 12)
        {
            talktimer++;
            if (talktimer == 1)
            {
                with (obj_writer)
                    instance_destroy();
                with (obj_lanino_enemy_rouxls)
                {
                    scr_move_to_point_over_time(x + 180, (cameray() + 30) - 8, 15);
                    pose = 0;
                }
                with (obj_elnina_enemy_rouxls)
                    scr_move_to_point_over_time(x, cameray() + 30, 15);
            }
            if (talktimer == 40)
            {
                endtalktimer = 0;
                talktimer = 0;
                endcon = 13;
            }
        }
        if (endcon == 13)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_writer)
                    instance_destroy();
                with (obj_elnina_enemy_rouxls)
                {
                    global.typer = 50;
                    msgsetloc(0, "I'm sorry,&my sunshine!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1452_0");
                    scr_enemyblcon(x + 20, y + 120, 11);
                    myblcon.side = -1;
                    pose = -1;
                }
                endtalktimer = 0;
                endcon = 14;
            }
        }
        if (endcon == 14)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_lanino_enemy_rouxls)
                {
                    with (obj_writer)
                        instance_destroy();
                    global.typer = 50;
                    msgsetloc(0, "I'm sorry,&my dewdrop!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1469_0");
                    scr_enemyblcon(x - 58, y + 131, 12);
                    head = 3264;
                }
                endtalktimer = 0;
                endcon = 14.1;
            }
        }
        if (endcon == 14.1)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_elnina_enemy_rouxls)
                {
                    global.typer = 50;
                    msgsetloc(0, "The weather&should always.../%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1482_0");
                    scr_enemyblcon(x + 20, y + 120, 11);
                    myblcon.side = -1;
                    pose = -1;
                    head = 4212;
                }
                endtalktimer = 0;
                endcon = 14.2;
            }
        }
        if (endcon == 14.2)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_writer)
                    instance_destroy();
                with (obj_lanino_enemy_rouxls)
                {
                    global.typer = 50;
                    msgsetloc(0, "stick&together.../%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1499_0");
                    scr_enemyblcon(x - 58, y + 131, 12);
                    head = 2741;
                }
                endtalktimer = 0;
                endcon = 14.5;
            }
        }
        if (endcon == 14.5)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                endtalktimer++;
                snd_free_all();
                endcon = 15;
            }
        }
        if (endcon == 15)
        {
            talktimer++;
            if (talktimer == 90)
            {
                with (obj_elnina_enemy_rouxls)
                    pose = -1;
                with (obj_lanino_enemy_rouxls)
                    pose = -1;
                with (obj_rouxls_ch3_enemy)
                {
                    global.typer = 50;
                    msgsetloc(0, "Ah... ha&ha ha ha!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1528_0");
                    scr_enemyblcon(x - 10, y + 50, 10);
                    with (obj_writer)
                        rate = 2;
                }
                endtalktimer = 0;
                talktimer = 0;
                endcon = 16;
                snd_free_all();
            }
        }
        if (endcon == 16)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_rouxls_ch3_enemy)
                {
                    with (obj_writer)
                        instance_destroy();
                    global.typer = 50;
                    msgsetloc(0, "Just as planned.&The two Loverse...&are reunited./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1544_0");
                    scr_enemyblcon(x - 10, y + 50, 10);
                }
                endtalktimer = 0;
                endcon = 17;
            }
        }
        if (endcon == 17)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_rouxls_ch3_enemy)
                {
                    with (obj_writer)
                        instance_destroy();
                    global.typer = 50;
                    msgsetloc(0, "I shall now...&Taketh my leave.../%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1557_0");
                    scr_enemyblcon(x - 16, y + 50, 10);
                    bowanim = true;
                    danceindex = 0;
                }
                endtalktimer = 0;
                endcon = 18;
            }
        }
        if (endcon == 18)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_rouxls_ch3_enemy)
                {
                    with (obj_writer)
                        instance_destroy();
                    with (obj_rouxls_ch3_enemy)
                        hspeed = 0.5;
                }
                endtalktimer = 0;
                endcon = 19;
                talktimer = 0;
            }
        }
        if (endcon == 19)
        {
            talktimer++;
            lancer.sprite_index = spr_lancer_rt;
            lancer.y = 170;
            if (talktimer == 60)
                snd_play(snd_slidewhistle);
            if (talktimer >= 60 && endtalktimer < 90)
                lancer.x = lerp(lancer.xstart, camerax() + 340, (endtalktimer - 60) / 30);
            if (talktimer > 90)
                lancer.x = camerax() + 340;
            if (talktimer == 90)
            {
                with (obj_rouxls_ch3_enemy)
                    hspeed = 0;
            }
            if (talktimer == 90)
            {
                endtalktimer = 0;
                talktimer = 0;
                endcon = 20;
            }
        }
        if (endcon == 20)
        {
            lancer.y = 170;
            lancer.x = camerax() + 340;
            with (obj_writer)
                instance_destroy();
            with (lancer)
            {
                global.typer = 50;
                msgsetloc(0, "Hey, Lesser Dad!&Lesser Dad!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1608_0");
                scr_enemyblcon(x + 100, y + 40, 10);
                myblcon.side = -1;
                pose = -1;
            }
            endtalktimer = 0;
            endcon = 21;
        }
        if (endcon == 21)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                lancer.y = 170;
                lancer.x = camerax() + 340;
                with (lancer)
                {
                    with (obj_writer)
                        instance_destroy();
                    global.typer = 50;
                    msgsetloc(0, "The guys with big guns want&to know when they're gonna&get paid!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1627_0");
                    scr_enemyblcon(x - 16, y + 50, 10);
                    sprite_index = spr_lancer_lt;
                }
                endtalktimer = 0;
                endcon = 21.5;
            }
        }
        if (endcon == 21.5)
        {
            if ((button3_p() && endtalktimer > 15) || !i_ex(obj_writer))
            {
                with (obj_writer)
                    instance_destroy();
                endtalktimer = 0;
                talktimer = 0;
                endcon = 22;
            }
        }
        if (endcon == 22)
        {
            talktimer++;
            lancer.y = 170;
            lancer.x = camerax() + 340;
            if (talktimer == 1)
            {
                with (obj_rouxls_ch3_enemy)
                    hspeed = 20;
                with (obj_elnina_enemy_rouxls)
                    head = 3799;
                with (obj_lanino_enemy_rouxls)
                    head = 4544;
            }
            if (talktimer == 5)
                snd_play_x(snd_escaped, 1, 1);
            if (talktimer == 31)
            {
                lancer.sprite_index = spr_lancer_rt;
                scr_lerpvar_instance(shadowman1, "x", shadowman1.x, camerax() + 800, 30);
                scr_lerpvar_instance(shadowman2, "x", shadowman2.x, camerax() + 800, 26);
                with (shadowman1)
                    sprite_index = spr_shadowman_reload_bunny;
                with (shadowman2)
                    sprite_index = spr_shadowman_reload_bunny;
                if (teamsize == 4 && shadowmenalreadyfired == false)
                {
                    scr_lerpvar_instance(shadowman3, "x", shadowman3.x, camerax() + 800, 22);
                    scr_lerpvar_instance(shadowman4, "x", shadowman4.x, camerax() + 800, 18);
                    with (shadowman3)
                        sprite_index = spr_shadowman_reload_cat;
                    with (shadowman4)
                        sprite_index = spr_shadowman_reload_cat;
                }
            }
            if (talktimer >= 60)
            {
                lancer.x = lerp(camerax() + 340, camerax() + 720, (talktimer - 60) / 30);
                lancer.sprite_index = spr_lancer_lt;
            }
            if (talktimer == 60)
            {
                scr_battle_sprite_set("susie", spr_susier_dark_laugh, 1/3, 1);
                snd_play(snd_suslaugh);
            }
            if (talktimer == 150)
                scr_battle_sprite_reset("susie");
            if (talktimer == 151)
            {
                endtalktimer = 0;
                talktimer = 0;
                endcon = 23;
                scr_wincombat();
            }
        }
    }
    if (cardsummon && yarnendturn == 0 && !i_ex(obj_writer) && !i_ex(obj_battleblcon))
    {
        cardsummontimer++;
        if (cardsummontimer == 10 && intro < 3)
        {
            snd_play(snd_boost);
            anim = instance_create(x - 8, y + 36, obj_animation);
            with (anim)
            {
                depth = other.depth - 2;
                image_index = 0;
                image_xscale = 2;
                image_yscale = 2;
                image_speed = 1;
                sprite_index = spr_rouxls_card_shine;
                if (other.intro == 3)
                {
                    x += 2;
                    y -= 4;
                }
            }
        }
        if (cardsummontimer == 12 && intro < 3)
        {
            flash = scr_oflash();
            flash.sprite_index = spr_rouxls_chef_card;
            flash.target = -1;
            flash.image_index = 2;
            if (intro == 3)
            {
                flash.sprite_index = spr_rouxls_chef_card2;
                flash.image_index = 19;
            }
        }
        if (((cardsummontimer > 30 && intro < 3) || (cardsummontimer == 120 && intro == 3)) && !i_ex(obj_rouxls_cards))
        {
            cardsummontimer = 0;
            cardsummon = false;
            if (intro > 1)
                summoning = true;
            if (intro == 3)
                mus_volume(global.batmusic[1], 1, 0);
        }
    }
    if (summoning && !cardsummon && dancecon == 0 && yarnendturn == 0)
    {
        if (summontimer == 0)
        {
            if (phase == 2)
            {
                obj_battlecontroller.rouxlsgridenabled = true;
                obj_battlecontroller.rouxlsbuttoncount_y = 0;
                obj_battlecontroller.rouxlsbuttoncount = choose(1, 2, 4, 5);
            }
            if (phase == 3)
            {
                obj_battlecontroller.rouxlsbuttoncount_y = 0;
                obj_battlecontroller.rouxlsbuttoncount = choose(1, 2, 4, 5);
            }
            if (phase == 1 || phase == 2)
            {
                var _count = 3 - scr_monsterpop();
                repeat (_count)
                {
                    var _newshadowman = scr_monster_add(60, obj_shadowman_enemy);
                    with (global.monsterinstance[_newshadowman])
                    {
                        skiptext = true;
                        x = camerax() + 740;
                        y = global.monstermakey[myself];
                        if (y < obj_rouxls_ch3_enemy.y)
                            depth = obj_rouxls_ch3_enemy.depth + 1;
                        else
                            depth = obj_rouxls_ch3_enemy.depth - 2;
                        rtimer = 0;
                        talkwait = 1;
                        scr_move_to_point_over_time(global.monstermakex[myself], global.monstermakey[myself], 20);
                        with (obj_shadowman_enemy)
                            createballoon = false;
                    }
                }
            }
            if (phase == 3)
            {
                with (obj_battlecontroller)
                {
                    heartbuttoncount = 0;
                    spadebuttoncount = -6;
                    rouxlsbuttoncount = choose(0, -1, -3, -4);
                }
                var _lanino = scr_monster_add(63, obj_elnina_enemy_rouxls);
                with (global.monsterinstance[_lanino])
                {
                    skiptext = true;
                    x = camerax() + 740;
                    y = global.monstermakey[myself];
                    if (y < obj_rouxls_ch3_enemy.y)
                        depth = obj_rouxls_ch3_enemy.depth + 1;
                    rtimer = 0;
                    talkwait = 1;
                    scr_move_to_point_over_time(global.monstermakex[myself], global.monstermakey[myself], 20);
                }
                var _elnina = scr_monster_add(64, obj_lanino_enemy_rouxls);
                with (global.monsterinstance[_elnina])
                {
                    skiptext = true;
                    x = camerax() + 740;
                    y = global.monstermakey[myself];
                    if (y < obj_rouxls_ch3_enemy.y)
                        depth = obj_rouxls_ch3_enemy.depth + 1;
                    rtimer = 0;
                    talkwait = 1;
                    scr_move_to_point_over_time(global.monstermakex[myself], global.monstermakey[myself], 20);
                }
            }
        }
        summontimer++;
        if (summontimer >= 20)
        {
            summoning = false;
            summontimer = 0;
        }
    }
    if (shadowmengetfiredcon == 1 && global.turntimer < 1)
    {
        with (obj_shadowman_enemy)
        {
            if (idlesprite == spr_shadowman_cat)
            {
                idlesprite = spr_shadowman_idle_cat;
                sparedsprite = spr_shadowman_idle_cat;
            }
            scr_move_to_point_over_time(xstart, ystart, 8);
        }
        with (obj_yarn_rotating)
            instance_destroy();
        with (obj_writer)
            instance_destroy();
        scr_move_to_point_over_time(xstart, ystart, 8);
        shadowmengetfiredcon = 2;
        snd_play(snd_howl);
        vspacechange = true;
        scr_speaker("ralsei");
        msgsetloc(0, "\\EO* Kris, Susie, I'm sorry! I've become a big cuddly ball...!/", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1809_0");
        scr_anyface_next("rouxls", "C");
        msgnextloc("* .../", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1811_0");
        msgnextloc("* I don't thinketh, THIS is what I askedst for./", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1812_0");
        msgnextloc("* Likest, Yarne? You don't even havest Gun's?/", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1813_0");
        msgnextloc("* Okaye. Okaye. I see. I see./", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1814_0");
        msgnextloc("* Your a little bit Fired, byst the way.../", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1815_0");
        msgnextloc("* NEXTST!!!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1816_0");
        scr_battletext();
    }
    if (shadowmengetfiredcon > 2)
        shadowmengetfiredtimer++;
    if (shadowmengetfiredcon == 2 && dancecon == 0 && !i_ex(obj_writer))
    {
        vspacechange = false;
        with (obj_shadowman_enemy)
            scr_move_to_point_over_time(global.monstermakex[myself] + 200, global.monstermakey[myself], 20);
        shadowmengetfiredcon = false;
        scr_speaker("rouxls");
        msgsetloc(0, "* Don't worry guys, I'll get a refund on that one./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1861_0");
        scr_battletext();
        shadowmengetfiredcon = 20;
        shadowmengetfiredcon = 2.05;
        talktimer = 0;
    }
    if (shadowmengetfiredcon == 2)
        exit;
    if (shadowmengetfiredcon == 2.05 && i_ex(obj_writer))
        exit;
    if (shadowmengetfiredcon == 2.05 && !i_ex(obj_writer))
    {
        talktimer++;
        if (talktimer == 1)
        {
            scr_battle_sprite_reset("ralsei");
            yarnmarker = instance_create_depth(obj_heroralsei.x, obj_heroralsei.y, obj_heroralsei.depth - 2, obj_marker);
            yarnmarker.sprite_index = spr_ralseib_yarn_2;
            yarnmarker.hspeed = -4;
            yarnmarker.image_xscale = 2;
            yarnmarker.image_yscale = 2;
            snd_play_x(snd_wallclaw, 0.4, 0.6);
        }
        if (talktimer == 30)
        {
            talktimer = 0;
            shadowmengetfiredcon = 2.1;
        }
    }
    if (shadowmengetfiredcon == 2.1)
    {
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            with (obj_face)
                instance_destroy();
            global.typer = 50;
            msgsetloc(0, "You may hath&gotten rid&of my Goones./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_1896_0");
            scr_enemyblcon(x - 16, y + 50, 10);
        }
        talktimer = 0;
        shadowmengetfiredcon = 2.2;
    }
    if (shadowmengetfiredcon == 2.2 && !i_ex(obj_writer))
    {
        talktimer++;
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 50;
            msgset(0, rouxlstext1);
            scr_enemyblcon(x - 16, y + 50, 10);
        }
        talktimer = 0;
        shadowmengetfiredcon = 2.3;
    }
    if (shadowmengetfiredcon == 2.3 && !i_ex(obj_writer))
    {
        talktimer++;
        with (obj_rouxls_ch3_enemy)
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 50;
            msgset(0, rouxlstext2);
            scr_enemyblcon(x - 16, y + 50, 10);
        }
        talktimer = 0;
        shadowmengetfiredcon = 2.4;
    }
    if (shadowmengetfiredcon == 2.4 && !i_ex(obj_writer))
    {
        talktimer = 0;
        shadowmengetfiredcon = 3;
    }
    if (shadowmengetfiredcon == 3 && dancecon == 0 && !i_ex(obj_writer) && shadowmengetfiredtimer > 20)
    {
        shadowmengetfiredcon = 4;
        rouxlsbuttoncount_y = 4;
        phase = 3;
        obj_battlecontroller.rouxlsgridenabled = true;
        obj_battlecontroller.rouxlsbuttoncount = choose(0, -1, -3, -4);
        with (global.monsterinstance[1])
        {
            scr_monsterdefeat();
            instance_destroy();
        }
        with (global.monsterinstance[2])
        {
            scr_monsterdefeat();
            instance_destroy();
        }
        summoning = true;
    }
    if (shadowmengetfiredcon == 4 && !i_ex(obj_writer) && summoning == false)
    {
        with (obj_battlecontroller)
        {
            noreturn = 0;
            alarm[2] = 2;
        }
        shadowmengetfiredcon = 0;
        shadowmenalreadyfired = true;
    }
    if (teamformationcon == 0)
    {
        teamformationtimer++;
        if (teamformationtimer == 100)
            teamformationtimer = 0;
    }
    if (teamformationcon == 1 && phase != 3)
    {
        teamformationtimer++;
        if (teamformationtimer == 1)
        {
            if (shadowman1 != -1 && teamsize == 2 && phase == 1)
            {
                scr_lerpvar_instance(shadowman1, "y", shadowman1.ystart, cameray() + 268, 20);
                scr_lerpvar_instance(shadowman2, "y", shadowman2.ystart, cameray() + 268, 10);
                with (shadowman1)
                    scr_script_delayed(scr_lerpvar, 20, "x", x, camerax() + 180, 8);
                with (shadowman2)
                    scr_script_delayed(scr_lerpvar, 10, "x", x, camerax() + 250, 4);
            }
            if (teamsize == 4 && shadowmenalreadyfired == false)
            {
                scr_lerpvar_instance(shadowman3, "y", shadowman3.ystart, cameray() + 268, 16);
                scr_lerpvar_instance(shadowman4, "y", shadowman4.ystart, cameray() + 268, 13);
                with (shadowman3)
                    scr_script_delayed(scr_lerpvar, 16, "x", x, camerax() + 320, 3);
                with (shadowman4)
                    scr_script_delayed(scr_lerpvar, 13, "x", x, camerax() + 390, 8);
            }
        }
        if (teamformationtimer == 80)
        {
            teamformationcon = 2;
            teamformationtimer = 0;
        }
    }
    if (teamformationcon == 2)
    {
        teamformationtimer++;
        if (teamformationtimer == 100)
            teamformationtimer = 0;
    }
    if (teamformationcon == 3 && phase != 3)
    {
        teamformationtimer++;
        if (teamformationtimer == 1)
        {
            var jumpspd = 20;
            var jumptime = 15;
            if (shadowman1 != -1)
            {
            }
            if (teamsize == 4 && shadowmenalreadyfired == false)
            {
                with (shadowman3)
                    scr_jump_to_point(camerax() + 253, cameray() + 88, jumpspd, jumptime);
                with (shadowman4)
                    scr_jump_to_point(camerax() + 253, cameray() + 152, jumpspd, jumptime);
            }
        }
        if (teamformationtimer == 80)
        {
            teamformationcon = 0;
            teamformationtimer = 0;
        }
    }
    with (obj_shadowman_enemy)
        skipattack = true;
    if (scr_isphase("enemytalk") && talked == 0 && dancecon == 0 && endcon == 0 && summoning == false && cardsummon == false && shadowmengetfiredcon == 0)
    {
        scr_randomtarget();
        myattackpriority = 50;
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        global.typer = 50;
        ballooncon = 0;
        balloonsubcon = 0;
        balloonend = 1;
        talkedcon = 0;
        ralseitalks = 0;
        susietalks = 0;
        attackdone = 0;
        spadepower = 0;
        yarnendturn = 0;
        if (balloonorder == 0)
        {
            msgsetloc(0, "Yes, yes! Non-violense!&Bigge 'ups', my friends./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2065_0");
            ballooncon = 1;
            balloonend = 0;
            balloonorder = 1;
        }
        else if (balloonorder == 1)
        {
            msgsetloc(0, "Lancer, don'st bother&Lesser Daddy when he's&harming your friends./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2066_0");
            balloonend = 1;
            balloonorder = 2;
        }
        else if (phase == 1 && phasedone == true)
        {
            msgsetloc(0, "It's fine.../%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2067_0");
            ballooncon = 3;
            balloonend = 0;
            phasedone = false;
            phase = 2;
        }
        else if (phase == 2 && phasedone == true)
        {
            if (obj_heroralsei.state == 8)
            {
                scr_battle_sprite_reset("ralsei");
                yarnmarker = instance_create_depth(obj_heroralsei.x, obj_heroralsei.y, obj_heroralsei.depth - 2, obj_marker);
                if (obj_rouxls_ch3_enemy.ralseiyarnhp == 0)
                    yarnmarker.sprite_index = spr_ralseib_yarn_2;
                else
                    yarnmarker.sprite_index = spr_ralseib_yarn_1b;
                yarnmarker.hspeed = -4;
                yarnmarker.image_xscale = 2;
                yarnmarker.image_yscale = 2;
                snd_play_x(snd_wallclaw, 0.4, 0.6);
            }
            msgsetloc(0, "Okay, you may&hath recruitedst&away some of&my Goones./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2081_0");
            ballooncon = 5;
            balloonend = 0;
            phasedone = false;
            phase = 3;
        }
        else if (phase == 1 || phase == 2)
        {
            if (p1p2dialogueturn == 0)
                msgsetloc(0, "Fretteth noth, my Recruitse.&From nowst on, thine Salarye&shall be Most Resplendent./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2085_0");
            if (p1p2dialogueturn == 1)
                msgsetloc(0, "You see-eth,I hath secretly&\"Trading Cards\" with TV GUY...&One \"Rules Card\" for his&\"Debith Card\"./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2086_0");
            if (p1p2dialogueturn == 2)
                msgsetloc(0, "TV guy shall Learnst&about his missing&Debith Card when&he looketh in his&wallet./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2094_0");
            if (p1p2dialogueturn == 3)
                msgsetloc(0, "But as his 2nd in command,&Surely Mr. TV shalt&Approveth, and teacheth&me the ways of his \"PIN\"./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2088_0");
            if (p1p2dialogueturn == 4)
                msgsetloc(0, "So yese. Thoun shalth not&gettingeth Paid yet./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2089_0");
            if (p1p2dialogueturn > 4)
            {
                if (phase == 1)
                    msgsetloc(0, "No violense...&Only Gun's./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2092_0");
                if (phase == 2)
                    msgsetloc(0, "Hope these Guyse&have Gun's. I'm&not Lookinge./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2093_0");
            }
            p1p2dialogueturn++;
        }
        else if (phase == 3)
        {
            if (p3dialogueturn == 0)
                msgsetloc(0, "I feelst it. Mm.&We're strongere,&We're growinge,&As a Throuple./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2099_0");
            if (p3dialogueturn == 1)
                msgsetloc(0, "I'm so proude to be dating&the Sun AND the Moon...&What? You're not the Moon?&You're a CLOUD? WHAT?/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2100_0");
            if (p3dialogueturn == 2)
                msgsetloc(0, "Guyse, I've beenst Traininge&thou with yon Pointere all&day. Try a LITTLE harder?/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2101_0");
            if (p3dialogueturn > 2)
                msgsetloc(0, "Beholde...&Yon powere of LOVE!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2102_0");
            p3dialogueturn++;
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
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
        }
        if (phase > 1)
        {
            with (obj_battlecontroller)
            {
                spadebuttondirection = 270;
                spadebuttoncount = -6;
                rouxlsbuttoncount = choose(0, -1, -3, -4);
            }
        }
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
    if (talked == 0.6 && cardsummon == false)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            if (ballooncon == 1)
            {
                msgsetloc(0, "Now for my ACT,&I shalt hire people,/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2154_0");
                ballooncon = 2;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "to shooteth you./%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2155_0");
                ballooncon = 0;
                balloonend = 1;
                summoning = 1;
            }
            else if (ballooncon == 3)
            {
                msgsetloc(0, "Not only do&I have more&guys where that&came from,/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2156_0");
                ballooncon = 4;
            }
            else if (ballooncon == 4)
            {
                msgsetloc(0, "but I also have&more cards!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2157_0");
                ballooncon = 0;
                balloonend = 1;
                cardsummon = true;
                danceindex = 0;
            }
            else if (ballooncon == 5)
            {
                msgsetloc(0, "But can thou&defeast...&The powere...&of Love?/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2158_0");
                ballooncon = 6;
                balloonend = 0;
            }
            else if (ballooncon == 6)
            {
                msgsetloc(0, "Honeyes!!!&Oh my Honeyes!!!!/%", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2159_0");
                ballooncon = 0;
                balloonend = 1;
                summoning = 1;
            }
            talked = 0.7;
            global.typer = 50;
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
                scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
            }
            ralseitalks = 0;
            susietalks = 0;
            alarm[6] = 1;
        }
    }
    if (talked == 1 && scr_isphase("enemytalk") && summoning == false && cardsummon == false && !i_ex(obj_writer))
        global.mnfight = 1.5;
    if (global.mnfight == 1.5)
    {
        if (scr_attackpriority(myattackpriority))
        {
            if (!instance_exists(obj_growtangle))
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            if (!instance_exists(obj_moveheart))
                scr_moveheart();
            global.mnfight = 2;
            scr_turntimer(90);
        }
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            global.faceaction[0] = 0;
            global.faceaction[1] = 0;
            global.faceaction[2] = 0;
            scr_turntimer(250);
            if (phase == 1 || phase == 2)
                myattackchoice = phase - 1;
            if (phase == 3)
            {
                if (usedlaserpointerattack == false)
                    myattackchoice = 2;
                else
                    myattackchoice = 3;
                usedlaserpointerattack = true;
            }
            if (myattackchoice == 0)
            {
                with (obj_shadowman_enemy)
                {
                    global.monsterattackname[myself] = "Rouxls shoot";
                    var dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 74;
                }
            }
            else if (myattackchoice == 1)
            {
                scr_move_to_point_over_time(x + 160, y, 8);
                yarndifficulty++;
                with (obj_shadowman_enemy)
                {
                    idlesprite = spr_shadowman_cat;
                    sparedsprite = spr_shadowman_cat;
                    if (y < other.y)
                        scr_move_to_point_over_time(x, y + 60, 8);
                    global.monsterattackname[myself] = "Yarn Balls";
                    var dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 72;
                    dc.creatorid = id;
                }
                if (!i_ex(obj_rouxls_yarn_picture_controller))
                    instance_create(x, y, obj_rouxls_yarn_picture_controller);
            }
            else if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "Laser Pointer";
                var dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 73;
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 69;
                dc.special = 0;
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 71;
                dc.special = 2;
                scr_turntimer(1500);
                battlemsgendcon = 1;
            }
            else if (myattackchoice == 3)
            {
                global.monsterattackname[myself] = "Laser Pointer";
                var dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 73.1;
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 69;
                dc.special = 0;
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 71;
                dc.special = 2;
                scr_turntimer(450);
            }
            powerup = false;
            turns += 1;
            if (turns == 1)
                rouxlsdance = true;
            if (phase == 1 && turns > 2)
                turns = 2;
            if (phase == 2 && turns > 3)
                turns = 3;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3);
            with (obj_shadowman_enemy)
                createballoon = true;
            var substring = string(myself);
            if (phase == 1)
                global.battlemsg[0] = stringsetloc("* (With the effect of the RULES CARD, you can only ACT!)", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2304_0");
            if (phase >= 2)
                global.battlemsg[0] = stringsetloc("* (Dodge ROUXLSes, select LANCERs!)", "obj_rouxls_ch3_enemy_slash_Step_0_gml_2313_0");
            attacked = 1;
        }
    }
}
if (global.mnfight == 2 && global.turntimer <= 1)
{
    with (obj_battlecontroller)
        buttonspeed = 0;
    rouxlsdance = false;
    if (destroywriter == true)
    {
        destroywriter = false;
        with (obj_writer)
            instance_destroy();
    }
    global.fc = 0;
    if (myattackchoice == 1)
    {
        with (obj_shadowman_enemy)
        {
            if (sparedsprite == spr_shadowman_cat)
            {
                idlesprite = spr_shadowman_idle_cat;
                sparedsprite = spr_shadowman_idle_cat;
            }
            if (obj_rouxls_ch3_enemy.shadowmengetfiredcon == 0)
                scr_move_to_point_over_time(xstart, ystart, 8);
        }
        with (obj_yarn_rotating)
            instance_destroy();
        scr_rememberxy();
        scr_move_to_point_over_time(xstart, ystart, 8);
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (actcon == 1 && !instance_exists(obj_writer))
        scr_nextact();
}
if (state == 3)
{
    scr_enemyhurt_tired_after_damage(0.5);
    scr_enemy_hurt();
}
if (yarnendturn == 1 && !i_ex(obj_writer))
    yarnendturn = 0;
if (spincon == 1)
{
    spintimer++;
    if (spintimer == 12)
        spintimer = 0;
    if (spintimer == 0)
        lancer.sprite_index = spr_lancer_dt;
    else if (spintimer == 3)
        lancer.sprite_index = spr_lancer_lt;
    else if (spintimer == 6)
        lancer.sprite_index = spr_lancer_ut;
    else if (spintimer == 9)
        lancer.sprite_index = spr_lancer_rt;
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
