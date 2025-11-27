mycam = instance_create(x, y, obj_camera_advanced);
with (mycam)
{
    cameraActive = 0;
    ignoreFreeze = 1;
    panStyle[0] = 1;
    targetObject[0] = 1049;
    targetObjectCenter[0] = 1;
    targetXRelative[0] = 0;
    targetYRelative[0] = 0;
}
if (botY == 0)
    botY = room_height - sprite_height - 20;
init = 2;
