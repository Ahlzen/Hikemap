//// Heavy rail

#rail [rail_class='heavy'][zoom>=12][zoom<=13] {
  line-width: 0.9;
  line-color: @railroad;
  ::ties { line-width: 3.5; line-dasharray: 0.9,12; line-color: @railroad; }
}
#rail [rail_class='heavy'][zoom>=14][zoom<=15] {
  line-width: 1.3;
  line-color: @railroad;
  ::ties { line-width: 6; line-dasharray: 1.3,20; line-color: @railroad; }
}
#rail [rail_class='heavy'][zoom>=16] {
  line-width: 2.0;
  line-color: @railroad;
  ::ties { line-width: 8; line-dasharray: 2.0,30; line-color: @railroad; }
}


//// Light rail etc

#rail [rail_class='light'][zoom>=12][zoom<=13] {
  line-width: 0.8;
  line-color: @lightrail;
  ::ties { line-width: 3; line-dasharray: 0.8,9; line-color: @lightrail; }
}
#rail [rail_class='light'][zoom>=14][zoom<=15] {
  line-width: 1.1;
  line-color: @lightrail;
  ::ties { line-width: 4; line-dasharray: 1.2,12; line-color: @lightrail; }
}
#rail [rail_class='light'][zoom>=16] {
  line-width: 1.5;
  line-color: @lightrail;
  ::ties { line-width: 6; line-dasharray: 1.5,15; line-color: @lightrail; }
}



//// Roads (detailed)

#roads::outline [zoom >= 10]
{
	line-width: 0;
	line-color: @roadcase;
	line-join: round;
	line-cap: round;

	[zoom>=10][zoom<=11] {
		// TODO
	}
	[zoom>=12][zoom<=13] {	
		[highway='motorway']       { line-width: 4; }
	    [highway='trunk']          { line-width: 4; }
	    [highway='primary']        { line-width: 4; }
	    [highway='secondary']      { line-width: 3.5; }
	    [highway='tertiary']       { line-width: 3.0; }
	    [highway='residential'],
	    [highway='unclassified'],
	    [highway='motorway_link'],
	    [highway='trunk_link'],
	    [highway='primary_link'],
	    [highway='secondary_link'],
	    [highway='tertiary_link']  { line-width: 2.5; }
	    [highway='service']        { line-width: 1.5; }
	    [tunnel='yes'] {
	    	line-dasharray: 6,3;
	    	line-cap: butt;
	    	line-color: lighten(@roadcase, 40%);
	    }
	}
	[zoom>=14][zoom<=15] {
		[highway='motorway']       { line-width: 6; }
	    [highway='trunk']          { line-width: 6; }
	    [highway='primary']        { line-width: 5.5; }
	    [highway='secondary']      { line-width: 5; }
	    [highway='tertiary']       { line-width: 4.5; }
	    [highway='residential'],
	    [highway='unclassified'],   
	    [highway='motorway_link'],
	    [highway='trunk_link'],
	    [highway='primary_link'],
	    [highway='secondary_link'],
	    [highway='tertiary_link']  { line-width: 3.5; }
	    [highway='service']        { line-width: 2.5; }
	    [tunnel='yes'] {
	    	line-dasharray: 8,4;
	    	line-cap: butt;
	    	line-color: lighten(@roadcase, 40%);
	    }
	}
	[zoom>=16] {
	    [highway='motorway']       { line-width: 8; }
	    [highway='trunk']          { line-width: 8; }
	    [highway='primary']        { line-width: 7.5; }
	    [highway='secondary']      { line-width: 6.5; }
	    [highway='tertiary']       { line-width: 5.5; }
	    [highway='residential'],
	    [highway='unclassified'],
	    [highway='motorway_link'],
	    [highway='trunk_link'],
	    [highway='primary_link'],
	    [highway='secondary_link'],
	    [highway='tertiary_link']  { line-width: 4.5; }
	    [highway='service']        { line-width: 3; }
	    [tunnel='yes'] {
	    	line-dasharray: 10,5;
	    	line-cap: butt;
	    	line-color: lighten(@roadcase, 40%);
	    }
	}
}

