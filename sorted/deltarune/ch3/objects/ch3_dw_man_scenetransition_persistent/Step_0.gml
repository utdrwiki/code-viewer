if (scr_debug())
{
    if (keyboard_check_pressed(ord("M")) || keyboard_check_pressed(ord("R")) || keyboard_check_pressed(ord("L")))
        instance_destroy();
}
