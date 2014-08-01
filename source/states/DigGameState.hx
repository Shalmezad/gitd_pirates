package states;

import sprites.Player;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
import flixel.FlxSprite;
import flixel.tile.FlxTilemap;

class DigGameState extends GameState
{
  private var walls:FlxTilemap;
  private var player:Player;

  private var depth:Int = 0;


  override public function create():Void
  {
    walls = new FlxTilemap();
    var mapString:String = "";
    var i:Int = 0;
    var j:Int = 0;
    while(i<14)
    {
      if(i!=0)
      {
        mapString += "\n";
      }
      j = 0;
      while(j<20)
      {
        if(j!=0)
        {
          mapString += ",";
        }
        if(j > 3 && j < 11)
        {
          mapString += "2";
        }
        else
        {
          mapString += "1";
        }
        j++;
      }
      i++;
    }
    //sand_tile1.png
    walls.loadMap(mapString,"assets/images/sand_tile1.png",20,20);
    add(walls);
    //digger is 20x25
    player = new Player();
    add(player);
    super.create();
  }

  override public function onAction():Void
  {
    super.onAction();
    walls.y --;
    if(walls.y <= -20)
    {
      walls.y += 20;
    }
    player.dig();
    depth++;
    exp++;
  }

}
