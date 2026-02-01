var lightShader:CustomShader;

function create()
{
    lightShader = new CustomShader("lightHandlerShader");
    lightShader.brightness = -60;
    lightShader.contrast = -45;
    camGame.addShader(lightShader);
}

function stepHit(curStep)
{
    switch(curStep)
    {
        case 272:
            FlxTween.num(-60, 0, 0.5, {ease: FlxEase.circOut}, function(v:Float) {
                lightShader.brightness = v;
            });
            FlxTween.num(-45, 0, 0.5, {ease: FlxEase.circOut}, function(v:Float) {
                lightShader.contrast = v;
            });

        case 275:
            camGame.removeShader(lightShader);
    }
}