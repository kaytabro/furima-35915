window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addTax = Math.floor( inputValue * 0.1 )
    const profit = Math.floor( inputValue - addTax )
    addTaxDom.innerHTML = `${ addTax }`
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = `${ profit }`
 })
});