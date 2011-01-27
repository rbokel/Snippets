package de.bokelberg.utils
{
	
	/**
	 * A simple helper class for handling locale strings 
	 * 
	 * * (c) 2011 ralf.bokelberg.github@qlod.org
	 */ 

	public class LocaleUtil
	{
		private static const LANGUAGE_INDEX:uint = 0;
		private static const REGION_INDEX:uint = 1;
		private static const SEPARATOR : String = "_";

		public function LocaleUtil()
		{
			super();
		}

		public static function getLanguage(locale:String):String
		{
			if (!locale)
			{
				return "";
			}
			var parts:Array = locale.split(SEPARATOR);
			return parts[LANGUAGE_INDEX];
		}

		public static function getRegion(locale:String):String
		{
			if (!locale)
			{
				return null;
			}
			var parts:Array = locale.split(SEPARATOR);
			return parts.length >= 2 ? parts[REGION_INDEX] : "";
		}
		
		public static function createLocale( language : String, region : String ) : String 
		{
			return language + SEPARATOR + region;
		}
	}
}