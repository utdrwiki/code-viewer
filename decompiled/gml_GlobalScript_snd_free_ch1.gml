snd_free_ch1 = function(argument0) //gml_Script_snd_free_ch1
{
    if instance_exists(obj_astream_ch1)
    {
        _xstream = argument0
        obj_astream_ch1.bstream = _xstream
        with (obj_astream_ch1)
        {
            if (bstream == mystream)
                instance_destroy()
        }
    }
    return;
}

