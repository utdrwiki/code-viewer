function scr_buttons_swapped_ext()
{
    var _buttons = scr_get_button_order();
    var _length = array_length(_buttons);
    var _confirm_id = -2;
    var _cancel_id = -1;
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        for (var i = 0; i < _length; i++)
        {
            if (_confirm_id < 0 && global.button0 == _buttons[i])
            {
                _confirm_id = i;
                if (_cancel_id >= 0)
                    break;
            }
            else if (_cancel_id < 0 && global.button1 == _buttons[i])
            {
                _cancel_id = i;
                if (_confirm_id >= 0)
                    break;
            }
        }
    }
    else
    {
        for (var i = 0; i < _length; i++)
        {
            var _button = _buttons[i];
            if (is_string(_button))
                _button = ord(_button);
            if (_confirm_id < 0 && global.input_k[4] == _button)
            {
                _confirm_id = i;
                if (_cancel_id >= 0)
                    break;
            }
            else if (_cancel_id < 0 && global.input_k[5] == _button)
            {
                _cancel_id = i;
                if (_confirm_id >= 0)
                    break;
            }
        }
    }
    if (_confirm_id > _cancel_id)
        return true;
    else
        return false;
}
