if (i_ex(obj_shadowman_sharpshoot_cursor) && obj_shadowman_sharpshoot_cursor.disabledebugui == true)
    exit;
setup_encounter = 0;
if (global.fighting == 0)
{
    if (sunkus_kb_check_pressed(49) || gamepad_button_check_pressed(0, gp_shoulderl))
        global.encounterno--;
    if (sunkus_kb_check_pressed(50) || gamepad_button_check_pressed(0, gp_shoulderr))
        global.encounterno++;
    if (sunkus_kb_check_pressed(51))
        global.encounterno -= 5;
    if (sunkus_kb_check_pressed(52))
        global.encounterno += 5;
    if (sunkus_kb_check_pressed(48))
        global.encounterno = 500;
}
global.encounterno = clamp(global.encounterno, encountermin, encountermax);
if (instance_exists(obj_chaseenemy))
    obj_chaseenemy.myencounter = global.encounterno;
if (global.fighting == 0)
{
    if (sunkus_kb_check_pressed(54) || gamepad_button_check_pressed(0, gp_shoulderlb))
    {
        scr_losechar();
        scr_getchar(2);
        scr_getchar(3);
    }
    if (sunkus_kb_check_pressed(55) || gamepad_button_check_pressed(0, gp_shoulderrb))
        scr_losechar();
    if (sunkus_kb_check_pressed(56))
    {
        scr_losechar();
        scr_getchar(3);
    }
    if (sunkus_kb_check_pressed(57))
    {
        scr_losechar();
        scr_getchar(4);
        scr_itemget(1);
    }
    draw_set_color(c_lime);
    scr_84_set_draw_font("main");
    draw_text(0, 440, string_hash_to_newline("Party:  " + string(global.charname[global.char[0]]) + " " + string(global.charname[global.char[1]]) + " " + string(global.charname[global.char[2]])));
    draw_text(0, 455, string_hash_to_newline("6: full party. 7:kris only. 8:kris and ralsei 9: kris + noelle"));
}
if (!instance_exists(obj_debug_xy))
{
    if (global.fighting == 0)
    {
        scr_encountersetup(global.encounterno);
        draw_set_color(c_black);
        draw_rectangle(0, 0, 80, 50, false);
        draw_set_color(c_white);
        scr_84_set_draw_font("mainbig");
        draw_text(0, 0, string_hash_to_newline("EncounterNo: " + string(global.encounterno)));
        for (i = 0; i < 3; i++)
        {
            if (global.monstertype[i] > 0)
                draw_text(0, 20 + (i * 20), string_hash_to_newline(object_get_name(global.monsterinstancetype[i])));
        }
        draw_set_color(c_ltgray);
        scr_84_set_draw_font("main");
        for (j = 1; j < 5; j++)
        {
            scr_encountersetup(global.encounterno + j);
            for (i = 0; i < 3; i++)
            {
                draw_text(0, 60 + (j * 70), string_hash_to_newline("Encounter: " + string(global.encounterno + j)));
                if (global.monstertype[i] > 0)
                    draw_text(0, 70 + (i * 10) + (j * 70), string_hash_to_newline(object_get_name(global.monsterinstancetype[i])));
            }
        }
        draw_text(300, 0, string_hash_to_newline("Adjust EncounterNo:#1- 2+#3----- 4+++++"));
        scr_encountersetup(global.encounterno);
    }
    else
    {
    }
}
if (global.fighting == 1 && sunkus_kb_check_pressed(68))
{
    if (!i_ex(obj_danmaku_analyzer))
    {
        instance_create(0, 0, obj_danmaku_analyzer);
    }
    else
    {
        with (obj_danmaku_analyzer)
            instance_destroy();
    }
}
