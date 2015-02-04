<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/LIP_Research/css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
/*
* Slides, A Slideshow Plugin for jQuery
* Intructions: http://slidesjs.com
* By: Nathan Searles, http://nathansearles.com
* Version: 1.1.9
* Updated: September 5th, 2011
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/ (function(a) {
    a.fn.slides = function(b) {
        return b = a.extend({}, a.fn.slides.option, b), this.each(function() {
            function w(g, h, i) {
                if (!p && o) {
                    p = !0, b.animationStart(n + 1);
                    switch (g) {
                    case "next":
                        l = n, k = n + 1, k = e === k ? 0 : k, r = f * 2, g = -f * 2, n = k;
                        break;
                    case "prev":
                        l = n, k = n - 1, k = k === -1 ? e - 1 : k, r = 0, g = 0, n = k;
                        break;
                    case "pagination":
                        k = parseInt(i, 10), l = a("." + b.paginationClass + " li." + b.currentClass + " a", c)
                            .attr("href")
                            .match("[^#/]+$"), k > l ? (r = f * 2, g = -f * 2) : (r = 0, g = 0), n = k
                    }
                    h === "fade" ? b.crossfade ? d.children(":eq(" + k + ")", c)
                        .css({
                        zIndex: 10
                    })
                        .fadeIn(b.fadeSpeed, b.fadeEasing, function() {
                        b.autoHeight ? d.animate({
                            height: d.children(":eq(" + k + ")", c)
                                .outerHeight()
                        }, b.autoHeightSpeed, function() {
                            d.children(":eq(" + l + ")", c)
                                .css({
                                display: "none",
                                zIndex: 0
                            }), d.children(":eq(" + k + ")", c)
                                .css({
                                zIndex: 0
                            }), b.animationComplete(k + 1), p = !1
                        }) : (d.children(":eq(" + l + ")", c)
                            .css({
                            display: "none",
                            zIndex: 0
                        }), d.children(":eq(" + k + ")", c)
                            .css({
                            zIndex: 0
                        }), b.animationComplete(k + 1), p = !1)
                    }) : d.children(":eq(" + l + ")", c)
                        .fadeOut(b.fadeSpeed, b.fadeEasing, function() {
                        b.autoHeight ? d.animate({
                            height: d.children(":eq(" + k + ")", c)
                                .outerHeight()
                        }, b.autoHeightSpeed, function() {
                            d.children(":eq(" + k + ")", c)
                                .fadeIn(b.fadeSpeed, b.fadeEasing)
                        }) : d.children(":eq(" + k + ")", c)
                            .fadeIn(b.fadeSpeed, b.fadeEasing, function() {
                            a.browser.msie && a(this)
                                .get(0)
                                .style.removeAttribute("filter")
                        }), b.animationComplete(k + 1), p = !1
                    }) : (d.children(":eq(" + k + ")")
                        .css({
                        left: r,
                        display: "block"
                    }), b.autoHeight ? d.animate({
                        left: g,
                        height: d.children(":eq(" + k + ")")
                            .outerHeight()
                    }, b.slideSpeed, b.slideEasing, function() {
                        d.css({
                            left: -f
                        }), d.children(":eq(" + k + ")")
                            .css({
                            left: f,
                            zIndex: 5
                        }), d.children(":eq(" + l + ")")
                            .css({
                            left: f,
                            display: "none",
                            zIndex: 0
                        }), b.animationComplete(k + 1), p = !1
                    }) : d.animate({
                        left: g
                    }, b.slideSpeed, b.slideEasing, function() {
                        d.css({
                            left: -f
                        }), d.children(":eq(" + k + ")")
                            .css({
                            left: f,
                            zIndex: 5
                        }), d.children(":eq(" + l + ")")
                            .css({
                            left: f,
                            display: "none",
                            zIndex: 0
                        }), b.animationComplete(k + 1), p = !1
                    })), b.pagination && (a("." + b.paginationClass + " li." + b.currentClass, c)
                        .removeClass(b.currentClass), a("." + b.paginationClass + " li:eq(" + k + ")", c)
                        .addClass(b.currentClass))
                }
            }
            function x() {
                clearInterval(c.data("interval"))
            }
            function y() {
                b.pause ? (clearTimeout(c.data("pause")), clearInterval(c.data("interval")), u = setTimeout(function() {
                    clearTimeout(c.data("pause")), v = setInterval(function() {
                        w("next", i)
                    }, b.play), c.data("interval", v)
                }, b.pause), c.data("pause", u)) : x()
            }
            a("." + b.container, a(this))
                .children()
                .wrapAll('<div class="slides_control"/>');
            var c = a(this),
                d = a(".slides_control", c),
                e = d.children()
                    .size(),
                f = d.children()
                    .outerWidth(),
                g = d.children()
                    .outerHeight(),
                h = b.start - 1,
                i = b.effect.indexOf(",") < 0 ? b.effect : b.effect.replace(" ", "")
                    .split(",")[0],
                j = b.effect.indexOf(",") < 0 ? i : b.effect.replace(" ", "")
                    .split(",")[1],
                k = 0,
                l = 0,
                m = 0,
                n = 0,
                o, p, q, r, s, t, u, v;
            if (e < 2) return a("." + b.container, a(this))
                .fadeIn(b.fadeSpeed, b.fadeEasing, function() {
                o = !0, b.slidesLoaded()
            }), a("." + b.next + ", ." + b.prev)
                .fadeOut(0), !1;
            if (e < 2) return;
            h < 0 && (h = 0), h > e && (h = e - 1), b.start && (n = h), b.randomize && d.randomize(), a("." + b.container, c)
                .css({
                overflow: "hidden",
                position: "relative"
            }), d.children()
                .css({
                position: "absolute",
                top: 0,
                left: d.children()
                    .outerWidth(),
                zIndex: 0,
                display: "none"
            }), d.css({
                position: "relative",
                width: f * 3,
                height: g,
                left: -f
            }), a("." + b.container, c)
                .css({
                display: "block"
            }), b.autoHeight && (d.children()
                .css({
                height: "auto"
            }), d.animate({
                height: d.children(":eq(" + h + ")")
                    .outerHeight()
            }, b.autoHeightSpeed));
            if (b.preload && d.find("img:eq(" + h + ")")
                .length) {
                a("." + b.container, c)
                    .css({
                    background: "url(" + b.preloadImage + ") no-repeat 50% 50%"
                });
                var z = d.find("img:eq(" + h + ")")
                    .attr("src") + "?" + (new Date)
                    .getTime();
                a("img", c)
                    .parent()
                    .attr("class") != "slides_control" ? t = d.children(":eq(0)")[0].tagName.toLowerCase() : t = d.find("img:eq(" + h + ")"), d.find("img:eq(" + h + ")")
                    .attr("src", z)
                    .load(function() {
                    d.find(t + ":eq(" + h + ")")
                        .fadeIn(b.fadeSpeed, b.fadeEasing, function() {
                        a(this)
                            .css({
                            zIndex: 5
                        }), a("." + b.container, c)
                            .css({
                            background: ""
                        }), o = !0, b.slidesLoaded()
                    })
                })
            } else d.children(":eq(" + h + ")")
                .fadeIn(b.fadeSpeed, b.fadeEasing, function() {
                o = !0, b.slidesLoaded()
            });
            b.bigTarget && (d.children()
                .css({
                cursor: "pointer"
            }), d.children()
                .click(function() {
                return w("next", i), !1
            })), b.hoverPause && b.play && (d.bind("mouseover", function() {
                x()
            }), d.bind("mouseleave", function() {
                y()
            })), b.generateNextPrev && (a("." + b.container, c)
                .after('<a href="#" class="' + b.prev + '">Prev</a>'), a("." + b.prev, c)
                .after('<a href="#" class="' + b.next + '">Next</a>')), a("." + b.next, c)
                .click(function(a) {
                a.preventDefault(), b.play && y(), w("next", i)
            }), a("." + b.prev, c)
                .click(function(a) {
                a.preventDefault(), b.play && y(), w("prev", i)
            }), b.generatePagination ? (b.prependPagination ? c.prepend("<ul class=" + b.paginationClass + "></ul>") : c.append("<ul class=" + b.paginationClass + "></ul>"), d.children()
                .each(function() {
                a("." + b.paginationClass, c)
                    .append('<li><a href="#' + m + '">' + (m + 1) + "</a></li>"), m++
            })) : a("." + b.paginationClass + " li a", c)
                .each(function() {
                a(this)
                    .attr("href", "#" + m), m++
            }), a("." + b.paginationClass + " li:eq(" + h + ")", c)
                .addClass(b.currentClass), a("." + b.paginationClass + " li a", c)
                .click(function() {
                return b.play && y(), q = a(this)
                    .attr("href")
                    .match("[^#/]+$"), n != q && w("pagination", j, q), !1
            }), a("a.link", c)
                .click(function() {
                return b.play && y(), q = a(this)
                    .attr("href")
                    .match("[^#/]+$") - 1, n != q && w("pagination", j, q), !1
            }), b.play && (v = setInterval(function() {
                w("next", i)
            }, b.play), c.data("interval", v))
        })
    }, a.fn.slides.option = {
        preload: !1,
        preloadImage: "/img/loading.gif",
        container: "slides_container",
        generateNextPrev: !1,
        next: "next",
        prev: "prev",
        pagination: !0,
        generatePagination: !0,
        prependPagination: !1,
        paginationClass: "pagination",
        currentClass: "current",
        fadeSpeed: 350,
        fadeEasing: "",
        slideSpeed: 350,
        slideEasing: "",
        start: 1,
        effect: "slide",
        crossfade: !1,
        randomize: !1,
        play: 0,
        pause: 0,
        hoverPause: !1,
        autoHeight: !1,
        autoHeightSpeed: 350,
        bigTarget: !1,
        animationStart: function() {},
        animationComplete: function() {},
        slidesLoaded: function() {}
    }, a.fn.randomize = function(b) {
        function c() {
            return Math.round(Math.random()) - .5
        }
        return a(this)
            .each(function() {
            var d = a(this),
                e = d.children(),
                f = e.length;
            if (f > 1) {
                e.hide();
                var g = [];
                for (i = 0; i < f; i++) g[g.length] = i;
                g = g.sort(c), a.each(g, function(a, c) {
                    var f = e.eq(c),
                        g = f.clone(!0);
                    g.show()
                        .appendTo(d), b !== undefined && b(f, g), f.remove()
                })
            }
        })
    }
})(jQuery)

</script>
	<script>
		$(function(){
			var startSlide = 1;
			$('#slides').slides({
				container: 'slide',
				pagination: true,
				generateNextPrev: true,
				generatePagination: true,
				paginationClass: 'page',
				start: 1,
				effect: 'slide',
				slideSpeed: 500,
				play: 5000,
				pause: 0,
				start: startSlide
			});
			$('#slides2').slides({
				container: 'slide',
				pagination: true,
				generatePagination: true,
				paginationClass: 'page',
				start: 1,
				effect: 'slide',
				slideSpeed: 1000,
				play: 5000,
				pause: 0,
				start: startSlide
			});
		});
	</script>
<style type="text/css">
/* slide */
.slides{ margin: 0 auto; position:relative;width:250px}
.slides .slide{padding: 0;overflow:hidden;position:relative;width:250px;height:170px}
.slides .slide li{display:block;width:250px;height:170px}
.slides .slide li a{display:block}
.slides a.prev,.slides a.next{display:inline-block;z-index:100;overflow:hidden;position:absolute;top:10px;width:14px;height:14px;background:url(../img/sp_page.gif) 0 0 no-repeat;line-height:999px;vertical-align:top}
.slides a.prev{right:25px;background-position:0 0}
.slides a.prev:hover{background-position:0 -20px}
.slides a.next{right:10px;width:15px;background-position:-20px 0}
.slides a.next:hover{background-position:-20px -20px}
.slides .page{ padding: 0px;z-index:100;position:absolute;top:180px;left:0;width:250px;text-align:center;list-style:none}
.slides .page li{display:inline-block;_display:inline;margin:0 1px;_zoom:1}
.slides .page li a{display:block;overflow:hidden;width:12px;height:12px;background:url(/LIP_Research/images/etc/pagination.png) 0 0 no-repeat;line-height:999px;vertical-align:top}
.slides .page li.current a{background-position:0 -12px}
#title_div {
height:100px
}
#button_div {
 
}

