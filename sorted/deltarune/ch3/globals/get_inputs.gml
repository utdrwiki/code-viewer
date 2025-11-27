function get_inputs(arg0)
{
    if (arg0)
    {
        key_left = left_h();
        key_right = right_h();
        key_up = up_h();
        key_down = down_h();
        press_left = left_p();
        press_right = right_p();
        press_up = up_p();
        press_down = down_p();
        vinput = key_down - key_up;
        hinput = key_right - key_left;
        press_jump = button2_p();
        key_jump = button2_h();
        press_attack = button1_p();
        key_attack = button1_h();
    }
    else
    {
        vinput = 0;
        hinput = 0;
        key_left = false;
        key_right = false;
        press_jump = false;
        key_jump = false;
        press_attack = false;
        key_attack = false;
    }
}
