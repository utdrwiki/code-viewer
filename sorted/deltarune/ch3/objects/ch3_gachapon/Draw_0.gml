draw_self();
var xx = x + (sprite_width / 2);
var yy = y + (sprite_height / 2);
var superChance = 5;
if (i_ex(obj_numberentry))
    betPoints = obj_numberentry.num;
var remainingSuperPrize = 5 - (global.flag[1177] + global.flag[1178] + global.flag[1179] + global.flag[1180] + global.flag[1181]);
var baseSuperChanceRate = 0.1 + (remainingSuperPrize / 50);
var superChanceOldBetBonus = (global.flag[1182] * baseSuperChanceRate * 2) / 100;
superChance = max(5, 5 + ((betPoints - 100) * (baseSuperChanceRate + superChanceOldBetBonus)));
if (remainingSuperPrize <= 0)
    superChance = 0;
superChanceBonusDrawAmount = superChance;
if (scr_debug())
{
}
if (dispense == 1 && !d_ex())
{
    xstart = x;
    ystart = y;
    global.interact = 1;
    con = 1;
    timer = 0;
    dispense = 0;
}
if (con == 1)
{
    global.interact = 1;
    timer++;
    if ((timer % 2) == 0)
    {
        x = xstart + random_range(-4, 4);
        y = ystart + random_range(-4, 4);
        snd_play_x(snd_noise, 0.6, 0.6 + random(0.4));
    }
    if (timer >= 30)
    {
        x = xstart;
        y = ystart;
        timer = 0;
        con = 2;
        snd_play_x(snd_closet_impact, 0.6, 1.5);
        snd_play_x(snd_locker, 0.6, 0.5);
        scr_shakescreen();
        gachaBallX = 0;
        gachaBallY = 140;
        gachaBallXScale = 0;
        gachaBallYScale = 0;
        gachaAngle = 180;
        gachaBallSeparation = 0;
        drawGachaBall = 1;
        var _t = 15;
        scr_lerpvar("gachaAngle", gachaAngle, 0, _t, -1, "out");
        scr_lerpvar("gachaBallXScale", 0, 2, _t, -1, "out");
        scr_lerpvar("gachaBallYScale", 0, 2, _t, -1, "out");
        scr_lerpvar("gachaBallY", gachaBallY, 0, _t, 2, "out");
        var myPrize = 25;
        selectedPrize = 25;
        var doSuperPrize = 0;
        var superPrizeCheck = round(random(100));
        if (superPrizeCheck <= superChanceBonusDrawAmount)
            doSuperPrize = 1;
        if (doSuperPrize)
        {
            for (var i = 0; i < 100; i++)
            {
                myPrize = irandom_range(20, 24);
                if (prizeavailable[myPrize] == 1)
                {
                    selectedPrize = myPrize;
                    break;
                }
            }
            if (prizeavailable[selectedPrize] == 0)
                selectedPrize = 25;
            snd_play_x(snd_sparkle_gem, 1, 1);
            var haveroom = true;
            switch (prizeitemtype[myPrize])
            {
                case "armor":
                    haveroom = scr_getarmorspace();
                    break;
                case "weapon":
                    haveroom = scr_getweaponspace();
                    break;
                case "item":
                    haveroom = scr_getinventoryspace() + scr_getpocketspace();
                    break;
            }
            if (haveroom)
            {
                show_debug_message_concat("global.flag[1182] before reset: ", global.flag[1182]);
                global.flag[1182] = 0;
                show_debug_message_concat("global.flag[1182] after reset: ", global.flag[1182]);
            }
        }
        else
        {
            for (var i = 0; i < 100; i++)
            {
                myPrize = choose(0, 1, 2, 3, 3, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
                if (prizeavailable[myPrize] == 1)
                {
                    selectedPrize = myPrize;
                    break;
                }
            }
            if (prizeavailable[selectedPrize] == 0)
                selectedPrize = 25;
            global.flag[1182] += betPoints;
        }
        scr_speaker("noone");
        var mystring;
        if (prizeitemtype[selectedPrize] != "none")
        {
            mystring = scr_itemget_anytype_text(prizeitemid[selectedPrize], prizeitemtype[selectedPrize]);
        }
        else
        {
            mystring = "";
            noroom = 0;
        }
        if (noroom == 0)
        {
            if (prizeflag[selectedPrize] > 0)
                global.flag[prizeflag[selectedPrize]] = 1;
            prizeavailable[selectedPrize] = 0;
            if (prizespecialmessage[selectedPrize] > 0)
            {
                if (prizespecialmessage[selectedPrize] == 1)
                {
                    snd_play_x(snd_reverse_splat, 1, 1);
                    scr_speaker("lancer");
                    global.fe = 0;
                    msgsetloc(0, "* Ho ho ho^1, I'm an item!/", "obj_ch3_gachapon_slash_Draw_0_gml_226_0");
                    msgnext(mystring + "/%");
                }
                if (prizespecialmessage[selectedPrize] == 2)
                {
                    snd_play_x(snd_lancerwhistle, 1, 1);
                    msgsetloc(0, "* You received a FORTUNE.../", "obj_ch3_gachapon_slash_Draw_0_gml_233_0");
                    fortunecheck = floor(random(12));
                    var fortunestring = stringsetloc("* ... but it was blank!/%", "obj_ch3_gachapon_slash_Draw_0_gml_237_0");
                    switch (fortunecheck)
                    {
                        case 0:
                            msgnextloc("* (Looks like a dog slobbered on it)/%", "obj_ch3_gachapon_slash_Draw_0_gml_242_0");
                            break;
                        case 1:
                            msgnextloc("* (You'll croak before you can find the X^1! Signed^1, the Mad Croaker.)/%", "obj_ch3_gachapon_slash_Draw_0_gml_245_0");
                            break;
                        case 2:
                            msgnextloc("* (Mumble..^1. mumble..^1. Two puzzles are connected...)/%", "obj_ch3_gachapon_slash_Draw_0_gml_248_0");
                            break;
                        case 3:
                            msgnextloc("* (It's good you're spending points on this. They are good for anything else.)/%", "obj_ch3_gachapon_slash_Draw_0_gml_251_0");
                            break;
                        case 4:
                            msgnextloc("* (The aqua spirits trapped in the coolers are beautiful^1, and best of all^1, recyclable.)/%", "obj_ch3_gachapon_slash_Draw_0_gml_254_0");
                            break;
                        case 5:
                            msgnextloc("* (Don't let your guard down. That chair is going to kick your ass!)/%", "obj_ch3_gachapon_slash_Draw_0_gml_257_0");
                            break;
                        case 6:
                            msgnextloc("* (Sometimes you should take the spotlight if it heads your way. Don't be a coward!)/%", "obj_ch3_gachapon_slash_Draw_0_gml_260_0");
                            break;
                        case 7:
                            msgnextloc("* (These are the ranks^1, from lowest to highest...)/", "obj_ch3_gachapon_slash_Draw_0_gml_263_0");
                            msgnextloc("* (C^1,B^1,A^1, S^1, and of course T^1, for TV.)/", "obj_ch3_gachapon_slash_Draw_0_gml_264_0");
                            msgnextloc("* (T is just for bragging rights^1, so don't sweat it.)/", "obj_ch3_gachapon_slash_Draw_0_gml_265_0");
                            msgnextloc("* (Anything lower than \"C\" is just asking for it...!)/%", "obj_ch3_gachapon_slash_Draw_0_gml_266_0");
                            break;
                        case 8:
                            msgnextloc("* (There are no weapons in the GAME. Kids and Adults can enjoy a like!)/%", "obj_ch3_gachapon_slash_Draw_0_gml_269_0");
                            break;
                        case 9:
                            msgnextloc("* (Kris felt a feeling of deja vu.)/", "obj_ch3_gachapon_slash_Draw_0_gml_272_0");
                            msgnextloc("* (..^1. however^1, the handwriting was illegible!)/", "obj_ch3_gachapon_slash_Draw_0_gml_273_0");
                            msgnextloc("* (Kris felt a feeling of deja vu.)/%", "obj_ch3_gachapon_slash_Draw_0_gml_274_0");
                            break;
                        case 10:
                            msgnextloc("* (A musical island postcard from the FLYING ACES.)/", "obj_ch3_gachapon_slash_Draw_0_gml_277_0");
                            msgnextloc("* (It's encouraging you to visit..^1. but the music gets old fast.)/%", "obj_ch3_gachapon_slash_Draw_0_gml_278_0");
                            break;
                        case 11:
                            msgnextloc("* (..^1. huh? There was some sort of triangle inside...)/", "obj_ch3_gachapon_slash_Draw_0_gml_281_0");
                            msgnextloc("* (Kris returned it to the machine.)/%", "obj_ch3_gachapon_slash_Draw_0_gml_282_0");
                            break;
                        default:
                            msgnextloc("* ... but it was blank!/%", "obj_ch3_gachapon_slash_Draw_0_gml_285_0");
                            break;
                    }
                }
                if (prizespecialmessage[selectedPrize] == 3)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (You got a GOLDEN TENNA STATUE!)/", "obj_ch3_gachapon_slash_Draw_0_gml_293_0");
                    scr_anyface_next("susie", 0);
                    msgnextloc("\\E2* Heh^1, anyone call dibs?/", "obj_ch3_gachapon_slash_Draw_0_gml_295_0");
                    scr_anyface_next("ralsei", 0);
                    msgnextloc("\\EJ* Um.../", "obj_ch3_gachapon_slash_Draw_0_gml_297_0");
                    scr_anyface_next("no_name", 0);
                    msgnextloc("* (Guess it can go in your room...?)/%", "obj_ch3_gachapon_slash_Draw_0_gml_299_0");
                }
                if (prizespecialmessage[selectedPrize] == 4)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (There's something in this white capsule!)/", "obj_ch3_gachapon_slash_Draw_0_gml_305_0");
                    msgnextloc("* (It's fuzzy...)/", "obj_ch3_gachapon_slash_Draw_0_gml_306_0");
                    msgnextloc("* (It's fluffy...)/", "obj_ch3_gachapon_slash_Draw_0_gml_307_0");
                    msgnextloc("* (..^1. did you get an item or not?)/%", "obj_ch3_gachapon_slash_Draw_0_gml_308_0");
                }
            }
            else
            {
                snd_play(snd_item);
                snd_play(snd_equip);
                msgset(0, mystring + "/%");
            }
        }
        else
        {
            global.flag[1182] -= betPoints;
            if (global.flag[1182] < 0)
                global.flag[1182] = 0;
            global.flag[1044] += 100;
            if (global.flag[1044] > 9999)
                global.flag[1044] = 9999;
            mystring = scr_itemget_anytype_text(prizeitemid[selectedPrize], prizeitemtype[selectedPrize], "/");
            msgset(0, mystring);
            msgnextloc("* (As a consolation^1, you received 100 POINTs.)/%", "obj_ch3_gachapon_slash_Draw_0_gml_327_0");
        }
    }
}
if (con == 2)
{
    timer++;
    if (timer == 15)
    {
        with (obj_lerpvar)
            instance_destroy();
        gachaBallX = 0;
        gachaBallY = 0;
        gachaBallXScale = 2;
        gachaBallYScale = 2;
        gachaAngle = 0;
    }
    if ((timer >= 16 && timer < 60 && button1_p()) || button2_p())
        timer = 60;
    if (timer == 60)
    {
        snd_play_x(snd_punchweak, 1, 0.8);
        snd_play_x(snd_punchheavythunder, 0.4, 1.3);
        if (prizeballcolor[selectedPrize] == c_blue)
            snd_play_x(snd_splat, 1, 0.8);
        if (prizeballcolor[selectedPrize] == c_yellow)
        {
            snd_play_x(snd_punchheavythunder, 1, 0.7);
            snd_play_x(snd_sparkle_glock, 1, 0.4);
        }
        if (prizeballcolor[selectedPrize] == c_green)
            snd_play_x(snd_pacify, 1, 0.7);
        timer = 0;
        scr_lerpvar("gachaBallSeparation", 0, 1, 20, 2, "out");
        con = 3;
    }
}
if (con == 3)
{
    timer++;
    if (timer >= 20 && !d_ex())
    {
        d = d_make();
        d.side = 1;
        d.stay = 10;
        con = 4;
    }
}
if (con == 4 && !d_ex())
{
    scr_lerpvar("gachaBallYScale", 2, 6, 10, 2, "in");
    scr_lerpvar("gachaBallXScale", 2, 0, 10, 2, "in");
    scr_var_delay("drawGachaBall", 0, 11);
    con = 0;
    if (room == room_dw_ranking_b)
    {
        if (global.flag[1044] >= 100)
        {
            with (obj_room_ranking_b)
                show_vending_prompt();
        }
        else
        {
            with (obj_room_ranking_b)
                finish_gacha_event();
        }
    }
    else
    {
        global.interact = 0;
        global.facing = 0;
    }
}
if (drawGachaBall)
{
    siner++;
    var prizeBlend = merge_color(c_black, c_white, gachaBallSeparation);
    var ballAlpha = lerp(1, 0, gachaBallSeparation);
    var floaty = sin(siner / 8) * 4;
    var bx = gachaBallX + xx;
    var by = gachaBallY + yy + floaty;
    var ballsep = lerp(0, 80, gachaBallSeparation);
    myballcolor = prizeballcolor[selectedPrize];
    if (myballcolor == c_yellow)
        myballcolor = make_color_hsv(110 + (sin(siner / 3) * 8), 255, 255);
    draw_sprite_ext(prizesprite[selectedPrize], prizeimage[selectedPrize], bx, by, gachaBallXScale, gachaBallYScale, gachaAngle, prizeBlend, 1);
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(spr_dw_tv_gachaball_colorless, 1, bx + ballsep, by + ballsep, gachaBallXScale, gachaBallYScale, gachaAngle, myballcolor, ballAlpha);
    draw_sprite_ext(spr_dw_tv_gachaball_colorless, 0, bx - ballsep, by - ballsep, gachaBallXScale, gachaBallYScale, gachaAngle, image_blend, ballAlpha);
    draw_set_blend_mode(bm_normal);
    if (gachaBallSeparation >= 1)
    {
        if ((siner % 4) == 0)
        {
            var sparklemarker = scr_marker(bx + random_range(-30, 30), by + random_range(-30, 30), spr_board_sparkle);
            sparklemarker.gravity = 0.2;
            sparklemarker.image_speed = 0.1 + random(0.15);
            scr_lerpvar_instance(sparklemarker, "image_alpha", 3, 0, 30, 2, "out");
            scr_doom(sparklemarker, 30);
        }
    }
}
