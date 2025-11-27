function scr_get_button_order()
{
    var _buttons = [];
    var _length = 0;
    if (global.is_console || obj_gamecontroller.gamepad_active)
    {
        var _switch = scr_is_switch_os();
        _buttons[0] = 32773;
        _buttons[1] = 32775;
        if (os_type == os_ps4 || os_type == os_ps5)
        {
            _buttons[2] = 32783;
            _buttons[3] = 32781;
            _buttons[4] = 32782;
            _buttons[5] = 32784;
            _buttons[6] = 32779;
        }
        else
        {
            _buttons[2] = 32779;
            _buttons[3] = 32783;
            _buttons[4] = 32781;
            _buttons[5] = 32782;
            _buttons[6] = 32784;
        }
        _buttons[7] = 32777;
        _buttons[8] = 32778;
        _buttons[9] = 32780;
        _buttons[10] = _switch ? 32772 : 32771;
        _buttons[11] = _switch ? 32770 : 32769;
        _buttons[12] = _switch ? 32771 : 32772;
        _buttons[13] = _switch ? 32769 : 32770;
        _buttons[14] = 32776;
        _buttons[15] = 32774;
        _length = 16;
    }
    else
    {
        _buttons = ["1", "Q", "S", "Z", 18, "2", "W", "S", "X", "3", "E", "D", "C", "4", "R", "F", "V", "5", "T", "G", "B", "6", "Y", "H", "N", "7", "U", "J", "M", "8", "I", "K", "9", "O", "L", "0", "P", 8, 37, 38, 40, 39];
    }
    return _buttons;
}
