package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import sprites.Enemigo;



class PlayState extends FlxState
{
	private var nave1:Enemigo;
	
	override public function create():Void
	{
		super.create();
		
		nave1 = new Enemigo(40, 10);
		nave1.velocity.y = 100;
		
		add(nave1);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (nave1.y > FlxG.height-nave1.height)
		{
			remove(nave1);
			nave1.destroy();
			
		}
		
	}
}
