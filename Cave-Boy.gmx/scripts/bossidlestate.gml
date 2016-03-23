///bossidlestate()
image_index = 0
var dis = point_distance (x, y, oPlayer.x, oPlayer.y);

if dis <= 128 {
    state = bossliftstate;
    if !audio_is_playing (aTrackOne) {
        audio_emitter_gain (audio_em, 0.5);
        audio_play_sound_on (audio_em, aBoss, true, 10)
        }
}
