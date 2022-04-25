snd_init_ch1 = function(argument0) //gml_Script_snd_init_ch1
{
    initsongvar = ("mus/" + argument0)
    _mystream = audio_create_stream(initsongvar)
    _astream = instance_create_ch1(0, 0, obj_astream_ch1)
    _astream.mystream = _mystream
    return _mystream;
}

