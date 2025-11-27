if (con < 0)
    exit;
if (con == 0 && obj_mainchara.y >= 1040 && obj_mainchara.x >= 1080 && global.interact == 0)
{
    con = 1;
    global.interact = 1;
    for (var i = 0; i < 5; i++)
    {
        var _floor = scr_marker(1440 + (i * sprite_get_width(spr_dw_teevie_floor)), 1080, spr_dw_teevie_floor);
        with (_floor)
            depth = 1000200;
    }
    var _stanchion = instance_create(1480, 1100, obj_dw_ch3_funny_stanchion_controller);
    with (_stanchion)
    {
        image_xscale = 50;
        image_yscale = 2;
        depth = 1000190;
        init();
    }
    var _stanchion_front = instance_create(1480, 1200, obj_dw_ch3_funny_stanchion_controller);
    with (_stanchion_front)
    {
        front_facing = false;
        image_xscale = 50;
        image_yscale = 2;
        depth = 90000;
        init();
    }
    create_employees();
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    te = actor_count + 1;
    te_actor = instance_create(camerax() + view_wport[0] + 300, cameray() + 260, obj_actor_tenna);
    scr_actor_setup(te, te_actor, "tenna");
    te_actor.preset = 12;
    c_sel(kr);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_wait(15);
    c_pannable(1);
    c_pan_wait(camerax() + 800, cameray(), 60);
    c_wait(15);
    c_speaker("tenna");
    c_msgsetloc(0, "* WHAT DO YOU MEAN YOU HAVEN'T FOUND THE LIGHTNERS YET!?/", "obj_room_teevie_large_02_slash_Step_0_gml_67_0");
    c_msgnextloc("* Arrghhh!^1! You're all.../", "obj_room_teevie_large_02_slash_Step_0_gml_68_0");
    c_msgnextloc("* FIRED!!!/%", "obj_room_teevie_large_02_slash_Step_0_gml_69_0");
    c_talk();
    c_wait_box(1);
    c_sel(te);
    c_tenna_preset(13);
    c_wait_box(2);
    c_sel(te);
    c_tenna_preset(14);
    c_flip("x");
    c_var_instance(id, "employees_state", "shocked");
    c_wait_talk();
    c_wait(30);
    c_tenna_preset(0);
    c_wait(30);
    c_tenna_sprite(spr_tenna_tie_adjust_a);
    c_speaker("tenna");
    c_msgsetloc(0, "* I mean^1, uh.../%", "obj_room_teevie_large_02_slash_Step_0_gml_98_0");
    c_talk_wait();
    c_wait(15);
    c_tenna_preset(2);
    c_var_instance(id, "employees_state", "joyed");
    c_speaker("tenna");
    c_msgsetloc(0, "* HIRED!!!!/%", "obj_room_teevie_large_02_slash_Step_0_gml_111_0");
    c_talk_wait();
    c_tenna_preset(0);
    c_wait(30);
    c_tenna_sprite(spr_tenna_tie_adjust_a);
    c_speaker("tenna");
    c_msgsetloc(0, "* I mean^1, uh.../%", "obj_room_teevie_large_02_slash_Step_0_gml_120_0");
    c_talk_wait();
    c_wait(15);
    c_tenna_preset(14);
    c_var_instance(id, "employees_state", "shocked");
    c_speaker("tenna");
    c_msgsetloc(0, "* No more POINTs until you CAPTURE them!^1! You like POINTs^1, right!?/%", "obj_room_teevie_large_02_slash_Step_0_gml_132_0");
    c_talk_wait();
    c_var_instance(id, "employees_state", "unhappy");
    c_wait(30);
    c_tenna_preset(0);
    c_tenna_sprite(spr_tenna_tie_adjust_c);
    c_speaker("tenna");
    c_msgsetloc(0, "* Okay^1, then we're CLEAR^1, right^1! You guys.../%", "obj_room_teevie_large_02_slash_Step_0_gml_143_0");
    c_talk_wait();
    if (scr_ch3_violencecheck() < 3)
    {
        c_var_instance(id, "employees_state", "joyed_single");
        c_wait(60);
    }
    else
    {
        c_var_instance(id, "employees_state", "scared_single");
        c_wait(30);
    }
    c_tenna_sprite(spr_tenna_hurt);
    c_shakeobj();
    c_speaker("tenna");
    if (scr_ch3_violencecheck() >= 3)
        c_msgsetloc(0, "* What do you MEAN you're scared to fight them!?/", "obj_room_teevie_large_02_slash_Step_0_gml_165_0");
    else
        c_msgsetloc(0, "* What do you MEAN you don't want to fight them!?/", "obj_room_teevie_large_02_slash_Step_0_gml_155_0");
    c_msgnextloc("* Wh..^1. What the!?/%", "obj_room_teevie_large_02_slash_Step_0_gml_156_0");
    c_talk();
    c_wait_box(1);
    c_tenna_sprite(spr_tenna_grasp_d);
    c_shakeobj();
    if (scr_ch3_violencecheck() < 3)
        c_var_instance(id, "employees_state", "joyed");
    c_wait_talk();
    c_var_instance(id, "employees_state", "shocked");
    c_sel(te);
    c_tenna_sprite(spr_tenna_point_left);
    c_shakeobj();
    c_speaker("tenna");
    c_msgsetloc(0, "* Read the FINE PRINT in your CONTRACT^1, buddy^1! Now QUIT complaining and GO!/%", "obj_room_teevie_large_02_slash_Step_0_gml_178_0");
    c_talk_wait();
    c_var_lerp_to_instance(te_actor, "x", te_actor.xstart + 690, 30, 3, "out");
    c_var_instance(id, "employees_state", "upset_leave");
    c_wait(15);
    c_var_instance(id, "move_employees", true);
    c_wait(60);
    c_pan_wait(camerax(), cameray(), 60);
    c_pannable(0);
    c_wait(15);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 1 && !d_ex() && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.facing = 0;
    global.interact = 0;
    if (global.tempflag[90] != 0)
        global.tempflag[90] = 0;
    clean_up();
    scr_flag_set(1235, 1);
}
if (move_employees)
{
    move_employees = false;
    for (var i = 0; i < array_length(employees); i++)
    {
        var employee = employees[i];
        with (employee)
        {
            var delay_offset = irandom(15);
            scr_script_delayed(scr_lerpvar, 15 + delay_offset, "x", x, x + 400, 30, 3, "out");
        }
    }
}
if (employees_state != current_employees_state)
{
    current_employees_state = employees_state;
    switch (current_employees_state)
    {
        case "shocked":
            snd_play(snd_wing);
            for (var i = 0; i < array_length(employees); i++)
            {
                var employee = employees[i];
                with (employee)
                    shock();
            }
            break;
        case "joyed":
            snd_play(snd_wing);
            for (var i = 0; i < array_length(employees); i++)
            {
                var employee = employees[i];
                with (employee)
                    joy();
            }
            break;
        case "upset_leave":
            for (var i = 0; i < array_length(employees); i++)
            {
                var employee = employees[i];
                with (employee)
                {
                    if (employee_type == "shadowman")
                    {
                        set_custom_sprite(spr_shadowman_sad);
                    }
                    else
                    {
                        scr_flip("x");
                        unhappy();
                    }
                }
            }
            break;
        case "joyed_single":
            snd_play(snd_wing);
            with (employees[joyful_index])
                joy();
            break;
        case "scared_single":
            snd_play(snd_wing);
            with (employees[joyful_index])
                scr_shakeobj();
            break;
        default:
            for (var i = 0; i < array_length(employees); i++)
            {
                var employee = employees[i];
                with (employee)
                    unhappy();
            }
            break;
    }
}
