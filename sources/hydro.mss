/* TODO: Separate major waterways/waterbodies below z12 */


////// Wetlands

// TODO: use pattern!

#nhdWetland [zoom >= 10] {
	 polygon-pattern-file: url(../symbols/marsh.png);
}


////// Rivers, streams etc...

#nhdPerennialStream [zoom >= 12] {
	line-color: @wateroutline;
	line-width: 0.4;
	[zoom >= 12] { line-width: 0.6; }
	[zoom >= 14] { line-width: 1.0; }
	[zoom >= 16] { line-width: 1.5; }
}

#nhdIntermittentStream [zoom >= 12] {
	line-color: @wateroutline;
	line-width: 0.4;
	line-dasharray: 6,3;
	[zoom >= 12] { line-width: 0.6; }
	[zoom >= 14] { line-width: 1.0; }
	[zoom >= 16] { line-width: 1.5; }
}

#nhdMajorStreamLabel [zoom >= 12] {
	text-spacing: 200;
	text-label-position-tolerance: 10;
	text-min-distance: 30;
	text-max-char-angle-delta: 40;
	text-character-spacing: 3;
	text-name: "[gnis_name]";
	text-size: 12;
	text-face-name: @waterbodylabelfont;
	text-fill: @waterlabelcolor;
	text-placement: line;
	text-halo-fill: rgba(255,255,255,0.4);
    text-halo-radius: 1.5;
    [zoom >= 14] { text-size: 14; }
	[zoom >= 15] { text-size: 15; }
}

#nhdStreamLabel [zoom >= 14] {
	text-spacing: 200;
	text-label-position-tolerance: 10;
	text-min-distance: 30;
	text-name: "[gnis_name]";
	text-size: 12;
	text-character-spacing: 1;
	text-face-name: @streamlabelfont;
	text-fill: @waterlabelcolor;
	text-placement: line;
	text-dy: 5;
	[zoom >= 15] {
		text-size: 14;
		text-dy: 6;
	}
}


////// Water bodies (lakes, ponds, wide rivers etc) and ocean

// NOTE: use double line-width, since half will
// be overdrawn by the fill

// TODO: use generalized coastline polys at lower zoom levels
// TODO: use coastline shapefiles rather than "raw" OSM

#coastline [zoom >= 8],
#nhdWaterPoly [zoom >= 8] {
	line-color: @wateroutline;
	line-width: 0.4;
	[fcode = 39001],[fcode = 46003],[fcode = 46007] {
		line-dasharray: 6,3; // Intermittent/ephemeral
	}
	[zoom >= 10] { line-width: 0.6; }
	[zoom >= 12] { line-width: 1.0; }
	[zoom >= 14] { line-width: 1.5; }
	[zoom >= 16] { line-width: 2.5; }
}

#nhdWaterPoly::fill [zoom >= 8] {
	polygon-fill: @waterfill;
}

#ocean {
	polygon-fill: @waterfill;
}

#nhdAreaLabel [zoom >= 9][areasqkm >= 10],
#nhdAreaLabel [zoom >= 11][areasqkm >= 0.6],
#nhdAreaLabel [zoom >= 13][areasqkm >= 0.06],
#nhdAreaLabel [zoom >= 15][areasqkm >= 0.001] {
	text-spacing: 200;
	text-label-position-tolerance: 30;
	text-wrap-width: 35;
	text-name: "[gnis_name]";
	text-face-name: @waterbodylabelfont;
	text-fill: @waterlabelcolor;
	text-halo-fill: rgba(255,255,255,0.4);
    text-halo-radius: 1.5;
    text-size: 12;
    [zoom >= 14] { text-size: 14; }
}


////// Hydrological barriers: Dams, weirs, etc

.hydro_barrier [zoom >= 12] {
	line-color: black;
	line-width: 1.5;	
}

.hydro_barrier_filled::fill [zoom >= 12] {
	polygon-fill: #666;
}
