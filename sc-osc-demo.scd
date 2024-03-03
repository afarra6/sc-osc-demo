//How to use this patch:
//Boot the server and run the main scene of the godot project. Then send the language port to the godot project by
//Executing line 35, and create two OSCFunc instances by executing the two OSCFuncs below.


(
//Boot server and add synthdef.
s.waitForBoot({


	//Add synthdefs to server
	SynthDef("sine", {
		arg freq = 440, attack = 1, decay = 1;
		var sig, env;
		sig = SinOsc.ar(freq);
		env = EnvGen.kr(Env(times: [attack, decay]), doneAction: 2);
		sig = sig * env * 0.1;
		Out.ar(0, sig!2);
	}).add;

	s.sync;

	//NetAddr to send OSC to Godot
	~sendToGodot = NetAddr("127.0.0.1", 4646);


});

)



//Send language port to godot. Re-evalute this line any time you restart godot.

~sendToGodot.sendMsg('/langPort', NetAddr.langPort);



//Receive and handle OSC messages on the default language port. See the OSFunc documentation for more info on handling OSC.
	OSCFunc.new({
		|msg, time, addr, recvPort|
		msg.postln;
		time.postln;
		addr.postln;
		recvPort.postln;
	});

//Handle only matching OSC messages on the default language port:

	OSCFunc.newMatching({
		|msg, time, addr, recvPort|
	msg.at(0).postln;
	Synth(\sine, ["freq", msg.at(0)]);
}, '/newSynth');



	//You can also optionally receive on a port besides the default langPort:

	OSCFunc.new({
		|msg, time, addr, recvPort|
		msg.postln;
		time.postln;
		addr.postln;
		recvPort.postln;
	}, '/foo', recvPort: 4647);



