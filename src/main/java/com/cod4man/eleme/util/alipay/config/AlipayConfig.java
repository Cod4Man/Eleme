package com.cod4man.eleme.util.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092700606341";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCTxfIP0wmUK5/CnDIrL17c1eEL3Dfiuk0Lm0a0JE7OIzRcZImD7WDplNs2q1d7EPIm6N/ELz2Lg06oPUEbNhAe0jJ6ykxssnVQ0jTqMC+hrdV/AuduNgWdrzaAXsrBXi64vWhGDB6yMX6yMEv0CKOYxjgRR7vX1baPyC04VBHsCdiqXD1YtiHUwKk0a7nnFP8Zi+mnVsWb1RX8OktaFe7TspwHM0b4Z2qnNpzEW6TgS1PnfGwZMCuKcvX0DfqNiZmapfUzRt3dRBHy3W0pR6OtQkopm2rYOuUewz63Fdh5mV9fqC9NaeqS2cdAJ5hRaCy+x85YLRFSCfg6rKQax+jbAgMBAAECggEAY16KpgV9vXuQVOd//PY/zjSsvrL5iadJw/JImz6HF6sovLCGoIZx0uDcgGi7zO/aRjv2rRAvTK+hpxR5wXibYn5qn5OFzNo8dXrFRm3cudYRaPVk9wGwyRZXif80TM+uj2AezGu+AImz7tL3YESm7kbs0QHx2PPHbexoLCasXpI9sxLRETtF0Cm/NichBhX+J94/Vt6HJHXPzoAO/9V42c++5qQ6c7gFxq4Hs3+NIQ7SPSnQeBIb+yfE7nE7jZ5D6JoO5a8WQybDJOZdcjEOPTCy8t5STZodzNLGTBpJdFy8ihUDvsypLh6earYuB/O5fix1bR1g0jgPQ+lviAZQgQKBgQDtPq09suEOgWtuIQsrMnbWoJ4QdUQrDMMSskq01IBCdOJsj24gNuTYdA1bx804xBQSOoNvKqewYA/g8BRRPBjUJmrZgEXsMhAl5d1WhWJADZKQ3k8aauwsgdSzFlbQs/Mb63Tmqda/wE748HuUSFzl011IHfwwc040s7G55k87OwKBgQCfdI6AqgBMr6+fGzGsJlnX8xysTyokOZqLbOIdOFudYzCQLzi1RdLFsqUw8esv+/EQvcKYYTLAohZnULvOzdiIiVRDidd09gcTSUzMnpVxqxnx/e1grkulWFkfELpCCyh7qwcXH+g11Obc5UKjJDVEbB6IukX9C7Z4Eb1yqPzu4QKBgByhdLy+aqSaf8GBoVxsMaVDKvAnhrt/Rcdq1tMt1fCvNGgPgyXGGiX5E2ehHCYem6F7iEMRLb1+SkxGDN2k2AY6QKjQ7x9LB2HbdLOtUycRvD9ZZMh2YNwaKvYV2xJCtTMIXko78tufNKicNP23IebmdBpw6+9Y6vY3PVqG7cbjAoGAfPx1vrCCb5m+RS6hrtiYz8aGESI0XBSy6Nq+Gj1Uwnc/V6VMA/rpDYHMLiNSQFhxSrgTUjHOAGSMvwrvS1jag5txa0celVVLkniANFuRtHlzatWpPYEhVkd8A/eup5nrb5RNiHjAIYHyO++QXiRBhJJjFLU9qu2FZ3QwVTHUoMECgYBkc43eqXud7BaArR3P972KhkqFvg++2swebCq12zotM+FG2mW2GCJu1wgp/bo6NCXDeasvq7oj/yeqYCF/qVr/bZV449VmugN44bAjKWHOEnqGlpI44uSoIqPBVPK8VNlIU6sVH2QSI443Lf2D84T7zBod6NyDwVOyZF2YKzLj2Q==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqkIfpX7qb3Q7vxtGM2CkYtqMrJeF96NMD74kGpi4BItJMzgfxYKcWuLx1bpuLApCYJOLPv0T9y6ShwSJzLtSZNVFCh6r8eM5LmNyaxJ2CvSg8lh8Le9F7yrMNtf637BPZ0lkk915lTsqePJ53YLjfXVyNQFx2vt19y+w8skYQ5VKMh4AgB/VSsYrvKS3/NhpSH5Oj9ZZ5/G0MFsqO+Uff7bI/4k6IOmErC6kad/wmYx3BR6MmUqe+8yA6z5C6X0hyVTEEhAqYy99YRL9fWXZDS1HspdZxuzdmyM0ATt4cnMFsIULkaFH8Droh2K+kEDOdB5qMQVYV2xTbnwckdAhYQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://192.168.1.56:8080/pages/shopCart/success.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://192.168.1.56:8080/pages/shopCart/success.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "D:\\";


    //↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     *
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}