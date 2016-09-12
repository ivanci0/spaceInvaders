package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	private var grupoEnemigo:Array<Enemigo> = new Array<Enemigo>();
	private var balas:Array<AntiBala> = new Array<AntiBala>();
	private var nave:Personaje;
	private var bonus:Bonus;
	private var cantEnemigos:Int = 15;
	//de prueba
	//private var prueba:Int = 10;
	//private var unNum:Int = 0;
	//private var enemPrueba:Enemigo;
	//private var otroEnem:Enemigo;
	//private var genRandom:FlxRandom = new FlxRandom();
	override public function create():Void
	{
		Reg.timer.start(5, elBonus, 0);
		Reg.otroTimer.start(3, dispararBalas, 0);
		super.create();
		nave = new Personaje(0, FlxG.height - 16);
		bonus = new Bonus();
		bonus.kill();
		//enemPrueba = new Enemigo(40, 10);
		//otroEnem = new Enemigo(50, 10);
		
		for (i in 0...cantEnemigos) 
		{
			grupoEnemigo[i] = new Enemigo();
			add(grupoEnemigo[i]);
		}
		posicionar(grupoEnemigo);
		for (j in 0...2) 
		{
			balas[j] = new AntiBala();
			add(balas[j]);
		}
		//timer.start(10, null, 0);
		
		add(bonus);
 		add(nave);
		//add(enemPrueba);
		//add(otroEnem);
		add(nave.getBala());
	}

	override public function update(elapsed:Float):Void
	{		
		// colisiones
		Reg.ColisionBala(nave.getBala(), grupoEnemigo);
		Reg.ColisionBala(nave.getBala(), bonus);
		Reg.ColisionAntiBala(balas, nave);
		Reg.ColisionEnemigoJugador(grupoEnemigo, nave);
		
		super.update(elapsed);
	}
	public function elBonus(timer:FlxTimer):Void{
		if (bonus.alive == false){
				bonus.revive();
			}
	}
	public function dispararBalas(otroTimer:FlxTimer):Void{
		if (todosMuertos()){
			//no tiene que hacer nada
		}
		else{
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
	public function posicionar(?enemigos:Array<Enemigo>):Void{
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
}
