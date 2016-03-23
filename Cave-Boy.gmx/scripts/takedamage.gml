///takedamage()

if state != hurtstate {
    audio_emitter_pitch (audio_em, 1.6);
    audio_emitter_gain (audio_em, 1.4);
    audio_play_sound_on (audio_em, aOuch, false, 8);
    
    image_blend = make_color_rgb (220, 150, 150);
    vspd = -12;
    hspd = sign (x - other.x) * 2;
    
    state = hurtstate;
    move(oSolid);
    if instance_exists (oPlayerStats) {
        oPlayerStats.hp -= 1;
    }
}
