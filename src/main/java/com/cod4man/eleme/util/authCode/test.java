package com.cod4man.eleme.util.authCode;

/**
 * @Title: http://www.smschinese.cn/api.shtml
 * @date 2011-3-22
 * @version V1.2  
 */
public class test {
	
	//用户名
//	private static String Uid = "1936911833@qq.com";
	private static String Uid = "Weekend";
	//String Uid = "fresh_zz@163.com";
	
	//接口安全秘钥
	private static String Key = "d41d8cd98f00b204e980";
	
	//手机号码，多个号码如13800000000,13800000001,13800000002
	private static String smsMob = "18359100900";
	
	//短信内容
	private static String smsText = "您的验证码为"+Util.getRandNum()+"，请于3分钟内正确输入，如非本人操作，请忽略此短信。";
	
	
	public static void main(String[] args) {
		
		HttpClientUtil client = HttpClientUtil.getInstance();
		
		//UTF发送
		int result = client.sendMsgUtf8(Uid, Key, smsText, smsMob);
		if(result>0){
			System.out.println("UTF8成功发送条数=="+result);
		}else{
			System.out.println(client.getErrorMsg(result));
		}
	}
}
