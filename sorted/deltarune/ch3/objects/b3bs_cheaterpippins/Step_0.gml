if (!init)
{
    with (obj_board_shopwriter)
        active = true;
    init = 1;
}
with (obj_mainchara_board)
    camera = true;
if (dcon == 0)
{
    if (button.pressed)
    {
        global.interact = 1;
        dcon = 1;
        dtimer = 0;
        dispcount = 15;
        disprate = 1;
        dice.sprite_index = spr_board_die_nocheat;
        dattempt++;
        if (dattempt > 6)
            dattempt = 1;
        global.flag[1088] = dattempt;
        if (i_ex(pwriter1))
            pwriter1.active = false;
    }
}
if (dcon == 1)
{
    dtimer++;
    if (dtimer > disprate)
    {
        dtimer = 0;
        disprate++;
        dispcount--;
        if (dispcount > 0)
        {
            snd_stop(snd_metalhit);
            snd_play(snd_metalhit);
            var newnumb = irandom(5);
            if (dice.image_index != newnumb)
                dice.image_index = newnumb;
            else
                dice.image_index += 1;
        }
        else
        {
            dtimer = 0;
            dcon++;
        }
    }
}
if (dcon == 2)
{
    if (dattempt == 1)
    {
        dtimer++;
        if (dtimer == 1)
        {
            snd_stop(snd_metalhit);
            snd_play(snd_metalhit);
            dice.sprite_index = spr_board_die_nocheat;
            dice.image_index = 4;
            if (i_ex(pwriter1))
            {
                pwriter1.timer = 0;
                pwriter1.texttimer = 0;
                pwriter1.shopstring = stringsetloc("TOO BAD!#TRY AGAIN!", "obj_b3bs_cheaterpippins_slash_Step_0_gml_75_0");
                pwriter1.active = true;
            }
            snd_play(snd_error);
        }
        if (dtimer == 15)
            dcon = 3;
    }
    if (dattempt == 2)
    {
        dtimer++;
        if (dtimer == 1)
        {
            snd_stop(snd_metalhit);
            snd_play(snd_metalhit);
            dice.sprite_index = spr_board_die_nocheat;
            dice.image_index = 0;
            if (i_ex(pwriter1))
            {
                pwriter1.timer = 0;
                pwriter1.texttimer = 0;
                pwriter1.shopstring = stringsetloc("SO CLOSE!#1'S ALMOST 2!", "obj_b3bs_cheaterpippins_slash_Step_0_gml_98_0");
                pwriter1.active = true;
            }
            snd_play(snd_error);
        }
        if (dtimer == 15)
            dcon = 3;
    }
    if (dattempt == 3)
    {
        dtimer++;
        if (dtimer == 1)
        {
            snd_stop(snd_metalhit);
            snd_play(snd_metalhit);
            dice.sprite_index = spr_board_die_7;
            if (i_ex(pwriter1))
            {
                pwriter1.timer = 0;
                pwriter1.texttimer = 0;
                pwriter1.shopstring = stringsetloc("UNLUCKY SEVEN.#HOW'D THAT#GET THERE?", "obj_b3bs_cheaterpippins_slash_Step_0_gml_117_0");
                pwriter1.active = true;
            }
            snd_play(snd_error);
        }
        if (dtimer == 15)
            dcon = 3;
    }
    if (dattempt == 4)
    {
        dtimer++;
        if (dtimer == 1)
        {
            snd_stop(snd_metalhit);
            snd_play(snd_metalhit);
            dice.sprite_index = spr_board_die_roman3;
            if (i_ex(pwriter1))
            {
                pwriter1.timer = 0;
                pwriter1.texttimer = 0;
                pwriter1.shopstring = stringsetloc("STILL NOT EVEN.#CLOSE!", "obj_b3bs_cheaterpippins_slash_Step_0_gml_138_0");
                pwriter1.active = true;
            }
            snd_play(snd_error);
        }
        if (dtimer == 15)
            dcon = 3;
    }
    if (dattempt == 5)
    {
        dtimer++;
        if (dtimer == 1)
        {
            snd_stop(snd_metalhit);
            snd_play(snd_metalhit);
            dice.sprite_index = spr_board_die_half;
            if (i_ex(pwriter1))
            {
                pwriter1.timer = 0;
                pwriter1.texttimer = 0;
                pwriter1.shopstring = stringsetloc("CLOSER!#ALMOST GOT IT!", "obj_b3bs_cheaterpippins_slash_Step_0_gml_159_0");
                pwriter1.active = true;
            }
            snd_play(snd_error);
        }
        if (dtimer == 15)
            dcon = 3;
    }
    if (dattempt == 6)
    {
        dtimer++;
        if (dtimer == 1)
        {
            snd_stop(snd_metalhit);
            snd_play(snd_metalhit);
            dice.sprite_index = spr_board_die_9;
            dice.image_index = 0;
        }
        var dietime = 8;
        if (dtimer == 30)
        {
            with (dice)
                scr_lerpvar("image_index", 0, 8, dietime);
        }
        if (dtimer == (dietime + 30))
        {
            if (i_ex(pwriter1))
            {
                pwriter1.timer = 0;
                pwriter1.texttimer = 0;
                pwriter1.shopstring = stringsetloc("UPSIDE DOWN 9!#SO CLOSE!", "obj_b3bs_cheaterpippins_slash_Step_0_gml_189_0");
                pwriter1.active = true;
            }
            snd_play(snd_error);
        }
        if (dtimer == (15 + dietime + 30 + 2))
            dcon = 3;
    }
}
if (dcon == 3)
{
    global.interact = 0;
    dcon = 4;
    dtimer = 0;
}
if (dcon == 4 && !button.pressed)
    dcon = 0;
