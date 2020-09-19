function input() {
  
  

  
// ①フォームに文字が入ったらイベントが発火する
value_input=document.getElementById("item-price")
    value_input.addEventListener("input", () => {    
// ②入力した値（数字）を取得する
value_input = new integer(document.getElementById("item-price"));
console.log("integer")
// ③取得した数字を使って、利益と手数料を計算する
commission = integer * 0.1
profit = integer - commission
// ④計算結果を表示する
commission=new (document.getElementById("item-price"));
profit=new integer(document.getElementById("item-price"));

    });

}
window.addEventListener("load", input);


