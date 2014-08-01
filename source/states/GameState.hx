package states;

import flixel.input.keyboard.FlxKey;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;

import shalmezad.flxplus.FlxShadowText;

class GameState extends FlxState
{

  private var gold:Int = 0;
  private var exp:Int = 0;
  private var level:Int = 1;

  private var goldText:FlxShadowText;
  private var expText:FlxShadowText;
  private var lvlText:FlxShadowText;

  override public function create():Void
  {
    super.create();
    goldText = new FlxShadowText(20,20,200, "Gold: 0");
    expText = new FlxShadowText(20,30,200, "Exp: 0/1");
    lvlText = new FlxShadowText(20,40,200, "Lvl: 1");
    add(goldText);
    add(expText);
    add(lvlText);
  }

  override public function update():Void
  {
    super.update();
    level = expToLevel(exp);
    checkInput();
    updateGui();
  }

  private function updateGui():Void
  {
    goldText.text = "Gold: " + gold;
    expText.text = "Exp: " + exp + "/" + levelToExp(level);
    lvlText.text = "Lvl: " + level;
  }

  private function expToLevel(exp:Int):Int
  {
    var l:Int = 0;
    while(levelToExp(l) <= exp)
    {
      l++;
    }
    return l;
  }

  private function levelToExp(level:Int):Int
  {
    //it's fibinnocci
    var a:Int = 1;
    var b:Int = 1;
    var c:Int = 2;
    for(i in 0...level)
    {
      c = a+b;
      a = b;
      b = c;
    } 
    return c;
  }

  private function checkInput():Void
  {
    if(FlxG.mouse.justReleased || FlxG.keys.firstJustReleased() != FlxKey.NONE)
    {
      onAction();
    }
  }

  private function onAction():Void
  {
  }

}
