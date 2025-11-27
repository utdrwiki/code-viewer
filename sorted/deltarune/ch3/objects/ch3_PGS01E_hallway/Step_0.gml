if (scr_debug())
{
    if (sunkus_kb_check_pressed(82))
        room_restart();
}
if (con == 0 && !i_ex(obj_writer))
{
    global.interact = 1;
    con = 1;
    alarm[0] = 30;
    scr_losechar();
    if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
            instance_destroy();
    }
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_visible(0);
    la = actor_count + 1;
    la_actor = instance_create(56, 240, obj_actor);
    scr_actor_setup(la, la_actor, "lancer");
    la_actor.sprite_index = spr_lancer_dt;
    qu = actor_count + 2;
    qu_actor = instance_create(172, 182, obj_actor);
    scr_actor_setup(qu, qu_actor, "queen");
    qu_actor.sprite_index = spr_queen_down;
    r1 = actor_count + 3;
    r1_actor = instance_create(360, 214, obj_actor);
    scr_actor_setup(r1, r1_actor, "rudinn1");
    r1_actor.sprite_index = spr_diamond_overworld;
    r1_actor.image_xscale = -2;
    ha = actor_count + 4;
    ha_actor = instance_create(416, 212, obj_actor);
    scr_actor_setup(ha, ha_actor, "hathy");
    ha_actor.sprite_index = spr_heartenemy_overworld;
    card_marker = scr_dark_marker(la_actor.x + 24, la_actor.y + 16, spr_card_spin);
    with (card_marker)
    {
        scr_depth();
        visible = 0;
    }
    card_marker_r1 = scr_dark_marker(r1_actor.x - 50, r1_actor.y + 52, spr_card_spin_diamond);
    card_marker_r1.depth = r1_actor.depth + 10;
    card_marker_r2 = scr_dark_marker(ha_actor.x + 46, ha_actor.y + 52, spr_card_spin_heart);
    card_marker_r2.depth = ha_actor.depth + 10;
    laptop_marker = scr_dark_marker(qu_actor.x, qu_actor.y + 40, spr_lw_computer_lab_laptop);
    with (laptop_marker)
    {
        scr_depth();
        visible = 0;
    }
    c_sel(r1);
    c_autowalk(0);
    c_imagespeed(0.1);
    c_sel(ha);
    c_autowalk(0);
    c_imagespeed(0.1);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 60);
    c_wait(60);
    c_var_instance(id, "create_writer", true);
    c_wait(30);
    c_waitcustom();
}
if (con == 2 && customcon == 1 && !i_ex(obj_writer))
{
    con = 3;
    alarm[0] = 30;
    customcon = 0;
    c_waitcustom_end();
    c_sel(la);
    c_spin(3);
    c_wait(14);
    c_visible(0);
    c_soundplay(snd_break2);
    c_var_instance(card_marker, "visible", 1);
    c_wait(4);
    c_var_instance(card_marker, "gravity", 1);
    c_wait(8);
    c_var_instance(card_marker, "vspeed", 0);
    c_var_instance(card_marker, "gravity", 0);
    c_wait(30);
    c_var_instance(id, "create_writer", true);
    c_wait(30);
    c_waitcustom();
}
if (con == 4 && customcon == 1 && !i_ex(obj_writer))
{
    con = 5;
    alarm[0] = 30;
    customcon = 0;
    c_waitcustom_end();
    c_wait(30);
    c_sel(qu);
    c_sprite(spr_queen_ohoho_standing);
    c_addxy(10, 2);
    c_autowalk(0);
    c_imagespeed(0.25);
    c_wait(28);
    c_visible(0);
    c_soundplay(snd_break2);
    c_var_instance(laptop_marker, "visible", 1);
    c_wait(4);
    c_var_instance(laptop_marker, "gravity", 2);
    c_wait(6);
    c_var_instance(laptop_marker, "vspeed", 0);
    c_var_instance(laptop_marker, "gravity", 0);
    c_wait(30);
    c_var_instance(id, "create_writer", true);
    c_wait(30);
    c_waitcustom();
}
if (con == 6 && customcon == 1 && !i_ex(obj_writer))
{
    con = 7;
    alarm[0] = 30;
    customcon = 0;
    c_waitcustom_end();
    c_lerp_var_instance(r1_actor, "image_alpha", 1, 0, 60);
    c_wait(15);
    c_lerp_var_instance(ha_actor, "image_alpha", 1, 0, 60);
    c_wait(60);
    c_var_instance(id, "create_writer", true);
    c_wait(90);
    c_waitcustom();
}
if (con == 8 && customcon == 1 && !i_ex(obj_writer))
{
    con = (speech_index < (array_length_1d(speech) - 1)) ? 7 : 39;
    alarm[0] = 30;
    customcon = 0;
    c_waitcustom_end();
    c_var_instance(id, "create_writer", true);
    c_waitcustom();
}
if (con == 40 && customcon == 1 && !i_ex(obj_writer))
{
    con = 49;
    alarm[0] = 1;
    customcon = 0;
    c_waitcustom_end();
    c_terminatekillactors();
}
if (con == 50 && !i_ex(obj_cutscene_master))
{
    con = 999;
    global.plot = 45;
    snd_free_all();
    snd_play(snd_whip_crack_only);
    room_goto(room_dw_couch_overworld_05);
}
if (create_writer && !i_ex(obj_writer))
{
    create_writer = false;
    global.typer = (speech_index < (array_length_1d(speech) - 1)) ? 31 : 36;
    msgset(0, speech[speech_index]);
    var writer = instance_create(__view_get(e__VW.XView, 0) + 80, __view_get(e__VW.YView, 0) + 340, obj_writer);
    writer.charline = 26;
    writer.rate = (speech_index < (array_length_1d(speech) - 1)) ? 2 : 4;
    writer.skippable = speech_index < (array_length_1d(speech) - 1);
    speech_index++;
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
