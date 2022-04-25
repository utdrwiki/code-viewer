depth = 999990
puzzleSize = (60 * image_xscale)
setupComplete = 0
goalCheck = 1
goalHit = 0
image_index = 0
image_speed = 0
finalGlow = 0
insideOnly = 1
if (room == room_dw_mansion_darkbulb_1)
{
    if (global.plot >= 105)
    {
        goalHit = 1
        finalGlow = 0.7
    }
}
if (room == room_dw_mansion_darkbulb_2)
{
    if (global.plot >= 110)
    {
        goalHit = 1
        finalGlow = 0.7
    }
}
if (room == room_dw_mansion_darkbulb_3)
{
    if (global.plot >= 115)
    {
        goalHit = 1
        finalGlow = 0.7
    }
}
inUse = 0
instructionLerp = 0
