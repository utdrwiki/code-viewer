if (!recording)
    return;
if (global.turntimer <= 0)
{
    recording = 0
    addIndex = 0
    return;
}
xpos[addIndex] = obj_heart.x
ypos[addIndex] = obj_heart.y
addIndex++
