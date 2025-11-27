if (!button3_h())
    chold = 0;
else
    chold++;
buffer--;
if (con < 4 && (button1_p() || chold > 3) && buffer <= 0)
{
    safe_delete(sword);
    safe_delete(consolestarter);
    with (obj_board_marker)
    {
        if (sprite_index == spr_5x5shine)
            instance_destroy();
    }
    snd_play(snd_board_bomb);
    con = 4;
    safe_delete(blackout);
    drawscreen = true;
    depth = 998390;
    for (var i = 0; i < array_length(border); i++)
    {
        with (border[i])
            scr_lerpvar("image_alpha", 1.5, 0, 30, 1, "out");
    }
    snd_stop(snd_nes_intro_extended);
    snd_stop(snd_tv_poweron2);
    timer = 0;
}
if (con == 0)
{
    timer++;
    if (timer == 15)
    {
        consolestarter = instance_create(0, 0, obj_swordroute_consolestarter);
        with (consolestarter)
        {
            timer = 0;
            standalone = 2;
            con = 10;
        }
        timer = 0;
        con = -1;
    }
}
if (con == 2)
{
    timer++;
    if ((timer % 30) == 0 && timer < 194)
    {
        consolestarter.drawboxcolor = true;
        consolestarter.drawcolor = merge_color(c_black, #3F48CC, clamp(timer / 180, 0, 1));
        consolestarter.logocolor = merge_color(c_black, #252C8C, clamp(timer / 180, 0, 1));
    }
    if (timer == 155)
    {
        sword = scr_board_marker(270, -256, spr_board_game_title_sword);
        sword.image_blend = obj_swordroute_consolestarter.logocolor;
        sword.depth = obj_swordroute_consolestarter.depth - 1;
        sword.vspeed = 6;
        scr_limitval_upper(sword, "y", 64);
    }
    if (i_ex(sword))
    {
        sword.image_blend = obj_swordroute_consolestarter.logocolor;
        if (sword.y >= 60)
        {
            timer = 0;
            safe_delete(sword);
            safe_delete(consolestarter);
            with (obj_board_marker)
            {
                if (sprite_index == spr_5x5shine)
                    instance_destroy();
            }
            snd_play(snd_board_bomb);
            con = 4;
            safe_delete(blackout);
            drawscreen = true;
            depth = 998390;
            for (var i = 0; i < array_length(border); i++)
            {
                with (border[i])
                    scr_lerpvar("image_alpha", 1.5, 0, 90, 1, "out");
            }
        }
    }
}
if (con == 4)
{
    timer++;
    if (timer == 1)
    {
        flash = scr_board_marker(board_tilex(0), board_tiley(0), spr_pxwhite, 0, depth - 1, 384);
        flash.image_alpha = 1.8;
        mus = snd_loop(snd_nes_intro_extended_part2);
        snd_volume(mus, 0.7, 0);
    }
    if ((timer % 5) == 0)
    {
        with (flash)
            image_alpha -= 0.25;
    }
    if (i_ex(flash))
    {
        if (flash.image_alpha <= 0)
        {
            timer = 0;
            con = 5;
        }
    }
}
if (con == 5)
{
    timer++;
    if (timer == 10)
    {
        var tetalk = stringsetloc("Welcome to the WORLD of TV TIME!!", "obj_GSA02_B0_slash_Step_0_gml_130_0");
        with (scr_couchtalk(tetalk, "tenna", 2, 70))
            depth = -10;
        with (obj_actor_tenna)
            bounce = 1;
    }
    if (timer == 80)
    {
        var tetalk = stringsetloc("Don't be blown away by the graphics, kids!", "obj_GSA02_B0_slash_Step_0_gml_137_0");
        scr_couchtalk(tetalk, "tenna", 2, 70);
        with (obj_actor_tenna)
            bounce = 1;
    }
    if (timer == 150)
    {
        var sutalk = stringsetloc("Uh... I'll try not to.", "obj_GSA02_B0_slash_Step_0_gml_144_0");
        scr_couchtalk(sutalk, "susie", 2, 70);
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                sprite_index = spr_susie_walk_right_dw_unhappy;
        }
    }
    if (timer == 220)
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                sprite_index = spr_susie_walk_up_dw;
        }
    }
    if (timer == 280)
    {
        var tetalk = stringsetloc("Kris! Only YOU may press any button to start!", "obj_GSA02_B0_slash_Step_0_gml_181_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
        with (obj_actor_tenna)
            bounce = 1;
    }
    if (timer == 400)
    {
        var tetalk = stringsetloc("At any time, you may press ONE button!", "obj_GSA02_B0_slash_Step_0_gml_187_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
        with (obj_actor_tenna)
            bounce = 1;
    }
    var contcon = 0;
    if (timer == 580)
    {
        var tetalk = stringsetloc("... you know what, forget it.", "obj_GSA02_B0_slash_Step_0_gml_196_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
        with (obj_actor_tenna)
            bounce = 1;
        nopress = 1;
    }
    if (timer == 610)
        contcon = 1;
    if (button1_p() || button2_p() || (button3_p() && nopress == 0))
        contcon = 1;
    if (contcon == 1)
    {
        snd_play(snd_board_text_main_end);
        snd_play(snd_explosion_mmx3);
        snd_volume(mus, 0, 30);
        nopress = 1;
        timer = 0;
        con++;
    }
}
if (con == 6)
{
    timer++;
    if (timer == 30)
    {
        snd_stop(mus);
        room_goto(room_board_intro);
    }
}
