import openfl.display.BlendMode;
import flixel.util.FlxGradient;

var songLength:Float = 155;
var sky:FlxSprite;
var lightShader:CustomShader;
var lightShader2:CustomShader;
function create()
{
    lightShader = new CustomShader("lightHandlerShader");
    lightShader2 = new CustomShader("lightHandlerShader");
    camGame.addShader(lightShader2);
    sky.shader = lightShader;
    blueAdd.shader = lightShader;

    trace(songLength);

    doDaTweenShit();
}
function postCreate()
{
    buildings.blend = BlendMode.MULTIPLY;
    lightAdd.blend = BlendMode.ADD;
    shadowoverlay.blend = BlendMode.OVERLAY;
    blueAdd.blend = BlendMode.ADD;
}

function doDaTweenShit()
{
    FlxTween.tween(lights, {alpha: 1}, songLength, {ease: FlxEase.circIn});
    FlxTween.num(0, 120, songLength, {ease: FlxEase.circIn}, function(v:Float) {
                lightShader.hue = v;
            });
    FlxTween.num(0, -40, songLength, {ease: FlxEase.circIn}, function(v:Float) {
                lightShader.brightness = v;
            });
    FlxTween.num(0, -40, songLength, {ease: FlxEase.circIn}, function(v:Float) {
                lightShader.contrast = v;
            });
}