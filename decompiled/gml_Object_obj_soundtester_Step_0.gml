if keyboard_check_pressed(vk_insert)
    room_goto_next()
var i = 0
mute = 0
if keyboard_check_pressed(ord("D"))
{
    file = "debug_soundlist.txt"
    myfileid = file_text_open_write(file)
    for (i = 0; i < soundtotal; i++)
    {
        file_text_write_string(myfileid, soundName[i])
        file_text_writeln(myfileid)
    }
    file_text_close(myfileid)
}
if keyboard_check(vk_down)
    moved++
if keyboard_check(vk_up)
    moved--
if keyboard_check(vk_right)
    moved += 15
if keyboard_check(vk_left)
    moved -= 15
if keyboard_check_pressed(vk_down)
    moved = 5
if keyboard_check_pressed(vk_up)
    moved = -5
if (auto == 1)
{
    moved += 0.5
    if (moved >= 5)
    {
        playsound = true
        mute = 1
    }
}
while (moved >= 5)
{
    current++
    moved -= 5
}
while (moved <= -5)
{
    current--
    moved += 5
}
if (current < 1)
    current = 1
if (current > (soundtotal - 1))
    current = (soundtotal - 1)
if keyboard_check_pressed(ord("Z"))
    playsound = true
if keyboard_check_pressed(ord("M"))
    mute = 1
if mute
{
    snd_free_all()
    snd_stop_all()
    mute = 0
}
if playsound
{
    playsound = false
    snd_play_pitch(soundNo[current], pitch)
}
if keyboard_check_pressed(ord("A"))
{
    if (auto == 0)
        auto = 1
    else
        auto = 0
}
if keyboard_check_pressed(ord("J"))
{
    checkstring = get_string("Enter index of sound to jump to sound. ex. snd_noise", "")
    checkaudio = asset_get_index(checkstring)
    if audio_exists(checkaudio)
        current = (checkaudio - firstsound)
}
if keyboard_check_pressed(vk_pageup)
    current = 1
if keyboard_check_pressed(vk_pagedown)
    current = (soundtotal - 1)
if keyboard_check_pressed(ord("U"))
    pitch += 0.1
if keyboard_check_pressed(ord("Y"))
    pitch -= 0.1
