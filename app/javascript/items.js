function price(){
  const priceInput = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  priceInput.addEventListener('keyup',() => {
    const value = priceInput.value;

    if (value>=300 && value <=9999999){

   let fee = value *0.1
   let benefit = value -fee
  tax.textContent = fee;
  profit.textContent = benefit;
}else{
  let fee = '0';
  let benefit = '0';
  tax.textContent = fee;
  profit.textContent =benefit;
}
  });
}
window.addEventListener('load',price);