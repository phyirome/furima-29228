function calcProfit() {
  if ( document.getElementById('sell_button')){
    const price = document.getElementById("item-price");
    const charge = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');

    price.addEventListener('change', function(){
      this.value;
      charge_ratio = 0.1;
      charge.innerHTML = price.value * charge_ratio;
      profit.innerHTML = price.value - charge.innerHTML;
    });
  };

};

window.addEventListener('load', calcProfit);