document.addEventListener("turbo:load", function () {
  const ContentPrice = document.getElementById('item-price');
  const ContentCommission = document.getElementById('add-tax-price');
  const ContentProfit = document.getElementById('profit');

  if (!ContentPrice) {
    return false;
  }

  ContentPrice.addEventListener('input', function () {
    const price = Math.floor(ContentPrice.value);
    const price_commission = Math.floor(price * 0.1)
    const price_profit = price - price_commission

    ContentPrice.innerHTML = price
    ContentCommission.innerHTML = price_commission
    ContentProfit.innerHTML = price_profit
  });

});
