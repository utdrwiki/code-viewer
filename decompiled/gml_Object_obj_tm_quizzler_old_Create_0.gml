init = false
difficulty = 0
currentturn = 0
turns = 1
manualturns = 0
letters[0] = 0
turnspeed = 30
lastletter = -1
state = 0
timer = 0
voiceclips[0] = snd_tm_quiz_a
voiceclips[1] = snd_tm_quiz_b
voiceclips[2] = snd_tm_quiz_c
voiceclips[3] = snd_tm_quiz_d
canrepeat = 1
creator = obj_sneo_friedpipis
damage = -1
target = -1
animator = noone
if instance_exists(obj_tm_whip_animation)
    animator = obj_tm_whip_animation
else
{
    animator = instance_create(x, y, obj_tm_whip_animation)
    animator.visible = false
    animator.state = -1
}
nextdifficulty = 0
dojo = 0
restart = false
rounds = 0
