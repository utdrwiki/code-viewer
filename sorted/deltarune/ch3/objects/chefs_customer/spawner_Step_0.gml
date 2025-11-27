var _wait = false;
with (obj_chefs_customer)
{
    if (alarm[0] > 0)
        _wait = true;
}
if (_wait)
{
    scr_pause_alarms();
    obj_chefs_customer.speed = 0;
}
