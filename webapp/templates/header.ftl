<#ftl encoding="utf-8">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AutoNews - place for the real machines.</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="/templates/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            let $result = $("search_box-result")
            let rootEl = document.getElementById("search_box-result");
            $('#search').on('keyup', function () {
                rootEl.innerHTML = ""
                var search = $(this).val();
                if ((search !== '') && (search.length > 1)) {
                    $.ajax({
                        type: "POST",
                        url: "/ajax_search",
                        data: {'search': search},
                        success: function (msg) {
                            if (msg !== " ") {
                                msg = msg.replace(/\n/ig, '');
                                $result.fadeIn();
                                let msgList = msg.split(';');
                                msgList.forEach(function (item, i, arr) {
                                    let itemMas = item.split('#')
                                    if (itemMas.length > 1) {
                                        let el = document.createElement("div");
                                        el.innerHTML =
                                            "<div class=\"search_result\"><table><tr><td class=\"search_result-name\"><a href=\"/user?user_id="+ itemMas[1] + "\">" + itemMas[0] + "</a></td><td class=\"search_result-btn\"><a href=\"#\">Перейти</a></td> </tr> </table> </div>"
                                        rootEl.appendChild(el);
                                    }
                                });
                            } else {
                                rootEl.innerHTML = ""
                                $result.fadeOut(80);
                            }
                        }
                    })
                } else {
                    $result.html('');
                    rootEl.innerHTML = ""
                    $result.fadeOut(100);
                }
            });
        })
    </script>
</head>
<#if isLogged>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-warning">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active ">
                        <a name="element" class="nav-link font-bold" href="/profile">Профиль<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active ">
                        <a name="element" class="nav-link font-bold" href="/main">Главная<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a name="element" class="nav-link font-bold" href="/news">Новости<span
                                    class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a name="element" class="nav-link font-bold" href="/chat">Чат<span
                                    class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a name="element" class="nav-link font-bold" href="/post">Посты<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <div class="search_box">
        <form autocomplete="off">
            <input type="text" name="search" id="search" placeholder="Нужно кого-то найти?">
            <input type="submit">
        </form>
        <div id="search_box-result"></div>
    </div>
<#else>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-warning">
            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active ">
                        <a name="element" class="nav-link font-bold" href="/login">Войти <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a name="element" class="nav-link font-bold" href="/register">Давай к нам!<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active ">
                        <a name="element" class="nav-link font-bold" href="/main">Главная<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a name="element" class="nav-link font-bold" href="/news">Новости<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a name="element" class="nav-link font-bold" href="/post">Посты<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
</#if>
<br>
<body id="main">