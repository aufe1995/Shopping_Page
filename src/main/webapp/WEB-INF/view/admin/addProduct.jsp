<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/css/admin/addProduct.css">
<script   src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
</head>
<body>
<div class="wrapper">
    <div class="wrap">

        <div class="title_area">
            <span>관리자 페이지</span>
        </div>

        <hr class="boundary">

        <div class="navi_bar_area">
            <div class="admin_navi_wrap">
                <ul>
                    <li>
                        <a class="admin_list" href="/admin/addBrand">브랜드 등록</a>
                    </li>
                    <li>
                        <a class="admin_list" href="/admin/changeBrand">브랜드 관리</a>
                    </li>
                    <li>
                        <a class="admin_list_selected" href="/admin/addProduct">물품 등록</a>
                    </li>
                    <li>
                        <a class="admin_list" href="/admin/changeProduct">물품 관리</a>
                    </li>
                    <li>
                        <a class="admin_list" href="/admin/manageUser">회원 관리</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="content_area">
            <div class="content_subject"><span>물품 등록</span></div>
            <form id="content_warp" method="post" action="/admin/addProductAction.do">
                <div class="content_section">
                    <div class="content_title">물품 이름</div>
                    <input class="content_box" type="text" name="productName" id="productName">
                </div>
                <div class="content_section">
                    <div class="content_title">브랜드</div>
                    <input class="content_small_section" name="brandName" id="brandName"  readonly="readonly">
                    <input name="brandID" id="brandID" type="hidden">
                    <button class="brand_btn" onclick="popUp()">브랜드 선택</button>
                </div>
                <div class="content_option_section">
                    <div class="content_title">카테고리</div>
                    <div class="content_select">
                        <div class="cate_wrap">
                            <span>대분류</span>
                            <select class="cate1">
                                <option selected value="none">선택</option>
                            </select>
                        </div>
                        <div class="cate_wrap">
                            <span>중분류</span>
                            <select class="cate2">
                                <option selected value="none">선택</option>
                            </select>
                        </div>
                        <div class="cate_wrap">
                            <span>소분류</span>
                            <select class="cate3" name="productCate">
                                <option selected value="none">선택</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="content_section">
                    <div class="content_title">제품코드</div>
                    <input class="content_box" type="text" name="productCode" id="productCode">
                </div>
                <div class="content_section">
                    <div class="content_title">제품가격</div>
                    <input class="content_box" type="text" name="productPrice" id="productPrice">
                </div>
                <div class="content_big_section">
                    <div class="content_title">제품설명</div>
                    <textarea type="text" name="productDesc" id="productDesc"></textarea>
                </div>
                <div class="submit_section">
                    <button class="submit_button" type="submit" class="btn btn-primary" value="false" onclick="return productAddCheck()" >확인</button>
                    <button class="submit_button" type="button" class="btn btn-primary" onclick="location.href='/admin'">취소</button>
                </div>
            </form>

        </div>
        <div class="clearfix"></div>
    </div>
</div>
<script type="text/javascript">

    function productAddCheck(){
        if(!content_warp.productName.value.length && !content_warp.productCode.value.length && content_warp.productCate.value == "none"){
            alert("모든 항목을 입력해주세요.");
            return false;
        }
        if(content_warp.brandID.value.length == '0'){
            alert("모든 항목을 입력해주세요.");
            return false;
        }

    }

    function popUp() {

        event.preventDefault();

        let popUrl = "/admin/brandPop";
        let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";

        window.open(popUrl,"브랜드 선택",popOption);

    }

    ClassicEditor
        .create(document.querySelector('#productDesc'))
        .catch(error=>{
    	    console.error(error);
        });

    let cateList = JSON.parse('${cateList}');

	let cate1Array = new Array();
	let cate2Array = new Array();
	let cate3Array = new Array();
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	let cate3Obj = new Object();

	let cateSelect1 = $(".cate1");
	let cateSelect2 = $(".cate2");
	let cateSelect3 = $(".cate3");

	function cateArray(obj, array, cateList, section){
		for(let i = 0; i < cateList.length; i++){
    		if(cateList[i].section === section){
    			obj = new Object();

    			obj.cateName = cateList[i].cateName;
    			obj.cateCode = cateList[i].cateCode;
    			obj.cateParent = cateList[i].cateParent;

    			array.push(obj);
    		}
    	}
	}

	/* 배열 초기화 */
	cateArray(cate1Obj,cate1Array,cateList,1);
	cateArray(cate2Obj,cate2Array,cateList,2);
	cateArray(cate3Obj,cate3Array,cateList,3);

    /* cate1 option 추가 */
    for(let i = 0; i < cate1Array.length; i++){
		cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
	}

    /* cate2 option 추가 */
	$(cateSelect1).on("change",function(){

		let selectVal1 = $(this).find("option:selected").val();

		cateSelect2.children().remove();
		cateSelect3.children().remove();

		cateSelect2.append("<option value='none'>선택</option>");
		cateSelect3.append("<option value='none'>선택</option>");

		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");
			}
		}

	});

	/* cate3 option 추가 */
    	$(cateSelect2).on("change",function(){

    		let selectVal2 = $(this).find("option:selected").val();

    		cateSelect3.children().remove();

    		cateSelect3.append("<option value='none'>선택</option>");

    		for(let i = 0; i < cate3Array.length; i++){
    			if(selectVal2 === cate3Array[i].cateParent){
    				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");
    			}
    		}

    	});
</script>
</body>
</html>
<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>