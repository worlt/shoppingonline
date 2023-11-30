var unum = 0;
var fnum = 0;

function sss(t) {
    if (t === "u") {
        unum++;
        var u = document.getElementById("user_list");
        if (unum % 2 === 0)
            u.style.display = "none";
        else
            u.style.display = "block";
    } else {
        fnum++;
        var f = document.getElementById("fruit_list");
        if (fnum % 2 === 0)
            f.style.display = "none";
        else
            f.style.display = "block";
    }
}


function ox(s) {
    for (var i = 0; i < 7; i++) {
        var t = "x" + i;

        if (s == t) {
            document.getElementById(t).style.display = "block";
        } else {
            document.getElementById(t).style.display = "none";
        }
    }
}


function recharge() {
    var amount = prompt("请输入充值金额：");
    var uid = document.getElementById("id").value;

// 发送AJAX请求到后端进行充值处理
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/shoppingonline_war_exploded/userServlet?key=recharge&id=" + uid, true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.onload = function () {
        if (xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.success) {
                alert("充值成功！");
                window.location.reload(); // 刷新页面
            } else {
                alert("充值失败，请稍后重试！");
            }
        }
    };
    xhr.onerror = function () {
        alert("请求出错，请稍后重试！");
    };
    xhr.send("amount=" + encodeURIComponent(amount) + "&id=" + uid);
}



