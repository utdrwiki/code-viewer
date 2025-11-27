var triggered = false;
if (place_meeting(x, y, obj_mainchara_board))
{
    var char = instance_place(x, y, obj_mainchara_board);
    if (char.name == "kris")
        triggered = true;
}
if (triggered == true && obj_board_camera.con == 0)
{
    if (audio_exists(playsound))
        snd_play(playsound);
    var targx = 1920;
    var targy = 1152;
    if (instance_place(targx + obj_board_camera.originX, targy + obj_board_camera.originY, obj_b3cactusflirt))
    {
        targx = 1952;
        targy = 1120;
    }
    with (obj_board_camera)
    {
        shift = "warp";
        warpx = other.warpx;
        warpy = other.warpy;
        playerX = targx;
        playerY = targy;
        global.interact = 1;
    }
}
