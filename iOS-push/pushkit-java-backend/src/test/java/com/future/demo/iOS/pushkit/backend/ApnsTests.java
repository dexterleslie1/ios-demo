package com.future.demo.iOS.pushkit.backend;

import com.notnoop.apns.APNS;
import com.notnoop.apns.ApnsService;
import org.junit.Test;

import java.io.File;

/**
 *
 */
public class ApnsTests {
    /**
     *
     */
    @Test
    public void testPushKit() {
        String userHome = System.getProperty("user.home");
        String filePath = userHome + File.separator + "voip-service-pushkit-demo.p12";
        ApnsService service =
                APNS.newService()
                        .withCert(filePath, "123456")
                        .withSandboxDestination()
                        .build();
        String token = "21302d81dee43941a16890f8b439854de4c5c72ed2727743c92eb9123a1d22ab";
        String title = "测试通知";
        String content = "测试通知内容";
        String payload = APNS.newPayload().alertTitle(title).alertBody(content).build();
        service.push(token, payload);
    }
}
