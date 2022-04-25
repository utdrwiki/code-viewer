scr_simultext = function(argument0) //gml_Script_scr_simultext
{
    __simulorder = 0
    if (argument0 == "kris")
        __simulorder = simulorderkri
    if (argument0 == "susie")
        __simulorder = simulordersus
    if (argument0 == "ralsei")
        __simulorder = simulorderral
    if (argument0 == "noelle")
        __simulorder = simulordernoe
    __yoffset = (__simulorder * 30)
    global.typer = 4
    battlewriter = instance_create((xx + 30), ((yy + 376) + __yoffset), obj_writer)
    return;
}

