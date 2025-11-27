sin_timer++;
timer++;
x += (sin(sin_timer * 0.1) * 1);
y += (cos(sin_timer * 0.15) * 0.5);
if (timer == 14)
    vspeed = 0;
if (timer == 30)
{
    direction = scr_at_player();
    speed = 4;
}
if (x < (__view_get(e__VW.XView, 0) - 80))
    instance_destroy();
if (x > (__view_get(e__VW.XView, 0) + 760))
    instance_destroy();
if (y < (__view_get(e__VW.YView, 0) - 80))
    instance_destroy();
if (y > (__view_get(e__VW.YView, 0) + 580))
    instance_destroy();
if (place_meeting(x, y, obj_ribbick_battle_frog))
{
    instance_destroy();
    with (instance_create(x, y, obj_regularbullet))
    {
        active = false;
        spin = 1;
        spinspeed = random(5) - 0.25;
        direction = 70 + random(40);
        speed = 1 + random(1);
        image_xscale = 0.5;
        image_yscale = 0.5;
        sprite_index = spr_cakesmoke;
        scr_lerpvar("image_alpha", 1, 0, 30);
        scr_script_delayed(instance_destroy, 30);
    }
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
