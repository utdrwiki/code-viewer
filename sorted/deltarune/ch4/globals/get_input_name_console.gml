function scr_get_input_name_console(arg0)
{
    var _control = arg0;
    var _input_name = "?";
    switch (_control)
    {
        case gp_padr:
            _input_name = "\\*D  ";
            break;
        case gp_padl:
            _input_name = "\\*A  ";
            break;
        case gp_padu:
            _input_name = "\\*W  ";
            break;
        case gp_padd:
            _input_name = "\\*S  ";
            break;
        case global.button0:
            _input_name = "\\*Z  ";
            break;
        case global.button1:
            _input_name = "\\*X  ";
            break;
        case global.button2:
            _input_name = "\\*C  ";
            break;
        case gp_shoulderl:
            _input_name = "\\*l  ";
            break;
        case gp_shoulderlb:
            _input_name = "\\*L  ";
            break;
        case gp_shoulderr:
            _input_name = "\\*r  ";
            break;
        case gp_shoulderrb:
            _input_name = "\\*R  ";
            break;
        case gp_stickl:
            _input_name = "\\*j  ";
            break;
        case gp_stickr:
            _input_name = "\\*J  ";
            break;
    }
    return _input_name;
}
