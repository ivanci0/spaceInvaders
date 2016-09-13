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
	static public var timer:FlxTimer = new FlxTimer();
	static public var otroTimer:FlxTimer = new FlxTimer();
	static public var movementModifier:Bool;
	static public var movementModifierII:Bool;
	static public var puntaje:Int = 0;
	static public var vidas:Int = 3;
	static public var posicionY:Int;
	static public var posicionX:Int;
	static public function ColisionBala(bala:Bala,?enemigo:Array<Enemigo>=null,?bonus:Bonus=null):Void{
		if (enemigo!=null){
			for (i in 0...enemigo.length){
				if (FlxG.overlap(enemigo[i],bala)){
					enemigo[i].kill();
					bala.Posicionar();
					puntaje += 5;
					trace("puntaje=" + puntaje);
				}
			}
		}
		else if (bonus!=null){
			if (FlxG.overlap(bonus,bala)){
				bonus.kill();
				bala.Posicionar();
				puntaje += 30;
				trace("puntaje=" + puntaje);
			}
		}
	}
	static public function ColisionAntiBala(anti:Array<AntiBala>,personaje:Personaje):Void{
		for (i in 0...anti.length){
			if (FlxG.overlap(personaje, anti[i])){
				if (vidas > 0){
				anti[i].Posicionar();
				vidas -= 1;
				trace("te quedan " + vidas + " vidas");
				} 
				else{
				personaje.kill();
				trace("has muerto");
				}
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
				jugador.kill();
			}
		}
	}
}