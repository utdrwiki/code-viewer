function scr_susiezilla_hiteffect(arg0)
{
    var _hit = arg0;
    var _hitmarker = scr_dark_marker(round((_hit.myxcenter + myxcenter) / 2), round((_hit.myycenter + myycenter) / 2), spr_dogcar_hit);
    scr_doom(_hitmarker, 4);
    var hitscale = myhitscale;
    if (_hit.myhitscale > hitscale)
        hitscale = _hit.myhitscale;
    scr_scale(hitscale, _hitmarker);
    scr_lerpvar_instance(_hitmarker, "image_xscale", hitscale, 1, 4);
    scr_lerpvar_instance(_hitmarker, "image_yscale", hitscale, 1, 4);
    _hitmarker.depth = depth - 100;
    return _hitmarker;
}
