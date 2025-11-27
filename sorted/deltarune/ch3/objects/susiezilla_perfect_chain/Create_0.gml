letters1 = stringsetloc("PERFECT", "obj_susiezilla_perfect_chain_slash_Create_0_gml_1_0");
letters2 = stringsetloc("CHAIN", "obj_susiezilla_perfect_chain_slash_Create_0_gml_2_0");
letters1_length = string_length(letters1);
midlength1 = (letters1_length + 1) / 2;
letters2_length = string_length(letters2);
midlength2 = (letters2_length + 1) / 2;
maxlength = max(letters1_length, letters2_length);
timer = 0;
xoff = x - camerax();
yoff = y - cameray();

create_letter = function(arg0, arg1, arg2)
{
    var xdiff = arg1 - x;
    var ydiff = arg2 - y;
    with (instance_create_depth(arg1, arg2, depth, obj_susiezilla_perfect_chain_letter))
    {
        display_x = other.xoff + xdiff;
        display_y = other.yoff + ydiff;
        color = c_yellow;
        letter = arg0;
    }
};
