function postCreate()
{
    for (strumLine in strumLines.members)
        if (strumLine.characters != null && strumLine.characters.length > 1)
            for (i in 1...strumLine.characters.length)
                strumLine.characters[i].visible = false;
}

function onEvent(e)
{
    if (e.event.name == "Change Character")
    {
        var params:Array = e.event.params;
        swapCharacter(params[0], params[1], params[2]);
    }
}

function swapCharacter(strum:String, index:String, isVisible:Bool)
{
    var strumToNumber:Int = Std.parseInt(strum);
    var indexToNum:Int = Std.parseInt(index);

    trace (strum, index, isVisible);

    if (isVisible)
        strumLines.members[strumToNumber].characters[indexToNum].visible = true;
    else
        strumLines.members[strumToNumber].characters[indexToNum].visible = false;
}