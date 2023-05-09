import {dbank} from "../../declarations/dbank"

window.addEventListener("load",async function(){
    const currentAmount = await dbank.checkBalance();
    const roundCurrentAmount = await currentAmount.round(2);
    this.document.getElementById("value").innerHTML = roundCurrentAmount;
})