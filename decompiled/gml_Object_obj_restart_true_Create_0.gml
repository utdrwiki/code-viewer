snd_free_all()
snd_free_all_ch1()
if instance_exists(obj_time_ch1)
{
    with (obj_time_ch1)
        instance_destroy()
}
if instance_exists(obj_border_controller)
{
    with (obj_border_controller)
        instance_destroy()
}
if instance_exists(obj_time)
{
    with (obj_time)
        instance_destroy()
}
if instance_exists(obj_debugcontroller_ch1)
{
    with (obj_debugcontroller_ch1)
        instance_destroy()
}
if instance_exists(obj_roomcontroller_ch1)
{
    with (obj_roomcontroller_ch1)
        instance_destroy()
}
if variable_global_exists("chapter")
{
    var flush_texture = 1
    if variable_global_exists("chapter_return")
        flush_texture = global.chapter != global.chapter_return
    if flush_texture
    {
        var _tex_array = texturegroup_get_textures(("chapter_0" + string(global.chapter)))
        for (var i = 0; i < array_length(_tex_array); i++)
            texture_flush(_tex_array[i])
    }
}
alarm[0] = 5
