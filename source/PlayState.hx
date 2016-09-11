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
	//de prueba
	//private var prueba:Int = 10;
	//private var unNum:Int = 0;
	//private var enemPrueba:Enemigo;
	//private var otroEnem:Enemigo;
	//private var genRandom:FlxRandom = new FlxRandom();
	override public function create():Void
	{
		Reg.timer.start(10, elBonus, 0);
		super.create();
		nave = new Personaje(0, FlxG.height - 16);
		bonus = new Bonus();
		//enemPrueba = new Enemigo(40, 10);
		//otroEnem = new Enemigo(50, 10);
		
		for (i in 0...5) 
		{
			grupoEnemigo[i] = new Enemigo(20 + i * 10, 20);
			add(grupoEnemigo[i]);
		}
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
		if (bonus.getPosicionada()) 
			{
				bonus.Mover();
			}
	}
}
