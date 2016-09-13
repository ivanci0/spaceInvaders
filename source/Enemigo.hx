package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.tweens.FlxTween;
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
 	private var velocidad:Int;
	private var elTimer:FlxTimer = new FlxTimer();
	private var reloj:Int = 2;
	public function new(?X:Float=0, ?Y:Float=0){
		super(X, Y);
	    elTimer.start(1, Move, 0);
		loadGraphic(AssetPaths.singlecat__png, true, 16, 16);
		animation.add("mov", [0], 10, false);
		animation.add("mov2", [1], 10, false);
		animation.add("morir", [2, 3, 4, 5], 10, false);
  		thebadguyY = 4;
 		velocidad = 4;
	}
	
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
	}
	override public function kill():Void{
		alive = false;
		FlxTween.tween(this, {}, .33, {onStart: Muriendo, onComplete: finishKill });
	}
	public function Muriendo(_):Void{
		animation.play("morir");
	}
	public function finishKill(_):Void{
		exists = false;
	}
	public function Move(timer:FlxTimer):Void {
		if (alive){
			if (reloj%2==0){
				animation.play("mov");
				reloj++;
			}
			else{
				animation.play("mov2");
				reloj--;
			}
			if (Reg.movementModifier == true){
				x += velocidad;
			}
			if (Reg.movementModifier == false){
				x -= velocidad;
			}
		}
  	}
	public function getX():Void{
		
	}
}