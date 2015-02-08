// TODO: Highlight major trail networks, like AT


#trails [zoom>=10][zoom<=11]
{ 
  line-color: @trailcolor;
  line-width: 0.7;
  [highway='bridleway'],
  [highway='track'] {
    line-dasharray: 5, 2;
  }
  [highway='footway'],
  [highway='path'] {
    line-dasharray: 3, 1.5;
  } 
}


#trails [zoom>=12][zoom<=13]
{

  //::background {
  //  line-width: 3;
  //  line-color: @trailbg; }

  //::fill {
    line-color: @trailcolor;
    line-width: 1.3;
    [highway='bridleway'],
    [highway='track'] {
      line-dasharray: 8, 2;
    }
    [highway='footway'],
    [highway='path'] {
      line-dasharray: 4, 2;
    }
  //}
}


#trails [zoom>=14]
{
  line-width: 0;
  line-color: @trailcolor;
  
  [highway='track'],
  [highway='bridleway'] {
    [bridge='yes'] { line-width: 6.5; line-color: fadeout(black, 30%); }
    //::background { line-width: 4.5; line-color: @trailbg; }
    //::fill {
      line-width: 1.8;
      line-dasharray: 12, 2;
      [tracktype='grade5'] { line-dasharray: 7, 2; }
      [tracktype='grade4'] { line-dasharray: 9, 2; }
      [tracktype='grade3'] { line-dasharray: 11, 2; }
      [tracktype='grade2'] { line-dasharray: 13.5, 2; }
      [tracktype='grade1'] { line-dasharray: 15, 2; }
    //}
  }
  
  [highway='footway'],
  [highway='path']
  {
    // Minor/overgrown trails
    [trail_visibility='intermediate'],
    [trail_visibility='bad'],
    [trail_visibility='horrible']
    {
      [bridge='yes'] {
        line-width: 4.9;
        line-color: black;
        ::midfill {
          line-width: 3.4;
          line-color: white;
        }
      }
      ::fill {
        line-width: 1.4;
        line-dasharray: 5, 2;
      }
    }
    
    // Normal trails
    [trail_visibility=''],
    [trail_visibility='good'],
    [trail_visibility='excellent']
    {
      [bridge='yes'] {
        line-width: 5.3;
        line-color: black;
        ::midfill {
          line-width: 3.8;
          line-color: white;
        }
      }
      ::fill {
        line-width: 1.8;
        line-dasharray: 5, 2;
      }
    }
  }
  
  [highway='cycleway'] {
    [bridge='yes'] {
      line-width: 5.3;
      line-color: black;
      ::midfill {
        line-width: 3.8;
        line-color: white;
      }
    }
    ::fill { line-width: 1.8; }
  }
}
