var _trueralsei = -1;
if (i_ex(obj_actor) && image_alpha >= 1)
{
    for (var i = 0; i < instance_number(obj_actor); i++)
    {
        _lg[i] = instance_find(obj_actor, i);
        if (_lg[i].dsprite == spr_ralsei_walk_down)
            _trueralsei = _lg[i];
    }
}
reticle_over_good_shot = false;
switch (subact_state)
{
    case "init":
        rotating_controller = instance_create(x, y - 60, obj_shutta_nobyacttest);
        rotating_controller.difficulty = difficulty;
        rotating_controller.type = 3;
        disablemovement = false;
        subact_state = "tvs";
        break;
    case "tvs":
        timerb++;
        pipetimer++;
        break;
    case "capture":
        subact_state = "tvs";
        break;
    case "post_capture":
        break;
}
