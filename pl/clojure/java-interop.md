# 访问私有属性、方法

比如有一个 Java 类
```java
public class ReflectDemo {
    private final String hiddenField;

    public ReflectDemo(String hiddenField) {
        this.hiddenField = hiddenField;
    }

    public String getHiddenField() {
        return hiddenField;
    }
    private String privateMethod(String name) {
        return hiddenField + name;
    }
}
```
问题：
1. 如何在不调用 getHiddenField 方法的前提下访问 hiddenField
2. 如何修改 final 的 hiddenField 字段
2. 如何调用privateMethod 方法

以上三个问题的答案是：反射
```clojure
;; 问题一
(let [demo (ReflectDemo. "haha")
      hidden-field (.getDeclaredField ReflectDemo "hiddenField")]
  (.setAccessible hidden-field true)
  (= (.getHiddenField demo) (.get hidden-field demo))) ;; true

;; 问题二
(let [demo (ReflectDemo. "haha")
      hidden-field (.getDeclaredField ReflectDemo "hiddenField")
      modifiers-field (.getDeclaredField java.lang.reflect.Field "modifiers")]
  (.setAccessible hidden-field true)
  (.setAccessible modifiers-field true)
  ;; Remove "final" modifier
  (.setInt modifiers-field hidden-field (bit-and (.getModifiers hidden-field)
                                                 (bit-not java.lang.reflect.Modifier/FINAL)))
  (.set hidden-field demo "heihei")
  (.get hidden-field demo))  ;; heihei

;; 问题三，这里需要注意的是 Java 里面的 varargs 在 Clojure 调用需要传入数组
(let [demo (ReflectDemo. "haha")
      private-method (.getDeclaredMethod ReflectDemo "privateMethod" (into-array Class  [String]))]
  (.setAccessible private-method true)
  (.invoke private-method demo (into-array String ["xxx"]))) ;; hahaxxx

```
Java 版本的解答
```java
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public class ReflectDemoMain {

    public static void main(String[] args) throws Exception {

        // 问题一
        ReflectDemo demo = new ReflectDemo("haha");
        Field hiddenField = ReflectDemo.class.getDeclaredField("hiddenField");
        hiddenField.setAccessible(true);
        System.out.println(hiddenField.get(demo));

        // 问题二
        Field modifiersField = Field.class.getDeclaredField("modifiers");
        modifiersField.setAccessible(true);
        modifiersField.setInt(hiddenField, hiddenField.getModifiers() & ~Modifier.FINAL);
        hiddenField.set(demo, "heihei");
        System.out.println(demo.getHiddenField());

        // 问题三
        Method privateMethod = ReflectDemo.class.getDeclaredMethod("privateMethod", String.class);
        privateMethod.setAccessible(true);
        System.out.println(privateMethod.invoke(demo, "xx"));
    }
}
```
## 参考
- https://javahowtodoit.wordpress.com/2014/09/12/how-to-get-and-set-private-static-final-field-using-java-reflection/
