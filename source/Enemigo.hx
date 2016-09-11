package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class Enemigo extends FlxSprite
{
	private var thebadguyX:Int;
  	private var thebadguyY:Int;
  	private var thebadguyModifier:Bool;
 	private var equalizer:Int;
	private var elTimer:FlxTimer = new FlxTimer();
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		elTimer.start(1, Move, 0);
		loadGraphic(AssetPaths.singlecat__png, true, 16, 16);
		animation.add("mov", [0, 1], 10, false);
  		thebadguyY = 8;
 		equalizer = 4;
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
	public function Move(timer:FlxTimer):Void{
		if (alive) 
		{
			animation.play("mov");
			if (Reg.movementModifier == true){
				x += equalizer;
				y = Reg.superejeY;
			}
			if (Reg.movementModifier == false){
				x -= equalizer;
				y = Reg.superejeY;
			}
			if (x >= 155){
				Reg.movementModifier = false;
				Reg.superejeY += thebadguyY;
			}
			if (x == equalizer){
				Reg.movementModifier = true;
				Reg.superejeY += thebadguyY;
			}
		}
  	}
	
}