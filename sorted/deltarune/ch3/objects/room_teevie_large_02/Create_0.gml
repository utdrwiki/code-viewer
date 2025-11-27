if (scr_debug() && global.tempflag[90] == -1)
{
    with (obj_mainchara)
        setxy(900, 1080);
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            setxy(798, 1080);
        if (name == "ralsei")
            setxy(706, 1080);
        scr_caterpillar_interpolate();
    }
}
con = (scr_flag_get(1235) == 0) ? 0 : -1;
customcon = 0;
camera_pan = false;
camera_pan_timer = 0;
camera_pan_back = false;
camera_x_pos = 0;
employees = [];
move_employees = false;
employees_state = "unhappy";
current_employees_state = employees_state;
joyful_index = 0;
var tv_screen_01 = instance_create(0, 0, obj_dw_teevie_tv_screens);
with (tv_screen_01)
{
    x = 410;
    y = 40;
    width = 3;
    height = 3;
    depth = 1000150;
    tvbasesprite = spr_dw_teevie_tv_base;
}
var tv_screen_02 = instance_create(0, 0, obj_dw_teevie_tv_screens);
with (tv_screen_02)
{
    x = 690;
    y = 40;
    width = 3;
    height = 3;
    depth = 1000150;
    tvbasesprite = spr_dw_teevie_tv_base;
}
var quiz_controller_01 = instance_create(0, 0, obj_dw_ch3_teevie_quiz_controller);
with (quiz_controller_01)
{
    depth = 1000000;
    init_quiz("A", 440, 440, 1131);
}
var quiz_controller_02 = instance_create(0, 0, obj_dw_ch3_teevie_quiz_controller);
with (quiz_controller_02)
{
    depth = 1000100;
    init_quiz("B", 440, 840, 1132);
}

create_employees = function()
{
    employees = [];
    var _offset = 40;
    for (var i = 0; i < 6; i++)
    {
        var x_offset = ((i % 2) == 1) ? 0 : 10;
        var y_offset = ((i % 2) == 1) ? 40 : 0;
        var _zapper = instance_create(1900 + (i * 70) + x_offset + _offset, 960 + (i * 10) + y_offset, obj_dw_teevie_employee);
        with (_zapper)
        {
            init("zapper");
            unhappy();
            scr_depth();
        }
        employees[array_length(employees)] = _zapper;
    }
    for (var i = 0; i < 6; i++)
    {
        if (joyful_index == 0)
            joyful_index = array_length(employees);
        var x_offset = ((i % 2) == 1) ? 0 : 10;
        var y_offset = ((i % 2) == 1) ? 40 : 0;
        var _shadow = instance_create(1840 + (i * 80) + x_offset + _offset, (1040 - (i * 10)) + y_offset, obj_dw_teevie_employee);
        with (_shadow)
        {
            init("shadowman");
            unhappy();
            scr_depth();
        }
        employees[array_length(employees)] = _shadow;
    }
    for (var i = 0; i < 6; i++)
    {
        var x_offset = ((i % 2) == 1) ? 0 : 10;
        var y_offset = ((i % 2) == 1) ? 40 : 0;
        var _pippins = instance_create(1840 + (i * 60) + x_offset + _offset, 1020 + y_offset + (i * 5), obj_dw_teevie_employee);
        with (_pippins)
        {
            init("pippins");
            unhappy();
            scr_depth();
        }
        employees[array_length(employees)] = _pippins;
    }
    var _shadow_marker = instance_create(2010, 1040, obj_dw_teevie_employee);
    with (_shadow_marker)
    {
        init("shadowman");
        unhappy();
        scr_depth();
    }
    employees[array_length(employees)] = _shadow_marker;
    _shadow_marker = instance_create(2080, 1050, obj_dw_teevie_employee);
    with (_shadow_marker)
    {
        init("shadowman");
        unhappy();
        scr_depth();
    }
    employees[array_length(employees)] = _shadow_marker;
};

clean_up = function()
{
    var i = array_length(employees) - 1;
    while (i >= 0)
    {
        with (employees[i])
            instance_destroy();
        i--;
    }
    employees = [];
};
