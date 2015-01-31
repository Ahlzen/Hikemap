/* TODO: Separate major waterways/waterbodies below z12 */


////// Rivers, streams etc...

#waterway [waterway='river'][zoom >= 8],
#waterway [waterway='canal'][zoom >= 8] {
	line-color: @wateroutline;
	line-width: 0.4;
	[zoom >= 10] { line-width: 0.6; }
	[zoom >= 12] { line-width: 1.0; }
	[zoom >= 14] { line-width: 1.5; }
	[zoom >= 16] { line-width: 2.5; }
}

#waterway [waterway='stream'][zoom >= 10],
#waterway [waterway='drain'][zoom >= 10] {
	line-color: @wateroutline;
	line-width: 0.4;
	[zoom >= 12] { line-width: 0.6; }
	[zoom >= 14] { line-width: 1.0; }
	[zoom >= 16] { line-width: 1.5; }
}

#waterway [waterway='ditch'][zoom >= 12] {
	line-color: @wateroutline;
	line-width: 0.4;
	[zoom >= 14] { line-width: 0.6; }
	[zoom >= 16] { line-width: 1.0; }
}



////// Water bodies (lakes, ponds, wide rivers etc)

#waterbody [zoom >= 8] {
	line-color: @wateroutline;
	line-width: 0.4;
	[zoom >= 10] { line-width: 0.6; }
	[zoom >= 12] { line-width: 1.0; }
	[zoom >= 14] { line-width: 1.5; }
	[zoom >= 16] { line-width: 2.5; }
}

#waterbody::fill [zoom >= 8] {
	polygon-fill: @waterfill;
}


////// Hydrological barriers: Dams, weirs, etc

// TODO: Change to z12+

.hydro_barrier [zoom >= 10] {
	line-color: black;
	line-width: 1.5;
	
}
.hydro_barrier_filled::fill [zoom >= 10] {
	polygon-fill: #666;
}