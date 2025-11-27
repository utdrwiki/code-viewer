function scr_addvar()
{
    if (argument_count < 6)
        ___lerpvar = scr_addvar_instance(id, argument[0], argument[1], argument[2], argument[3]);
    else
        ___lerpvar = scr_addvar_instance(id, argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
    return ___lerpvar;
}

function scr_addvar_respect()
{
    if (argument_count < 6)
        ___lerpvar = scr_addvar_instance(id, argument[0], argument[1], argument[2], argument[3]);
    else
        ___lerpvar = scr_addvar_instance(id, argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
    ___lerpvar.respectglobalinteract = true;
    return ___lerpvar;
}
