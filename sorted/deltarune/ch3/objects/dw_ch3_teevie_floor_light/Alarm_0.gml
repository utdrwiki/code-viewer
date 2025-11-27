if (_is_paused)
    exit;
if (_is_active)
{
    _is_active = false;
    turn_off();
}
else
{
    _is_active = true;
    turn_on();
}
alarm[0] = 30;
