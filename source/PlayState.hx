package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
import flixel.ui.FlxButton;

import openfl.Assets;


class PlayState extends FlxState
{
	private var map:FlxTilemap;

	override public function create():Void
	{
		super.create();
		map = new FlxTilemap();		
		map.loadMap(Assets.getText("assets/data/map1.csv"), "assets/images/tileset.png", 20,20,FlxTilemapAutoTiling.OFF,0,1,2);
		add(map);

		var player:FlxSprite = new FlxSprite(40,40);
		player.loadGraphic("assets/images/player1.png");
		add(player);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}	
}
