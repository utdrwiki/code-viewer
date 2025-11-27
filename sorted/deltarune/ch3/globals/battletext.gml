function scr_battletext()
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (global.fc != 0)
        battlewriter = instance_create(xx + 30, yy + 376, obj_writer);
    if (global.fc == 0)
        battlewriter = instance_create(xx + 30, yy + 376, obj_writer);
    if (global.chapter == 3 && i_ex(obj_tennabattleconvo_controller) && (obj_tennabattleconvo_controller.chattedduringbulletphase == true || (obj_tennabattleconvo_controller.introcon >= 0.1 && obj_tennabattleconvo_controller.introcon <= 2)))
    {
    }
    else
    {
        myface = instance_create(xx + 26, yy + 380, obj_face);
    }
    with (battlewriter)
    {
        dialoguer = 1;
        facer = 1;
        if (global.fc == 0 && originalcharline == 33)
            charline = 26;
    }
    return battlewriter;
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
