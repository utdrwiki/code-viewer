if (just_created)
{
    just_created = false;
    exit;
}
if (keyboard_check_pressed(vk_down))
    mode++;
if (keyboard_check_pressed(vk_up))
    mode--;
if (mode < 0)
    mode += 5;
if (mode > 4)
    mode -= 5;
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || button1_p())
{
    start(mode);
    exit;
}
if (keyboard_check_pressed(vk_numpad0) || keyboard_check_pressed(ord("0")))
{
    start(0);
    exit;
}
if (keyboard_check_pressed(vk_numpad1) || keyboard_check_pressed(ord("1")))
{
    start(1);
    exit;
}
if (keyboard_check_pressed(vk_numpad2) || keyboard_check_pressed(ord("2")))
{
    start(2);
    exit;
}
if (keyboard_check_pressed(vk_numpad3) || keyboard_check_pressed(ord("3")))
{
    start(3);
    exit;
}
if (keyboard_check_pressed(vk_numpad4) || keyboard_check_pressed(ord("4")))
{
    start(4);
    exit;
}
if (mouse_check_button_pressed(mb_left))
{
    for (a = 0; a < 5; a++)
    {
        if (point_in_rectangle(mouse_x, mouse_y, 40, 35 + (20 * a), 40 + string_width(name[a]), 45 + (20 * a) + (string_height(name[a]) * 0.75)))
        {
            if (mode == a)
                start(a);
            else
                mode = a;
            exit;
        }
    }
}
