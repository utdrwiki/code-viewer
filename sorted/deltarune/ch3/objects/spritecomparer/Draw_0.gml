if (!scr_debug())
    instance_destroy();
siner++;
draw_sprite_ext(spr_whitepx, 0, 0, horizony, 640, 1, 0, #F2A176, (abs(sin(siner / 40)) * 0.75) + 0.25);
draw_sprite_ext(spr_whitepx, 0, horizonx, 0, 1, 480, 0, #C7E3F2, (abs(sin((siner + 1.5707963267948966) / 40)) * 0.75) + 0.25);
if (keyboard_check_pressed(ord("1")) && keyboard_check(ord("F")))
    flip1 *= -1;
if (keyboard_check_pressed(ord("2")) && keyboard_check(ord("F")))
    flip2 *= -1;
if (keyboard_check_pressed(ord("3")) && keyboard_check(ord("F")))
    flip3 *= -1;
for (i = 0; i < 3; i++)
{
    xx[i] = sprite_get_xoffset(mysprite[i]);
    yy[i] = sprite_get_yoffset(mysprite[i]);
}
if (sunkus_kb_check_pressed(49) && keyboard_check(vk_shift))
{
    checkstring = get_string("Enter sprite_index of first sprite, OR enemy name from the object", "");
    if (sprite_exists(asset_get_index("spr_" + checkstring + "_idle")))
    {
        sprite[0] = asset_get_index("spr_" + checkstring + "_idle");
        sprite[1] = asset_get_index("spr_" + checkstring + "_hurt");
        sprite[2] = asset_get_index("spr_" + checkstring + "_spared");
    }
    else if (sprite_exists(asset_get_index(checkstring)))
    {
        sprite[0] = asset_get_index(checkstring);
    }
    event_user(0);
}
if (sunkus_kb_check_pressed(50) && keyboard_check(vk_shift))
{
    checksprite = asset_get_index(get_string("Enter sprite_index of second sprite.", ""));
    if (checksprite != -1)
        sprite[1] = checksprite;
    event_user(0);
}
if (sunkus_kb_check_pressed(51) && keyboard_check(vk_shift))
{
    checksprite = asset_get_index(get_string("Enter sprite_index of third sprite.", ""));
    if (checksprite != -1)
        sprite[2] = checksprite;
    event_user(0);
}
var altalpha1 = 1;
var altalpha2 = 1;
if (keyboard_check(vk_numpad8))
{
    if ((siner % 8) == 0)
    {
        alt = 1 - alt;
        debug_message("alt=" + string(alt));
    }
    if (alt == 0)
        altalpha1 = 0;
    if (alt == 1)
        altalpha2 = 0;
}
draw_sprite_ext(mysprite[0], image_index, x - hspace, y, image_xscale * flip1, image_yscale, image_angle, image_blend, 1);
draw_sprite_ext(mysprite[1], image_index, x + hspace, y, image_xscale * flip2, image_yscale, image_angle, image_blend, 1);
draw_sprite_ext(mysprite[2], image_index, x + hspace, y, image_xscale * flip3, image_yscale, image_angle, image_blend, 1);
var spr1alph = 1;
if (sunkus_kb_check(52))
    spr1alph = 0.5;
if (sunkus_kb_check(52) && keyboard_check(vk_shift))
    spr1alph = 0;
draw_sprite_ext(mysprite[0], image_index, x, y, image_xscale * flip1, image_yscale, image_angle, image_blend, spr1alph * altalpha1);
spr1alph = 1;
if (sunkus_kb_check(53))
    spr1alph = 0.5;
if (sunkus_kb_check(53) && keyboard_check(vk_shift))
    spr1alph = 0;
draw_sprite_ext(mysprite[1], image_index, x, y, image_xscale * flip2, image_yscale, image_angle, image_blend, spr1alph * altalpha2);
spr1alph = 1;
if (sunkus_kb_check(54))
    spr1alph = 0.5;
if (sunkus_kb_check(54) && keyboard_check(vk_shift))
    spr1alph = 0;
draw_sprite_ext(mysprite[2], image_index, x, y, image_xscale * flip3, image_yscale, image_angle, image_blend, spr1alph);
if (sunkus_kb_check_pressed(72))
{
    if (hitbox_mode == 0)
        hitbox_mode = 1;
    else
        hitbox_mode = 0;
}
ii = 3;
if (hitbox_mode)
    ii = 1;
var bboxl = sprite_get_bbox_left(mysprite[0]);
var bboxu = sprite_get_bbox_top(mysprite[0]);
var bboxr = sprite_get_bbox_right(mysprite[0]);
var bboxd = sprite_get_bbox_bottom(mysprite[0]);
draw_set_font(fnt_mainbig);
for (i = 0; i < ii; i++)
{
    if (i == 0)
        draw_set_color(c_yellow);
    if (i == 1)
        draw_set_color(c_red);
    draw_rectangle((x + (xx[i] * image_xscale)) - 1, (y + (yy[i] * image_yscale)) - 1, x + (xx[i] * image_xscale) + 1, y + (yy[i] * image_xscale) + 1, false);
    if (i == 0)
        draw_rectangle((x + (xx[i] * image_xscale)) - hspace - 1, (y + (yy[i] * image_yscale)) - 1, (x + (xx[i] * image_xscale)) - hspace - 1, y + (yy[i] * image_yscale) + 1, false);
    if (i == 1)
        draw_rectangle((x + (xx[i] * image_xscale) + hspace) - 1, (y + (yy[i] * image_yscale)) - 1, x + (xx[i] * image_xscale) + hspace + 1, y + (yy[i] * image_yscale) + 1, false);
    draw_text(0, i * 20, string(xx[i]) + ", " + string(yy[i]));
    var height = sprite_get_height(mysprite[i]);
    var width = sprite_get_height(mysprite[i]);
    draw_set_color(c_blue);
    draw_rectangle(x - (xx[i] * image_xscale), y - (yy[i] * image_yscale), (x + (width * image_xscale)) - (xx[i] * image_xscale), (y + (height * image_xscale)) - (yy[i] * image_yscale), true);
    if (hitbox_mode)
    {
        var ix = image_xscale;
        var iy = image_yscale;
        draw_set_color(c_red);
        draw_set_alpha(0.5);
        draw_rectangle(x + (bboxl * ix), y + (bboxu * iy), x + (bboxr * ix), y + (bboxd * iy), false);
        draw_set_alpha(1);
    }
}
if (sunkus_kb_check_pressed(49) && !keyboard_check(vk_shift))
    s = 0;
if (sunkus_kb_check_pressed(50) && !keyboard_check(vk_shift))
    s = 1;
if (sunkus_kb_check_pressed(51) && !keyboard_check(vk_shift))
    s = 2;
var m = 5;
if (sunkus_kb_check(40) && !keyboard_check(vk_shift))
{
    movetimer++;
    go = 0;
    if (movetimer >= m)
        go = 1;
    if (go && !hitbox_mode)
        sprite_set_offset(mysprite[s], xx[s], yy[s] - 1);
}
if (sunkus_kb_check(38) && !keyboard_check(vk_shift))
{
    movetimer++;
    go = 0;
    if (movetimer >= m)
        go = 1;
    if (go && !hitbox_mode)
        sprite_set_offset(mysprite[s], xx[s], yy[s] + 1);
}
if (sunkus_kb_check(37) && !keyboard_check(vk_shift))
{
    movetimer++;
    go = 0;
    if (movetimer >= m)
        go = 1;
    if (go && !hitbox_mode)
        sprite_set_offset(mysprite[s], xx[s] + 1, yy[s]);
}
if (sunkus_kb_check(39) && !keyboard_check(vk_shift))
{
    movetimer++;
    go = 0;
    if (movetimer >= m)
        go = 1;
    if (go && !hitbox_mode)
        sprite_set_offset(mysprite[s], xx[s] - 1, yy[s]);
}
if (hitbox_mode)
{
    if (keyboard_check(vk_right))
        bboxr++;
    if (keyboard_check(vk_left))
        bboxr--;
    sprite_set_bbox(mysprite[0], bboxl, bboxu, bboxr, bboxd);
}
if (sunkus_kb_check_pressed(83))
{
    snd_play(snd_save);
    sprite_set_bbox(sprite[0], bboxl, bboxu, bboxr, bboxd);
    for (i = 0; i < 3; i++)
        sprite_set_offset(sprite[i], xx[i], yy[i]);
}
draw_set_font(fnt_ja_dotumche);
draw_set_color(c_white);
var space = 15;
var yyy = 310;
var xxx = 10;
draw_text(xxx, yyy + (space * 0), "1/2/3: Select Sprite");
draw_text(xxx, yyy + (space * 1), "Shift+1/2/3: Change sprite");
draw_text(xxx, yyy + (space * 2), "4/5/6 Lower Transparency (Shift to Hide)");
draw_text(xxx, yyy + (space * 3), "Arrows: Adjust Anchor Point");
draw_text(xxx, yyy + (space * 4), "H: Edit hitbox of Sprite1");
draw_text(xxx, yyy + (space * 5), "S: Save changes (This session only)");
draw_text(xxx, yyy + (space * 6), "Shift+Arrows: Reposition Sprites");
draw_text(xxx, yyy + (space * 7), "D: Switch Image Scale");
draw_text(xxx, yyy + (space * 8), "CTRL+Shift+Arrows: Adjust spacing");
draw_text(xxx, yyy + (space * 9), "numpad 7/9 to change image_index");
draw_text(xxx, yyy + (space * 10), "Hold numpad 8 to alternate visibility");
draw_set_halign(fa_right);
draw_text(640 - xxx, yyy + (space * 0), "Hold F and Press 1/2/3 to flip sprite");
draw_set_halign(fa_left);
if (s == 0)
    draw_set_color(c_yellow);
else
    draw_set_color(c_gray);
draw_text(40, yyy + (space * -4), "Sprite 1: " + string(sprite_get_name(sprite[0])));
if (s == 1)
    draw_set_color(c_yellow);
else
    draw_set_color(c_gray);
draw_text(40, yyy + (space * -3), "Sprite 2: " + string(sprite_get_name(sprite[1])));
if (s == 2)
    draw_set_color(c_yellow);
else
    draw_set_color(c_gray);
draw_text(40, yyy + (space * -2), "Sprite 3: " + string(sprite_get_name(sprite[2])));
draw_set_color(c_white);
if (keyboard_check(vk_shift) && keyboard_check(vk_down))
    y++;
if (keyboard_check(vk_shift) && keyboard_check(vk_up))
    y--;
if (keyboard_check(vk_shift) && keyboard_check(vk_left) && !keyboard_check(vk_control))
    x--;
if (keyboard_check(vk_shift) && keyboard_check(vk_right) && !keyboard_check(vk_control))
    x++;
if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check(vk_right))
    hspace++;
if (keyboard_check(vk_shift) && keyboard_check(vk_control) && keyboard_check(vk_left))
    hspace--;
if (sunkus_kb_check_pressed(105))
    image_index++;
if (sunkus_kb_check_pressed(103))
    image_index--;
if (sunkus_kb_check_pressed(82))
    room_restart();
if (sunkus_kb_check_pressed(45))
    room_goto_next();
if (sunkus_kb_check_pressed(36))
    game_restart();
if (keyboard_check_pressed(ord("D")))
{
    if (image_xscale == 2)
    {
        image_xscale = 1;
        image_yscale = 1;
    }
    else
    {
        image_xscale = 2;
        image_yscale = 2;
    }
}
