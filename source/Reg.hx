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
	static public var movementModifier:Bool = true;
	static public var cambioDireccion:Bool = false;
	static public var puntaje:Int = 0;
	static public var vidas:Int = 3;
	//estas son las colisiones
	static public function ColisionBala(bala:Bala,?enemigo:Array<Enemigo>=null,?bonus:Bonus=null):Void{
		if (enemigo!=null){
			for (i in 0...enemigo.length){
				if (FlxG.overlap(enemigo[i],bala)){
					enemigo[i].kill();
					bala.Posicionar();
					puntaje += 20;
				}
			}
		}
		else if (bonus!=null){
			if (FlxG.overlap(bonus,bala)){
				bonus.kill();
				bala.Posicionar();
				puntaje += 250;
			}
		}
	}
	static public function ColisionAntiBala(anti:Array<AntiBala>,personaje:Personaje=null,obstaculo:Array<Obstaculo>=null):Void{
		if (personaje != null){
			for (i in 0...anti.length){
				if (FlxG.overlap(personaje, anti[i])){
					if (vidas > 0){
						anti[i].Posicionar();
						vidas--;
					}
					else{
						personaje.kill();
					}
				}
			}
		}
		if (obstaculo != null){
			for (i in 0...anti.length){
				for (j in 0...obstaculo.length){
					if (FlxG.overlap(anti[i], obstaculo[j])){
						anti[i].Posicionar();
						obstaculo[j].hacerDanio();
					}
				}
			}
		}
	}
	// no se para que esta (porque no colisionarian nunca) pero la pedia el tp
	static public function ColisionEnemigoJugador(enemigos:Array<Enemigo>,jugador:Personaje):Void{
		for (i in 0...enemigos.length){
			if (FlxG.overlap(enemigos[i],jugador)){
				jugador.kill();
			}
		}
	}
	static public function mostrarPuntuacionesAltas(altos:Array<Int>, puntaje:Int){
		var estaAlli:Bool = false;
		for (i in 0...5){
			if (puntaje > altos[i] && estaAlli == false){
				altos[i] = puntaje;
			}	
		}
		for (i in 0...5){
			trace(i + "." + altos[i]);
		}
	}
}