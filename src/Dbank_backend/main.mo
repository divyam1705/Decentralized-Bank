import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {//creating a canister
  stable var startTime=Time.now();
  Debug.print(debug_show(startTime));
  stable var currentValue:Float =300; //persisted variable
  // currentValue:=400;
  // currentValue:=100; //assignment

  //let id=2424;
  // Debug.print(debug_show(id));

  public func topUp(amount:Float){//private function
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };
  //dfx canister call Dbank topUp;
  public func withdraw(amount:Float)
  {let tempvalue:Float =currentValue-amount;
    if(tempvalue>=0){
    currentValue:=tempvalue;
    Debug.print(debug_show(currentValue));
    }
    else{
       Debug.print("Very smart , Trying to withdraw more than ypu have?");
    }
  };
  public query func getValue(): async Float{
      return currentValue;
  };
  public func compound()
  {
    let currentTime=Time.now();
    let timeElapsedNS=currentTime-startTime;
    let timeElapsed= timeElapsedNS/1000000000;
    currentValue:= currentValue *(1.01**Float.fromInt(timeElapsed));
    startTime:=currentTime;
  };
  public func setValue(amount:Float)
  {
    currentValue:=amount;
  };
}
