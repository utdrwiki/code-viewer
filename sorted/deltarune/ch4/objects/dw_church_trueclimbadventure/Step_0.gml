scr_populatechars();
if (scr_debug())
{
    if (keyboard_check(ord("W")))
    {
        var moveem = false;
        var pos;
        if (keyboard_check_pressed(ord("1")))
        {
            pos = scr_heromarker("kris", "treasure");
            moveem = true;
        }
        if (keyboard_check_pressed(ord("2")))
        {
            pos = scr_heromarker("kris", "side");
            moveem = true;
        }
        if (keyboard_check_pressed(ord("3")))
        {
            pos = scr_heromarker("kris", "top");
            moveem = true;
        }
        if (keyboard_check_pressed(ord("3")))
        {
            pos = scr_heromarker("kris", "a");
            moveem = true;
        }
        if (moveem)
        {
            setxy(pos[0], pos[1], kris);
            setxy(pos[0], pos[1], ralsei);
            setxy(pos[0], pos[1], susie);
            scr_caterpillar_interpolate("all");
        }
    }
}
if (bcon == 0)
{
    var trig = 0;
    with (obj_bell_small_playable)
    {
        if (extflag == "shortcutbell")
        {
            if (rung == 1)
                trig = 1;
        }
    }
    if (trig)
    {
        with (obj_dw_church_trueclimbadventure_appeartiles)
            con = 1;
        instance_create(840, 1800, obj_climb_climbable);
        with (instance_create(880, 1480, obj_climb_climbable))
            scr_size(1, 9);
        layer_set_visible("CLIMBSHORTCUT1", 1);
        global.flag[1530] = 1;
        bcon = 1;
    }
}
if (makeb2blocker == true)
{
    makeb2blocker = false;
    var pos = scr_heromarker(undefined, "b2blocker");
    b2blocker = instance_create(pos[0], pos[1], obj_solidblocksized);
    scr_sizeexact(pos[2].sprite_width, pos[2].sprite_height, b2blocker);
}
if (bcon2 == 0)
{
    var trig = 0;
    with (obj_bell_small_playable)
    {
        if (extflag == "treasurebell")
        {
            if (rung == 1)
                trig = 1;
        }
    }
    if (trig)
    {
        global.flag[1571] = 1;
        var pos = scr_heromarker(undefined, "b2blocker");
        with (scr_marker_ext(pos[0], pos[1], spr_pxwhite, pos[2].sprite_width, pos[2].sprite_height, 0, 0, #7F97F0, 5000))
        {
            scr_lerpvar("image_alpha", 1, 0, 30, -1, "out");
            scr_doom(id, 30);
        }
        layer_set_visible("TILES_SHORTCUTBRIDGE", true);
        layer_set_visible("ASSETS_SHORTCUTBRIDGE", true);
        safe_delete(b2blocker);
        bcon2 = 1;
    }
}
