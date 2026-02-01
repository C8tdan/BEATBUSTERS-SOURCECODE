function onNoteHit(event) {
    // Controlla se è il note type corretto
    if (event.noteType != "strumline 1 notes") return;
    
    // Controlla se ci sono abbastanza personaggi nella strumline
    if (event.characters == null || event.characters.length < 2) return;
    
    // IMPORTANTE: Previeni l'animazione di default per TUTTI i personaggi
    event.preventAnim();
    
    // Fai cantare SOLO il secondo personaggio (index 1)
    var secondChar = event.characters[0];
    if (secondChar != null) {
        secondChar.playSingAnim(event.direction, event.animSuffix);
    }
}

function onPlayerMiss(event) {
    // Controlla se la nota esiste e è del tipo corretto
    if (event.note == null || event.note.noteType != "strumline 1 notes") return;
    
    // Controlla se ci sono abbastanza personaggi
    if (event.characters == null || event.characters.length < 2) return;
    
    // IMPORTANTE: Previeni l'animazione di default per TUTTI i personaggi
    event.preventAnim();
    
    // Fai fare la miss animation SOLO al secondo personaggio (index 1)
    var secondChar = event.characters[0];
    if (secondChar != null) {
        secondChar.playSingAnim(event.direction, event.animSuffix, MISS, event.forceAnim);
        if (event.stunned) secondChar.stunned = true;
    }
}