</style>


</head>

<body>
  <jsp:include page="jsp/common/menu_bar/user_menu.jsp" />
<div style="padding:0 0 0 0; background-image: url(/LIP_Research/images/etc/intro_logoBg.png); background-repeat:no-repeat;background-position:center;">     
<div style="padding:180px 0 210px 0; background-image: url(/LIP_Research/images/etc/intro_ballonBack.png); background-repeat:no-repeat;background-position:center;">

	<!-- slide -->
	<div id="slides" class="slides">
		<ul class="slide">
			<c:forEach var="poll" items="${polls }">
			<li> <div id="title_div" align="center">
			    <h2>${poll.pollQuestion }</h2>
				<c:if test="${poll.pollBalancePoint !=0}">
				<font color="red" size="3">1P</font>
				</c:if>
				</div>
				<div id="button_div">			
				<input type="button"  id="join-btn" onclick="location.href='/LIP_Research/poll/OngoingPoll.action#${poll.pollNumber}'" style="background: url(/LIP_Research/images/etc/btn_intro_join.png) no-repeat;margin-right: 7px; width: 93px; height: 43px; border: none;padding: 0;margin-left: 26; cursor: pointer;">
				<input type="button" id="result-btn" onclick="location.href='/LIP_Research/poll/ResultPoll.action?pollNumber=${poll.pollNumber}'" style="background: url(/LIP_Research/images/etc/btn_intro_result.png) no-repeat;margin-right: 7px; width: 93px; height: 43px; border: none;padding: 0; cursor: pointer;">
				</div>
			</li>

			</c:forEach>
		</ul>
	</div>
	<!-- //slide -->
	
</div>
</div>
  <jsp:include page="jsp/common/footer/footer1.jsp" />
  <script type="text/javascript">
  
  
  </script>
</body>
</html>
