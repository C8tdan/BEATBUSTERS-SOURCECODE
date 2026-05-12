import openfl.filters.ShaderFilter;

var bloomShader:FunkinShader;
var shader:CustomShader;

function postCreate()
{
    bloomShader = new FunkinShader(Assets.getText(Paths.fragShader("bloom")));
	camGame.addShader(bloomShader);

    shader = new CustomShader("lightHandlerShader");
    camGame.addShader(shader);

    FlxTween.num(0, -25, 155, {ease: FlxEase.circIn}, function(v:Float) {
                shader.hue = v;
            });
    FlxTween.num(0, -6, 155, {ease: FlxEase.circIn}, function(v:Float) {
        shader.contrast = v;
    });
}
