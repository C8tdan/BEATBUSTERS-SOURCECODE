import openfl.display.BlendMode;
import flixel.tweens.FlxTweenType;

importScript('data/scripts/dropshadow-effect');

// Ogni gruppo lampada è rappresentato come { sprites, pivotX, pivotY, originalPositions }
var lampGroups:Array<Dynamic> = [];
var lightShader:CustomShader;
var characterShader:CustomShader;

function create()
{
    lampGroups = [
        initLampGroup([lightslightadd, lamp, lightadd],    lamp),
        initLampGroup([lightslightadd2, lamp2, lightadd2], lamp2)
    ];

    startLampOscillation(lampGroups[0], 0, 3, 2.5, 0.0);
    startLampOscillation(lampGroups[1],  0, 3, 2.5, 1);
}

// baseAngle: angolo di riposo | swing: ampiezza oscillazione
// duration: secondi per mezza oscillazione | startDelay: ritardo iniziale
function startLampOscillation(group:Dynamic, baseAngle:Float, swing:Float, duration:Float, startDelay:Float)
{
    FlxTween.num(baseAngle - swing, baseAngle + swing, duration,
    {
        type:      FlxTweenType.PINGPONG,
        ease:      FlxEase.sineInOut,
        startDelay: startDelay
    },
    function(v:Float) { rotateLampGroup(group, v); });
}

function initLampGroup(sprites:Array<FlxSprite>, pivotSprite:FlxSprite):Dynamic
{
    var positions:Array<FlxPoint> = [];
    for (sprite in sprites)
    {
        positions.push(FlxPoint.get(
            sprite.x + sprite.width  / 2,
            sprite.y + sprite.height / 2
        ));
    }

    return {
        sprites:   sprites,
        pivotX:    pivotSprite.x + pivotSprite.width / 2,
        pivotY:    pivotSprite.y,
        originals: positions
    };
}

function rotateLampGroup(group:Dynamic, angle:Float)
{
    var rad = angle * (Math.PI / 180);
    var cos = Math.cos(rad);
    var sin = Math.sin(rad);

    for (i in 0...group.sprites.length)
    {
        var sprite:FlxSprite = group.sprites[i];
        var orig:FlxPoint    = group.originals[i];

        var dx = orig.x - group.pivotX;
        var dy = orig.y - group.pivotY;

        sprite.x     = group.pivotX + (dx * cos - dy * sin) - sprite.width  / 2;
        sprite.y     = group.pivotY + (dx * sin + dy * cos) - sprite.height / 2;
        sprite.angle = angle;
    }
}

function lightingAdjustment(highValue:Float, lowValue:Float, speedMultiplier:Float)
{
    FlxTween.num(highValue, lowValue, (6 * speedMultiplier), {ease: FlxEase.sineInOut, type: FlxTweenType.PINGPONG}, function(v:Float) {
                lightShader.brightness = v;
                lightShader.contrast = (-v - 5);
                if (lightShader.contrast < 0) lightShader.contrast = 0;
            });
}

function lightTweens(speed:Float)
{
    FlxTween.num(1, 0.5, speed, {ease: FlxEase.sineInOut, type: FlxTweenType.PINGPONG}, function(v:Float) {
                backadd.alpha = v;
                lightslightadd.alpha = v + 0.3;
                lightslightadd2.alpha = v - 0.1;
                frontlightadd.alpha = v;
            });
}

function postCreate()
{
    lightShader = new CustomShader("lightHandlerShader");
    characterShader = new CustomShader("lightHandlerShader");
    camGame.addShader(lightShader);

    backadd.blend        = BlendMode.ADD;
    lightslightadd.blend = BlendMode.ADD;
    lightadd.blend       = BlendMode.ADD;
    lightslightadd2.blend = BlendMode.ADD;
    lightadd2.blend      = BlendMode.ADD;
    frontmultiply.blend  = BlendMode.MULTIPLY;
    frontlightadd.blend  = BlendMode.ADD;

    boyfriend.shader = characterShader;
    dad.shader = characterShader;
    characterShader.brightness = -10;
    characterShader.contrast = 5;
    characterShader.saturation = 6;

    lightingAdjustment(0, -10, 1);
    lightTweens(6);
}