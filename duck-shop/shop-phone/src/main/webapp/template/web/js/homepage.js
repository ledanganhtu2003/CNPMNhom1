//--HomePageImage-Left---Next,Back
const homePageImage = document.querySelector(".homepage-left-img");
const homePageImageNext = document.querySelector(".homepage-left-icon-next")
const homePageImageBack = document.querySelector(".homepage-left-icon-back")
const arraySrc = ["https://cdn.didongviet.vn/pub/media/mageplaza/bannerslider/banner/image/7/6/768x371-80_80.jpg","https://cdn.didongviet.vn/pub/media/mageplaza/bannerslider/banner/image/i/p/iphone-c_-1.jpg","https://cdn.didongviet.vn/pub/media/mageplaza/bannerslider/banner/image/7/6/768_x_371.jpg"]
homePageImageNext.addEventListener("click",handleNextSrc);
let countSrc = 0;
function handleNextSrc(event) {
    countSrc = countSrc + 1;
    if(countSrc > 2){
        countSrc = 0;
    }
    homePageImage.setAttribute("src",arraySrc[countSrc]);
    
}
homePageImageBack.addEventListener("click",handleBackSrc);
function handleBackSrc(event) {
    countSrc = countSrc - 1;
    if(countSrc < 0){
        countSrc = 2;
    }
    homePageImage.setAttribute("src",arraySrc[countSrc]);
    
}

const timer = setInterval(function(){
    handleNextSrc();
},5500);