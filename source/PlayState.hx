package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.group.FlxGroup;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	private var grupoEnemigo:FlxGroup = new FlxGroup();
	private var nave:Personaje;
	private var balaDePers:Bala;
	private var bonus:Bonus;
	private var lejos:Int = 1000;
	override public function create():Void
	{
		super.create();
		
		nave = new Personaje(0, 130);
		balaDePers = new Bala();
		bonus = new Bonus(FlxG.height, 5);
		
		for (i in 0...5) 
		{
			var enem:Enemigo = new Enemigo(20 + i*20,20);
			grupoEnemigo.add(enem);
		}
		
		add(bonus);
 		add(nave);
		add(balaDePers);
 		add(grupoEnemigo);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		// colisiones
		//		de enemigos con balas del jugador
		for (i in 0...grupoEnemigo.length) 
		{
			if (FlxG.overlap(grupoEnemigo.members[i],balaDePers)) 
			{
				grupoEnemigo.members[i].destroy();
				balaDePers.Posicionar();
			}
		}
		//		de enemigos con el jugador
		for (i in 0...grupoEnemigo.length) 
		{
			if (FlxG.overlap(grupoEnemigo.members[i],nave)) 
			{
				trace("choca");
			}
		}
		// disparo de bala de personaje
		if (FlxG.keys.justPressed.SPACE) 
		{
			if (balaDePers.y == lejos && balaDePers.x == lejos) 
			{
				balaDePers.Disparar(nave);
			}
		}
		// para cuando la bala se va del rango
		if (balaDePers.y < 0) 
		{
			balaDePers.Posicionar();
		}
		// para cuando el bonus se va de rango
		if (bonus.x < 0) 
		{
			bonus.destroy();
		}
	}
}
