draw_sprite_ext(sprite_index, 0, x, obj_rhythmgame.y - 480, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
var _yy = (obj_rhythmgame.y - 640) + ((cameray() - obj_rhythmgame.y) * -0.5);
draw_sprite_ext(sprite_index, 1, x, _yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
with (obj_rhythmgame)
    event_user(2);
