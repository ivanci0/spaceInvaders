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
	static public function posicionarEnemigos(?enemigos:Array<Enemigo>, cantEnemigos:Int):Void{
		var colum:Int = 8;
		var fila:Int = 24;
		var cantCol:Int = 5;
		for (i in 0...cantEnemigos) 
		{
			if (cantCol == 0) 
			{
				fila += 20;
				colum = 8;
				cantCol = 5;
			}
			enemigos[i] = new Enemigo(colum, fila);
			colum += 24;
			cantCol--;
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