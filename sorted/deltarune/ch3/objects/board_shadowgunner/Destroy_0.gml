safe_delete(hat);
safe_delete(_hit);
if (obj_board_camera.con == 0 && obj_board_camera.shift == "none" && !noleaves && !i_ex(obj_board_deathevent))
{
    snd_stop(snd_board_splash);
    snd_play(snd_board_splash);
    var leaves = instance_create(x, y, obj_board_afterimage);
    leaves.depth = depth - 1;
    with (leaves)
    {
        image_speed = 0.25;
        sprite_index = spr_board_shadowgunner_leaves;
        length = 8;
        gravity = 0.5;
        scr_darksize();
        image_xscale = other.image_xscale;
    }
}
