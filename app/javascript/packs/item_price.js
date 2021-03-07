window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price")
  console.log(priceInput);
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue * 0.1
    const profit = document.getElementById("profit");
    value = Math.floor(profit.innerHTML);
  console.log( "Math.floor", value );
    profit.innerHTML =  priceInput.value - inputValue * 0.1
  })
});
