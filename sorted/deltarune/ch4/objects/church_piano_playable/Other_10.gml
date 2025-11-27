if (con == 0 && buffer <= 0 && cantuse == false)
{
    if (!solved)
        progress = "";
    con = 0.1;
    if (!instance_exists(obj_tutorial_text))
        instance_create_depth(0, 0, 0, obj_tutorial_text);
}
