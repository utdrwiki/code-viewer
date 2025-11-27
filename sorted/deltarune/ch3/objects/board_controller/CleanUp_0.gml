if (variable_instance_exists(id, "crt_surface"))
{
    if (surface_exists(crt_surface))
        surface_free(crt_surface);
}
if (variable_instance_exists(id, "screen_surface"))
{
    if (surface_exists(screen_surface))
        surface_free(screen_surface);
}
if (room == room_board_dungeon_2 || room == room_board_dungeon_3)
    snd_free(global.currentsong[0]);
