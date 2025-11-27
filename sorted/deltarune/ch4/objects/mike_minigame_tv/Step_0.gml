var _check = lastmike;
var _blush = 0;
with (obj_mike)
{
    if (act == 1 || act == 3)
    {
        switch (sprite_index)
        {
            case spr_mike_s:
                _check = 1;
                break;
            case spr_mike_l:
                _check = 2;
                break;
            case spr_mike_m:
                _check = 3;
                break;
        }
        other.lastmike = _check;
    }
    if (blush)
        _blush = 1;
}
minigame = _check;
if (aww == 1)
{
    aww = 2;
    snd_play(snd_aww);
}
if (aww == 2 && _blush == 0)
    aww = 0;
