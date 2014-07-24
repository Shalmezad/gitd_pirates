package states;

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
	private static var TILE_WIDTH:Int = 20;
	private static var TILE_HEIGHT:Int = 20;

	private static var MAP_DATA:Xml = null;

	private var currentMap:Xml = null;
	private var map:FlxTilemap;

	override public function create():Void
	{
		super.create();
		if(MAP_DATA == null)
		{
				MAP_DATA = Xml.parse(Assets.getText("assets/data/maps.xml"));
		}
		for(m in MAP_DATA.firstElement().elements())
		{
			if(m.get("id") == Std.string(1))
			{
				currentMap = m;
			}
		}
		map = new FlxTilemap();		
		map.loadMap(currentMap.get("data"), "assets/images/tileset.png", TILE_WIDTH,TILE_HEIGHT,FlxTilemapAutoTiling.OFF,0,1,2);
		add(map);

		var player:FlxSprite = new FlxSprite();
		player.x = Std.parseInt(currentMap.elementsNamed("player").next().get("x")) * TILE_WIDTH;
		player.y = Std.parseInt(currentMap.elementsNamed("player").next().get("y")) * TILE_HEIGHT;
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






























