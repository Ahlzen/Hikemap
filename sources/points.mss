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