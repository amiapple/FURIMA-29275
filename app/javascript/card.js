const pay = ()=> {
Payjp.setPublicKey("pk_test_95dac0017fa40cce27907d22");　// PAY.JPテスト公開鍵
const form = document.getElementById("item-explain-box");
form.addEventListener("submit", () => {
  console.log("イベント発火");
})
}

window.addEventListener("load", pay);




