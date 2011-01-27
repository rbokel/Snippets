package de.bokelberg.utils
{
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;

	/**
	 * A fluent factory class which wraps calls to setTimeout into a nicer interface
	 * @example Timeout.wait(1000).andCall(someMethod).withParameter(someParameter).afterwards();
	 * 
	 * (c) 2011 ralf.bokelberg.github@qlod.org
	 */
	public class Timeout
	{

		//------------------------------------------------------------------------------
		//
		//   Static Public Functions 
		//
		//------------------------------------------------------------------------------

		static public function wait(milliseconds:uint):Timeout
		{
			return new Timeout(milliseconds);
		}


		//------------------------------------------------------------------------------
		//
		//   Private Properties 
		//
		//------------------------------------------------------------------------------

		private var delegate:Function;

		private var id:uint = 0;

		private var milliseconds:uint;

		private var parameters:Array;

		//------------------------------------------------------------------------------
		//
		//   Constructor 
		//
		//------------------------------------------------------------------------------

		public function Timeout(milliseconds:uint = 1000)
		{
			super();

			parameters = [];

			this.milliseconds = milliseconds;
		}


		//------------------------------------------------------------------------------
		//
		//   Public Functions 
		//
		//------------------------------------------------------------------------------

		public function andCall(delegate:Function):Timeout
		{
			this.delegate = delegate;
			return this;
		}

		public function clear():void
		{
			if (id)
			{
				clearTimeout(id);
			}
		}

		public function afterwards():Timeout
		{
			if (delegate is Function)
			{
				id = setTimeout.apply(this, [ delegate, milliseconds ].concat(parameters));
			}

			return this;
		}

		public function withParameter(parameter:*):Timeout
		{
			parameters.push(parameter);
			return this;
		}
		
		public function withStringParameter(parameter:String):Timeout
		{
			return withParameter( parameter );
		}
		
		public function withNumberParameter(parameter:Number):Timeout
		{
			return withParameter( parameter );
		}
		
		public function withBooleanParameter(parameter:Boolean):Timeout
		{
			return withParameter( parameter );
		}
		
		public function withFunctionParameter(parameter:Function):Timeout
		{
			return withParameter( parameter );
		}
		
		public function withObjectParameter(parameter:Object):Timeout
		{
			return withParameter( parameter );
		}
	}
}