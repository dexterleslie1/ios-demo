package com.future.demo.apns;

import com.eatthepath.pushy.apns.ApnsClient;
import com.eatthepath.pushy.apns.ApnsClientBuilder;
import com.eatthepath.pushy.apns.PushNotificationResponse;
import com.eatthepath.pushy.apns.util.ApnsPayloadBuilder;
import com.eatthepath.pushy.apns.util.SimpleApnsPayloadBuilder;
import com.eatthepath.pushy.apns.util.SimpleApnsPushNotification;
import com.eatthepath.pushy.apns.util.concurrent.PushNotificationFuture;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

public class PushyTests {
    /**
     * 测试普通apns推送
     * 普通apns推送需要aps.content-available=1
     */
    @Test
    public void testNormalApns() throws IOException, InterruptedException, ExecutionException, TimeoutException {
        String userHome = System.getProperty("user.home");
        String filePath = userHome + File.separator + "com.future.demo.iOS.apns-dev.p12";

        final ApnsClient apnsClient = new ApnsClientBuilder()
                .setApnsServer(ApnsClientBuilder.DEVELOPMENT_APNS_HOST)
                .setClientCredentials(new File(filePath), "123456")
                .build();

        String token = "fd275a815f0cf3259f93a2d6f6952809cded19b5e3377ea0bc991c4653ed012a";
        String title = "Title";
        String content = "Your message here.";

        final SimpleApnsPushNotification pushNotification;
        {
            final ApnsPayloadBuilder payloadBuilder = new SimpleApnsPayloadBuilder();
            payloadBuilder.setAlertTitle(title);
            payloadBuilder.setAlertBody(content);
            payloadBuilder.setBadgeNumber(9);
            payloadBuilder.setSound("default");
            payloadBuilder.setContentAvailable(true);

            final String payload = payloadBuilder.build();

            pushNotification = new SimpleApnsPushNotification(token, "com.example.myApp", payload);
        }

        final PushNotificationFuture<SimpleApnsPushNotification, PushNotificationResponse<SimpleApnsPushNotification>>
                sendNotificationFuture = apnsClient.sendNotification(pushNotification);

        try {
            final PushNotificationResponse<SimpleApnsPushNotification> pushNotificationResponse =
                    sendNotificationFuture.get();

            if (pushNotificationResponse.isAccepted()) {
                System.out.println("Push notification accepted by APNs gateway.");
            } else {
                System.out.println("Notification rejected by the APNs gateway: " +
                        pushNotificationResponse.getRejectionReason());

                pushNotificationResponse.getTokenInvalidationTimestamp().ifPresent(timestamp -> {
                    System.out.println("\t…and the token is invalid as of " + timestamp);
                });
            }
        } catch (final ExecutionException e) {
            System.err.println("Failed to send push notification.");
            e.printStackTrace();
        } finally {
            final CompletableFuture<Void> closeFuture = apnsClient.close();
            closeFuture.get(5, TimeUnit.SECONDS);
        }
    }
}
