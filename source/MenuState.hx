package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
<<<<<<< HEAD
import sprites.Personaje;

class MenuState extends FlxState
{
	private var nave:Personaje;
	
    override public function create():Void 
	{
		super.create();
		
		nave = new Personaje(0, 130);
		add(nave);
	}

    override public function update(elapsed:Float):Void
	{
	    super.update(elapsed);
=======

class MenuState extends FlxState
{
	
	
	override public function create():Void
	{
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
>>>>>>> origin/master
	}
}
