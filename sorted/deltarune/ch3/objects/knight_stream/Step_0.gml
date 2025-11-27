timer++;
if (timer == 20)
{
    var xoff = 0;
    var yoff = 0;
    var plane_shift = choose(true, false);
    if (plane_shift)
        xoff = irandom_range(-40, 40);
    else
        yoff = irandom_range(-40, 40);
    scr_fire_bullet(obj_growtangle.x + xoff, obj_growtangle.y + yoff, obj_bullet_knight_stream, slash_angle, 0, spr_nothing);
    scr_fire_bullet(obj_growtangle.x + xoff, obj_growtangle.y + yoff, obj_bullet_knight_stream, 180 - slash_angle, 0, spr_nothing);
}
if (timer == 23)
{
    with (obj_bullet_knight_stream)
    {
        if (can_do_slashes)
        {
            scr_fire_bullet(x + lengthdir_x(60, direction + 270), y + lengthdir_y(60, direction + 270), obj_knight_streamline, direction, 0, spr_nothing);
            scr_fire_bullet(x - lengthdir_x(60, direction + 270), y - lengthdir_y(60, direction + 270), obj_knight_streamline, direction, 0, spr_nothing);
        }
    }
}
if (timer == 26)
{
    with (obj_bullet_knight_stream)
    {
        if (can_do_slashes)
        {
            scr_fire_bullet(x + lengthdir_x(120, direction + 270), y + lengthdir_y(120, direction + 270), obj_knight_streamline, direction, 0, spr_nothing);
            scr_fire_bullet(x - lengthdir_x(120, direction + 270), y - lengthdir_y(120, direction + 270), obj_knight_streamline, direction, 0, spr_nothing);
        }
    }
}
if (timer == 29)
{
    with (obj_bullet_knight_stream)
    {
        if (can_do_slashes)
        {
            scr_fire_bullet(x + lengthdir_x(180, direction + 270), y + lengthdir_y(180, direction + 270), obj_knight_streamline, direction, 0, spr_nothing);
            scr_fire_bullet(x - lengthdir_x(180, direction + 270), y - lengthdir_y(180, direction + 270), obj_knight_streamline, direction, 0, spr_nothing);
            can_do_slashes = false;
        }
    }
}
if (timer == 45)
{
    slash_angle += (25 + irandom(25));
    if (slash_angle > 70)
        slash_angle -= 40;
    timer = 0;
}
