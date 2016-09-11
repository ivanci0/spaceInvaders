package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author ...
 */
class Personaje extends FlxSprite // un personaje "fuerte"
{
	private var balaPersonaje:Bala; //El personaje es el unico que tiene una bala (because reasons)
	private var velocidad:Int = 100; // usado para setear la velocidad
	private var _izq:Bool = false; // para detectar el movimiento (el disparo no necesita ser detectado)
	private	var _der:Bool = false;
	public function new(?X:Float=0, ?Y:Float=0){
		super(X, Y);
		loadGraphic(AssetPaths.alfpj__png, true, 16, 16); //carga del sprite
		// carga de animaciones
		animation.add("movDer", [0, 1, 2], 10, false);
		animation.add("movIzq", [3, 4, 5], 10, false);
		animation.add("disDer", [6, 7, 6, 0], 10, false);
		animation.add("disIzq", [9, 8, 9, 3], 10, false);
		animation.add("morirDer", [10, 11, 12], 10, false);
		animation.add("morirIzq", [13, 14, 15], 10, false);
		drag.x = drag.y = 1600; // para que no resvale cuando no apretas nada
		balaPersonaje = new Bala();
	}
	override public function update(elapsed:Float):Void{
		Moverse();
		Disparar();
 		super.update(elapsed);
 	}
	public function Moverse():Void{
		if (alive){ // detecta primero si esta vivo, para que de muerto no dispare...
			_izq = FlxG.keys.pressed.LEFT; // iguala las antes declaradas con el pressed y la respectiva key
			_der = FlxG.keys.pressed.RIGHT;
		
			if (_izq && _der){ // para que no haya problema al apretar ambos botones al mismo tiempo (osea no hace nada)
				_izq = _der = false;
			}
			if (_izq || _der){//si presiona cualquiera de los dos
				if (_izq){//si es izq
					if (x >= 0){//verifica que no se pase de la pantalla
						velocity.x = -velocidad; // -100
						facing = FlxObject.LEFT; // para la animacion
					}
				}
				else if (_der){// lo mismo pero a la derecha
					if (x <= FlxG.width-width){
						velocity.x = velocidad;
						facing = FlxObject.RIGHT;
					}
				}
			}
			if (velocity.x != 0){// esto es: si se mueve y el facing es right(derecha) --> reproduci la animacion "movDer"
				switch (facing){
					case FlxObject.RIGHT:
						animation.play("movDer");
					case FlxObject.LEFT:
						animation.play("movIzq");
				}
			}
		}
	}
	public function getBala(){// por si acaso
		return balaPersonaje;
	}
	override public function kill():Void{//sobreescritura de kill(); para agregar animacion de muerte
		alive = false; // si se muere se para el movimiento
		FlxTween.tween(this, { }, .33, { onStart: Muriendo, onComplete: finishKill }); //crea un clon, cuando se inicia llama a muriendo y cuando termina llama a finishkill
	}
	public function Muriendo(_):Void{//agrega la animacion para que se reprodusca antes de desaparecer
		switch (facing){
			case FlxObject.RIGHT:
				animation.play("morirDer");
			case FlxObject.LEFT:
				animation.play("morirIzq");
		}
	}
	public function finishKill(_):Void{//termina de matar al objeto
		exists = false;
	}
	public function Disparar():Void{//agrega la animacion al disparo del tenedor
		if (FlxG.keys.justPressed.SPACE && balaPersonaje.getPosicionada()){
			balaPersonaje.Disparar(this);
				switch (facing){
					case FlxObject.LEFT:
						animation.play("disIzq");
					case FlxObject.RIGHT:
						animation.play("disDer");
				}
		}
	}
}