package sprites;

import flixel.FlxSprite;

class Player extends FlxSprite
{
	public function new(playerXml:Xml):Void
	{
		super();
		x = Std.parseInt(playerXml.get("x")) * Main.TILE_WIDTH;
		y = Std.parseInt(playerXml.get("y")) * Main.TILE_HEIGHT;
		loadGraphic("assets/images/player1.png");

	}
}
