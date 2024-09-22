# 從index.jsp選擇進入lottery game或是guess game
## lottery game
填入組數及排除的數字後點擊送出
畫面會顯示回傳結果

## guess game
輸入數字1~10進行猜數字遊戲
假如在範圍內猜測成功則進入youWin.jsp
反之進入youLose.jsp
參數設定目前從GameController.java中new GuessGame進行調整
第一個參數為能猜測的次數
第二個參數為要猜測的號碼
