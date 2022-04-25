safe_delete = function(argument0) //gml_Script_safe_delete
{
    if i_ex(argument0)
    {
        with (argument0)
            instance_destroy()
    }
    return;
}

