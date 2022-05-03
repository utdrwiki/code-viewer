audio_stop_all()
global.lang_loaded = ""
if reload_textures
{
    var _tex_array = texturegroup_get_textures(("chapter_0" + string(chaptertoload_temp)))
    for (var i = 0; i < array_length(_tex_array); i++)
        texture_prefetch(_tex_array[i])
}
switch chaptertoload_temp
{
    case 1:
        room_goto(ROOM_INITIALIZE_ch1)
        break
    case 2:
        room_goto(ROOM_INITIALIZE)
        break
}

_tex_array = texturegroup_get_textures("chapter_select")
for (i = 0; i < array_length(_tex_array); i++)
    texture_flush(_tex_array[i])
