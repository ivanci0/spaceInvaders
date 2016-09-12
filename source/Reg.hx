package;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.util.FlxTimer;
/**
 * ...
 * @author ...
 */
class Reg
{
	static public var movementModifier:Bool = true;
	static public var superejeY:Int = 10;
	static public var timer:FlxTimer = new FlxTimer();
	static public var otroTimer:FlxTimer = new FlxTimer();
	static public function ColisionBala(bala:Bala,?enemigo:Array<Enemigo>=null,?bonus:Bonus=null):Void{
		if (enemigo!=null){
			for (i in 0...enemigo.length){
				if (FlxG.overlap(enemigo[i],bala)){
					enemigo[i].kill();
					bala.Posicionar();
				}
			}
		}
		else if (bonus!=null){
			if (FlxG.overlap(bonus,bala)){
				bonus.kill();
				bala.Posicionar();
			}
		}
	}
	static public function ColisionAntiBala(anti:Array<AntiBala>,personaje:Personaje):Void{
		for (i in 0...anti.length){
			if (FlxG.overlap(personaje,anti[i])){
				anti[i].Posicionar();
				personaje.kill();
			}
		}
	}
	static public function posicionarEnemigos(?enemigos:Array<Enemigo>):Void{
		var cantCol:Int = 5;
		var posY:Int = 24;
		var posX:Int = -16;
		for (i in 0...enemigos.length - 1){
			for (j in 0...cantCol){
				posX += 24;
				enemigos[i].x = posX;
				enemigos[i].y = posY;
			}
			posY += 16;
		}
	}
	
	// no se para que esta (porque no colisionarian nunca) pero la pedia el tp
	static public function ColisionEnemigoJugador(enemigos:Array<Enemigo>,jugador:Personaje):Void{
		for (i in 0...enemigos.length){
			if (FlxG.overlap(enemigos[i],jugador)){
				trace("choca" + enemigos[i]);
			}
		}
	}
	
}