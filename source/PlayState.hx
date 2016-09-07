package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var nave1:Enemigo;
	private var nave:Personaje;
	private var balaDePers:Bala;
	override public function create():Void
	{
		super.create();
		
		nave = new Personaje(0, 130);
 		add(nave);
		balaDePers = new Bala();
		add(balaDePers);
		
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
		if (FlxG.keys.justPressed.SPACE) 
		{
			if (balaDePers.y == 1000 && balaDePers.x == 1000) 
			{
				balaDePers.Disparar(nave);
			}
		}
		if (balaDePers.y < 0) 
		{
			balaDePers.Posicionar();
		}
	}
}
