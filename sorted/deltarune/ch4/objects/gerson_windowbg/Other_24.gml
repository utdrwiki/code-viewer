timer++;
ossafe_fill_rectangle_color(camerax(), cameray(), 640, 164, #609F92, #609F92, #167B66, #167B66, 0);
if (keyboard_check(ord("P")) && (timer % 4) == 0 && scr_debug())
{
    lan = scr_marker(106, 106, spr_lancer_dt);
    lan.image_alpha = -69;
    lan.speed = random_range(10, 20);
    lan.gravity = 0.75;
    lan.direction = random_range(35, 55);
    scr_darksize(lan);
    lan.image_angle = random(360);
    scr_doom(lan, 60);
}
event_user(11);
latmode = 5;
var lockround = false;
drawbell = false;
if (latmode == 0)
{
    lockround = true;
    latdir = 0;
    latspeed = 0;
    latidealhspeed = lengthdir_x(latspeed, latdir);
    latidealvspeed = lengthdir_y(latspeed, latdir);
}
if (latmode == 1)
{
    lockround = true;
    latdir = 0;
    latspeed = 2;
}
if (latmode == 2)
{
    lockround = true;
    latdir = 45;
    latspeed = 2;
}
if (latmode == 3)
{
    latdir = sin(timer / 27) * 20;
    lathspeed = cos(timer / 30) * 4;
}
if (latmode == 4)
{
    lockround = true;
    latdir = 90;
    latspeed = 2;
}
if (latmode == 5)
{
    drawbell = true;
    lockround = true;
    latdir = 90;
    latspeed = 2;
}
if (drawbell)
{
    if ((timer % 50) == 0)
    {
        for (var i = 0; i < 3; i++)
        {
            var randno = 20;
            if (i == 1)
                randno = 40;
            var bell = scr_dark_marker(196 + (126 * i) + scr_even(irandom_range(-randno, randno)), 172 + scr_even(irandom_range(-20, 20)), spr_bell_small);
            bell.image_alpha = -69;
            scr_doom(bell, 240);
            bell.vspeed = latvspeed;
        }
    }
    with (obj_marker)
    {
        if (image_alpha == -69)
            image_angle = scr_even(sin((other.timer + x) / 6) * 8);
    }
}
latidealhspeed = lengthdir_x(latspeed, latdir);
latidealvspeed = lengthdir_y(latspeed, latdir);
lathspeed = lerp(lathspeed, latidealhspeed, 0.2);
latvspeed = lerp(latvspeed, latidealvspeed, 0.2);
if (lockround == true)
{
    latposx = round(lathspeed + latposx);
    latposy = round(latvspeed + latposy);
}
else
{
    latposx = lathspeed + latposx;
    latposy = latvspeed + latposy;
}
draw_sprite_tiled_ext(spr_gerson_lattice, 0, camerax() + latposx, cameray() + latposy, 2, 2, c_black, 1);
draw_sprite_ext(spr_gerson_windows_bg, 0, camerax(), cameray(), 2, 2, 0, c_black, 1);
ossafe_fill_rectangle_color(0, 164, 640, 480, c_black, c_black, c_black, c_black, 0);
draw_set_color(#241E17);
ossafe_fill_rectangle(0, 172, 640, 480, 0);
draw_set_color(c_white);
windows = sprite_create_from_surface(application_surface, 146, 6, 346, 124, 1, 0, 0, 0);
var x2 = 680;
var y2 = 680;
var x1 = -40;
var y1 = 680;
var x4 = 132;
var y4 = 168;
var x3 = 508;
var y3 = 168;
draw_sprite_pos_fixed(windows, 0, x1, y1, x2, y2, x3, y3, x4, y4, 1);
if (i_ex(obj_herosusie))
{
    with (obj_herosusie)
    {
        x1 = x + 18;
        y1 = y + 84;
        x2 = x1 + 32;
        y2 = y1;
        x3 = x2 - 60;
        y3 = y1 + 200;
        x4 = x1 - 60;
        y4 = y1 + 200;
        draw_set_color(#241E17);
        draw_rectangle_pos(x1, y1, x2, y2, x3, y3, x4, y4);
    }
}
if (i_ex(obj_hammer_of_justice_enemy))
{
    with (obj_hammer_of_justice_enemy)
    {
        if (image_alpha > 0 && visible == true)
        {
            x1 = x + 38;
            y1 = y + 72;
            x2 = x1 + 60;
            y2 = y1;
            x3 = x2 + 60;
            y3 = y1 + 200;
            x4 = x1 + 60;
            y4 = y1 + 200;
            draw_set_color(#241E17);
            draw_rectangle_pos(x1, y1, x2, y2, x3, y3, x4, y4);
        }
    }
}
if (sprite_exists(windows))
    sprite_delete(windows);
