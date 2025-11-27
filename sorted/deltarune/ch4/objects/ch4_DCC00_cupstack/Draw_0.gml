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
        con = 1;
        timer = 0;
    }
}
siner += (sine_interval / 2);
anim += 0.2;
var base_y = 0;
var total_y_offset = -total_height;
var height;
for (var i = 0; i < array_length(recruited_sprites); i++)
{
    var _sprite = recruited_sprites[i];
    base_y += sprite_heights[i];
    height = (round(y + total_height) - base_y) + total_y_offset;
    var x_pos = (x - (sprite_get_width(_sprite) / 2)) + sprite_get_xoffset(_sprite);
    var y_pos = height;
    var x_offset = sin(siner / 12) * 6 * (i + 1);
    var y_offset = 0;
    draw_sprite_ext(recruited_sprites[i], anim, x_pos + x_offset, y_pos + y_offset, 2, 2, 0, c_white, 1);
}
for (var i = 0; i < count; i++)
{
    height = round(y - (stacksize * i)) + total_y_offset;
    var x_offset = (sin(siner / 12) * 6 * array_length(recruited_sprites)) + (sin(siner / 12) * i * 2);
    draw_sprite_ext(sprite_index, 0 + (i % 3), x_offset + scr_even(x + ((sin(i) * 2 * stacksize) / 14)), height, 2, 2, 0, c_white, 1);
    if (i == (count - 1))
        draw_sprite_ext(spr_npc_cup_feather, 0, x + 44 + x_offset, height - 26, -2, 2, 0, c_white, 1);
}
if (cutscene_mode)
{
    var x_offset = (sin(siner / 12) * 6 * array_length(recruited_sprites)) + (sin(siner / 12) * count * 2);
    draw_sprite_ext(spr_jackenstein_catch, jack_index, (x + x_offset) - 80, height - 120, 2, 2, 0, c_white, 1);
}
