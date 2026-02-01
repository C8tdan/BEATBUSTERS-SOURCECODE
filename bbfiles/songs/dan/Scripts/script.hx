var bloomShader:CustomShader;
var lightHandler:CustomShader;

function postCreate()
{
    bloomShader = new CustomShader("bloom");
    lightHandler = new CustomShader("lightHandlerShader");
    camGame.addShader(bloomShader);
}