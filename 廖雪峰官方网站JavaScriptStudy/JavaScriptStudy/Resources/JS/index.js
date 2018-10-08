

function buttonClick()
{
    // 调OC方法
    //callAppback('点击了按钮');
    alert('测试');
}


/** 数据类型*/
//1.number
let ceshi = 0.99;
Infinity
NaN
console.log(0/0);
console.log(2/0);

console.log('abcdefg');

var tmp = 'I\'m ok';
var mutaStr = `多行
字符串
测试`



function tmpFunction(x){
    //console.log('测试函数');
    for(var i = 0; i < arguments.length;i++){
        console.log(arguments[i]);
    }
}
tmpFunction(10,11,13);

var array = ['hello','jsvascrapt','ES6'];
var [x,y,z] = array;


//如果数组本身还有嵌套，也可以通过下面的形式进行解构赋值，注意嵌套层次和位置要保持一致：
var otherarray = ['a',['b','c']];
var [,[,z]] = otherarray;
console.log(`x=${x} y=${y} z=${z}`);



//对一个对象进行解构赋值时，同样可以直接对嵌套的对象属性进行赋值，只要保证对应的层次是一致的：
var person = {
    name: '小明',
    age: 20,
    gender: 'male',
    passport: 'G-12345678',
    school: 'No.4 middle school',
    address: {
        city: 'Beijing',
        street: 'No.1 Road',
        zipcode: '100001'
    }
};

var{gender,address:{city,zipcode}} = person;
console.log(`genter = ${gender} city = ${city} zipcode = ${zipcode}`);

//解构赋值还可以使用默认值，这样就避免了不存在的属性返回undefined的问题：
let {name,time='测试时间'} = person;
console.log(`name = ${name} time = ${time}`)


//javascript引擎把{，开头的语句做了块处理，于是=不在合法，解决方法是用小括号括起来
var a,b;
({a,b} = {a:1,b:2});
console.log(`a = ${a} b = ${b} `);


//交换两个变量的值
var x = 1,y = 2;
[x,y] = [y,x];
console.log(`x = ${x} y = ${y}`);



//如果一个函数接收一个对象作为参数，那么，可以使用解构直接把对象的属性绑定到变量中
var date = {
   year : '2018',
   month : '4',
   day : '19',
};

function currentDate({year,month,day}){
  console.log(`${year}.${month}.${day}`);
};
currentDate(date);

//给小明绑定一个函数
//this是一个特殊变量，他始终指向当前对象，也就是小明对象，this.birthday可以获取到小明的年龄
//用var that = this;，你就可以放心地在方法内部定义其他函数，而不是把所有语句都堆到一个方法中。
var xiaoming = {
   name : '小明',
   birthday : 1990,
   age : function getage(){
       //// 在方法内部一开始就捕获this
       var that = this;
      var y = new Date().getFullYear();
      return y - that.birthday;
   },
};

console.log(xiaoming.age);
console.log(xiaoming.age());


//apply()可以改变this的指向, call()的第二个参数按顺序传入
//可以用函数本身的apply方法，它接收两个参数，第一个参数就是需要绑定的this变量，第二个参数是Array，表示函数本身的参数。
function getTmpAge() {
    var y = new Date().getFullYear();
    return y - this.birth;
}

var xiaoxin = {
    name: '小新',
    birth: 1990,
    age: getTmpAge,
};

console.log(getTmpAge.apply(xiaoxin,[]));


//装饰器，可以使用apply()，动态改变函数的行为
//统计一下代码一共调用了多少次text()
function text(){
    return 0;
}
var count = 0;
var oldText = text;
text = function(){
    count += 1;
    return oldText.apply(null,arguments);
}

text();
text();
text();
console.log(`count = ${count}`);


//高阶函数，函数接收另一个函数作为参数
function add(x,y,f){
  return f(x) + f(y);
}

console.log(add(5,-6,Math.abs));


//map使用，定义在array中
function pow(x){
    return x * x;
}

var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];

