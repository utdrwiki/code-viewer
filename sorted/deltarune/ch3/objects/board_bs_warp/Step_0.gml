buffer--;
if (buffer <= 0 && global.interact == 0 && con == 0)
{
    if (place_meeting(x, y, obj_mainchara_board))
    {
        player = instance_place(x, y, obj_mainchara_board);
        if (player.canfreemove == true)
        {
            player.canfreemove = false;
            global.interact = 1;
            buffer = 999;
            con = 1;
        }
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        player.visible = false;
        snd_play(snd_board_escaped);
    }
    if (timer == 15)
    {
        player.x = playX;
        player.y = playY;
        player.facing = 0;
        player.visible = true;
        player.canfreemove = true;
        global.interact = 0;
        buffer = 3;
        con = 0;
        timer = 0;
    }
}
