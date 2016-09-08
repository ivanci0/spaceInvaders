package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Bala extends FlxSprite
{
	private var posicionada:Bool;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(1, 1);
		Posicionar();
	}
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
	}
	public function Disparar(personaje:Personaje):Void{
		y = personaje.y;
		x = personaje.x;
		velocity.y = -100;
		posicionada = false;
	}
	public function DispararEnemigo(enemigo:Enemigo):Void{
		y = enemigo.y;
		x = enemigo.x;
		velocity.y = 50;
	}
	public function Posicionar():Void{
		x = 1000;
		y = 1000;
		velocity.y = 0;
		posicionada = true;
	}
	public function getPosicionada():Bool{
		return posicionada;
	}
}