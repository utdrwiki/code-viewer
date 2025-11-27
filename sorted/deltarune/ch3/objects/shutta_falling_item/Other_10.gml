for (var _i = 1; _i < image_number; _i++)
{
    var _side = 1;
    repeat (2)
    {
        var _piece = instance_create_depth(x, y + 10, depth - 1, obj_shutta_falling_item_piece);
        _piece.sprite_index = sprite_index;
        _piece.image_index = _i;
        _piece.image_alpha = 1.5;
        _piece.image_xscale = _side * 2;
        _piece.image_yscale = _side * 2;
        _piece.speed = 10 + irandom(2);
        _piece.direction = 90 - ((5 + irandom(3)) * _i * _side);
        _piece.rotation_spd = _side * -20;
        _side = -1;
    }
}
sprite_index = spr_realisticexplosion;
image_speed = 1;
image_index = 1;
snd_play_x(snd_badexplosion, 0.6, 1.1);
