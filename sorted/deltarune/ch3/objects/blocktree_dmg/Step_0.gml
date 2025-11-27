scr_depth();
oo = 0;
if (spec < 2)
    blocktimer += 1;
if (blocktimer == 20)
{
    xv = x + (sprite_width / 4) + random(sprite_width / 2);
    yv = y + (sprite_height / 4) + random(sprite_height / 4);
    block = instance_create(xv, yv, obj_board_marker);
    with (block)
    {
        sprite_index = spr_blocktree_block_dmg;
        scr_darksize();
        hspeed = 0.4 + random(1);
        vspeed = 0.7 + random(1.5);
        gravity_direction = 0;
        gravity = 0.1;
        image_alpha = 0;
        friction = -0.1;
    }
    block.depth = depth - 1;
    block.image_blend = merge_color(#97CA88, #345038, oo);
    if (oo >= 0.8)
    {
        with (block)
            instance_destroy();
    }
}
if (blocktimer >= 20 && blocktimer <= 30)
{
    with (block)
    {
        if (image_alpha < 1)
            image_alpha += 0.2;
    }
}
if (blocktimer >= 38)
{
    with (block)
        image_alpha -= 0.1;
}
if (blocktimer >= 48)
{
    blocktimer = 0;
    with (block)
        instance_destroy();
}
buffer--;
if (myinteract == 3)
{
    if (here == true)
    {
        global.msc = 20000;
        scr_text(global.msc);
        scr_speaker("no_name");
        global.choicemsg[0] = _yes;
        global.choicemsg[1] = _no;
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        msgsetloc(0, "WELL^1,/", "obj_blocktree_dmg_slash_Step_0_gml_67_0");
        msgnextloc("SPRING CHANGED TO SUMMER^1, AND SUMMER CHANGED TO COLD^1,/", "obj_blocktree_dmg_slash_Step_0_gml_68_0");
        msgnextloc("AND SURE ENOUGH^1,/", "obj_blocktree_dmg_slash_Step_0_gml_69_0");
        msgnextloc("I AM THE FORGOTTEN MAN./", "obj_blocktree_dmg_slash_Step_0_gml_70_0");
        msgnextloc("WILL YOU FORGET ME^1, TOO?/", "obj_blocktree_dmg_slash_Step_0_gml_71_0");
        msgnextloc(" \\C2", "obj_blocktree_dmg_slash_Step_0_gml_72_0");
        myinteract = 10;
        var b = bw_make();
        b.stay = 3;
    }
    else
    {
        msgsetloc(0, "WELL, THERE IS NOT A MAN HERE./%", "obj_blocktree_dmg_slash_Step_0_gml_79_0");
        myinteract = -1;
        var b = bw_make();
    }
    here = false;
}
if (myinteract == -1 && !bw_ex())
{
    myinteract = 0;
    buffer = 3;
    global.interact = 0;
}
if (myinteract == 10 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
{
    if (global.choice == 0)
    {
        msgset(0, _fail);
        myinteract = -1;
    }
    if (global.choice == 1)
    {
        global.msc = 20000;
        scr_text(global.msc);
        global.choicemsg[0] = _yes;
        global.choicemsg[1] = _no;
        msgsetloc(0, "ARE YOU SURE? YOU HAVE FORGOTTEN ME MANY TIMES BEFORE./", "obj_blocktree_dmg_slash_Step_0_gml_108_0");
        msgnextloc("EVEN IF YOU MEET ME^1, I WILL BE FORGOTTEN THEREAFTER./", "obj_blocktree_dmg_slash_Step_0_gml_109_0");
        msgnextloc("SOMETIMES I EVEN FORGET MYSELF.../", "obj_blocktree_dmg_slash_Step_0_gml_110_0");
        msgnextloc("I ASK AGAIN. WILL YOU FORGET ME?/", "obj_blocktree_dmg_slash_Step_0_gml_111_0");
        msgnextloc(" \\C2", "obj_blocktree_dmg_slash_Step_0_gml_112_0");
        myinteract++;
    }
    var b = bw_make();
    b.skip = 1;
    b.stay = 3;
}
if (myinteract == 11 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
{
    if (global.choice == 0)
    {
        msgset(0, _fail);
        myinteract = -1;
    }
    if (global.choice == 1)
    {
        global.msc = 20000;
        scr_text(global.msc);
        global.choicemsg[0] = _yes;
        global.choicemsg[1] = _no;
        msgsetloc(0, "YOU'LL REMEMBER ME?/", "obj_blocktree_dmg_slash_Step_0_gml_136_0");
        msgnextloc("WELL. IN THAT CASE^1, FORGET ABOUT IT./", "obj_blocktree_dmg_slash_Step_0_gml_137_0");
        msgnextloc("I AM JUST A MAN./", "obj_blocktree_dmg_slash_Step_0_gml_138_0");
        msgnextloc("LISTEN WELL TO MY STORY./", "obj_blocktree_dmg_slash_Step_0_gml_139_0");
        msgnextloc("ONCE UPON A TIME^1, THE WHOLE WORLD LOOKED LIKE THIS./", "obj_blocktree_dmg_slash_Step_0_gml_140_0");
        msgnextloc("DO YOU THINK SO?/", "obj_blocktree_dmg_slash_Step_0_gml_141_0");
        msgnextloc(" \\C2", "obj_blocktree_dmg_slash_Step_0_gml_142_0");
        myinteract++;
    }
    var b = bw_make();
    b.skip = 1;
    b.stay = 3;
}
if (myinteract == 12 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
{
    global.msc = 20000;
    scr_text(global.msc);
    global.choicemsg[0] = _yes;
    global.choicemsg[1] = _no;
    if (global.choice == 0)
    {
        msgsetloc(0, "REALLY? YOU BELIEVE SOMETHING SO ABSURD?/", "obj_blocktree_dmg_slash_Step_0_gml_161_0");
        msgnextloc("I'M HAPPY TO HEAR IT. LET ME CONTINUE.../", "obj_blocktree_dmg_slash_Step_0_gml_162_0");
    }
    if (global.choice == 1)
    {
        msgsetloc(0, "OF COURSE NOT. IT'S JUST A STORY AFTER ALL./", "obj_blocktree_dmg_slash_Step_0_gml_166_0");
        msgnextloc("NOW^1, LET ME CONTINUE.../", "obj_blocktree_dmg_slash_Step_0_gml_167_0");
    }
    msgnextloc("WELL^1, THE WORLD CHANGED. SOCIETY WAS DEVELOPED./", "obj_blocktree_dmg_slash_Step_0_gml_171_0");
    msgnextloc("THE EARTH WAS COVERED IN WATER^1, DINOSAURS APPEARED^1, AN ICE AGE,/", "obj_blocktree_dmg_slash_Step_0_gml_172_0");
    msgnextloc("HM..^1. ACTUALLY^1, THERE ARE STILL DINOSAURS..^1. IS IT MIXED UP?/", "obj_blocktree_dmg_slash_Step_0_gml_173_0");
    msgnextloc("IN ANY CASE^1, THIS ISLAND IS THE ONLY PLACE LEFT I CAN TALK./", "obj_blocktree_dmg_slash_Step_0_gml_174_0");
    msgnextloc("DO YOU UNDERSTAND WHAT I'M SAYING?/", "obj_blocktree_dmg_slash_Step_0_gml_175_0");
    msgnextloc(" \\C2", "obj_blocktree_dmg_slash_Step_0_gml_176_0");
    var b = bw_make();
    b.skip = 1;
    b.stay = 3;
    myinteract++;
}
if (myinteract == 13 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
{
    global.msc = 20000;
    scr_text(global.msc);
    global.choicemsg[0] = _yes;
    global.choicemsg[1] = _no;
    if (global.choice == 0)
        msgsetloc(0, "FUNNY, I HAVEN'T THE FAINTEST CLUE WHAT IT ALL MEANS./", "obj_blocktree_dmg_slash_Step_0_gml_195_0");
    if (global.choice == 1)
        msgsetloc(0, "THAT'S FUNNY. I DON'T UNDERSTAND IT EITHER./", "obj_blocktree_dmg_slash_Step_0_gml_199_0");
    msgnextloc("BUT ONE DAY^1, THIS ISLAND WILL DISAPPEAR^1, TOO./", "obj_blocktree_dmg_slash_Step_0_gml_203_0");
    msgnextloc("WE MAY NOT MEET AGAIN IN THAT CASE./", "obj_blocktree_dmg_slash_Step_0_gml_204_0");
    msgnextloc(".../", "obj_blocktree_dmg_slash_Step_0_gml_205_0");
    msgnextloc("DID YOU WANT TO MEET AGAIN?/", "obj_blocktree_dmg_slash_Step_0_gml_206_0");
    msgnextloc(" \\C2", "obj_blocktree_dmg_slash_Step_0_gml_208_0");
    var b = bw_make();
    b.skip = 1;
    b.stay = 3;
    myinteract++;
}
if (myinteract == 14 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
{
    if (global.choice == 0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "OH^1, JOY./", "obj_blocktree_dmg_slash_Step_0_gml_222_0");
        msgnextloc("I'LL TELL YOU MY SCHEDULE. LISTEN CAREFULLY./", "obj_blocktree_dmg_slash_Step_0_gml_223_0");
        msgnextloc("ON THURSDAY^1, I GO TO SELL THE DONUTS./", "obj_blocktree_dmg_slash_Step_0_gml_224_0");
        msgnextloc("ON FRIDAY^1, I TOSS THE LEFTOVERS IN THE DUMPSTER./", "obj_blocktree_dmg_slash_Step_0_gml_225_0");
        msgnextloc("ON SATURDAY^1, I LET IT COOL ON THE WINDOWSILL./", "obj_blocktree_dmg_slash_Step_0_gml_226_0");
        msgnextloc("ON SUNDAY^1, I HARVEST THE WHEAT./", "obj_blocktree_dmg_slash_Step_0_gml_227_0");
        msgnextloc("HOLD YOUR BREATH^1, HEAD TO THE LEFT^1, AND COUNT BACKWARDS TO 100.../", "obj_blocktree_dmg_slash_Step_0_gml_228_0");
        msgnextloc("DID YOU REMEMBER TO WRITE THAT DOWN?/", "obj_blocktree_dmg_slash_Step_0_gml_229_0");
        msgnextloc(" \\C2", "obj_blocktree_dmg_slash_Step_0_gml_230_0");
        var b = bw_make();
        b.skip = 1;
        b.stay = 3;
        myinteract++;
    }
    if (global.choice == 1)
    {
        msgsetloc(0, "WELL. I'M STARTING TO REALIZE WHY I WAS FORGOTTEN./%", "obj_blocktree_dmg_slash_Step_0_gml_239_0");
        var b = bw_make();
        b.skip = 1;
        b.stay = 3;
        myinteract = -1;
    }
}
if (myinteract == 15 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
{
    if (global.choice == 0)
        msgsetloc(0, "HOW VERY KIND OF YOU./", "obj_blocktree_dmg_slash_Step_0_gml_254_0");
    if (global.choice == 1)
        msgsetloc(0, "WELL^1, IT SEEMS YOU ARE ALREADY FORGETTING./", "obj_blocktree_dmg_slash_Step_0_gml_258_0");
    msgnextloc("PLEASE TAKE THIS TO REMEMBER ME./", "obj_blocktree_dmg_slash_Step_0_gml_261_0");
    msgnextloc("(KRIS RECEIVED THE \\cYEGG\\cW.)/%", "obj_blocktree_dmg_slash_Step_0_gml_262_0");
    scr_keyitemget(2);
    global.flag[930] = 1;
    myinteract++;
    var b = bw_make();
    b.skip = 1;
    b.stay = 3;
}
if (myinteract == 16)
{
    if (scr_getmsgno() == 2)
    {
        myinteract++;
        mytimer = 0;
    }
}
if (myinteract == 17 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
{
    if (mytimer == 0)
        snd_play(snd_item);
    mytimer++;
    if (mytimer == 10)
    {
        scr_speaker("no_name");
        msgsetloc(0, "ALTHOUGH^1, YOU MAY LOSE IT IN ANOTHER DAY./", "obj_blocktree_dmg_slash_Step_0_gml_292_0");
        msgnextloc("SO BE SURE TO PUT IT SOME WHERE./", "obj_blocktree_dmg_slash_Step_0_gml_293_0");
        msgnextloc("THERE'S NO SHAME IN AN EGG./", "obj_blocktree_dmg_slash_Step_0_gml_294_0");
        msgnextloc(" \\C2", "obj_blocktree_dmg_slash_Step_0_gml_295_0");
        var b = bw_make();
        b.skip = 1;
        b.stay = 3;
        myinteract++;
    }
}
if (myinteract == 18 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
{
    scr_speaker("no_name");
    msgsetloc(0, "YOU ARE VERY OPINIONATED./", "obj_blocktree_dmg_slash_Step_0_gml_308_0");
    msgnextloc("I LIKE YOU!/", "obj_blocktree_dmg_slash_Step_0_gml_309_0");
    msgnextloc("YOU MAY FORGET ME^1, I MAY FORGET MYSELF^1,/", "obj_blocktree_dmg_slash_Step_0_gml_310_0");
    msgnextloc("BUT I WILL REMEMBER YOUR KINDNESS./", "obj_blocktree_dmg_slash_Step_0_gml_311_0");
    msgnextloc("NOW^1, THIS ISLAND WILL DISAPPEAR SOON. YOU MUST DEPART./", "obj_blocktree_dmg_slash_Step_0_gml_312_0");
    msgnextloc("IF YOU WILL IT^1, WE SHALL MEET AGAIN AT THAT PLACE.../", "obj_blocktree_dmg_slash_Step_0_gml_313_0");
    msgnextloc("WHETHER 11 HOURS OR 11 YEARS^1, DELTARUNE WILL BE WAITING./", "obj_blocktree_dmg_slash_Step_0_gml_314_0");
    msgnextloc("SO TAKE YOUR TIME^1, WASH YOUR FACE^1, AND GET DRESSED!/%", "obj_blocktree_dmg_slash_Step_0_gml_315_0");
    var b = bw_make();
    b.skip = 1;
    b.stay = 3;
    myinteract++;
}
if (myinteract == 19 && !i_ex(obj_choicer_neo) && !i_ex(obj_board_writer))
{
    scr_healall(999);
    with (obj_mainchara)
    {
        dsprite = spr_krisd_dark;
        rsprite = spr_krisr_dark;
        lsprite = spr_krisl_dark;
        usprite = spr_krisu_dark;
    }
    snd_play(snd_equip);
    myinteract = 0;
    global.interact = 0;
}
