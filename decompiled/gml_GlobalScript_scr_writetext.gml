scr_writetext = function(argument0, argument1, argument2, argument3) //gml_Script_scr_writetext
{
    global.fc = 0
    global.msc = argument0
    if (argument1 != "x")
        global.msg[0] = argument1
    if (argument2 != 0)
        global.fc = argument2
    global.typer = 5
    if (argument3 != 0)
        global.typer = argument3
    instance_create(0, 0, obj_dialoguer)
    return;
}

