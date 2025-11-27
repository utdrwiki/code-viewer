if (i_ex(obj_lancergotchi))
{
    reticle_over_good_shot = false;
    if (place_meeting(x, y, obj_heroparent) || (place_meeting(x, y, obj_lancergotchi) && collision_circle(x, y, reticle_size + 35, obj_lancergotchi, false, true) && obj_lancergotchi.sprite_index == spr_ch3_dw_shutta_lancer_tongue))
        reticle_over_good_shot = true;
}
if (i_ex(obj_shutta_nobyact_shutta))
{
    var _trueshutta = -1;
    if (image_alpha >= 1)
    {
        for (var i = 0; i < instance_number(obj_shutta_nobyact_shutta); i++)
        {
            _lg[i] = instance_find(obj_shutta_nobyact_shutta, i);
            if (_lg[i].facing == 1 && _lg[i].sprite_index == spr_shutta_jump)
                _trueshutta = _lg[i];
        }
    }
    reticle_over_good_shot = false;
    if (place_meeting(x, y, obj_heroparent) || (_trueshutta != -1 && place_meeting(x, y, _trueshutta) && collision_circle(x, y, reticle_size + 40, _trueshutta, false, true)))
        reticle_over_good_shot = true;
}
