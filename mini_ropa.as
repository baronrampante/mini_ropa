package 
{


	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;

	public class mini_ropa extends MovieClip
	{

		//tiempo.text = "INTENTALO";
		private var cronometro:Timer;
		public var incremento:Number = 0;
		public var segundos:Number = 0;
		public var parte_arriba:int = 0;
		public var parte_medio:int = 0;
		public var parte_abajo:int = 0;
		public var maxNum:int = 0;
		public var minNum:int = 2;
		public var eleccion_prenda:int = 1;
		public var acierto:int = 0;
		//public texto1_txt.text = String(acierto);

		public var pantalla_ini:pantalla_inicio=new pantalla_inicio();

		public function mini_ropa()
		{

			init();
		}


		// random de la eleccion de la ropa
		public function randomRange(minNum:Number, maxNum:Number):Number
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}

		/*addEventListener(Event.ENTER_FRAME,myFunction);
		function myFunction(event:Event) {
		trace (randomRange(0,2));
		}
		*/


		public function init():void
		{
			volver.visible = false;
			texto1_txt.text = String(acierto);
			addChild(pantalla_ini);
			pantalla_ini.addEventListener(MouseEvent.CLICK, onClickInicio);
			tira_medio.boton_medio.addEventListener(MouseEvent.CLICK, onClickMedio);
			tira_medio.boton_medio2.addEventListener(MouseEvent.CLICK, onClickMedio2);
			tira_medio.boton_medio3.addEventListener(MouseEvent.CLICK, onClickMedio3);
			tira_medio.boton_mediox.addEventListener(MouseEvent.CLICK, onClickMedio);
			arriba.boton_arriba1.addEventListener(MouseEvent.CLICK, onClickArriba);
			arriba.boton_arriba1x.addEventListener(MouseEvent.CLICK, onClickArriba);
			arriba.boton_arriba2.addEventListener(MouseEvent.CLICK, onClickArriba2);
			arriba.boton_arriba3.addEventListener(MouseEvent.CLICK, onClickArriba3);
			abajo.boton_abajo1.addEventListener(MouseEvent.CLICK, onClickAbajo);
			abajo.boton_abajox.addEventListener(MouseEvent.CLICK, onClickAbajo);
			abajo.boton_abajo2.addEventListener(MouseEvent.CLICK, onClickAbajo2);
			abajo.boton_abajo3.addEventListener(MouseEvent.CLICK, onClickAbajo3);
			replay.addEventListener(MouseEvent.CLICK, onClickReplay);

		}

		//inicio

		public function onClickInicio(event:MouseEvent):void
		{
			removeChild(pantalla_ini);

			// entry point
			cronometro = new Timer(1000,60);
			cronometro.addEventListener(TimerEvent.TIMER, nuestroReloj);
			cronometro.start();
		}

		public function onClickArriba(event:MouseEvent):void
		{
			arriba.gotoAndStop(1);
			parte_arriba = 1;
			Acertar();
		}

		public function onClickArriba2(event:MouseEvent):void
		{
			arriba.gotoAndStop(13);
			parte_arriba = 13;
			Acertar();
		}

		public function onClickArriba3(event:MouseEvent):void
		{
			arriba.gotoAndStop(25);
			parte_arriba = 25;
			Acertar();
		}

		//nombre de la instancia no del movieclip

		function onClickMedio(event:MouseEvent):void
		{
			tira_medio.gotoAndStop(1);
			parte_medio = 25;
			Acertar();
		}

		function onClickMedio2(event:MouseEvent):void
		{
			tira_medio.gotoAndStop(13);
			parte_medio = 1;
			Acertar();
		}

		function onClickMedio3(event:MouseEvent):void
		{
			tira_medio.gotoAndStop(25);
			parte_medio = 13;
			Acertar();
		}

		function onClickAbajo(event:MouseEvent):void
		{
			abajo.gotoAndStop(1);
			parte_abajo = 13;
			Acertar();
		}

		function onClickAbajo2(event:MouseEvent):void
		{
			abajo.gotoAndStop(13);
			parte_abajo = 25;
			Acertar();
		}
		function onClickAbajo3(event:MouseEvent):void
		{
			abajo.gotoAndStop(25);
			parte_abajo = 1;
			Acertar();
		}

		// volver a jugar

		function onClickReplay(event:MouseEvent):void
		{
			tira_medio.gotoAndPlay(1);
			arriba.gotoAndPlay(1);
			abajo.gotoAndPlay(1);
			trace(randomRange(0,2));
			eleccion_prenda =((randomRange(1,3)));
			eleccion.gotoAndStop(eleccion_prenda);
			eleccion2();
			tiempo.text = "NUEVO INTENTO";
			parte_arriba = 0;
			parte_medio = 0;
			parte_abajo = 0;

			//Acertar();
		}

		//cambiar numero de eleccion por el de frame animacion ropa
		function eleccion2()
		{
			if (eleccion_prenda == 2)
			{
				eleccion_prenda = 25;
			}
			if (eleccion_prenda == 3)
			{
				eleccion_prenda = 13;
			}
		}

		// ver si acertó
		function Acertar():void
		{
			trace(parte_arriba);
			trace(parte_medio);
			trace(parte_abajo);
			trace(eleccion_prenda);
			if (parte_arriba == parte_medio && parte_arriba == parte_abajo)
			{
				if (parte_arriba == eleccion_prenda)
				{

					tiempo.text = "ACERTASTES!!";
					acierto = acierto + 1;
					texto1_txt.text = String(acierto);
					eleccion_prenda = 0;
				}
				else
				{
					tiempo.text = "INTENTALO";//acciones que se ejecutan cuando NO se cumple la condición
				}
			}
		}


		/*function init(e:Event = null):void 
		{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		// entry point
		cronometro = new Timer(1000, 60);
		cronometro.addEventListener(TimerEvent.TIMER, nuestroReloj);
		cronometro.start();
		
		}*/

		function nuestroReloj(e:TimerEvent):void
		{
			incremento = 6;
			aguja_mc.rotation +=  incremento;
			segundos -=  1;
			//trace ("seg" + segundos);

			if (segundos == -10)
			{
				tiempo.text = "TERMINÓ";

				Pantalla_volver();
			}
}
		function Pantalla_volver():void
			{
				volver.visible = true;
				volver.final_txt.text = String(acierto);
				volver.boton_volver.addEventListener(MouseEvent.CLICK, onClickVolver);
			}

			function onClickVolver(event:MouseEvent):void
			{
				acierto = 0;
				arriba.gotoAndPlay(1);
				tira_medio.gotoAndPlay(1);
				
				abajo.gotoAndPlay(1);
				parte_arriba = 0;
				parte_medio = 0;
				parte_abajo = 0;
				init();
			}
			//texto_txt.text = String(segundos);
		

	}

}