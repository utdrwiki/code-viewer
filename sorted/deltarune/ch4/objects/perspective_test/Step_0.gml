if (!init)
{
    depth = 100000 - (y * 10);
    init = true;
    var _xx = x - ((partcount / 2) * 10);
    for (i = 0; i < partcount; i++)
    {
        parts[i] = instance_create(x, y, obj_marker);
        parts[i].sprite_index = spr_perspective_orb;
        parts[i].image_speed = 0;
        xpos[i] = _xx;
        shadows[i] = instance_create(x, y, obj_marker);
        shadows[i].sprite_index = spr_perspective_orb;
        shadows[i].image_speed = 0;
        shadows[i].image_blend = c_black;
        shadows[i].depth = depth + 500;
        _xx += 10;
    }
}
var _sine = sin(siner / 60) * pi;
siner++;
for (i = 0; i < partcount; i++)
{
    var _vec3 = new Vector3(0, 0, 0);
    var _centerx = camerax() + (surface_get_width(application_surface) / 2);
    var _centery = 80;
    var _loopPos = _sine + ((i / 12) * 2 * pi);
    var _newX = xpos[i];
    var _height = (cos(_loopPos * 1) * 100) - 120;
    var _newY = other.y + _height;
    var _newZ = 300 + (sin(_loopPos * 1) * 60);
    var _playerdis = playerlook ? ((obj_mainchara.x + 15) - _newX) : 0;
    var _scale = 1;
    with (parts[i])
    {
        _vec3 = scr_perspective_scale_depth(_newX, _newY, _newZ, _centerx, _centery, 300, other.depth);
        x = _vec3.x;
        y = _vec3.y;
        depth = other.depth + ((_newZ - 300) * 10);
        _scale = _vec3.z;
        if (other.scalesnap > 0)
            _scale = round(_scale / other.scalesnap) * other.scalesnap;
        if (_playerdis != 0)
            image_xscale *= -sign(_playerdis);
        image_xscale = _scale;
        image_yscale = _scale;
        image_blend = merge_color(c_black, c_white, clamp01(_vec3.z / 1.5));
    }
    with (shadows[i])
    {
        x = _vec3.x;
        y = _centery + ((other.y - _centery) * _vec3.z);
        depth = other.depth + 10000;
        var _depthscale = clamp01((400 - (other.y - _newY)) / 400);
        image_xscale = _scale * _depthscale;
        if (_playerdis != 0)
            image_xscale *= -sign(_playerdis);
        if (other.shadowscale)
            _scale /= 2;
        image_yscale = _scale * _depthscale;
    }
}
