init = false;
custom_sprite = -4;
bg_surface = -4;
mode = 0;
sprite_mask = -4;
sprite_x_offset = 0;
sprite_y_offset = 0;
sprite_string = [];
text_x_offset = 0;
text_y_offset = 0;
text_alignment = "center";

initialize_sprite = function(arg0, arg1 = 0, arg2 = 0)
{
    mode = 0;
    sprite_mask = arg0;
    sprite_x_offset = arg1;
    sprite_y_offset = arg2;
    init = true;
};

initialize_text = function(arg0, arg1, arg2)
{
    mode = 1;
    sprite_string = string_split(arg0[0], "#", false, 99);
    text_alignment = arg0[1];
    text_x_offset = arg1;
    text_y_offset = arg2;
    init = true;
};
