import openfl.display.BlendMode;

var lightHandlerShader:CustomShader;
var blurShader:CustomShader;

function create()
{
    introLength = 0;

    lightHandlerShader = new CustomShader("lightHandlerShader");
    blurShader = new CustomShader("blur");
    camGame.addShader(blurShader);
    camGame.addShader(lightHandlerShader);
    camHUD.visible = false;
    boyfriend.visible = false;
    dad.visible = false;
}

function stepHit()
{
    switch(curStep)
    {
        case 112:
            FlxTween.num(0.0, -20.0, (Conductor.stepCrochet * 16 / 1000), {ease: FlxEase.circIn}, function(v:Float) {
                lightHandlerShader.brightness = v;
            });
            FlxTween.num(0.0, 20.0, (Conductor.stepCrochet * 16 / 1000), {ease: FlxEase.circIn}, function(v:Float) {
                lightHandlerShader.contrast = v;
            });
            FlxTween.num(0.0, 10.0, (Conductor.stepCrochet * 16 / 1000), {ease: FlxEase.circIn}, function(v:Float) {
                blurShader.focusPower = v;
            });
        case 128:
            setBackroomsBlends();
            camGame.removeShader(blurShader);
            lightHandlerShader.brightness = -8;
            lightHandlerShader.contrast = 8;
            boyfriend.visible = true;
            dad.visible = true;
            camHUD.visible = true;
    }
}

function setBackroomsBlends()
{
    var multiply = stage.getSprite("multiply");
    var add = stage.getSprite("add");
    var multiply2 = stage.getSprite("multiply2");
    var multiply3 = stage.getSprite("multiply3");

    multiply.blend = BlendMode.MULTIPLY;
    add.blend = BlendMode.ADD;
    multiply2.blend = BlendMode.MULTIPLY;
    multiply3.blend = BlendMode.MULTIPLY;
}