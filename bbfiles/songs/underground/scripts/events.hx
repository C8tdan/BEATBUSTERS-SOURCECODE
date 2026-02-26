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
            camGame.removeShader(blurShader);
            lightHandlerShader.brightness = -8;
            lightHandlerShader.contrast = 8;
            boyfriend.visible = true;
            dad.visible = true;
            camHUD.visible = true;
    }
}