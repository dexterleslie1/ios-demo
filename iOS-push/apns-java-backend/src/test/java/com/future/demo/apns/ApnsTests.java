//package com.future.demo.iOS.pushkit.backend;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.fasterxml.jackson.databind.node.ObjectNode;
//import com.notnoop.apns.APNS;
//import com.notnoop.apns.ApnsService;
//import org.apache.commons.lang3.time.DateFormatUtils;
//import org.junit.Test;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.Date;
//
///**
// *
// */
//public class ApnsTests {
//    /**
//     * 测试普通apns推送
//     * 普通apns推送需要aps.content-available=1
//     */
//    @Test
//    public void testNormalApns() throws IOException {
//        String userHome = System.getProperty("user.home");
//        String filePath = userHome + File.separator + "com.future.demo.iOS.apns-dev.p12";
//        ApnsService service =
//                APNS.newService()
//                        .withCert(filePath, "123456")
//                        .withSandboxDestination()
//                        .build();
//        String token = "fd275a815f0cf3259f93a2d6f6952809cded19b5e3377ea0bc991c4653ed012a";
//        String title = "Title";
//        String content = "Your message here.";
//        String payload = APNS.newPayload()
//                .alertTitle(title)
//                .alertBody(content)
//                .badge(9)
//                .sound("default")
//                .build();
//
//        ObjectMapper OMInstance = new ObjectMapper();
//        ObjectNode node = (ObjectNode)OMInstance.readTree(payload);
//        ((ObjectNode)node.get("aps")).put("content-available", 1);
//        payload = node.toString();
//
//        service.push(token, payload);
//    }
//
//    /**
//     * 测试Notification Service Extension推送
//     * Notification Service Extension 需要 aps.mutable-content=1
//     * @throws IOException
//     */
//    @Test
//    public void testNotificationServiceExtension() throws IOException {
//        String userHome = System.getProperty("user.home");
//        String filePath = userHome + File.separator + "com.future.demo.iOS.apns-dev.p12";
//        ApnsService service =
//                APNS.newService()
//                        .withCert(filePath, "123456")
//                        .withSandboxDestination()
//                        .build();
//        String token = "fd275a815f0cf3259f93a2d6f6952809cded19b5e3377ea0bc991c4653ed012a";
//        String identifier = "a125";
//        Date currentTime = new Date();
//        String currentTimeString = DateFormatUtils.format(currentTime, "yyyy-MM-dd HH:mm:ss");
//        String payload = APNS.newPayload()
//                .alertTitle("服务器当前时间")
//                .alertBody(currentTimeString)
//                .badge(9)
//                .customField("custom-payload-id", identifier)
//                .build();
//
//        ObjectMapper OMInstance = new ObjectMapper();
//        ObjectNode node = (ObjectNode)OMInstance.readTree(payload);
//        ((ObjectNode)node.get("aps")).put("mutable-content", 1);
//        payload = node.toString();
//        service.push(token, payload);
//    }
//}
