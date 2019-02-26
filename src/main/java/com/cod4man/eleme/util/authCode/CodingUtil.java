package com.cod4man.eleme.util.authCode;

/** 简单的加密工具
 * Created with IntelliJ IDEA.
 *
 * @author 张鸿杰
 * Date：2019-02-26
 * Time:17:35
 */
public class CodingUtil {
    private static int pattern = 77;
    public static int coding(int num) {
        int number = num * pattern;
        return number;
    }

    public static int encoding(int num) {
        int number = num / pattern;
        return number;
    }

}
