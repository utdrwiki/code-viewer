var drawshine = false;
if (global.flag[1599] == 0)
    drawshine = 1;
if (scr_debug())
{
    if (keyboard_check_pressed(vk_numpad8))
        count++;
    if (keyboard_check_pressed(vk_numpad5))
        count--;
    if (keyboard_check_pressed(vk_subtract))
        stacksize -= 0.5;
    if (keyboard_check_pressed(vk_add))
        stacksize += 0.5;
    if (keyboard_check_pressed(vk_multiply))
        onboard = !onboard;
    if (keyboard_check_pressed(vk_numpad0))
    {
        con = 10;
        timer = 0;
    }
}
siner++;
for (var i = 0; i < count; i++)
{
    var height = round(y - (stacksize * i));
    draw_sprite_ext(sprite_index, 0 + (i % 3), scr_even(x + ((sin(i) * 2 * stacksize) / 14)), height, 2, 2, 0, c_white, 1);
    if (i == (count - 1))
    {
        draw_sprite_ext(spr_npc_cup_feather, 0, x + 44, height - 26, -2, 2, 0, c_white, 1);
        if (drawshine)
            draw_sprite_ext(spr_shine_white, (siner * 1) / 8, x + 6, height + 8, 2, 2, 0, c_white, 0.65 + (sin(siner / 15) * 0.35));
    }
}
if (drawshine)
    draw_sprite_ext(spr_shine_white, (siner * 1) / 8, x + 4, y + 8, 2, 2, 0, c_white, 0.65 + (sin(siner / 15) * 0.35));
var playerheightlocation = scr_even((y - (stacksize * count)) + 8 + 8);
if (onboard)
{
    draw_sprite_ext(spr_ralsei_down, 0, (x - 10) + 4, playerheightlocation - 214, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_krisd_dark, 0, (x - 10) + 6, playerheightlocation - 142, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_susie_down_dw, 0, x - 10, playerheightlocation - 84, 2, 2, 0, c_white, 1);
}
var _count = 0;
var space = 10;
var border = 8;
var _cx = camerax();
var _cy = cameray();
