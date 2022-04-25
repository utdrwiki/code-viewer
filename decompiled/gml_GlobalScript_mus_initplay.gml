mus_initplay = function(argument0) //gml_Script_mus_initplay
{
    global.currentsong[0] = snd_init(argument0)
    global.currentsong[1] = mus_play(global.currentsong[0])
    return;
}

