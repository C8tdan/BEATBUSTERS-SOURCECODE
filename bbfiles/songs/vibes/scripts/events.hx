var lightShader:CustomShader;

function postCreate()
{
    lightShader = new CustomShader("lightHandlerShader");
    camGame.addShader(lightShader);
}

function stepHit()
{
    switch(curStep)
    {
        case 64:
            FlxTween.num(0, -140, 0.3, {ease: FlxEase.circOut}, function(v:Float) {
                lightShader.hue = v;
            });
    }
}