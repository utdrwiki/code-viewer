if (con < 0)
    exit;
if (con == 10 && global.interact == 0)
{
    con = 11;
    alarm[0] = 45;
    global.interact = 1;
    snd_play(snd_coaster_kiss);
    with (goulden_sam)
    {
        sprite_index = spr_npc_gouldensam_kissy;
        x += 6;
    }
    with (suliver_sam)
    {
        sprite_index = spr_npc_suliversam_kissy;
        x -= 6;
    }
    var flyingheart = scr_marker(camerax() + (view_wport[0] / 2), 190, spr_shadowman_sharpshoot_heart);
    with (flyingheart)
    {
        image_xscale = 0.5;
        image_yscale = 0.5;
        scr_lerpvar("image_alpha", 3, 0, 30, 0, "in");
        speed = 4 + random(2);
        direction = 90;
        friction = 0.3;
        scr_doom(id, 60);
    }
}
if (con == 12)
{
    con = 13;
    alarm[0] = 90;
    snd_play(snd_crowd_cheer_single);
    snd_play(snd_won);
    var _word_fx = instance_create(0, 0, obj_dw_teevie_sams_word_fx);
    with (_word_fx)
    {
        init(stringsetloc("LOVE WINS", "obj_room_teevie_sams_slash_Step_0_gml_51_0"), true);
        depth = 9000;
    }
}
if (con == 14)
{
    con = -1;
    global.interact = 0;
}
if (con == 20 && global.interact == 0)
{
    con = 21;
    alarm[0] = 15;
    global.interact = 1;
    with (goulden_sam)
        sprite_index = spr_npc_gouldensam_angry;
}
if (con == 22)
{
    con = 23;
    alarm[0] = 90;
    with (goulden_sam)
    {
        scr_lerpvar("x", x, x - 60, 15, 3, "in");
        scr_script_delayed(scr_lerpvar, 30, "x", x - 60, x + 130, 15, -2, "out");
    }
    with (suliver_sam)
    {
        scr_var_delay("sprite_index", spr_npc_suliversam_knockout, 30);
        scr_script_delayed(scr_lerpvar, 30, "x", x, x + 380, 15, 3, "out");
    }
    snd_play(snd_wing);
    scr_script_delayed(snd_play, 28, snd_punchmed);
    scr_script_delayed(snd_play, 46, snd_glassbreak);
}
if (con == 24)
{
    con = 25;
    alarm[0] = 60;
    snd_play(snd_hurt1);
    snd_play(snd_crowd_gasp);
    var _word_fx = instance_create(0, 0, obj_dw_teevie_sams_word_fx);
    with (_word_fx)
    {
        init(stringsetloc("HATE WINS", "obj_room_teevie_sams_slash_Step_0_gml_111_0"), false);
        depth = 9000;
    }
    readable.x = goulden_sam.x - 200;
    with (readable)
        image_xscale = 8;
    collider_left.x = goulden_sam.x - 240;
    with (collider_right)
        instance_destroy();
}
if (con == 26)
{
    con = -1;
    global.interact = 0;
}
