package;

import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	var boton:FlxButton;
	override public function create():Void
	{
		super.create();
		boton = new FlxButton(0, 0, "Jugar", irJugar);
		boton.screenCenter();
		add(boton);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	private function irJugar():Void{
		FlxG.switchState(new PlayState());
	}
}
