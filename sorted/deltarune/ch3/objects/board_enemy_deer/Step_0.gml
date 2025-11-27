timer++;
if (timer < 3)
    exit;
active_hitbox = false;
scr_board_enemy_step_init();
scr_depth_board();
scr_board_enemy_sword_collision();
if (!follow)
    scr_board_enemy_hurt_state();
active_hitbox = false;
if (obj_board_camera.active || global.interact == 1)
{
    path_end();
}
else
{
    var stopfollow = 0;
    with (obj_mainchara_board)
    {
        if (place_meeting(x, y, obj_board_trigger))
            stopfollow = 1;
    }
    if (follow && i_ex(obj_board_controller.kris_object) && stopfollow == 0)
    {
        var _kris = obj_board_controller.kris_object;
        moved = 0;
        if (_kris.x != remx[0])
            moved = 1;
        if (_kris.y != remy[0])
            moved = 1;
        if (moved == 1)
        {
            for (i = 75; i > 0; i -= 1)
            {
                remx[i] = remx[i - 1];
                remy[i] = remy[i - 1];
                facingdir[i] = facingdir[i - 1];
            }
            remx[0] = _kris.x;
            remy[0] = _kris.y;
            facingdir[0] = _kris.facing;
        }
        x = remx[target];
        y = remy[target];
        facing = facingdir[target];
        switch (facing)
        {
            case 0:
                sprite_index = spr_board_deer_downsprite;
                break;
            case 1:
                sprite_index = spr_board_deer_rightsprite;
                break;
            case 2:
                sprite_index = spr_board_deer_upsprite;
                break;
            case 3:
                sprite_index = spr_board_deer_leftsprite;
                break;
        }
        if (x != xprevious || y != yprevious)
            image_index += 0.125;
    }
    if (follow && stopfollow)
    {
        for (i = 0; i < 75; i += 1)
        {
            remx[i] = x;
            remy[i] = y;
            facing[i] = 0;
        }
        var _a = 0;
        var _dir = point_direction(x, y, obj_board_controller.kris_object.x, obj_board_controller.kris_object.y);
        repeat (target)
        {
            remx[_a] = lerp(obj_board_controller.kris_object.x, x, _a / target);
            remy[_a] = lerp(obj_board_controller.kris_object.y, y, _a / target);
            _a++;
        }
    }
}
