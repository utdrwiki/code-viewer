if (y >= (obj_shootout_controller.kris_y_ground - 10))
    destroy = true;
if (destroy)
{
    var _dir = 40;
    repeat (4)
    {
        var _hrt = scr_afterimage();
        _hrt.depth = obj_shootout_controller.depth - 5;
        _hrt.sprite_index = spr_shootout_heart;
        _hrt.image_xscale = 1;
        _hrt.image_yscale = 1;
        _hrt.direction = _dir + irandom(10);
        _hrt.speed = 5 + irandom(5);
        _hrt.fadeSpeed = 0.1;
        _dir += 22;
    }
    instance_destroy();
}
