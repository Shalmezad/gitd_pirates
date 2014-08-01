package sprites;

import flixel.FlxSprite;

class Player extends FlxSprite
{
    public function new():Void
	{
		super();
		loadGraphic("assets/images/digger.png",true, 20,25);
        this.animation.add("dig", [0,1,2,3],5,false);
	}

    public function dig()
    {
        this.animation.play("dig");
    }
}
