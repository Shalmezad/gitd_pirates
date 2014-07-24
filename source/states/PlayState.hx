package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
import flixel.ui.FlxButton;

import openfl.Assets;

import sprites.Player;

class PlayState extends FlxState
{
	private static var MAP_DATA:Xml = null;

	private var currentMap:Xml = null;
	private var map:FlxTilemap;
	private var player:Player;

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
		map.loadMap(currentMap.get("data"), "assets/images/tileset.png", Main.TILE_WIDTH, Main.TILE_HEIGHT,FlxTilemapAutoTiling.OFF,0,1,2);
		add(map);

		player = new Player(currentMap.elementsNamed("player").next());
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






























