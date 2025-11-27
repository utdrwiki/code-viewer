if (is_pressed || global.interact == 1)
    exit;
var _pressed = false;
if (i_ex(obj_mainchara) && place_meeting(x, y, obj_mainchara))
    _pressed = true;
if (_pressed)
    press_button();
