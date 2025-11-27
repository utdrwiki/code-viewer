if (os_type == os_macosx)
    draw_screen = skiptimer < 19;
if (draw_screen)
{
    if (con == 1)
    {
        textimer += 1;
        if (textimer == 6)
        {
            skip_ready = true;
            global.typer = 41;
            global.msg[0] = stringsetloc("Once upon a time, a LEGEND&was whispered among shadows.", "obj_legend_slash_Draw_0_gml_13_0");
            w = instance_create(40, 160, obj_writer);
            w.depth = -10;
        }
        if (textimer == 220)
        {
            with (obj_writer)
                instance_destroy();
            global.msg[0] = stringsetloc("It was&a LEGEND&of HOPE.", "obj_legend_slash_Draw_0_gml_21_0");
            w = instance_create(40, 160, obj_writer);
            w.depth = -10;
            global.msg[0] = stringsetloc("It was&a LEGEND&of DREAMS.", "obj_legend_slash_Draw_0_gml_24_0");
            w = instance_create(220, 160, obj_writer);
            w.depth = -10;
        }
        if (textimer == 340)
        {
            with (obj_writer)
                instance_destroy();
            global.msg[0] = stringsetloc("It was&a LEGEND&of LIGHT.", "obj_legend_slash_Draw_0_gml_32_0");
            w = instance_create(40, 160, obj_writer);
            w.depth = -10;
            global.msg[0] = stringsetloc("It was&a LEGEND&of DARK.", "obj_legend_slash_Draw_0_gml_35_0");
            w = instance_create(220, 160, obj_writer);
            w.depth = -10;
        }
        if (textimer == 460)
        {
            with (obj_writer)
                instance_destroy();
            global.msg[0] = stringsetloc("This is the legend of&  ^3   DELTA RUNE", "obj_legend_slash_Draw_0_gml_43_0");
            w = instance_create(80, 160, obj_writer);
            w.depth = -10;
        }
        shader_set(shd_prophecy_legend);
        texture_set_stage(u_texture, texture_prophecy);
        shader_set_uniform_f(u_time, ((get_timer() / 1000000) * 30) / 4);
        draw_sprite(pic, 0, 60, 48 + yoff);
        shader_reset();
        draw_sprite_ext(pic, 0, 60, 48 + yoff, 1, 1, 0, c_white, prophecy_alpha);
        ytimer += 1;
        if (ytimer >= 4 && yoff > -260)
        {
            ytimer = 0;
            yoff -= 2;
            prophecy_alpha -= 0.016666666666666666;
        }
        if (yoff <= -260)
        {
            contimer += 1;
            if (contimer == 40)
            {
            }
            if (contimer == 100)
            {
                con = 2;
                contimer = 0;
                chunkfade = 1;
            }
        }
    }
    if (con == 2)
    {
        shader_set(shd_prophecy_legend);
        texture_set_stage(u_texture, texture_prophecy);
        shader_set_uniform_f(u_time, ((get_timer() / 1000000) * 30) / 4);
        draw_sprite(pic, 0, 60, 48 + yoff);
        w.textalpha = 1 - alph;
        shader_reset();
        contimer += 1;
        if (contimer >= 120)
        {
            snd_free_all();
            room_goto(PLACE_LOGO);
        }
    }
    if (border == 1)
    {
        draw_set_color(c_black);
        ossafe_fill_rectangle(-10, -10, 330, 27, false);
        ossafe_fill_rectangle(-10, -10, 59, 300, false);
        ossafe_fill_rectangle(400, -10, 260, 300, false);
        ossafe_fill_rectangle(-10, 400, 330, 138, false);
    }
    if (chunkfade == 0 && chunkamt > 0)
        chunkamt -= fadespeed;
    if (chunkfade == 1 && chunkamt < 1)
        chunkamt += fadespeed;
    draw_set_color(fadecolor);
    alph = 0;
    if (chunkamt >= 0.25)
        alph = 0.25;
    if (chunkamt >= 0.5)
        alph = 0.5;
    if (chunkamt >= 0.75)
        alph = 0.75;
    if (chunkamt >= 1)
        alph = 1;
    draw_set_alpha(alph);
    ossafe_fill_rectangle(-10, -10, 500, 500, false);
}
draw_set_alpha(1);
if (ingame == 0)
{
    if (!variable_instance_exists(id, "presscount"))
        presscount = 0;
    if (button1_p())
        presscount++;
    if (!skipped)
    {
        if ((button1_p() && textimer > 30) || presscount >= 2)
        {
            skipped = 1;
            skiptimer = 0;
            f = instance_create(0, 0, obj_fadeout);
            f.fadespeed = 0.08;
            mus_volume(global.currentsong[1], 0, 15);
        }
    }
    if (skipped == 1)
        skiptimer += 1;
    if (skiptimer == 19)
    {
        snd_free(global.currentsong[0]);
        global.flag[6] = 0;
    }
    if (skiptimer == 20)
        room_goto(PLACE_LOGO);
}
