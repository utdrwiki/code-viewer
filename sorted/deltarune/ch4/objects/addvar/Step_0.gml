if (i_ex(target))
{
    if (init == 0)
    {
        if (is_string(pointa))
            pointa = variable_instance_get(target, varname);
        init = 1;
    }
    var cont = 1;
    if (respectglobalinteract == true)
    {
        if (global.interact != 0)
            cont = 0;
    }
    if (cont)
        time++;
    var _value = variable_instance_get(target, varname);
    var _change = 0;
    if (easetype == 0)
    {
        _change = lerp(pointa, pointb, time / maxtime);
    }
    else
    {
        if (easeinout == "out")
            _change = lerp_ease_out(pointa, pointb, time / maxtime, easetype);
        if (easeinout == "in")
            _change = lerp_ease_in(pointa, pointb, time / maxtime, easetype);
        if (easeinout == "inout")
            _change = lerp_ease_inout(pointa, pointb, time / maxtime, easetype);
    }
    if (roundvar)
    {
        if (roundtype > 0)
            _change = ceil(_change);
        else if (roundtype < 0)
            _change = floor(_change);
        else
            _change = round(_change);
    }
    variable_instance_set(target, varname, _value + _change);
    if (time >= maxtime)
        instance_destroy();
}
else
{
    instance_destroy();
}
