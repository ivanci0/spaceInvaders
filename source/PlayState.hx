package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class PlayState extends FlxState {
	private var grupoEnemigo:Array<Enemigo> = new Array<Enemigo>();
	private var balas:Array<AntiBala> = new Array<AntiBala>();
	private var highScores:Array<Int> = new Array<Int>();
	private var nave:Personaje;
	private var bonus:Bonus;
	private var cantEnemigos:Int = 20;
	private var obstaculos:Array<Obstaculo> = new Array<Obstaculo>();
	private var cantObstaculos:Int = 4;
	
	override public function create():Void{
		super.create();
		posicionarObstaculos(obstaculos, cantObstaculos);
		for (i in 0...cantObstaculos){
			add(obstaculos[i]);
		}
		Reg.timer.start(5, elBonus, 0);
		Reg.otroTimer.start(3, dispararBalas, 0);
		nave = new Personaje(0, FlxG.height - 16);
		bonus = new Bonus(1000,1000);
		bonus.kill();
		posicionarEnemigos(grupoEnemigo, cantEnemigos);
		for (i in 0...cantEnemigos){
			add(grupoEnemigo[i]);
		}
		for (j in 0...2) 
		{
			balas[j] = new AntiBala();
			add(balas[j]);
		}
		
		add(bonus);
 		add(nave);
		add(nave.getBala());
	}

	override public function update(elapsed:Float):Void
	{
		checkChange(grupoEnemigo);
		// colisiones
		Reg.ColisionBala(nave.getBala(), grupoEnemigo);
		Reg.ColisionBala(nave.getBala(), bonus);
		Reg.ColisionAntiBala(balas, nave);
		Reg.ColisionEnemigoJugador(grupoEnemigo, nave);
		Reg.ColisionAntiBala(balas, obstaculos);
		super.update(elapsed);
	}
	public function elBonus(timer:FlxTimer):Void{
		if (bonus.alive == false){
				bonus.revive();
			}
	}
	public function dispararBalas(otroTimer:FlxTimer):Void{
		if (!todosMuertos()) {
			var cantBalas:Int = FlxG.random.int(1, 2);
			var cansancio:Int = grupoEnemigo.length;
			for (i in 0...cantBalas){
				var hayVivos:Bool = true;
				while (hayVivos){
					var proxEnem:Int = FlxG.random.int(0, grupoEnemigo.length - 1);
					if (grupoEnemigo[proxEnem].alive){
						balas[i].salirDisparada(grupoEnemigo[proxEnem]);
						hayVivos = false;
					}
					else{
						cansancio--;
					}
					if (cansancio == 0){
						hayVivos = false;
					}
				}
			}
		}
	}
	public function todosMuertos():Bool{
		var muyMuerto:Bool = true;
		for (i in 0...grupoEnemigo.length-1){
			if (grupoEnemigo[i].alive){
				muyMuerto = false;
			}
		}
		return muyMuerto;
	}
	public function posicionarEnemigos(?enemigos:Array<Enemigo>, cantEnemigos:Int):Void{
		var colum:Int = 8;
		var fila:Int = 24;
		var cantCol:Int = 5;
		for (i in 0...cantEnemigos){
			if (cantCol == 0){
				fila += 20;
				colum = 8;
				cantCol = 5;
			}
			enemigos[i] = new Enemigo(colum, fila);
			colum += 24;
			cantCol--;
		}
	}
	public function posicionarObstaculos(?obstaculos:Array<Obstaculo>, cantObstaculos:Int):Void{
		var colObs:Int = 20;
		for (i in 0...cantObstaculos) {
			obstaculos[i] = new Obstaculo(colObs, FlxG.height -30);
			colObs += 32;
		}
	}
	public function checkChange(enemigos:Array<Enemigo>){
		for (i in 0...enemigos.length){
				if (enemigos[i].x + enemigos[i].width > FlxG.width - enemigos[i].width){
					Reg.movementModifier = false;
					cambiarDireccion(enemigos);
				}
				else if (enemigos[i].x < 8){
					Reg.movementModifier = true;
					cambiarDireccion(enemigos);
				}
			}
	}
	public function cambiarDireccion(enemigos:Array<Enemigo>):Void{
		var velocidad:Int = 4;
		if (Reg.movementModifier){
			velocidad *= 1;
		}
		else{
			velocidad *= -1;
		}
		for (i in 0...enemigos.length){
			enemigos[i].x += velocidad;
			enemigos[i].y += 4;
		}
	}
}
