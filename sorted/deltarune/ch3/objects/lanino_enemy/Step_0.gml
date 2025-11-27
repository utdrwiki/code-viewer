if (global.monster[myself] == 1 && !i_ex(obj_rouxls_ch3_enemy))
{
    if (scr_isphase("enemytalk") && talked == 0 && obj_elnina_lanino_controller.talked == 1)
    {
        scr_randomtarget();
        talked = 1;
        talktimer = 0;
        rtimer = 0;
    }
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* Lanino - The sight of Elnina makes him want to be singin' in the rain./%", "obj_lanino_enemy_slash_Step_0_gml_40_0_b");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        msgsetloc(0, "* Kris says I Love TV to Lanino!/%", "obj_lanino_enemy_slash_Step_0_gml_47_0");
        scr_battletext_default();
        if (obj_elnina_lanino_controller.sunboost < 3)
            obj_elnina_lanino_controller.sunboost++;
        obj_elnina_lanino_controller.ilovetv_increase = 1;
        acting = 200;
    }
    if (acting == 200 && actcon == 0)
    {
        with (obj_writer)
        {
            if (reachedend)
            {
                if (obj_elnina_lanino_controller.ilovetv_increased == false)
                    obj_elnina_lanino_controller.ilovetv_increase = 3;
            }
        }
        if (!i_ex(obj_writer))
        {
            if (obj_elnina_lanino_controller.ilovetv_increased == false)
                obj_elnina_lanino_controller.ilovetv_increase = 3;
            if (obj_elnina_lanino_controller.ilovetv_increase == 0)
                actcon = 1;
        }
    }
    if (acting == 3 && actcon == 0)
    {
        msgsetloc(0, "* Everyone said I Love TV to Lanino!/%", "obj_lanino_enemy_slash_Step_0_gml_78_0");
        scr_battletext_default();
        if (obj_elnina_lanino_controller.sunboost < 3)
            obj_elnina_lanino_controller.sunboost++;
        acting = 200;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        msgsetloc(0, "* Susie said \"I Love TV!\"/%", "obj_lanino_enemy_slash_Step_0_gml_107_0_b");
        scr_simultext("susie");
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
        obj_elnina_lanino_controller.ilovetv_increase++;
    }
    if (actingral == 1 && actconral == 1)
    {
        msgsetloc(0, "* Ralsei said \"I Love TV!\"/%", "obj_lanino_enemy_slash_Step_0_gml_117_0_b");
        scr_simultext("ralsei");
        if (simulorderral == 0)
            actconral = 20;
        else
            actconral = 0;
        obj_elnina_lanino_controller.ilovetv_increase++;
    }
    if (actcon == 20 || actconsus == 20 || actconral == 20)
    {
        if (scr_terminate_writer())
        {
            actconsus = -1;
            actconral = -1;
            actcon = 1;
        }
    }
    if (actcon == 1 && !instance_exists(obj_writer))
        scr_nextact();
}
if (state == 3)
    scr_enemy_hurt();

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
