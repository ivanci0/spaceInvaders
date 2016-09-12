package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author ...
 */
class Bala extends FlxSprite
{
	private var posicionada:Bool;//mismo uso que alive de personaje
	private var velocidad:Int = 100;//la velocidad que va a tener
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.tenedor__png, false, 5, 10);
		//kill();
		Posicionar();
	}
	override public function update(elapsed:Float):Void{
		seVa();
		super.update(elapsed);
	}
	public function salirDisparada(?personaje:Personaje = null, ?enemigo:Enemigo = null):Void{// no se pudo hacer una sobrecarga asi que se soluciono asi
		if (personaje != null){
			y = personaje.y + personaje.height / 2;//ubica la posicion en el centro de quien la dispara
			x = personaje.x + personaje.width / 2;
			velocity.y = -velocidad;// sale disparada
		}
		else if (enemigo != null){//lo mismo pero para el enemigo
			y = enemigo.y + enemigo.height / 2;
			x = enemigo.x + enemigo.width / 2;
			velocity.y = velocidad / 2;
		}
		posicionada = false; //queda en false
	}
	public function Posicionar():Void{
		x = 1000;
		y = 1000;
		velocity.y = 0;
		posicionada = true;
	}
	/*override public function kill():Void{
		alive = false;
		FlxTween.tween(this, { }, 0, { onComplete: finishKill });
	}
	public function finishKill(_):Void{
		exists = false;
	}
	override public function revive(?personaje:Personaje = null, ?enemigo:Enemigo = null):Void 
	{
		salirDisparada(personaje,enemigo);
		super.revive();
	}*/
	public function getPosicionada():Bool{// porsi, no se como quiero usar el kill revive aca.... es lo mismo...
		return posicionada;
	}
	public function seVa():Void{//verifica si se va y la vuelve a posicionar.
		if (y < 0 || y > FlxG.height){
			Posicionar();
			//kill();
		}
	}
}