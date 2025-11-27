if (i_ex(obj_mainchara_board))
{
    if (obj_mainchara_board.controlled == 1)
    {
        if (fun == 1)
        {
            obj_mainchara_board.fun = 0;
            fun = 0;
        }
    }
    if (obj_mainchara_board.controlled == 0)
    {
        if (fun == 0)
        {
            obj_mainchara_board.fun = 1;
            obj_mainchara_board.sprite_index = spr_board_lancer_spin;
            obj_mainchara_board.image_speed = 0.25 * choose(-1, 1);
            fun = 1;
        }
    }
}
if (con == 0)
{
}
if (con == 1)
{
    global.interact = 1;
    with (obj_mainchara_board)
        digfreeze = true;
    con = 2;
    keycard = instance_create(obj_mainchara_board.x, (obj_mainchara_board.y + 32) - 8, obj_board_marker_sin);
    keycard.yamt = 0;
    keycard.style = 1;
    keycard.sprite_index = spr_board_keycard;
    scr_darksize(keycard);
    with (keycard)
        scr_jump_to_point(376, 168, 8, 30);
    timer = 0;
}
if (con == 2)
{
    timer++;
    if (timer == 30)
    {
        snd_play(snd_board_splash);
        keycard.yamt = 4;
        keycard.yrate = 30;
    }
    if (timer == 60)
    {
        scr_speaker("no_name");
        msgsetloc(0, "YOU DUG UP THE IMPORTANT ELEVATOR KEY CARD./%", "obj_board_b3bs_intro_slash_Step_0_gml_56_0");
        var b = bw_make();
        b.side = 0;
        b.yoff = 32;
        b.boxleft = 96;
        b.boxright = 96;
        con++;
        timer = 0;
    }
}
if (con == 3 && !bw_ex())
{
    timer++;
    if (timer == 15)
    {
        with (obj_b3bs_console)
            endplay = 2;
        with (obj_mainchara_board)
        {
            digfreeze = 0;
            digcon = 0;
            digtime = 0;
            controlled = 1;
        }
        fun = 10;
        scr_lerpvar_instance(keycard, "vspeed", 0, 2, 60, 2, "out");
        timer = 0;
        con = 4;
    }
}
if (con == 4)
{
    if (keycard.y > 256)
    {
        timer = 0;
        con++;
        scr_doom(keycard, 8);
        scr_speaker("no_name");
        msgsetloc(0, "THE KEY CARD WAS WASHED SOMEWHERE BACKSTAGE.../%", "obj_board_b3bs_intro_slash_Step_0_gml_90_0");
        var b = bw_make();
        b.side = 0;
        b.yoff = 32;
        b.boxleft = 96;
        b.boxright = 96;
    }
}
if (con == 5)
{
    con = 99;
    with (obj_npc_room)
        sprite_index = spr_lancer_dt;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_walkdirect(256, 284, 30);
    c_sel(su);
    c_walkdirect_wait(308, 312, 30);
    c_var_instance(id, "con", 5.5);
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 5.5 && !bw_ex() && !i_ex(cutscene_master))
{
    scr_speaker("ralsei");
    msgsetloc(0, "* Umm^1, were we..^1. supposed to do that?/", "obj_board_b3bs_intro_slash_Step_0_gml_125_0");
    scr_anyface_next("lancer", 0);
    msgnextloc("* \"Supposed to\" do what?/%", "obj_board_b3bs_intro_slash_Step_0_gml_127_0");
    d_make();
    timer = 0;
    con = 6;
}
if (con == 6 && !d_ex())
{
    timer++;
    var pasystemtime = 30;
    if (timer == 15)
    {
        snd_play(snd_drumroll);
        debug_print("Suddenly, the PA system goes off.");
    }
    if (timer == (15 + pasystemtime))
    {
        scr_speaker("lancer");
        msgsetloc(0, "* Oh^1, TV Guy is doing an announcement!/%", "obj_board_b3bs_intro_slash_Step_0_gml_148_0");
        d_make();
        timer = 0;
        con++;
    }
}
if (con == 7 && !d_ex())
{
    timer++;
    if (timer == 15)
    {
        instance_create(999, 999, obj_actor_tenna);
        var tetalk = stringsetloc("Board 2 is now ready!!", "obj_board_b3bs_intro_slash_Step_0_gml_161_0");
        scr_tennabubble_xytail(tetalk, 320, 86, 162, 26, 60);
    }
    if (timer == 75)
    {
        with (obj_tennatalkbubble)
            instance_destroy();
        var tetalk = stringsetloc("All performers and#contestants report to the#STAGE immediately!!", "obj_board_b3bs_intro_slash_Step_0_gml_167_0");
        scr_tennabubble_xytail(tetalk, 320, 86, 162, 26, 80);
    }
    if (timer == 155)
    {
        with (obj_tennatalkbubble)
            instance_destroy();
        scr_speaker("susie");
        msgsetloc(0, "* Dang^1, guess we gotta go./", "obj_board_b3bs_intro_slash_Step_0_gml_174_0");
        scr_anyface_next("lancer", 0);
        msgnextloc("* Don't worry^1, Susie^1! I'll see you in the funny stages!/%", "obj_board_b3bs_intro_slash_Step_0_gml_176_0");
        d_make();
        timer = 0;
        con++;
    }
}
if (con == 8 && !d_ex())
{
    with (obj_mainchara_board)
    {
        canfreemove = true;
        controlled = 0;
    }
    fun = 0;
    global.plot = 128;
    global.interact = 0;
    global.facing = 0;
    con = 10;
}
