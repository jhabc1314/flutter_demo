import 'dart:math';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  var name = "jackdou";
  name = "jj";

  //print(name);
  assert(18 == int.parse("18")); //生产环境不会执行 不满足条件时会抛异常
  Demo(name).echo();
  var s = 19;
  print(~s);
  assert("name is $name" == "name is " + "jj");
  print("你好".length);
  print(r"你好".length);
  var co = const [1, 2, 3];
  print(co);
  //".."是级联方法调用操作符。".."语法调用一个方法（getter或setter）
  // 并丢弃它的返回值，同时返回级联操作符最初的接收者。
  MapDemo()
    ..test(false, false, "jj")
    ..test1(bold: false); //级联调用
  //MapDemo().test1(bold: false);

  //函数作为参数
  int func(int a) {
    return a++;
  }
  MapDemo().call(func);
  var x = MapDemo();

  var type2 = Type2.init(10);
  var type2_2  = Type2();
  print(type2_2.b);
  print(type2 is Type1); //继承的子类同样为true

  type2.tryCatch();

  print(type2.runtimeType);
  //泛型测试
  //Ttest<String>().call();
  Ttest<int>().call();
  //异步测试
  print(Sync().test());
}

class Demo {
  final _age = 18;
  String _name;
  var s1 = "s";
  var i2 = 10;
  static const d1 = "xx";
  static const d2 = 15;
  //static const c1 = "$s1 $i2";// 报错
  static const c2 = "$d1 $d2";

  static const Obj = "Demo";
  Demo(String s) {
    _name = s;
  }

  echo() {
    print("value is :" + pi.toString());
    print(c2);
    print(_name);
  }
}

class SetDemo {
  //set 是一个不会重复的集合，和map很像
  bool test() {
    //定义
    Set<String> s = {"j", "s"};
    var def = {}; //这样默认定义的是一个空map，而不是set。
    var emp = <String>{}; //定义空set的方式1
    Set<String> emp1 = {}; //定义空set的方式2
    var h = {
      "s",
    };
    return true;
  }
}

class MapDemo {
  //定义参数,参数都是命名参数，非必填参数用[]包起来
  void test(bool bold, bool hidden, String name, [int age]) {
    Map<String, String> m = {"name": "j", "age": "18"};
    var rune = '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}';
    print(rune);
  }

  //flutter 中多参数传递的是一个{}对象
  void test1(
      {bool bold,
      bool hidden,
      String name = "xx",
      Map<int, int> ints = const {1: 1}}) {
    print(bold);
    print(hidden);
  }

  bool simple() => 1 == 2;

  call(Function func) {
    print(func(10));
    print(10 ~/ 3); //整除，即取商
    print(10 is int); //类型判断 is!
  }
}

class Type1 {
  num x,y;
  num z;
  Type1(); //这种叫0参数非命名构造函数，可以不写，系统会默认生成，子类默认只能继承此函数
  Type1.init(this.z);//语法糖，传入的两个参数会默认直接赋值给内部变量x,y

  call() {
    print("type1");
  }
}

class Type2 extends Type1 {

  num b;
  //子类默认不会继承父类的命名构造函数，只会继承父类的0参数非命名构造函数
  //Type1 现在的构造函数有参数非命名，不满足条件
  //子类想使用父类的命名构造函数就的主动调用
  Type2():b=3  {

    print("type 2 构造函数");
    print("type1 的 x: $x,y:$y,z:$z");
  }
  //还可以在构造函数执行之前初始化变量列表

  Type2.init(this.b):super.init(4) {
    print(b);
    x = 1;
    y = 2;
  }
  @override
  call() {
    // TODO: implement call
    print("type2");

    //return super.call();
  }

  tryCatch() {
    //抛出和捕获 和finally
    try {
      assert(1 is String);
    } on AssertionError catch(e) {
      print(e.toString());
    } catch(e) {
      print(e);
      rethrow;//可以将不需要现在处理的异常重新抛出
    } finally {
      //不管有没有抛出异常，这里面的代码都会执行，抛出异常或没抛之后执行
      print("this is finally");
      num x = 1; //数值型，可以是整型或者浮点型
    }
  }
}

//每个类都隐式的定义了一个接口，接口包含了该类所有的实例成员及其实现的接口。
//如果要创建一个 A 类，A 要支持 B 类的 API ，但是不需要继承 B 的实现， 那么可以通过 A 实现 B 的接口。
// B定义的方法属性等我都要，但是B的具体方式实现我不要，我全部自己定义，那就用实现接口方式
class Type3 implements Type1 {

  @override
  call() {
    print("this.is type3 call");
    // TODO: implement call
    //throw UnimplementedError();
  }
  num get x => x;
  num get y => y;
  num get z => z;
  set x(num xval) => x = xval;
  set y(num yval) => y = yval;
  set z(num zval) => z = zval;

  @override
  noSuchMethod(Invocation invocation) {
    // TODO: implement noSuchMethod
    return super.noSuchMethod(invocation);
  }
}


//泛型T可以是任意支持的类型 还可以加extends限制指定的类型
class Ttest<T extends Object> {
 //这样就只能是Object 类型或其子类数据
  //调用时类型也可以不指定，但是不能指定不支持的类型
  call () {
    print(T is String);
    print(T is int);
  }
  /*
  支持在函数或者方法上使用泛型
  T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}
这里的 first (<T>) 泛型可以在如下地方使用参数 T ：

函数的返回值类型 (T).
参数的类型 (List<T>).
局部变量的类型 (T tmp).
   */
}

//异步 async 和等待 await async 返回的都会被包装成Future类型

class Sync {
  //需要在后面说明是异步方式，里面所有的代码都不会等待执行完成，直到遇到await
  Future test() async {
    //await Future.delayed(Duration(seconds: 1));
    print("first");
    var a = "f";
    var s = await  http.get("http://chezhu.chelun.com/JuHui/isLogin");
    print(convert.jsonDecode(s.body));
  }
}