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
	private var balas:Array<Bala> = new Array<Bala>();
	private var nave:Personaje;
	private var bonus:Bonus;
	//de prueba
	private var prueba:Int = 10;
	private var unNum:Int = 0;
	private var enemPrueba:Enemigo;
	private var genRandom:FlxRandom = new FlxRandom();
	private var timer:FlxTimer = new FlxTimer();
	override public function create():Void
	{
		super.create();
		
		nave = new Personaje(0, 130);
		bonus = new Bonus();
		enemPrueba = new Enemigo(20, 40);
		
		for (i in 0...5) 
		{
			grupoEnemigo[i] = new Enemigo(20 + i * 10, 20);
			add(grupoEnemigo[i]);
		}
		for (j in 0...2) 
		{
			balas[j] = new Bala();
			add(balas[j]);
		}
		timer.start(10, null, 0);
		
		add(bonus);
 		add(nave);
		add(enemPrueba);
		add(nave.getBala());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		// colisiones
		ColisionConEnemigo();
		ColisionConBonus();
		ColisionConPersonaje();
		ColisionEnemigoJugador();
		
		// pruba
		if (prueba == 0) 
		{
			if (bonus.getPosicionada() == true) 
			{
				bonus.Mover();
			}
			balas[0].DispararEnemigo(grupoEnemigo[genRandom.int(0, grupoEnemigo.length-1)]);
			prueba = 200;
		}
		else 
		{
			prueba--;
		}
	}
	public function ColisionConEnemigo():Void{
		for (i in 0...grupoEnemigo.length) 
		{
			if (FlxG.overlap(grupoEnemigo[i],nave.getBala())) 
			{
				grupoEnemigo[i].destroy();
				nave.getBala().Posicionar();
			}
		}
	}
	public function ColisionConBonus():Void{
		if (FlxG.overlap(bonus,nave.getBala())) 
		{
			bonus.Posicionar();
			nave.getBala().Posicionar();
		}
	}
	public function ColisionConPersonaje():Void{
		for (i in 0...balas.length) 
		{
			if (FlxG.overlap(nave,balas[i])) 
			{
				trace("Choca con nave");
				balas[i].Posicionar();
			}
		}
	}
	public function ColisionEnemigoJugador():Void{
		for (i in 0...grupoEnemigo.length) 
		{
			if (FlxG.overlap(grupoEnemigo[i],nave)) 
			{
				trace("choca" + grupoEnemigo[i]);
			}
		}
	}
}
