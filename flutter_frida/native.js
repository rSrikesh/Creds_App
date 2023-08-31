 var awaitForCondition = function (callback) {
     var int = setInterval(function () {
         var addr = Module.findBaseAddress('libnative.so');
         if (addr) {
             console.log("SO Address found:", addr);
             clearInterval(int);
             callback(+addr);
             return;
         }
     }, 0);
 }
 
awaitForCondition((baseAddr)=>{
	console.log("STARTING HOOK ");
	
	let x = Module.findExportByName('libnative.so', 'encrypt');
	console.log("Encrypt Address -> ", x);
	
	Interceptor.attach(x, {
     onEnter(args) {
       console.log("Args0 -> " + args[0].readCString());
         console.log("Args1 -> " + args[1].readCString());
     },
	 onLeave: function ( retval ) {  
            var x = Memory.readCString(retval);
            var arr = x.split('').map(function (x) { return x.charCodeAt(0); });
            console.log("Return value -> " + arr);
            //change the return value
            return retval;
 		}
   })
	
});

