if (con == 0 && appearcon == 1)
{
    for (i = 0; i < 30; i += 1)
        global.msg[i] = mytext[i];
    charxoff = 0;
    if (char > 0)
        charxoff = 40;
    global.typer = 50;
    if (typeroverride > 0)
        global.typer = typeroverride;
    writer = instance_create(x + 35 + charxoff, y + 20, obj_writer);
    writer.depth = depth - 1;
    mytext_sizecheck = string_replace_all(mytext[0], "&", "#");
    width = (32 + string_width(string_hash_to_newline(mytext_sizecheck)) + charxoff + 35) * 2;
    height = 32 + string_height(string_hash_to_newline(mytext_sizecheck)) + 20;
    con = 1;
}
if (con == 1)
{
    if (destroytime > 0)
    {
        timer++;
        if (timer >= destroytime)
        {
            appearcon = 2;
            con = 2;
        }
    }
    if (!i_ex(writer))
    {
        appearcon = 2;
        con = 2;
    }
    if (appearcon == 2)
        safe_delete(writer);
}
