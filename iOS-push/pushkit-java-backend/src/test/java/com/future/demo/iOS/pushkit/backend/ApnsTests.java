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
        String filePath = userHome + File.separator + "com.azp.iOS.pushkit.p12";
        ApnsService service =
                APNS.newService()
                        .withCert(filePath, "123456")
                        .withSandboxDestination()
                        .build();
        String token = "8de3e47838f3ac284d7d731d3e9ee4d9adddb779418120fe75e8083afca6259a";
        String title = "测试通知";
        String content = "测试通知内容";
        String payload = APNS.newPayload().alertTitle(title).alertBody(content).build();
        service.push(token, payload);
    }
}
