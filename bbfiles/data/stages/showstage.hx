import openfl.display.BlendMode;
import flixel.tweens.FlxTweenType;

var blur:CustomShader;
var lightShader:CustomShader;

function postCreate()
{
    blur = new CustomShader("gaussianBlur");
    lightShader = new CustomShader("lightHandlerShader");
    curtain1.shader = blur;
    curtain2.shader = blur;
    oppShadow.blend = BlendMode.MULTIPLY;
    bfShadow.blend = BlendMode.MULTIPLY;
    micShadow.blend = BlendMode.MULTIPLY;
    camGame.addShader(lightShader);
    lightingAdjustment(0, -20, 1);
}

function lightingAdjustment(highValue:Float, lowValue:Float, speedMultiplier:Float)
{
    FlxTween.num(highValue, lowValue, (6 * speedMultiplier), {ease: FlxEase.sineInOut, type: FlxTweenType.PINGPONG}, function(v:Float) {
                lightShader.brightness = v;
            });
}