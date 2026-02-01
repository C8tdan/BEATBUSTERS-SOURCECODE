import flixel.group.FlxGroup;

var ghostSprites:FlxTypedGroup<FlxSprite>;
var ghostDistance:Float = 100;
var ghostDuration:Float = 1;
var ghostAlpha:Float = 0.6;

function onEvent(event) {
  if(event.event.name == "Ghost Trail onBeat")
  {
    var params:Array = event.event.params;

    ghostDistance = params[3];
    ghostDuration = params[4];
    ghostAlpha = params[2];

    createGhostTrail(dad, true);
    createGhostTrail(boyfriend, false);
  }
}

function createGhostTrail(character:Dynamic, moveLeft:Bool) {
    // Crea uno sprite ghost
    var ghost:FlxSprite = new FlxSprite(character.x, character.y);
    ghost.frames = character.frames;
    ghost.animation.copyFrom(character.animation);
    ghost.animation.frameName = character.animation.frameName; // Frame corrente
    
    // Copia le proprietà del personaggio
    ghost.scale.set(character.scale.x, character.scale.y);
    ghost.updateHitbox();
    ghost.offset.set(character.offset.x, character.offset.y);
    ghost.flipX = character.flipX;
    ghost.flipY = character.flipY;
    ghost.alpha = ghostAlpha;
    
    // Colore del personaggio (dalla health bar)
    if (character == dad) {
        ghost.color = FlxColor.BLACK;
    } else {
        ghost.color = FlxColor.BLACK;
    }
    
    // Posizione finale del movimento diagonale
    var targetX = ghost.x + (moveLeft ? -ghostDistance : ghostDistance);
    var targetY = ghost.y + ghostDistance; // Sempre verso il basso
    
    // Tween per il movimento diagonale
    FlxTween.tween(ghost, {x: targetX, y: targetY}, ghostDuration, {
        ease: FlxEase.quadOut,
        onComplete: function(t:FlxTween) {
            ghost.kill();
            ghost.destroy();
        }
    });
    
    // Tween per il fade out
    FlxTween.tween(ghost, {alpha: 0}, ghostDuration, {
        ease: FlxEase.quadOut
    });
}