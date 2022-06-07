const functions = require("firebase-functions");
const admin = require("firebase-admin");


admin.initializeApp(functions.config().functions);

// onCreate is fired when new document is added to specified collection
exports.messageTrigger = functions.firestore
    .document("/messages/{names}/chats/{chatId}").
    onCreate(async (snapshot, context)=> {
      const newData= snapshot.data();
      const sentFrom = newData.from;
      const sentTo = newData.to;
      const content = newData.content;
      const userRef = admin.firestore().collection("users");
      const userSnapshot = await userRef.get();
      const deviceTokens = [];
      userSnapshot.forEach((doc)=> {
        // add to the if something like "&& notifications == true"
        if (doc.data().email == sentTo) {
          deviceTokens.push(doc.data().tokens);
        }
      });
      const tokenIds = await Promise.all(deviceTokens);
      const messagesPayload = {
        notification: {title: `New Message from ${sentFrom}`, body:
        `${content.substring(0, 15)}...`, sound: "default"},
        data: {click_actions: "FLUTTER_NOTIFICATION_CLICK",
          message: "Sample FCM Message"},
      };
      try {
        // send to device accepts array of device tokens
        const response = await admin.messaging()
            .sendToDevice(tokenIds, messagesPayload);
        console.log("Notification sent successfully");
        console.log(response.results);
      } catch (error) {
        console.log(`error sending notifications: ${error}`);
      }
    });
