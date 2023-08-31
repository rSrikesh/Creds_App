function disablePinning()
{
    var PinningPlugin = Java.use("diefferson.http_certificate_pinning.HttpCertificatePinningPlugin");
    
    PinningPlugin.checkConnexion.implementation = function()
    {
        console.log("Disabled Pinning Plugin");
        return true;
    }
}
 
Java.perform(disablePinning)