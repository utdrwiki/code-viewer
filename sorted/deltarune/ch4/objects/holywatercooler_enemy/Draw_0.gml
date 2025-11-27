if (transformationcon == 0)
{
    scr_enemy_drawhurt_generic();
    scr_enemy_drawidle_generic(0.16666666666666666);
}
else
{
    siner += 0.16666666666666666;
}
if (amimissmizzle)
    y = ystart + (sin(siner * 0.5) * 5);
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (pinkflashtimer > 0)
{
    pinkflashtimer--;
    draw_sprite_ext(sparedsprite, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, pinkflashtimer / 10);
}
if (transformationcon == 1)
{
    transformationtimer++;
    if (transformationtimer < 30)
    {
        if (!audio_is_playing(snd_sneo_overpower))
            snd_play_x(snd_sneo_overpower, 0.7, 1.3);
        d = instance_create(x + 18, y + 45, obj_rouxls_power_up_orb);
        d.direction = irandom(360);
        d.depth = depth + 1;
        d.image_blend = image_blend;
        d.lifetime = 12;
        d.parenttarget = id;
        d.distance_multiplier = 1.4;
    }
    draw_sprite_ext(spr_watercooler_centered, siner, x + 18, y + 44, 2, 2, 0, c_white, 1);
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(spr_watercooler_centered, siner, x + 18, y + 44, 2, 2, 0, c_white, lerp(0, 1, transformationtimer / 40));
    d3d_set_fog(false, c_black, 0, 0);
    if (transformationtimer == 40)
    {
        transformationcon = 2;
        transformationtimer = 0;
        snd_play(snd_motor_ghost);
    }
}
if (transformationcon == 2)
{
    transformationtimer++;
    var scale;
    if (transformationtimer <= 20)
        scale = lerp(2, 0, transformationtimer / 20);
    else
        scale = 0;
    var scale2 = lerp(0, 2, transformationtimer / 30);
    if (transformationtimer == 30)
    {
        transformationcon = 3;
        transformationtimer = 0;
    }
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(spr_watercooler_centered, siner, x + 18, y + 44, scale, scale, 0, c_white, 1);
    d3d_set_fog(false, c_black, 0, 0);
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(spr_mizzle_idle_large_centered, siner, x + 22, y + 40, scale2, scale2, 0, c_white, 1);
    d3d_set_fog(false, c_black, 0, 0);
}
if (transformationcon == 3)
{
    transformationtimer++;
    draw_sprite_ext(spr_mizzle_idle_large_centered, siner, x + 22, y + 40, 2, 2, 0, c_white, 1);
    d3d_set_fog(true, c_white, 0, 1);
    draw_sprite_ext(spr_mizzle_idle_large_centered, siner, x + 22, y + 40, 2, 2, 0, c_white, lerp(1, 0, transformationtimer / 30));
    d3d_set_fog(false, c_black, 0, 0);
    if (transformationtimer == 30)
    {
        transformationcon = 0;
        transformationtimer = 0;
        turnintomizzle = false;
        idlesprite = spr_mizzle_idle_large;
        hurtsprite = spr_mizzle_idle_large;
        sparedsprite = spr_mizzle_idle_large;
        amimissmizzle = true;
        siner = 0;
        x -= 38;
        y -= 58;
        ystart = y;
        global.monstername[myself] = stringsetloc("Miss Mizzle", "obj_holywatercooler_enemy_slash_Draw_0_gml_104_0");
        global.canact[myself][1] = 1;
        global.actname[myself][1] = stringsetloc("Dazzle", "obj_holywatercooler_enemy_slash_Draw_0_gml_106_0");
        global.actdesc[myself][1] = stringsetloc("???", "obj_holywatercooler_enemy_slash_Draw_0_gml_107_0");
        global.canact[myself][2] = 1;
        global.actname[myself][2] = stringsetloc("Embezzle", "obj_holywatercooler_enemy_slash_Draw_0_gml_110_0");
        global.actactor[myself][2] = 2;
        global.actdesc[myself][2] = stringsetloc("Chance#to steal#item", "obj_holywatercooler_enemy_slash_Draw_0_gml_112_0");
        global.canact[myself][3] = 1;
        global.actname[myself][3] = stringsetloc("Nuzzle", "obj_holywatercooler_enemy_slash_Draw_0_gml_115_0");
        global.actactor[myself][3] = 3;
        global.actdesc[myself][3] = stringsetloc("???", "obj_holywatercooler_enemy_slash_Draw_0_gml_117_0");
        scr_spellmenu_setup();
    }
}
