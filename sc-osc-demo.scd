//How to use this patch:
//Boot the server and run the main scene of the godot project. Then send the language port to the godot project by
//Executing line 35, and create two OSCFunc instances by executing the two OSCFuncs below.

s.boot;
(
//Boot server and add synthdef.
s.waitForBoot({


	//Add synthdefs to server
	SynthDef("synth", {
		arg freq = 55;
		var sig, env;
		sig = SinOsc.ar(freq * SinOsc.ar(220, mul: 22.5));
		env = Lag3.ar(\gate.ar(0), 0.5);
		sig = sig * env * 0.2;
		Out.ar(0, sig!2);
	}).add;

	s.sync;

	//NetAddr to send OSC to Godot
	~sendToGodot = NetAddr("127.0.0.1", 4646);

	s.sync;
	~synth1 = Synth(\synth);


	s.sync;



//Receive and handle OSC messages on the default language port. See the OSFunc documentation for more info on handling OSC.
	OSCFunc.new({
		|msg, time, addr, recvPort|
		msg.postln;
		time.postln;
		addr.postln;
		recvPort.postln;
	});

//Handle only matching OSC messages on a specified port. If you do not specify a port it will default to SuperCollider's default language port':

	OSCFunc.newMatching({
		|msg, time, addr, recvPort|
	~synth1.set(\gate, msg.at(1));
}, '/synth1/gate', recvPort: 4848);



});

)



//You can send messages to Godot using NetAddr method .sendMsg()

~sendToGodot.sendMsg('/cube1', 300); //Change the value to move "cube 1" horizontally

~sendToGodot.sendMsg('/cube2', 1.0); //Change the value to resize "cube 2"





