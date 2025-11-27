function snd_free_all()
{
    with (obj_astream)
        instance_destroy();
}

function sound_free_all()
{
    snd_free_all();
}
