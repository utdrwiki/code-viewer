with (obj_writer)
    instance_destroy()
if (theystoppeddancing == 1)
{
    alarm[0] = -1
    global.typer = 6
    theystoppeddancing = 2
    scr_speaker("susie")
    msgsetloc(0, "* They stopped dancing!/", "obj_musical_controller_slash_Alarm_0_gml_11_0")
    msgnextloc("* We need to do it again!/%", "obj_musical_controller_slash_Alarm_0_gml_12_0")
    c_facenext("none", 0)
    scr_battletext()
    return;
}
if ((global.hp[1] <= 0 && happyfeetscene == 0) || (obj_sweet_enemy.actCounter > 3 && happyfeetscene == 0))
{
    with (obj_battlecontroller)
        noreturn = true
    obj_sweet_enemy.dancecon = 1
    obj_sweet_enemy.postattackscene = 1
    if (global.hp[2] < 1)
    {
        star = 1
        scr_healitemspell((abs(global.hp[2]) + 1))
    }
    if (global.hp[3] < 1)
    {
        star = 2
        scr_healitemspell((abs(global.hp[3]) + 1))
    }
    return;
}
skiptext = 0
with (obj_battlecontroller)
    noreturn = false
with (obj_battlecontroller)
{
    if (obj_musical_controller.ralseiportrait == 1)
        scr_speaker("ralsei")
    alarm[2] = 2
}
