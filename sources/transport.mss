//// Heavy rail

#rail [rail_class='heavy'][zoom>=10][zoom<=13] {
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


//// Roads (major roads @ low zoom levels)

#roadsLowzoom [zoom >= 6][zoom <= 7] {
	[highway='motorway']       { line-color: @roadslowzoom; line-width: 1.2; }
    [highway='trunk']          { line-color: @roadslowzoom; line-width: 0.8; }
}

#roadsLowzoom [zoom >= 8][zoom <= 9] {
	[highway='motorway']       { line-color: @roadslowzoom; line-width: 1.5; }
    [highway='trunk']          { line-color: @roadslowzoom; line-width: 1.2; }
    [highway='primary']        { line-color: @roadslowzoom; line-width: 0.8; }
}


//// Roads (detailed)

#roadsHizoom::outline [zoom >= 10]
{
	line-width: 0;
	line-color: @roadcase;
	line-join: round;
	line-cap: round;

	[zoom>=10][zoom<=11] {
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
	    [highway='secondary_link'],
	    [highway='tertiary_link']  { line-width: 1.5; }
	    [tunnel='yes'] {
	    	line-dasharray: 6,3;
	    	line-cap: butt;
	    	line-color: lighten(@roadcase, 40%);
	    }
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

#roadsHizoom [zoom >= 10]
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
		[highway='motorway']       { line-width: 2; }
		[highway='trunk']          { line-width: 2; }
		[highway='primary']        { line-width: 2; }
		[highway='secondary']      { line-width: 1.5; }
		[highway='tertiary']       { line-width: 1.0; }
		[highway='residential'],
		[highway='unclassified'],
		[highway='motorway_link'],
		[highway='trunk_link'],
		[highway='primary_link'],
		[highway='tertiary_link'],
		[highway='tertiary_link']  { line-width: 1.0; }
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
			[highway='motorway'] { line-width: 8; }
			[highway='trunk'] { line-width: 8; }
			[highway='primary'] { line-width: 7.5; }
			[highway='secondary'] { line-width: 7; }
			[highway='tertiary'] { line-width: 6.5; }
			[highway='residential'],
			[highway='unclassified'],
			[highway='motorway_link'],
			[highway='trunk_link'],
			[highway='primary_link'],
			[highway='secondary_link'],
			[highway='tertiary_link'] { line-width: 5.5; }
			[highway='service'] { line-width: 4.5; }
		}
		[zoom>=16] {
			[highway='motorway'] { line-width: 10; }
			[highway='trunk'] { line-width: 10; }
			[highway='primary'] { line-width: 9.5; }
			[highway='secondary'] { line-width: 8.5; }
			[highway='tertiary'] { line-width: 7.5; }
			[highway='residential'],
			[highway='unclassified'],
			[highway='motorway_link'],
			[highway='trunk_link'],
			[highway='primary_link'],
			[highway='secondary_link'],
			[highway='tertiary_link'] { line-width: 6.5; }
			[highway='service'] { line-width: 5; }
		}
	}
}


//// Shields and road labels

#transportShieldsAndLabelsHizoom [zoom >= 10]
{
  // Shields
  [road_class != ''] {
    shield-placement: line;
    shield-face-name: @roadshieldfont;
    shield-min-distance: 30;
    shield-spacing: 300;
    shield-size: 12;
    shield-fill: black;
    shield-file: url(../symbols/shield-state.svg);
    shield-name: "[road_ref]";
    shield-transform: scale(0.9, 0.9);
    shield-character-spacing: 1;
    [road_class='I'] {
       shield-fill: white;
       shield-file: url(../symbols/shield-interstate.svg);
    }
    [road_class='U'] {
       shield-file: url(../symbols/shield-us.svg);
    }
  }
  
  // Road labels
  ::roadLabelsMajor [zoom=14] {
    [highway='motorway'], [highway='trunk'],
    [highway='primary'], [highway='secondary']
    {
       text-name: "[name]"; 
       text-face-name: @roadlabelfont;
       //text-size: 10;
       text-min-path-length: 150;
       text-spacing: 400;
       text-min-distance: 100;
       text-avoid-edges: true;
       text-placement: line;
       text-halo-radius: 2px;
       text-max-char-angle-delta: 20;
       [highway='motorway'] { text-halo-fill: @interstate; text-size: 11; }
       [highway='trunk'] { text-halo-fill: @trunk; text-size: 11; }
       [highway='primary'] { text-halo-fill: @primary; text-size: 10; }
       [highway='secondary'] { text-halo-fill: @secondary; text-size: 10; }
    }
  }

  ::roadLabelsAll [zoom>=15] {
    text-name: "[name]"; 
    text-face-name: @roadlabelfont;
    text-size: 11;
    text-min-path-length: 150;
    text-spacing: 400;
    text-min-distance: 50;
    text-avoid-edges: true;
    text-placement: line;
    text-halo-fill: white;
    text-halo-radius: 2px;
    text-max-char-angle-delta: 20;
    [highway='motorway'] { text-halo-fill: @interstate; text-size: 13; }
    [highway='trunk'] { text-halo-fill: @trunk; text-size: 13; }
    [highway='primary'] { text-halo-fill: @primary; text-size: 12; }
    [highway='secondary'] { text-halo-fill: @secondary; text-size: 12; }
  }
} 


//// Ski lifts etc

#aerialway [aerialway_class='major'][zoom>=12] {
	line-color: @aerialway;	
	marker-placement: line;
	marker-line-width: 0;
	marker-fill: @aerialway;
	line-width: 1.2;
	marker-width: 3.0;
	marker-height: 3.0;
	marker-spacing: 15;
	[zoom >= 14] {
		line-width: 1.6;
		marker-width: 4.0;
		marker-height: 4.0;
		marker-spacing: 20;
	}
}

#aerialway [aerialway_class='minor'][zoom>=12] {
	line-color: @aerialway;	
	marker-placement: line;
	marker-line-width: 0;
	marker-fill: @aerialway;
	line-width: 0.8;
	marker-width: 2.0;
	marker-height: 2.0;
	marker-spacing: 10;
	[zoom >= 14] {
		line-width: 1.2;
		marker-width: 3.0;
		marker-height: 3.0;
		marker-spacing: 15;
	}
}