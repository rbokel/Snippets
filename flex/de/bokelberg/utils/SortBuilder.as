package de.bokelberg.utils
{
	import mx.collections.Sort;
	import mx.collections.SortField;
	import mx.utils.ObjectUtil;

	/**
	 * A builder to create Sort objects
	 *  
	 * @Example
	 * var ac : ArrayCollection = new ArrayCollection();
	 * ac.sort = new SortBuilder().byField("name").asString().caseInsensitive().build();
	 * 
	 * (c) 2011 ralf.bokelberg.github@qlod.org
	 */
	public class SortBuilder
	{

		//------------------------------------------------------------------------------
		//
		//   Private Properties 
		//
		//------------------------------------------------------------------------------

		private var fields:Array;

		//------------------------------------------------------------------------------
		//
		//   Constructor 
		//
		//------------------------------------------------------------------------------

		public function SortBuilder()
		{
			super();

			fields = [];
		}


		//------------------------------------------------------------------------------
		//
		//   Public Functions 
		//
		//------------------------------------------------------------------------------

		public function asAuto():SortBuilder
		{
			getLastSortField().numeric = null;
			return this;
		}

		public function asDate():SortBuilder
		{
			var name:String = getLastSortField().name;
			getLastSortField().compareFunction = function(itemA:Object, itemB:Object):int
			{
				var dateA:Date = getDate(itemA, name);
				var dateB:Date = getDate(itemB, name);
				return ObjectUtil.dateCompare(dateA, dateB);
			};
			return this;
		}

		public function asNumber():SortBuilder
		{
			getLastSortField().numeric = true;
			return this;
		}

		public function asString():SortBuilder
		{
			getLastSortField().numeric = false;
			return this;
		}

		public function ascending():SortBuilder
		{
			getLastSortField().descending = false;
			return this;
		}

		public function build():Sort
		{
			var sort:Sort = new Sort();
			sort.fields = fields;
			return sort;
		}

		public function byField(name:String):SortBuilder
		{
			var sortField:SortField = new SortField(name);
			fields.push(sortField);
			return this;
		}

		public function byItem():SortBuilder
		{
			return byField(null);
		}

		public function caseInsensitive():SortBuilder
		{
			getLastSortField().caseInsensitive = true;
			return this;
		}

		public function caseSensitive():SortBuilder
		{
			getLastSortField().caseInsensitive = false;
			return this;
		}

		public function descending():SortBuilder
		{
			getLastSortField().descending = true;
			return this;
		}

		//------------------------------------------------------------------------------
		//
		//   Private Functions 
		//
		//------------------------------------------------------------------------------

		/**
		 * It is not clear, why the date is mangled in such
		 * a convoluted way. Probably to avoid npe while sorting
		 * Maybe name this function accordingly to document or
		 * add some tests
		 */
		private function getDate(item:Object, property:String = null):Date
		{
			var value:* = property ? item[property] : item;
			return new Date(Date.parse(value));
		}

		private function getLastSortField():SortField
		{
			if (!fields || fields.length == 0)
			{
				throw new Error("no sort field available, call byField first");
			}
			return SortField(fields[fields.length - 1]);
		}
	}
}