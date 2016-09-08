package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Personaje extends FlxSprite
{
	private var balaPersonaje:Bala;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(5, 5);
		balaPersonaje = new Bala();
	}
	
	override public function update(elapsed:Float):Void
 	{
 		super.update(elapsed);
 		
 		if (FlxG.keys.pressed.RIGHT)
 		{
 		if (x <= 155)
 			x += 2;
 		}
 			
 		if (FlxG.keys.pressed.LEFT)
 		{
 			if(x >= 0)
 			x -= 2;
 		}
		if (FlxG.keys.justPressed.SPACE) 
		{
			if (balaPersonaje.getPosicionada() == true) 
			{
				balaPersonaje.Disparar(this);
			}
		}
		if (balaPersonaje.y < 0) 
		{
			balaPersonaje.Posicionar();
		}
 	}
	public function getBala(){
		return balaPersonaje;
	}
}

//para pruebas
		/*if (FlxG.keys.pressed.UP)
 		{
 			if(y >= 0)
 			y -= 2;
 		}
		if (FlxG.keys.pressed.DOWN)
 		{
 			if(y >= 0)
 			y += 2;
 		}*/