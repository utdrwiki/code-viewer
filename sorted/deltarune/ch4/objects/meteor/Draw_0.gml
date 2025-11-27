var _scale = 1.25;
var _vol = obj_mike_controller.microphone_volume / 100;
var _shake = 2 * _vol;
var _shakex = irandom_range(-_shake, _shake);
var _shakey = irandom_range(-_shake, _shake);
scr_dso(sprite_index, image_index, x + _shakex, y + _shakey, _scale, _scale, angle, 16777215, image_alpha, 1);
draw_sprite_ext(sprite_index, image_index, x + _shakex, y + _shakey, _scale, _scale, angle, c_white, image_alpha);