if (dcon == 20)
{
    if (i_ex(pwriter1))
    {
        pwriter1.timer = 0;
        pwriter1.texttimer = 0;
        pwriter1.active = true;
    }
    dcon = 21;
}
if (dcon == 21)
{
    if (pwriter1.textcomplete == true)
    {
        dcon = 0;
        dtimer = 0;
    }
    if (!i_ex(pwriter1))
    {
        dcon = 0;
        dtimer = 0;
    }
}
if (dcon == 40)
{
    dtimer++;
    if (dtimer == 1)
        global.interact = 1;
    if (dtimer == 15)
    {
        global.flag[1098] = 1;
        with (obj_npc_room)
        {
            if (sprite_index == spr_npc_pippins)
                sprite_index = spr_npc_pippins_sad;
        }
        scr_speaker("pippins");
        msgsetloc(0, "* What the -- what are you doing photoing us!?/", "obj_b3bs_cheaterpippins_slash_Step_0_gml_253_0");
        msgnextloc("* We're innocent^1! Ahh^1, let's get out of here!/%", "obj_b3bs_cheaterpippins_slash_Step_0_gml_254_0");
        d_make();
        dtimer = 0;
        dcon++;
    }
}
if (dcon == 41 && !d_ex())
{
    dtimer++;
    if (dtimer == 1)
    {
        with (bpip1)
        {
            snd_play(snd_board_splash);
            instance_create(x, y, obj_board_smokepuff);
            instance_destroy();
        }
        with (pippins1)
        {
            scr_lerpvar("x", x, -120, 22, 2, "out");
            scr_lerpvar("y", y, 208, 22);
        }
        with (pippins2)
        {
            scr_lerpvar("x", x, 720, 18, 2, "out");
            scr_lerpvar("y", y, 152, 22, -1, "in");
            scr_doom(id, 23);
        }
        with (pippins3)
            scr_lerpvar("x", x, room_width + 100, 18, 2, "out");
    }
    if (dtimer == 15)
    {
        global.interact = 0;
        dcon++;
    }
}
