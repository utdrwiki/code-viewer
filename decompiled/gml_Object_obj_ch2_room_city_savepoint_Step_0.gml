if (con == 10 && (!d_ex()))
{
    con = 50
    kknpc.sprite_index = spr_npc_kk_music
    snd_free(global.currentsong[0])
    global.currentsong[0] = snd_init("cybershop_christmas.ogg")
    global.currentsong[1] = mus_loop(global.currentsong[0])
}
