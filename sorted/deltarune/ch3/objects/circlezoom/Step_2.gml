if (type == 0)
{
    siner++;
    x += (sin(siner / 8) / 2);
    y += (cos(siner / 8) / 2);
    zoomtimer += ((zoomtimer / 5) + 16);
    if (zoomtimer >= zoomtime)
        zoomtimer = zoomtime;
    lerpamount = zoomtimer / zoomtime;
    if (lerpamount >= 1)
        lerpamount = 1;
    radius = lerp(startradius, endradius, lerpamount);
}
if (type == 1)
{
    if (radius > endradius)
        radius -= 8;
    if (radius <= 0)
        radius = 0;
}
if (type == 2 || type == 3 || type == 4)
{
    depth = 100;
    siner++;
    if (type == 2)
    {
        radius = 40;
        x = 448 + (sin(siner / 8) / 2);
        y = 210 + (cos(siner / 8) / 2);
    }
    if (type == 3 || type == 4)
    {
        if (type == 3)
        {
            if (radius < 180)
                radius = lerp(radius, 180, 0.1);
        }
        if (type == 4)
        {
            radius += 10;
            if (radius > 290)
                instance_destroy();
        }
        var hold = (right_h() - left_h()) * (obj_mainchara.wspeed * 4);
        if (button2_h())
            hold *= 2;
        if (global.interact != 0)
            hold = 0;
        var targx = camerax() + 300;
        targx = obj_mainchara.x + 12 + hold;
        var targy = cameray() + 210 + (cos(siner / 8) / 2);
        targy = obj_mainchara.y;
        if (i_ex(obj_cutscene_master))
            targx = camerax() + 320;
        var overwrite = false;
        with (obj_camera_area)
        {
            if (place_meeting(x, y, obj_mainchara))
                overwrite = true;
        }
        if (overwrite)
        {
            targx = lerp(x, camerax() + 320, 0.5);
            targy = lerp(y, cameray() + 240, 0.5);
        }
        if (global.interact != 5)
        {
            if (abs(targx - x) > 6)
                x = lerp(x, targx, 0.1);
            if (abs(targy - y) > 6)
                y = lerp(y, targy, 0.1);
            y += (cos(siner / 8) / 2);
            x += (sin(siner / 8) / 2);
        }
        if (init == 0)
        {
            x = targx;
            y = targy;
            init = 1;
        }
    }
}
if (!surface_exists(surf))
    surf = surface_create(room_width, room_height);
surface_set_target(surf);
if (type == 3 || type == 4)
{
    var intensity = 1;
    if (room == room_dw_couch_overworld_intro)
        intensity = 1.5;
    if (room == room_dw_couch_overworld_01)
        intensity = 1.35;
    if (room == room_dw_couch_overworld_02 || room == room_dw_couch_points)
        intensity = 1.2;
    if (room == room_dw_couch_overworld_03)
        intensity = 0.7;
    if (room == room_dw_couch_overworld_04)
        intensity = 0.5;
    draw_set_alpha(0.4 * intensity);
    draw_set_color(c_black);
    draw_rectangle(0, 0, camerax() + 700, cameray() + 500, false);
    draw_set_blend_mode(bm_subtract);
    draw_set_color(c_white);
    draw_circle(x, y, radius, false);
    draw_circle(x, y, radius + 20, false);
    draw_circle(x, y, radius + 40, false);
    draw_set_alpha(1);
}
else
{
    draw_clear(c_black);
    draw_set_blend_mode(bm_subtract);
    draw_set_color(c_white);
    draw_circle(x, y, radius, false);
}
surface_reset_target();
draw_set_blend_mode(bm_normal);
if (finish == 1)
{
    type = 1;
    endradius = 0;
    zoomtime += 100;
}
