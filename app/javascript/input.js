function input() {
 
// ①フォームに文字が入ったらイベントが発火する
const value_input=document.getElementById("item-price")
    value_input.addEventListener("input", () => {    
// ②入力した値（数字）を取得する
const courseLists = document.getElementById("item-price").value;

// ③取得した数字を使って、利益と手数料を計算する
commission = courseLists * 0.1

profit = courseLists - commission

// ④計算結果を表示する
const p1 = document.getElementById("add-tax-price");
p1.textContent=commission

const p2 = document.getElementById("profit");
p2.textContent=profit
    });

}
window.addEventListener("load", input);


