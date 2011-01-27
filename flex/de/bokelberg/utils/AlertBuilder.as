package de.bokelberg.utils
{
	import flash.display.Sprite;

	import mx.controls.Alert;

	/**
	 * A fluent builder for alerts 
	 * 
	 * @example
	 * var Alert : Alert = new AlertBuilder().withMessage("hello").withTitle("some title").withOKButton().withWidth(280).show();
	 * 
	 * (c) 2011 ralf.bokelberg.github@qlod.org
	 */ 
	public class AlertBuilder
	{
		public function AlertBuilder()
		{
			super();
		}

		private var message:String = null;

		public function withMessage(value:String):AlertBuilder
		{
			this.message = value;
			return this;
		}

		private var title:String = null;

		public function withTitle(value:String):AlertBuilder
		{
			this.title = value;
			return this;
		}

		private var buttonFlags:uint = 0;

		public function withOKButton():AlertBuilder
		{
			this.buttonFlags |= Alert.OK;
		}
		
		public function withCancelButton():AlertBuilder
		{
			this.buttonFlags |= Alert.CANCEL;
		}
		
		public function withYesButton():AlertBuilder
		{
			this.buttonFlags |= Alert.YES;
		}
		
		public function withNoButton():AlertBuilder
		{
			this.buttonFlags |= Alert.NO;
		}

		private var parent:Sprite = null;

		public function withParent(value:Sprite):AlertBuilder
		{
			this.parent = value;
			return this;
		}

		private var closeHandler:Function = null;

		public function withCloseHandler(value:Function):AlertBuilder
		{
			this.closeHandler = value;
			return this;
		}

		private var yesLabel:String = null;

		public function withYesLabel(value:String):AlertBuilder
		{
			this.yesLabel = value;
			return this;
		}

		private var noLabel:String = null;

		public function withNoLabel(value:String):AlertBuilder
		{
			this.noLabel = value;
			return this;
		}
		
		private var okLabel:String = null;
		
		public function withOKLabel(value:String):AlertBuilder
		{
			this.okLabel = value;
			return this;
		}
		
		private var cancelLabel:String = null;
		
		public function withCancelLabel(value:String):AlertBuilder
		{
			this.cancelLabel = value;
			return this;
		}

		private var width : Number = 0;
		
 		public function withWidth( value : Number ) : AlertBuilder
		{
			width = value;
		}

		private var height : Number = 0;
		
		public function withHeight( value : Number ) : AlertBuilder
		{
			height = value;
		}

		public function show():Alert
		{
			var saveYesLabel:String = Alert.yesLabel;
			var saveNoLabel:String = Alert.noLabel;
			var saveOkLabel:String = Alert.okLabel;
			var saveCancelLabel:String = Alert.cancelLabel;
			
			if (yesLabel)
			{
				Alert.yesLabel = yesLabel;
			}
			if (noLabel)
			{
				Alert.noLabel = noLabel;
			}
			if (okLabel)
			{
				Alert.okLabel = okLabel;
			}
			if (cancelLabel)
			{
				Alert.cancelLabel = cancelLabel;
			}
			
			var alert:Alert = Alert.show(message, title, buttonFlags, parent, closeHandler);
			
			if( width )
			{
				alert.width = width;
			}
			if( height )
			{
				alert.height = height;
			}

			Alert.yesLabel = saveYesLabel;
			Alert.noLabel = saveNoLabel;
			Alert.okLabel = saveOkLabel;
			Alert.cancelLabel = saveCancelLabel;

			return alert;
		}

	}
}
