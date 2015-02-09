//// Mountain peaks

#peaks [zoom>=12]
{
   point-file: url(../symbols/peak.svg);
   point-transform: scale(5.0, 5.0);
   [zoom >= 14] { point-transform: scale(6.0, 6.0); }
}

#peak_labels [zoom>=12] {
   text-name: "[short_name]";
   text-dy: 8;
   text-face-name: "Gentium Basic Bold Italic";
   text-size: 11;
   text-fill: @peakcolor;
   text-halo-fill: @peakhalo;
   text-halo-radius: 1.5;
   [zoom >= 14] {
      text-name: "[name]";
      text-size: 13;
      ::elevation [ele_ft!=""] {
         text-name: [ele_ft] + ' ft';
         text-face-name: "Gentium Basic Bold Italic";
         text-size: 12;
         text-dy: 22;
         text-fill: @peakcolor;
         text-halo-fill: @peakhalo;
         text-halo-radius: 1.5;
      }
   }
}


//// High-priority POI icons

#prioritypoints [zoom >= 12] {
   point-allow-overlap: false;

   // not used ; indicates that we missed a feature type
   point-file: url(../symbols/question.svg); 

   // pick icon depending on feature type
   [tourism='alpine_hut']     { point-file: url(../symbols/hut.svg); }
   [tourism='viewpoint']      { point-file: url(../symbols/view.svg); }
   [tourism='picnic_site']    { point-file: url(../symbols/picnic-area.svg); }
   [tourism='camp_site'],
   [tourism='campground']     { point-file: url(../symbols/campground.svg); }
   [tourism='information'],
   [tourism='map']            { point-file: url(../symbols/info.svg); }
   [amenity='shelter']        { point-file: url(../symbols/shelter.svg); }
   [amenity='toilets'],
   [amenity='restrooms']      { point-file: url(../symbols/restrooms.svg); }
   [amenity='parking']        { point-file: url(../symbols/parking.svg); }
   [amenity='drinking_water'] { point-file: url(../symbols/water.svg); }
   [aeroway='aerodrome']      { point-file: url(../symbols/airport.svg); }
   [landuse='quarry'],
   [man_made='mineshaft'],
   [man_made='adit']          { point-file: url(../symbols/mine.svg); }
   
   // scale depending on zoom level
   [zoom = 12] { point-transform: scale(0.30, 0.30); }
   [zoom = 13] { point-transform: scale(0.40, 0.40); }
   [zoom = 14] { point-transform: scale(0.50, 0.50); }
   [zoom >=15] { point-transform: scale(0.60, 0.60); }   

   // show labels at high zoom levels
   ::labels [zoom >= 14] {
      text-face-name: @pointfeaturefont;
      text-fill: #000;
      text-halo-fill: rgba(255,255,255,0.5);
      text-halo-radius: 1.5;
      text-wrap-width: 60;
      text-name: "[short_name]";
      text-size: 11;
      text-placement-type: simple;
      text-placements: "S,N,11,10";
      text-dy: 12;
      [zoom >= 15] {
         text-name: "[name]";
         text-size: 13;
         text-wrap-width: 80;
         text-placements: "S,N,13,12,11,10";
      }
   }
}


//// Misc other points

#miscpoints [man_made='tower'][zoom>=12] {
   marker-line-width: 0;
   marker-width: 3;
   marker-fill: black;
   [zoom >= 14] {
      text-name: '"Tower"';
      text-face-name: @pointfeaturefont;
      text-fill: #000;
      text-halo-fill: rgba(255,255,255,0.5);
      text-halo-radius: 1.5;
      text-size: 10;
      text-placement-type: simple;
      text-placements: "S,N,10";
      text-dy: 6;
   }
}

#miscpoints [barrier='gate'][zoom>=15] {
  marker-file: url(../symbols/gate.svg);
  marker-allow-overlap: false;
  marker-transform: scale(1.2,1.2);
  [zoom=16]  { marker-transform: scale(1.5,1.5); }
  [zoom>=17] { marker-transform: scale(1.8,1.8); }
}
