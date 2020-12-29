// var a = undefined
// if (a) {
//     console.log("a")
// }else{
//     console.log("b")
// }

// var arrs = []
// var arr_a = []
// // var arr_b = []


// // arrs[0] = arr_a
// // arrs[2] = arr_b
// arr_a[0] = "cc-cc"
// arr_a[1] = "a"
// arr_a[3] = "b"
// arr_a[5] = "c"
// arr_a[7] = "b-a"
// arr_a[9] = "b-b"
// arr_a[10] = "b-b"
// arr_a[12] = "b-b"
// arr_a[13] = "b-b"

// console.log(arr_a.length)
// console.log("----------")
// arr_a.splice(2, 1)
// console.log(arr_a.length)

// function test_a() {
//     var start = Number(new Date().getTime())
//     for (let index = 0; index < 100; index++) {
//         arr_a.forEach(element => {
//             console.log(element)
//         });
//     }
//     var end = Number(new Date().getTime())
//     console.log("test_a:", end - start)
// }

// function test_b() {
//     var start = Number(new Date().getTime())
//     for (let index = 0; index < 100; index++) {
//         for (let i = 0; i < arr_a.length; i++) {
//             const element = arr_a[i];
//             if (element) {
//                 console.log(element)
//             } 
//         }
//     }
//     var end = Number(new Date().getTime())
//     console.log("test_b:", end - start)
// }

// function test_c() {
//     var start = Number(new Date().getTime())
//     for (let index = 0; index < 100; index++) {
//         arr_a.some(element => {
//             console.log(element)
//             return false;
//         });
//     }
//     var end = Number(new Date().getTime())
//     console.log("test_c:", end - start)
// }

// // test_a()
// // test_b()
// // test_c()

// // let a = arr_a ? arr_a : []
// // console.log(a)

// // let a = arr_a.reverse()

// // arr_a.push("cc-cc", 3)


// // arr_a.slice(0,2).forEach((element , i) => {
// //     console.log(element, ",index:", i)
// // });
// // console.log("---------------")
// // arr_a.forEach((element , i) => {
// //     console.log(element, ",index:", i)
// // });





// // a.forEach(element => {
// //     console.log(element)
// // });

// // if (a === arr_a) {
// //     console.log("===")
// // }

// // arr_a = arr_a.slice(1)

// // for (const i in arr_a) {
// //     console.log("key:", i, ",value:", arr_a[i])
// //     let id = Number(i)
// //     console.log(id)

// //     // console.log("i:",i, arrs[i].length)
// // }

// // let a = "1"
// // let b = "2"

// // console.log(Number(b) - Number(a))

// // arr_a.some((val, idx, array) => {
// //     // val: 当前值
// //     // idx：当前index
// //     // array: Array
// //     // return true; // Continues
// //     // Return false will quit the iteration
// //     if (true) {
// //         return true;
// //     }

// //     console.log("val:", val, ",idx:", idx, ",type(idx):", typeof(idx), array)
// //     return true;
// // })

// console.log( Object.getOwnPropertyNames(arr_a).length);

// // arr[0] = "aaaa"
// // arr[1] = "bbbb"

// // for (const i in arr) {
// //     // if (object.hasOwnProperty(key)) {
// //         const element = arr[i];
// //         console.log("key:", i, ",value:", element)
// //     // }
// //         console.log(i + byte(1))
// //     for (const j in arr) {
        
// //         if (j == i + 1) {
// //             console.log("-------")
// //         }
// //     }
// // }

// // var str: string = String("Hello World");
// // str.

// let no = undefined
// no = no | 1

// console.log(no)

// let array = [1,2,3,4];
// console.log(array)      // [1, 2, 3, 4]

// let popValue = array.pop();     // 弹出
// console.log(array)      // [1, 2, 3]

// array.splice(1, 0, 5);     // 删除元素（index, deleteCount）
// console.log(array)

enum gShareScene {
    //大厅分享
    Lobby = 1,
    //右上角菜单
    Menu = 2,
    //房间邀请
    RoomInvite = 3,
    //总结算
    GameEnd = 4,
    //回放
    Replay = 5,
    //救济金
    PoChan = 6,
    //额外救济金
    PoChanExtra = 7,
    //失败免输
    FailAvoid = 8,
    //胜利礼包
    WinGift = 9,
    //商城免费礼包
    ShopFreeGift = 10,
    // 记牌器道具
    DaoJuJPQ = 11,
    //游戏分享
    GameShare = 12,
    //连胜结算中断
    LS_Result = 13,
    //恢复最高连胜
    LS_Hight = 14,
    //红包
    TaskHB = 15,
    //话费 
    TaskPhone = 16,
    //话费列表中领取 
    TaskPhoneList = 17,
    //签到
    SignIn = 18
}

for (const key in gShareScene) {
    var keyToAny:any = key;
    if(!isNaN(keyToAny))
    {
        var fruitAnyType:any = gShareScene[key];
        var fruitEnum:gShareScene = fruitAnyType;
        console.log(fruitEnum);
    }
}
