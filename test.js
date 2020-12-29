// var a = undefined
// if (a) {
//     console.log("a")
// }else{
//     console.log("b")
// }
// var arrs = []
var arr_a = [];
// var arr_b = []
// arrs[0] = arr_a
// arrs[2] = arr_b
arr_a[0] = "cc-cc";
arr_a[1] = "a";
arr_a[3] = "b";
arr_a[5] = "c";
arr_a[7] = "b-a";
arr_a[9] = "b-b";
arr_a[10] = "b-b";
arr_a[12] = "b-b";
arr_a[13] = "b-b";
function test_a() {
    var start = Number(new Date().getTime());
    for (var index = 0; index < 100; index++) {
        arr_a.forEach(function (element) {
            console.log(element);
        });
    }
    var end = Number(new Date().getTime());
    console.log("test_a:", end - start);
}
function test_b() {
    var start = Number(new Date().getTime());
    for (var index = 0; index < 100; index++) {
        for (var i = 0; i < arr_a.length; i++) {
            var element = arr_a[i];
            if (element) {
                console.log(element);
            }
        }
    }
    var end = Number(new Date().getTime());
    console.log("test_b:", end - start);
}
function test_c() {
    var start = Number(new Date().getTime());
    for (var index = 0; index < 100; index++) {
        arr_a.some(function (element) {
            console.log(element);
            return false;
        });
    }
    var end = Number(new Date().getTime());
    console.log("test_c:", end - start);
}
test_a();
test_b();
test_c();
var a = arr_a ? arr_a : [];
console.log(a);
// let a = arr_a.reverse()
// arr_a.push("cc-cc", 3)
// arr_a.slice(0,2).forEach((element , i) => {
//     console.log(element, ",index:", i)
// });
// console.log("---------------")
// arr_a.forEach((element , i) => {
//     console.log(element, ",index:", i)
// });
// a.forEach(element => {
//     console.log(element)
// });
// if (a === arr_a) {
//     console.log("===")
// }
// arr_a = arr_a.slice(1)
// for (const i in arr_a) {
//     console.log("key:", i, ",value:", arr_a[i])
//     let id = Number(i)
//     console.log(id)
//     // console.log("i:",i, arrs[i].length)
// }
// let a = "1"
// let b = "2"
// console.log(Number(b) - Number(a))
// arr_a.some((val, idx, array) => {
//     // val: 当前值
//     // idx：当前index
//     // array: Array
//     // return true; // Continues
//     // Return false will quit the iteration
//     if (true) {
//         return true;
//     }
//     console.log("val:", val, ",idx:", idx, ",type(idx):", typeof(idx), array)
//     return true;
// })
console.log(Object.getOwnPropertyNames(arr_a).length);
// arr[0] = "aaaa"
// arr[1] = "bbbb"
// for (const i in arr) {
//     // if (object.hasOwnProperty(key)) {
//         const element = arr[i];
//         console.log("key:", i, ",value:", element)
//     // }
//         console.log(i + byte(1))
//     for (const j in arr) {
//         if (j == i + 1) {
//             console.log("-------")
//         }
//     }
// }
// var str: string = String("Hello World");
// str.
