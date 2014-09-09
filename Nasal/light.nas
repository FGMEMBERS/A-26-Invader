var sbc1 = aircraft.light.new( "/sim/model/lights/sbc1", [0.5, 0.3] );
sbc1.interval = 0.1;
sbc1.switch( 1 );

var flash_trigger = props.globals.getNode("controls/armament/trigger", 0);
aircraft.light.new("sim/model/a26/lighting/flash-gun", [0.052, 0.05], flash_trigger);

var sbc2 = aircraft.light.new( "/sim/model/lights/sbc2", [0.2, 0.3], "/sim/model/lights/sbc1/state" );
sbc2.interval = 0;
sbc2.switch( 1 );

setlistener( "/sim/model/lights/sbc2/state", func(n) {
  var bsbc1 = sbc1.stateN.getValue();
  var bsbc2 = n.getBoolValue();
  var b = 0;
  if( bsbc1 and bsbc2 and getprop( "/controls/lighting/beacon") ) {
    b = 1;
  } else {
    b = 0;
  }
  setprop( "/sim/model/lights/beacon/enabled", b );

  if( bsbc1 and !bsbc2 and getprop( "/controls/lighting/strobe" ) ) {
    b = 1;
  } else {
    b = 0;
  }
  setprop( "/sim/model/lights/strobe/enabled", b );
});

var beacon = aircraft.light.new( "/sim/model/lights/beacon", [0.05, 0.05] );
beacon.interval = 0;

var strobe = aircraft.light.new( "/sim/model/lights/strobe", [0.05, 0.05, 0.05, 1] );
strobe.interval = 0;

setprop( "/instrumentation/nav[0]/ident", 0 );
setprop( "/instrumentation/nav[1]/ident", 0 );

var FluorLamp1 = aircraft.light.new("/sim/model/lights/FluorLamp[0]", [0], "/controls/lighting/FluorLamp[0]");
var FluorLamp2 = aircraft.light.new("/sim/model/lights/FluorLamp[1]", [0], "/controls/lighting/FluorLamp[1]");
var FluorLamp3 = aircraft.light.new("/sim/model/lights/FluorLamp[2]", [0], "/controls/lighting/FluorLamp[2]");
var FluorLamp4 = aircraft.light.new("/sim/model/lights/FluorLamp[3]", [0], "/controls/lighting/FluorLamp[3]");

var RoofLight = aircraft.light.new("/sim/model/lights/RoofLamp[0]", [0], "/controls/lighting/RoofLamp[0]");
