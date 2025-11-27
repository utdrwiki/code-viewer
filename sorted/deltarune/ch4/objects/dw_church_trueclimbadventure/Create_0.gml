bcon = 0;
btimer = 0;
btimer2 = 0;
layer_set_visible("TILES_SHORTCUTBRIDGE", false);
layer_set_visible("ASSETS_SHORTCUTBRIDGE", false);
layer_set_visible("CLIMBSHORTCUT1", 0);
if (scr_debug())
{
    scr_setparty(1, 1);
    if (global.flag[23] != 1)
    {
        global.flag[23] = 1;
        debug_print("Climb Flag [23] enabled");
    }
}
if (global.flag[1530] == 1)
{
    with (obj_dw_church_trueclimbadventure_appeartiles)
        instance_destroy();
    layer_set_visible("CLIMBSHORTCUT1", 1);
    instance_create(840, 1800, obj_climb_climbable);
    with (instance_create(880, 1480, obj_climb_climbable))
        scr_size(1, 9);
    bcon = 1;
}
makeb2blocker = true;
bcon2 = 0;
if (global.flag[1571] == 1)
{
    bcon2 = 1;
    makeb2blocker = false;
    layer_set_visible("TILES_SHORTCUTBRIDGE", true);
    layer_set_visible("ASSETS_SHORTCUTBRIDGE", true);
}
scr_musicer("church_wip.ogg", 0.7);
