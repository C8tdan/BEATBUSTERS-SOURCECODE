import openfl.filters.ShaderFilter;

var bloomShader:FunkinShader;

function postCreate()
{
    bloomShader = new FunkinShader(Assets.getText(Paths.fragShader("bloom")));
	camGame.addShader(bloomShader);
}
