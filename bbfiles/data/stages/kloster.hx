import openfl.display.BlendMode;

function create()
{
    multiplyBeb.blend = BlendMode.MULTIPLY;
    multiply18.blend = BlendMode.MULTIPLY;
    supramultiply.blend = BlendMode.MULTIPLY;
    supramultiply.alpha = 0.6;
}

function postCreate()
{
    coolmultiply.blend = BlendMode.MULTIPLY;
    lampsadd.blend = BlendMode.ADD;
    add40.blend = BlendMode.ADD;
    add40.alpha = 0.4;
}