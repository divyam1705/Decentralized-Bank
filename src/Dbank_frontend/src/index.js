import { Dbank_backend } from "../../declarations/Dbank_backend";
window.addEventListener("load",async ()=>{
  updateBalance();
});

document.querySelector("form").addEventListener("submit",async ()=>{
 event.preventDefault();
 const inputamount=document.getElementById("input-amount");
 const outputamount=document.getElementById("output-amount");
const button=document.getElementById("submit-btn");
//console.log(button);
 button.setAttribute("disabled",true);

if(inputamount.value.length!=0){await Dbank_backend.topUp(parseFloat(inputamount.value));}
 if(outputamount.value.length!=0){await Dbank_backend.withdraw(parseFloat(outputamount.value));}

 updateBalance();
 Dbank_backend.compound();
 button.removeAttribute("disabled");
 inputamount.value="";
 outputamount.value="";
});
async function updateBalance()
{
  const curamount=await Dbank_backend.getValue();
 document.getElementById("value").innerText=curamount.toFixed(2);
 
}