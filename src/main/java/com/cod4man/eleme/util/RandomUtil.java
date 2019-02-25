package com.cod4man.eleme.util;
/**创建随机数工具
 * @author zhj*/
public class RandomUtil {
	/**生成随机整数数，通过传入的参数
	 * start为起始数，end为结束数，包含end*/
	public static int random(int start, int end) {
		end = end +1;
		int num = ((int)(Math.random() * (end - start) ) + start);
		return num;
	}
	/**重载方法：生产0 - num的整数，包含num*/
	public static int random(int num) {
		return random(0,num);
	}
}