#roads [zoom >= 10]
{
	line-width: 0;
	line-color: @smallroad; // default fill
	line-join: round;
	line-cap: round;

	/* Road fill colors */
	[highway='motorway']  { line-color: @interstate; }
	[highway='trunk']     { line-color: @trunk; }
	[highway='primary']   { line-color: @primary; }
	[highway='secondary'] { line-color: @secondary; }
	[highway='tertiary '] { line-color: @tertiary; }
	[highway='motorway_link'] { line-color: @interstate; }
	[highway='trunk_link']    { line-color: @trunk; }
	[highway='primary_link']  { line-color: @primary; }
	[highway='secondary_link']{ line-color: @secondary; }

	/* Road fill widths */
	[zoom>=10][zoom<=11] {
		// TODO
	}
	[zoom>=12][zoom<=13] {	
		[highway='motorway']       { line-width: 3; }
		[highway='trunk']          { line-width: 3; }
		[highway='primary']        { line-width: 3; }
		[highway='secondary']      { line-width: 2.5; }
		[highway='tertiary']       { line-width: 2.0; }
		[highway='residential'],
		[highway='unclassified'],
		[highway='motorway_link'],
		[highway='trunk_link'],
		[highway='primary_link'],
		[highway='tertiary_link'],
		[highway='tertiary_link']  { line-width: 1.5; }
		[highway='service']        { line-width: 1.0; }
	}
	[zoom>=14][zoom<=15] {
		[highway='motorway']       { line-width: 4; }
		[highway='trunk']          { line-width: 4; }
		[highway='primary']        { line-width: 4; }
		[highway='secondary']      { line-width: 3; }
		[highway='tertiary']       { line-width: 3; }
		[highway='residential'],
		[highway='unclassified'],
		[highway='motorway_link'],
		[highway='trunk_link'],
		[highway='primary_link'],
		[highway='tertiary_link'],
		[highway='tertiary_link']  { line-width: 2.5; }
		[highway='service']        { line-width: 1.5; }
	}
	[zoom>=16] {
		[highway='motorway']       { line-width: 6; }
		[highway='trunk']          { line-width: 6; }
		[highway='primary']        { line-width: 6; }
		[highway='secondary']      { line-width: 5; }
		[highway='tertiary']       { line-width: 4; }
		[highway='residential'],
		[highway='unclassified'],
		[highway='motorway_link'],
		[highway='trunk_link'],
		[highway='primary_link'],
		[highway='secondary_link'],
		[highway='tertiary_link']  { line-width: 2.5; }
		[highway='service']        { line-width: 2; }
	}

	/* Bridge outlines (z14+).
	NOTE: These must be in the same style as highway
	fills, since they are often drawn "inbetween" different
	layer roads. Outlines at the same layer will draw before
	fills, however, thanks to "pass".
	*/
	[bridge='yes'][pass=1] {
		line-color: @bridgecase;
		line-cap: butt;
		[zoom>=14][zoom<=15]{ 
			[highway='motorway'] { line-width: 9; }
			[highway='trunk'] { line-width: 9; }
			[highway='primary'] { line-width: 8.5; }
			[highway='secondary'] { line-width: 8; }
			[highway='tertiary'] { line-width: 7.5; }
			[highway='residential'],
			[highway='unclassified'] { line-width: 5.5; }
			[highway='service'] { line-width: 4.5; }
			[highway='motorway_link'],
			[highway='trunk_link'],
			[highway='primary_link'],
			[highway='secondary_link'],
			[highway='tertiary_link'] { line-width: 6.5; }
		}
		[zoom>=16] {
			[highway='motorway'] { line-width: 12; }
			[highway='trunk'] { line-width: 12; }
			[highway='primary'] { line-width: 11; }
			[highway='secondary'] { line-width: 10; }
			[highway='tertiary'] { line-width: 9; }
			[highway='residential'],
			[highway='unclassified'] { line-width: 8; }
			[highway='service'] { line-width: 5; }
			[highway='motorway_link'],
			[highway='trunk_link'],
			[highway='primary_link'],
			[highway='secondary_link'],
			[highway='tertiary_link'] { line-width: 8; }
		}
	}
}

