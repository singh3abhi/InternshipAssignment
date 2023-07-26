# Internship Assignment For ORU Phones

I created the Internship Assignment with Flutter as Frontend and used Bloc pattern design. I have also implemented Cubit for the app's State Management.

For Caching Images I have used the cached_network_image package which helps in Caching network images and when the next time image is requested instead of downloading again it shows the images from cache memory.

## Sample Video and Apk File
https://drive.google.com/drive/folders/1Q6nHD8Tf0HJyDIOFzxKa3EdrxdoCGr4V?usp=sharing


## Installation
First of all Clone this repository:
```bash
 git clone https://github.com/singh3abhi/InternshipAssignment
```
After cloning this repository, migrate to ```InternshipAssignment``` folder.<br />
Then, follow the following steps:<br />
Run the following commands to run the app:<br />
```bash
  flutter pub get
  flutter run --release
```
To generate the apk:
```bash
   flutter build apk --release
```
Then you can find the apk in InternshipAssignment\build\app\outputs\flutter-apk

## For Firebase Cloud Push Notifications

We can send push Notifications by making post api
```bash
   https://fcm.googleapis.com/fcm/send
```
Add the Header
```bash
   header - Authorization
   value -  key = AAAAJTjOfCY:APA91bEtJcXnFqV9o2Ep_N3svDspmKFoeT8cC4wyYcT9-nas3zFaMkhdoHmE8yKhWW8gJPsTutEYKvjoyurylEpVc7fyVFtwN2y56mVtKtK53wIuZ-gCk9GJqQWZq_Tawdgp7lXPCUc9
```
To get the device token run the code in debug mode and copy the device token from debug console <br />
Body:
```bash
   {
  "to" : Enter devicetoken here,
  "notification" : {
    "title" : "ORU Phones",
    "body" : "Internship Assignment is due today",
    "android_channel_id" : "1"
    
  },
  "data" : {
    "type" : "Notification",
    "id" : "12345"
  }
}
```
