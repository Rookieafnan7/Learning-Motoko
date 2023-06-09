
import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor Dbank{
    stable var currentValue: Float = 300;
    // currentValue := 100;
    stable var startTime = Time.now();
    let id = 423423423;

    
    // Debug.print(debug_show(currentValue));
    public func topUp(amount: Float){
      currentValue+=amount;
      Debug.print(debug_show(currentValue));
    };

    public func withdraw(amount: Float){
      let temp : Float = currentValue - amount;
      
      if(temp >= 0){
        currentValue -= amount;
      }else{
        Debug.print("Amount greater than current value!");
      };

      Debug.print(debug_show(currentValue));
    };

    public query func checkBalance(): async Float{
      return currentValue;
    };

    public func compound(){
      let currentTime = Time.now();
      let timeElapsedNS = currentTime - startTime;
      let timeElapsedS = timeElapsedNS / 1000000000;
      currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
      startTime := Time.now();
    }

}
