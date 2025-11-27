function scr_tennashouter()
{
    safe_delete(obj_ch3_tennashouter);
    safe_delete(obj_ch3_tennashouter_alt);
    var tennadialoguer = instance_create(0, 0, obj_ch3_tennashouter_alt);
    tennadialoguer.mystring = argument0;
    if (argument_count > 1)
        tennadialoguer.customlife = argument1;
    if (argument_count > 2)
        tennadialoguer.preset = argument2;
    if (argument_count > 3)
        tennadialoguer.tcustanimrate = argument3;
    if (argument_count > 4)
        tennadialoguer.skippable = argument4;
    return tennadialoguer;
}
