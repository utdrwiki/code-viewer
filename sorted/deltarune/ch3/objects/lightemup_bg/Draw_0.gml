if (!i_ex(obj_lightemup_controller))
{
    instance_destroy();
    exit;
}
depth = obj_heroparent.depth + 99000;
var _channelnumber = obj_lightemup_controller.channelnumber % 5;
if (_channelnumber == 1)
{
}
if (_channelnumber == 2)
    draw_sprite_ext(spr_dw_kitchen, 0, camerax(), cameray() - 30, 2, 2, 0, c_white, 1);
if (_channelnumber == 3)
    draw_sprite(spr_rhythmgame_bg, 0, camerax(), cameray() - 15);
if (_channelnumber == 4)
{
    draw_sprite_ext(spr_susiezilla_background_backstage, 0, (camerax() + 20) - (camerawidth() / 2), cameray() - 30, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_susiezilla_background, 0, (camerax() + 20) - (camerawidth() / 2), cameray() - 30, 2, 2, 0, c_white, 1);
}
if (_channelnumber == 0)
{
    draw_sprite_ext(spr_desert_loop_backrgound_4, 0, camerax(), cameray(), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_desert_loop_middle_back_3, 0, camerax(), cameray(), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_desert_loop_middle_2, 0, camerax(), cameray(), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_desert_loop_foreground, 0, camerax(), cameray(), 2, 2, 0, c_white, 1);
}
