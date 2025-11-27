if (other.height > 5)
    exit;
if (jump == 1)
    exit;
if (timer < 20)
    exit;
var _score = 0;
if (itemtype == 0)
    _score += 50;
if (itemtype == 1)
    _score += 100;
if (itemtype == 2)
    _score += 200;
if (itemtype == 3)
    _score += 400;
if (itemtype == 4)
    _score += 500;
if (itemtype == 5)
    _score += 750;
if (itemtype == 6)
    _score += 1000;
if (itemtype == 7)
    _score += 1200;
if (itemtype == 8)
    _score += 1500;
if (itemtype == 9)
    _score += 2000;
obj_susiezilla.susiezilla_score += _score;
var xx = 40;
if (obj_susiezilla.image_xscale == -2)
    xx = -40;
scoretext = instance_create(x - (string_width(string(_score)) / 2), y, obj_susiezilla_collectible_text);
scoretext.score_text = _score;
instance_destroy();
snd_play(snd_coin);
