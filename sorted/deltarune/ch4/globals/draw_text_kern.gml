function draw_text_kern(arg0, arg1, arg2, arg3)
{
    var tx = argument[0];
    var ty = argument[1];
    var txt = argument[2];
    var kern = argument[3];
    var tox = tx;
    for (var i = 1; i <= string_length(arg2); i += 1)
    {
        var ch = string_char_at(txt, i);
        if (ch == "\n" || ch == "#")
        {
            ty += string_height("|");
            tx = tox;
        }
        else
        {
            draw_text(tx, ty, ch);
            tx += string_width(ch);
            tx += kern;
        }
    }
}

function draw_text_kern_legend(arg0, arg1, arg2, arg3)
{
    var tx = argument[0];
    var ty = argument[1];
    var txt = argument[2];
    var kern = argument[3];
    var tox = tx;
    for (var i = 1; i <= string_length(arg2); i += 1)
    {
        var ch = string_char_at(txt, i);
        if (ch == "\n" || ch == "#")
        {
            ty += string_height("|");
            tx = tox;
        }
        else
        {
            var x_offset = 0;
            if (ch == "L")
                x_offset = 1;
            draw_text(tx + x_offset, ty, ch);
            tx += string_width(ch);
            tx += kern;
        }
    }
}
