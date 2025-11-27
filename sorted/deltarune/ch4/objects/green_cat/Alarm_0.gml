randomize();
var _probabilities = [80, 14, 4.5, 1.25, 0.24, 0.01, 0.0001, 0];
var _new_type = type;
var _repeat = clamp(power(1.7, (chance * 0.7) + 0.3), 1, 99999999);
var _rr = random(100);
_rr *= (1 / _repeat);
if (_rr <= 100)
    _new_type = 0;
if (_rr <= 20)
    _new_type = 1;
if (_rr <= 6)
    _new_type = 2;
if (_rr <= 1.5)
    _new_type = 3;
if (_rr <= 0.25)
    _new_type = 4;
if (_rr <= 0.01)
    _new_type = 5;
if (_rr <= 0.0003)
    _new_type = 6;
if (_rr <= 0.000005)
    _new_type = 7;
if (_new_type == 7 && chance >= 40)
{
    var _rr2 = random(100);
    if (_rr2 <= (1 * (chance - 40)))
        _new_type = 8;
}
type = _new_type;
